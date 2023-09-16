/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
*/

module alu_ctl(clk, ALUOp, Funct, SignaltoALU, SignaltoSHT, SignaltoDIV, SignaltoMUX, total);
    input [1:0] ALUOp;
    input [5:0] Funct;
    input clk;
    input [6:0] total;
    reg   [6:0] counter;

    output [2:0] SignaltoALU;
    reg    [2:0] ALUOperation;

    output [1:0] SignaltoMUX;
    reg    [1:0] MUXOperation;

    output SignaltoDIV;
    reg    DIVOperation;    

    output [2:0] SignaltoSHT;
    // reg    [2:0] SHTOperation;


    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
    parameter F_sll = 6'd0;
    parameter F_div = 6'd27;
    parameter F_mfhi = 6'd16 ;
    parameter F_mflo = 6'd18 ;


    // symbolic constants for ALU Operations
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b110;
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_slt = 3'b111;

    parameter SHT_sll = 3'b011;
    parameter DIV_mfhi = 3'b100;
    parameter DIV_mflo = 3'b101;


    always @(Funct)
    begin
      if (Funct == F_div)
      begin
        counter = 0;
      end
    end

    always @(posedge clk or ALUOp or Funct)
    begin
        MUXOperation = 2'b00;
        case (ALUOp) 
            2'b00 : ALUOperation = ALU_add;
            2'b01 : ALUOperation = ALU_sub;
            2'b10 : case (Funct) 
                        F_add : ALUOperation = ALU_add;
                        F_sub : ALUOperation = ALU_sub;
                        F_and : ALUOperation = ALU_and;
                        F_or  : ALUOperation = ALU_or;
                        F_slt : ALUOperation = ALU_slt;
                        F_sll : begin
                        	if (total>0)
                              begin
                                	ALUOperation = ALU_add;
                              end

                              else
                              begin
                                	ALUOperation = SHT_sll;
                                	MUXOperation = 2'b11;
                              end
                        end

                        F_div : DIVOperation = 1'b1;
                        F_mfhi : 
                        begin
                        	ALUOperation = DIV_mfhi;
                              MUXOperation = 2'b01;
                        end

                        F_mflo : 
                        begin
                              ALUOperation = DIV_mflo;
                              MUXOperation = 2'b10;
                        end

                        default begin
				      ALUOperation = 3'bxxx;
				      DIVOperation = 1'b0;
                        end

            endcase
            default begin
                      ALUOperation = 3'bxxx;
                      DIVOperation = 1'b0;
            end
        endcase
    end


    always @(posedge clk)

    begin
      if (DIVOperation == 1'b1) DIVOperation = 1'b0 ;

    end



    assign SignaltoALU = ALUOperation ;
    assign SignaltoSHT = ALUOperation ;
    assign SignaltoDIV = DIVOperation ;
    assign SignaltoMUX = MUXOperation ;

endmodule

