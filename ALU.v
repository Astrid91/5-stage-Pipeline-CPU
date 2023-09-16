`timescale 1ns/ 1ns
module ALU(dataA, dataB, Signal, dataOut, reset);
input reset;
input [31:0] dataA;
input [31:0] dataB;
input [2:0] Signal;
output [31:0] dataOut;
  
wire [31:0] temp;
wire [31:0] cout;
wire less;  

parameter AND = 3'b000; 
parameter OR  = 3'b001; 
parameter ADD = 3'b010; 
parameter SUB = 3'b110;
parameter SLT = 3'b111; 
  
// 將ALU切成32個1bit的bitALU

bitALU ALU0( .dataA(dataA[0]), .dataB(dataB[0]), .dataOut(dataOut[0]), .Signal(Signal), .carryin(Signal[2]), .carryout(cout[0]), .less(less), .Set() );
bitALU ALU1( .dataA(dataA[1]), .dataB(dataB[1]), .dataOut(dataOut[1]), .Signal(Signal), .carryin(cout[0]), .carryout(cout[1]), .less(1'b0), .Set() );
bitALU ALU2( .dataA(dataA[2]), .dataB(dataB[2]), .dataOut(dataOut[2]), .Signal(Signal), .carryin(cout[1]), .carryout(cout[2]), .less(1'b0), .Set() );
bitALU ALU3( .dataA(dataA[3]), .dataB(dataB[3]), .dataOut(dataOut[3]), .Signal(Signal), .carryin(cout[2]), .carryout(cout[3]), .less(1'b0), .Set() );
bitALU ALU4( .dataA(dataA[4]), .dataB(dataB[4]), .dataOut(dataOut[4]), .Signal(Signal), .carryin(cout[3]), .carryout(cout[4]), .less(1'b0), .Set() );

bitALU ALU5( .dataA(dataA[5]), .dataB(dataB[5]), .dataOut(dataOut[5]), .Signal(Signal), .carryin(cout[4]), .carryout(cout[5]), .less(1'b0), .Set() );
bitALU ALU6( .dataA(dataA[6]), .dataB(dataB[6]), .dataOut(dataOut[6]), .Signal(Signal), .carryin(cout[5]), .carryout(cout[6]), .less(1'b0), .Set() );
bitALU ALU7( .dataA(dataA[7]), .dataB(dataB[7]), .dataOut(dataOut[7]), .Signal(Signal), .carryin(cout[6]), .carryout(cout[7]), .less(1'b0), .Set() );
bitALU ALU8( .dataA(dataA[8]), .dataB(dataB[8]), .dataOut(dataOut[8]), .Signal(Signal), .carryin(cout[7]), .carryout(cout[8]), .less(1'b0), .Set() );
bitALU ALU9( .dataA(dataA[9]), .dataB(dataB[9]), .dataOut(dataOut[9]), .Signal(Signal), .carryin(cout[8]), .carryout(cout[9]), .less(1'b0), .Set() );

bitALU ALU10( .dataA(dataA[10]), .dataB(dataB[10]), .dataOut(dataOut[10]), .Signal(Signal), .carryin(cout[9]), .carryout(cout[10]), .less(1'b0), .Set() );
bitALU ALU11( .dataA(dataA[11]), .dataB(dataB[11]), .dataOut(dataOut[11]), .Signal(Signal), .carryin(cout[10]), .carryout(cout[11]), .less(1'b0), .Set() );
bitALU ALU12( .dataA(dataA[12]), .dataB(dataB[12]), .dataOut(dataOut[12]), .Signal(Signal), .carryin(cout[11]), .carryout(cout[12]), .less(1'b0), .Set() );
bitALU ALU13( .dataA(dataA[13]), .dataB(dataB[13]), .dataOut(dataOut[13]), .Signal(Signal), .carryin(cout[12]), .carryout(cout[13]), .less(1'b0), .Set() );
bitALU ALU14( .dataA(dataA[14]), .dataB(dataB[14]), .dataOut(dataOut[14]), .Signal(Signal), .carryin(cout[13]), .carryout(cout[14]), .less(1'b0), .Set() );

bitALU ALU15( .dataA(dataA[15]), .dataB(dataB[15]), .dataOut(dataOut[15]), .Signal(Signal), .carryin(cout[14]), .carryout(cout[15]), .less(1'b0), .Set() );
bitALU ALU16( .dataA(dataA[16]), .dataB(dataB[16]), .dataOut(dataOut[16]), .Signal(Signal), .carryin(cout[15]), .carryout(cout[16]), .less(1'b0), .Set() );
bitALU ALU17( .dataA(dataA[17]), .dataB(dataB[17]), .dataOut(dataOut[17]), .Signal(Signal), .carryin(cout[16]), .carryout(cout[17]), .less(1'b0), .Set() );
bitALU ALU18( .dataA(dataA[18]), .dataB(dataB[18]), .dataOut(dataOut[18]), .Signal(Signal), .carryin(cout[17]), .carryout(cout[18]), .less(1'b0), .Set() );
bitALU ALU19( .dataA(dataA[19]), .dataB(dataB[19]), .dataOut(dataOut[19]), .Signal(Signal), .carryin(cout[18]), .carryout(cout[19]), .less(1'b0), .Set() );

bitALU ALU20( .dataA(dataA[20]), .dataB(dataB[20]), .dataOut(dataOut[20]), .Signal(Signal), .carryin(cout[19]), .carryout(cout[20]), .less(1'b0), .Set() );
bitALU ALU21( .dataA(dataA[21]), .dataB(dataB[21]), .dataOut(dataOut[21]), .Signal(Signal), .carryin(cout[20]), .carryout(cout[21]), .less(1'b0), .Set() );
bitALU ALU22( .dataA(dataA[22]), .dataB(dataB[22]), .dataOut(dataOut[22]), .Signal(Signal), .carryin(cout[21]), .carryout(cout[22]), .less(1'b0), .Set() );
bitALU ALU23( .dataA(dataA[23]), .dataB(dataB[23]), .dataOut(dataOut[23]), .Signal(Signal), .carryin(cout[22]), .carryout(cout[23]), .less(1'b0), .Set() );
bitALU ALU24( .dataA(dataA[24]), .dataB(dataB[24]), .dataOut(dataOut[24]), .Signal(Signal), .carryin(cout[23]), .carryout(cout[24]), .less(1'b0), .Set() );

bitALU ALU25( .dataA(dataA[25]), .dataB(dataB[25]), .dataOut(dataOut[25]), .Signal(Signal), .carryin(cout[24]), .carryout(cout[25]), .less(1'b0), .Set() );
bitALU ALU26( .dataA(dataA[26]), .dataB(dataB[26]), .dataOut(dataOut[26]), .Signal(Signal), .carryin(cout[25]), .carryout(cout[26]), .less(1'b0), .Set() );
bitALU ALU27( .dataA(dataA[27]), .dataB(dataB[27]), .dataOut(dataOut[27]), .Signal(Signal), .carryin(cout[26]), .carryout(cout[27]), .less(1'b0), .Set() );
bitALU ALU28( .dataA(dataA[28]), .dataB(dataB[28]), .dataOut(dataOut[28]), .Signal(Signal), .carryin(cout[27]), .carryout(cout[28]), .less(1'b0), .Set() );
bitALU ALU29( .dataA(dataA[29]), .dataB(dataB[29]), .dataOut(dataOut[29]), .Signal(Signal), .carryin(cout[28]), .carryout(cout[29]), .less(1'b0), .Set() );

bitALU ALU30( .dataA(dataA[30]), .dataB(dataB[30]), .dataOut(dataOut[30]), .Signal(Signal), .carryin(cout[29]), .carryout(cout[30]), .less(1'b0), .Set() );
bitALU ALU31( .dataA(dataA[31]), .dataB(dataB[31]), .dataOut(dataOut[31]), .Signal(Signal), .carryin(cout[30]), .carryout(cout[31]), .less(1'b0), .Set(less) );


assign dataOut = reset?32'b0:temp ;

endmodule