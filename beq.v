module beq( RD1, RD2, Zero, opcode );

	input [31:0] RD1, RD2;
      	input [5:0] opcode;
	output Zero;

	assign Zero = (RD1 == RD2 && opcode == 6'd4)? 1'b1 : 
		      (RD1 != RD2 && opcode == 6'd5)? 1'b1 : 1'b0 ;

endmodule