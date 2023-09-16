module ID_EX( clk, rst, Zero, WB, M, EX, rt, rd, extend_SHT, funct, total, RD1, RD2, immed_in, pc, jump_addr, ZeroEX, total_Reg, WB_Reg, MEM_Reg, EX_Reg, rt_Reg, rd_Reg, extend_SHT_Reg, funct_Reg, RD1_Reg, RD2_Reg, immed_in_Reg, pc_Reg, jump_addr_Reg );

	input clk, rst, Zero;
	input [2:0] WB;
	input [3:0] M, EX;
	input [4:0] rt, rd, extend_SHT;
	input [5:0] funct;
	input [6:0] total;
	input [31:0] RD1, RD2, immed_in, pc, jump_addr;
	
	output reg ZeroEX ;
	output reg [6:0] total_Reg;
	output reg [2:0] WB_Reg;
	output reg [3:0] MEM_Reg, EX_Reg;
	output reg [4:0] rt_Reg, rd_Reg, extend_SHT_Reg;
	output reg [5:0] funct_Reg ;
	output reg [31:0] RD1_Reg, RD2_Reg, immed_in_Reg, pc_Reg, jump_addr_Reg;

	always@( posedge clk )
	begin
		if ( rst )
		begin
			ZeroEX <= 0 ;
			pc_Reg <= 0;
			WB_Reg <= 0; 
			MEM_Reg <= 0;
			EX_Reg <= 0;
			RD1_Reg <= 0;
			RD2_Reg <= 0;
			immed_in_Reg <= 0;
			rt_Reg <= 0 ;
			rd_Reg <= 0;
			total_Reg <= 0;
			funct_Reg <= 0;
			extend_SHT_Reg <= 0 ;
		end
		else
		begin
			ZeroEX <= Zero ;
			pc_Reg <= pc;
			WB_Reg <= WB;
			MEM_Reg <= M;
			EX_Reg <= EX;
			RD1_Reg <= RD1;
			RD2_Reg <= RD2;
			immed_in_Reg <= immed_in;
			rt_Reg <= rt;
			rd_Reg <= rd;
			total_Reg <= total;
			jump_addr_Reg <= jump_addr ;
			funct_Reg <= funct ;
			extend_SHT_Reg <= extend_SHT ;
		end
	end

endmodule