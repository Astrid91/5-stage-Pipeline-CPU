//    Title: MIPS Single-Cycle Processor
//    Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_pipeline( clk, rst );
    input clk, rst;
    
    // instruction bus
    	wire[31:0] instr;
    
    // break out important fields from instruction

	wire [4:0] rs, rt_ID, rt_EX, rd_ID, rd_EX, shamt,shamt_EX;
    	wire [5:0] opcode, funct, funct_EX;
	wire [6:0] total_IF, total_ID, total_EX;
	wire [15:0] immed;
	wire [25:0] jumpoffset;
	wire [31:0] extend_immed_ID, extend_immed_EX, b_offset ;
	
    // datapath signals
	wire [4:0] rfile_wn_EX, rfile_wn_MEM, rfile_wn_WB, rfile_wn ;
	wire [31:0] rfile_rd1_ID, rfile_rd2_ID, rfile_rd1_EX, rfile_rd2_EX, rfile_rd2_MEM, rfile_wd, alu_b, alu_out_EX, alu_out_M, alu_out_WB, b_tgt_EX, b_tgt_M, pc_next,
            	pc, pc_incr_IF, pc_incr_ID, pc_incr_EX, pc_incr_M, pc_incr_WB, dmem_rdata_MEM,dmem_rdata_WB, jump_addr_ID, jump_addr_EX, jump_addr_MEM, branch_addr, memreg_out, instr_IF, instr_ID;

    // control signals
	wire WBmux, RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump, en_pc, ZeroEX, ZeroMEM ;
	wire [1:0] ALUOp;
	wire [2:0] WB_1, WB_2, WB_3, WB_4 ;
	wire [3:0] M_1, M_2, M_3;
	wire [3:0] EX_1, EX_2;
	wire [5:0] Operation;
    
// ---------------IF-------------------	

    	reg32 PC( .clk(clk), .rst(rst), .en_reg(en_pc), .d_in(pc_next), .d_out(pc) );	
    	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr_IF) );
    
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr_IF) );
	mux2 #(32) hazardMUX( .sel(hazard), .a(instr_IF), .b(32'd0), .y(instr) );
	
	hazard hazard_detect( .clk(clk), .rst(rst), .instr(instr), .en_pc(en_pc), .hazard(hazard), .total(total_IF) );
    
// ---------------IF/ID----------------	

	IF_ID IF_ID_Reg( .clk(clk), .rst(rst), .total(total_IF), .pc(pc_incr_IF), .instr(instr),
			 .pc_Reg(pc_incr_ID), .total_Reg(total_ID), .instr_Reg(instr_ID) );
// -----
		
	assign opcode = instr_ID[31:26];
	assign rs = instr_ID[25:21];
	assign rt_ID = instr_ID[20:16];
	assign rd_ID = instr_ID[15:11];
	assign shamt = instr_ID[10:6];
	assign funct = instr_ID[5:0];
	assign immed = instr_ID[15:0];
	assign jumpoffset = instr_ID[25:0];	
    	assign jump_addr_ID = { pc_incr_ID[31:28], jumpoffset <<2 };		

    	reg_file RegFile( .clk(clk), .RegWrite(WB_4[1]), .RN1(rs), .RN2(rt_ID), .WN(rfile_wn),
   				   .WD(rfile_wd), .RD1(rfile_rd1_ID), .RD2(rfile_rd2_ID) );
	
    	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed_ID) );	
	
	control_single CTL(.opcode(opcode), .funct(funct), .RegDst(EX_1[1]), .ALUSrc(EX_1[0]),.MemtoReg(WB_1[0]),
                   	   .RegWrite(WB_1[1]), .MemRead(M_1[2]), .MemWrite(M_1[1]), .Branch(M_1[0]),
                   	   .Jump(M_1[3]), .ALUOp(EX_1[3:2]), .WBmux(WB_1[2]));
	
