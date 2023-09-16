module EX_MEM( clk, rst, ZeroEX, WB, M, rd_rt, ALUOut, RD2, branch_PC, pc, jump_addr, ZeroMEM, WB_Reg, M_Reg, rd_rt_Reg, ALU_Reg, WD, branch_PC_Reg, pc_Reg, jump_addr_Reg );
					
	input clk, rst, ZeroEX;
	input [2:0] WB;
	input [3:0] M;

	input [4:0] rd_rt;
	input [31:0] ALUOut, RD2, branch_PC, pc, jump_addr;
	
	output reg ZeroMEM ;
	output reg [2:0] WB_Reg;
	output reg [3:0] M_Reg;
	output reg [4:0] rd_rt_Reg;
	output reg [31:0] ALU_Reg, WD, branch_PC_Reg, pc_Reg, jump_addr_Reg;

	always@( posedge clk )
	begin
		if ( rst )
		begin
			WB_Reg <= 0;
			M_Reg <= 0;
			branch_PC_Reg <= 0;
			pc_Reg <= 0;
			ALU_Reg <= 0;
			WD <= 0;
			rd_rt_Reg <= 0;
			ZeroMEM <= 0;
		end
		else
		begin
			ZeroMEM <= ZeroEX;
			WB_Reg <= WB;
			M_Reg <= M;
			branch_PC_Reg <= branch_PC;
			pc_Reg <= pc;
			ALU_Reg <= ALUOut;
			WD <= RD2;	
			rd_rt_Reg <= rd_rt;
			jump_addr_Reg <= jump_addr ;
		end
	end
	
endmodule
