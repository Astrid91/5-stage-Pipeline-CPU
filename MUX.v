`timescale 1ns/1ns
module MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input [1:0] Signal ;
output [31:0] dataOut ;

// symbolic constants for ALU Operations
parameter ALU_add = 3'b010;
parameter ALU_sub = 3'b110;
parameter ALU_and = 3'b000;
parameter ALU_or  = 3'b001;
parameter ALU_slt = 3'b111;

parameter SHT_sll = 3'b011;
parameter DIV_mfhi = 3'b100;  // 原本 3'b101;
parameter DIV_mflo = 3'b101;  // 原本 3'b100;


assign dataOut = ( Signal == 2'b00 ) ? ALUOut :
		 ( Signal == 2'b01 ) ? HiOut :
		 ( Signal == 2'b10 ) ? LoOut :
		 ( Signal == 2'b11 ) ? Shifter : 32'b0 ;

endmodule