// ---------------ID/EX----------------	

	ID_EX ID_EX_Reg( .clk(clk), .rst(rst), .Zero(Zero), .WB(WB_1) , .M(M_1), .EX(EX_1), .rt(rt_ID), .rd(rd_ID), .extend_SHT(shamt), .funct(funct), .total(total_ID), .RD1(rfile_rd1_ID), .RD2(rfile_rd2_ID), .immed_in(extend_immed_ID), .pc(pc_incr_ID), .jump_addr(jump_addr_ID), .ZeroEX(ZeroEX),
		.total_Reg(total_EX), .WB_Reg(WB_2), .MEM_Reg(M_2), .EX_Reg(EX_2), .rt_Reg(rt_EX), .rd_Reg(rd_EX), .extend_SHT_Reg( shamt_EX ), .funct_Reg(funct_EX), .RD1_Reg(rfile_rd1_EX), .RD2_Reg(rfile_rd2_EX), .immed_in_Reg(extend_immed_EX), .pc_Reg(pc_incr_EX), .jump_addr_Reg(jump_addr_EX));
	
// -----

	assign b_offset = extend_immed_EX << 2;
	mux2 #(5) RFMUX( .sel(EX_2[1]), .a(rt_EX), .b(rd_EX), .y(rfile_wn_EX) );
	mux2 #(32) ALUMUX( .sel(EX_2[0]), .a(rfile_rd2_EX), .b(extend_immed_EX), .y(alu_b) );

	add32 BRADD( .a(pc_incr_EX), .b(b_offset), .result(b_tgt_EX) );
	
	TotalALU TotalALU( .clk(clk), .ALUOp(EX_2[3:2]), .dataA(rfile_rd1_EX), .dataB(alu_b), 
			 .Funct(funct_EX), .Output(alu_out_EX), .reset(rst), .total(total_EX), .extend_SHT( shamt_EX ) ) ;
	
// ---------------EX/MEM---------------	

	EX_MEM EX_MEM_Reg( .clk(clk), .rst(rst), .ZeroEX(ZeroEX), .WB(WB_2), .M(M_2), .rd_rt(rfile_wn_EX), .ALUOut(alu_out_EX), .RD2(rfile_rd2_EX), .branch_PC(b_tgt_EX), .pc(pc_incr_EX), .jump_addr(jump_addr_EX), .ZeroMEM(ZeroMEM), .WB_Reg(WB_3), .M_Reg(M_3),
                   .rd_rt_Reg(rfile_wn_MEM), .ALU_Reg(alu_out_M), .WD(rfile_rd2_MEM), .branch_PC_Reg(b_tgt_M), .pc_Reg(pc_incr_M), .jump_addr_Reg(jump_addr_MEM) );
// -----

	beq BRA_EQU( .RD1(rfile_rd1_ID), .RD2(rfile_rd2_ID), .Zero(Zero), .opcode(opcode));
	and BR_AND(PCSrc, M_3[0], ZeroMEM);
	
	memory DatMem( .clk(clk), .MemRead(M_3[2]), .MemWrite(M_3[1]), .wd(rfile_rd2_MEM), 
		    .addr(alu_out_M), .rd(dmem_rdata_MEM) );	   

	mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr_IF), .b(b_tgt_M), .y(branch_addr) );
    	mux2 #(32) JMUX( .sel(M_3[3]), .a(branch_addr), .b(jump_addr_MEM), .y(pc_next) );
    
// ---------------MEM/WB---------------	

	MEM_WB MEM_WB_Reg( .clk(clk), .rst(rst), .WB(WB_3), .rd_rt(rfile_wn_MEM), .RD(dmem_rdata_MEM), .pc(pc_incr_M), .ADDR(alu_out_M),
			 .WB_Reg(WB_4), .rd_rt_Reg(rfile_wn_WB), .RD_Reg(dmem_rdata_WB), .pc_Reg(pc_incr_WB), .ALU_Reg(alu_out_WB) );
// -----
 
	mux2 #(5)  WNMUX( .sel(WB_4[2]), .a(rfile_wn_WB), .b(5'd31), .y(rfile_wn) );
	mux2 #(32) WRMUX( .sel(WB_4[0]), .a(alu_out_WB), .b(dmem_rdata_WB), .y(memreg_out) );
	mux2 #(32) WDMUX( .sel(WB_4[2]), .a(memreg_out), .b(pc_incr_WB), .y(rfile_wd) );
	
// ---------------WB-------------------	
	

endmodule
