`timescale 1ns/1ns
module HiLo( clk, DivAns, Signal, HiOut, LoOut, reset );
input clk ;
input reset ;
input [1:0] Signal ;
input [63:0] DivAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;


always@( posedge clk or reset )
begin
  if ( reset )
    HiLo = 64'b0 ;

 // else if ( Signal == 2'b01 | Signal == 2'b10 )
    HiLo = DivAns ;
 
end

assign HiOut = HiLo[63:32] ;
assign LoOut = HiLo[31:0] ;

endmodule