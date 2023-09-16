module IF_ID( clk, rst, total, pc, instr, total_Reg, pc_Reg, instr_Reg );

	input clk, rst ;
	input [6:0] total ;
	input [31:0] pc, instr;

	output reg [6:0] total_Reg ;
	output reg [31:0] instr_Reg, pc_Reg;

	always@( posedge clk )
	begin
		if ( rst )
		begin
			instr_Reg <= 0;
			pc_Reg <= 0;
			total_Reg <= 0;
		end
		else
		begin
			instr_Reg <= instr;
			pc_Reg <= pc;
			total_Reg <= total ;
		end
	end
	
endmodule 
