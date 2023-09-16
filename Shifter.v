`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [4:0] dataB ;
input [2:0] Signal ;
output [31:0] dataOut ;


wire [31:0] temp1, temp2, temp3, temp4, temp5 ;

parameter SLL = 3'b011;

// MUX1

mux2to1 MUX1_00 ( .dataA( dataA[0] ) , .dataB( 1'b0 ), .S(dataB[0] ) , .dataOut( temp1[0] ) );
mux2to1 MUX1_01 ( .dataA( dataA[1] ) , .dataB( dataA[0] ), .S(dataB[0] ) , .dataOut( temp1[1] ) );
mux2to1 MUX1_02 ( .dataA( dataA[2] ) , .dataB( dataA[1] ), .S(dataB[0] ) , .dataOut( temp1[2] ) );
mux2to1 MUX1_03 ( .dataA( dataA[3] ) , .dataB( dataA[2] ), .S(dataB[0] ) , .dataOut( temp1[3] ) );
mux2to1 MUX1_04 ( .dataA( dataA[4] ) , .dataB( dataA[3] ), .S(dataB[0] ) , .dataOut( temp1[4] ) );
mux2to1 MUX1_05 ( .dataA( dataA[5] ) , .dataB( dataA[4] ), .S(dataB[0] ) , .dataOut( temp1[5] ) );
mux2to1 MUX1_06 ( .dataA( dataA[6] ) , .dataB( dataA[5] ), .S(dataB[0] ) , .dataOut( temp1[6] ) );
mux2to1 MUX1_07 ( .dataA( dataA[7] ) , .dataB( dataA[6] ), .S(dataB[0] ) , .dataOut( temp1[7] ) );
mux2to1 MUX1_08 ( .dataA( dataA[8] ) , .dataB( dataA[7] ), .S(dataB[0] ) , .dataOut( temp1[8] ) );
mux2to1 MUX1_09 ( .dataA( dataA[9] ) , .dataB( dataA[8] ), .S(dataB[0] ) , .dataOut( temp1[9] ) );

mux2to1 MUX1_10 ( .dataA( dataA[10] ) , .dataB( dataA[9] ), .S(dataB[0] ) , .dataOut( temp1[10] ) );
mux2to1 MUX1_11 ( .dataA( dataA[11] ) , .dataB( dataA[10] ), .S(dataB[0] ) , .dataOut( temp1[11] ) );
mux2to1 MUX1_12 ( .dataA( dataA[12] ) , .dataB( dataA[11] ), .S(dataB[0] ) , .dataOut( temp1[12] ) );
mux2to1 MUX1_13 ( .dataA( dataA[13] ) , .dataB( dataA[12] ), .S(dataB[0] ) , .dataOut( temp1[13] ) );
mux2to1 MUX1_14 ( .dataA( dataA[14] ) , .dataB( dataA[13] ), .S(dataB[0] ) , .dataOut( temp1[14] ) );
mux2to1 MUX1_15 ( .dataA( dataA[15] ) , .dataB( dataA[14] ), .S(dataB[0] ) , .dataOut( temp1[15] ) );
mux2to1 MUX1_16 ( .dataA( dataA[16] ) , .dataB( dataA[15] ), .S(dataB[0] ) , .dataOut( temp1[16] ) );
mux2to1 MUX1_17 ( .dataA( dataA[17] ) , .dataB( dataA[16] ), .S(dataB[0] ) , .dataOut( temp1[17] ) );
mux2to1 MUX1_18 ( .dataA( dataA[18] ) , .dataB( dataA[17] ), .S(dataB[0] ) , .dataOut( temp1[18] ) );
mux2to1 MUX1_19 ( .dataA( dataA[19] ) , .dataB( dataA[18] ), .S(dataB[0] ) , .dataOut( temp1[19] ) );

mux2to1 MUX1_20 ( .dataA( dataA[20] ) , .dataB( dataA[19] ), .S(dataB[0] ) , .dataOut( temp1[20] ) );
mux2to1 MUX1_21 ( .dataA( dataA[21] ) , .dataB( dataA[20] ), .S(dataB[0] ) , .dataOut( temp1[21] ) );
mux2to1 MUX1_22 ( .dataA( dataA[22] ) , .dataB( dataA[21] ), .S(dataB[0] ) , .dataOut( temp1[22] ) );
mux2to1 MUX1_23 ( .dataA( dataA[23] ) , .dataB( dataA[22] ), .S(dataB[0] ) , .dataOut( temp1[23] ) );
mux2to1 MUX1_24 ( .dataA( dataA[24] ) , .dataB( dataA[23] ), .S(dataB[0] ) , .dataOut( temp1[24] ) );
mux2to1 MUX1_25 ( .dataA( dataA[25] ) , .dataB( dataA[24] ), .S(dataB[0] ) , .dataOut( temp1[25] ) );
mux2to1 MUX1_26 ( .dataA( dataA[26] ) , .dataB( dataA[25] ), .S(dataB[0] ) , .dataOut( temp1[26] ) );
mux2to1 MUX1_27 ( .dataA( dataA[27] ) , .dataB( dataA[26] ), .S(dataB[0] ) , .dataOut( temp1[27] ) );
mux2to1 MUX1_28 ( .dataA( dataA[28] ) , .dataB( dataA[27] ), .S(dataB[0] ) , .dataOut( temp1[28] ) );
mux2to1 MUX1_29 ( .dataA( dataA[29] ) , .dataB( dataA[28] ), .S(dataB[0] ) , .dataOut( temp1[29] ) );

mux2to1 MUX1_30 ( .dataA( dataA[30] ) , .dataB( dataA[29] ), .S(dataB[0] ) , .dataOut( temp1[30] ) );
mux2to1 MUX1_31 ( .dataA( dataA[31] ) , .dataB( dataA[30] ), .S(dataB[0] ) , .dataOut( temp1[31] ) );

// MUX2

mux2to1 MUX2_00 ( .dataA( temp1[0] ) , .dataB( 1'b0 ) , .S(dataB[1] ) , .dataOut( temp2[0] ) );
mux2to1 MUX2_01 ( .dataA( temp1[1] ) , .dataB( 1'b0 ) , .S(dataB[1] ) , .dataOut( temp2[1] ) );
mux2to1 MUX2_02 ( .dataA( temp1[2] ) , .dataB( temp1[0] ) , .S(dataB[1] ) , .dataOut( temp2[2] ) );
mux2to1 MUX2_03 ( .dataA( temp1[3] ) , .dataB( temp1[1] ) , .S(dataB[1] ) , .dataOut( temp2[3] ) );
mux2to1 MUX2_04 ( .dataA( temp1[4] ) , .dataB( temp1[2] ) , .S(dataB[1] ) , .dataOut( temp2[4] ) );
mux2to1 MUX2_05 ( .dataA( temp1[5] ) , .dataB( temp1[3] ) , .S(dataB[1] ) , .dataOut( temp2[5] ) );
mux2to1 MUX2_06 ( .dataA( temp1[6] ) , .dataB( temp1[4] ) , .S(dataB[1] ) , .dataOut( temp2[6] ) );
mux2to1 MUX2_07 ( .dataA( temp1[7] ) , .dataB( temp1[5] ) , .S(dataB[1] ) , .dataOut( temp2[7] ) );
mux2to1 MUX2_08 ( .dataA( temp1[8] ) , .dataB( temp1[6] ) , .S(dataB[1] ) , .dataOut( temp2[8] ) );
mux2to1 MUX2_09 ( .dataA( temp1[9] ) , .dataB( temp1[7] ) , .S(dataB[1] ) , .dataOut( temp2[9] ) );

mux2to1 MUX2_10 ( .dataA( temp1[10] ) , .dataB( temp1[8] ) , .S(dataB[1] ) , .dataOut( temp2[10] ) );
mux2to1 MUX2_11 ( .dataA( temp1[11] ) , .dataB( temp1[9] ) , .S(dataB[1] ) , .dataOut( temp2[11] ) );
mux2to1 MUX2_12 ( .dataA( temp1[12] ) , .dataB( temp1[10] ) , .S(dataB[1] ) , .dataOut( temp2[12] ) );
mux2to1 MUX2_13 ( .dataA( temp1[13] ) , .dataB( temp1[11] ) , .S(dataB[1] ) , .dataOut( temp2[13] ) );
mux2to1 MUX2_14 ( .dataA( temp1[14] ) , .dataB( temp1[12] ) , .S(dataB[1] ) , .dataOut( temp2[14] ) );
mux2to1 MUX2_15 ( .dataA( temp1[15] ) , .dataB( temp1[13] ) , .S(dataB[1] ) , .dataOut( temp2[15] ) );
mux2to1 MUX2_16 ( .dataA( temp1[16] ) , .dataB( temp1[14] ) , .S(dataB[1] ) , .dataOut( temp2[16] ) );
mux2to1 MUX2_17 ( .dataA( temp1[17] ) , .dataB( temp1[15] ) , .S(dataB[1] ) , .dataOut( temp2[17] ) );
mux2to1 MUX2_18 ( .dataA( temp1[18] ) , .dataB( temp1[16] ) , .S(dataB[1] ) , .dataOut( temp2[18] ) );
mux2to1 MUX2_19 ( .dataA( temp1[19] ) , .dataB( temp1[17] ) , .S(dataB[1] ) , .dataOut( temp2[19] ) );

mux2to1 MUX2_20 ( .dataA( temp1[20] ) , .dataB( temp1[18] ) , .S(dataB[1] ) , .dataOut( temp2[20] ) );
mux2to1 MUX2_21 ( .dataA( temp1[21] ) , .dataB( temp1[19] ) , .S(dataB[1] ) , .dataOut( temp2[21] ) );
mux2to1 MUX2_22 ( .dataA( temp1[22] ) , .dataB( temp1[20] ) , .S(dataB[1] ) , .dataOut( temp2[22] ) );
mux2to1 MUX2_23 ( .dataA( temp1[23] ) , .dataB( temp1[21] ) , .S(dataB[1] ) , .dataOut( temp2[23] ) );
mux2to1 MUX2_24 ( .dataA( temp1[24] ) , .dataB( temp1[22] ) , .S(dataB[1] ) , .dataOut( temp2[24] ) );
mux2to1 MUX2_25 ( .dataA( temp1[25] ) , .dataB( temp1[23] ) , .S(dataB[1] ) , .dataOut( temp2[25] ) );
mux2to1 MUX2_26 ( .dataA( temp1[26] ) , .dataB( temp1[24] ) , .S(dataB[1] ) , .dataOut( temp2[26] ) );
mux2to1 MUX2_27 ( .dataA( temp1[27] ) , .dataB( temp1[25] ) , .S(dataB[1] ) , .dataOut( temp2[27] ) );
mux2to1 MUX2_28 ( .dataA( temp1[28] ) , .dataB( temp1[26] ) , .S(dataB[1] ) , .dataOut( temp2[28] ) );
mux2to1 MUX2_29 ( .dataA( temp1[29] ) , .dataB( temp1[27] ) , .S(dataB[1] ) , .dataOut( temp2[29] ) );

mux2to1 MUX2_30 ( .dataA( temp1[30] ) , .dataB( temp1[28] ) , .S(dataB[1] ) , .dataOut( temp2[30] ) );
mux2to1 MUX2_31 ( .dataA( temp1[31] ) , .dataB( temp1[29] ) , .S(dataB[1] ) , .dataOut( temp2[31] ) );

// MUX3

mux2to1 MUX3_00 ( .dataA( temp2[0] ) , .dataB( 1'b0 ) , .S( dataB[2] ) , .dataOut( temp3[0] ) );
mux2to1 MUX3_01 ( .dataA( temp2[1] ) , .dataB( 1'b0 ) , .S( dataB[2] ) , .dataOut( temp3[1] ) );
mux2to1 MUX3_02 ( .dataA( temp2[2] ) , .dataB( 1'b0 ) , .S( dataB[2] ) , .dataOut( temp3[2] ) );
mux2to1 MUX3_03 ( .dataA( temp2[3] ) , .dataB( 1'b0 ) , .S( dataB[2] ) , .dataOut( temp3[3] ) );
mux2to1 MUX3_04 ( .dataA( temp2[4] ) , .dataB( 1'b0 ) , .S( dataB[2] ) , .dataOut( temp3[4] ) );
mux2to1 MUX3_05 ( .dataA( temp2[5] ) , .dataB( temp2[0] ) , .S( dataB[2] ) , .dataOut( temp3[5] )) ;
mux2to1 MUX3_06 ( .dataA( temp2[6] ) , .dataB( temp2[1] ) , .S( dataB[2] ) , .dataOut( temp3[6] )) ;
mux2to1 MUX3_07 ( .dataA( temp2[7] ) , .dataB( temp2[2] ) , .S( dataB[2] ) , .dataOut( temp3[7] )) ;
mux2to1 MUX3_08 ( .dataA( temp2[8] ) , .dataB( temp2[3] ) , .S( dataB[2] ) , .dataOut( temp3[8] )) ;
mux2to1 MUX3_09 ( .dataA( temp2[9] ) , .dataB( temp2[4] ) , .S( dataB[2] ) , .dataOut( temp3[9] )) ;

mux2to1 MUX3_10 ( .dataA( temp2[10] ) , .dataB( temp2[5] ) , .S( dataB[2] ) , .dataOut( temp3[10] )) ;
mux2to1 MUX3_11 ( .dataA( temp2[11] ) , .dataB( temp2[6] ) , .S( dataB[2] ) , .dataOut( temp3[11] )) ;
mux2to1 MUX3_12 ( .dataA( temp2[12] ) , .dataB( temp2[7] ) , .S( dataB[2] ) , .dataOut( temp3[12] )) ;
mux2to1 MUX3_13 ( .dataA( temp2[13] ) , .dataB( temp2[8] ) , .S( dataB[2] ) , .dataOut( temp3[13] )) ;
mux2to1 MUX3_14 ( .dataA( temp2[14] ) , .dataB( temp2[9] ) , .S( dataB[2] ) , .dataOut( temp3[14] )) ;
mux2to1 MUX3_15 ( .dataA( temp2[15] ) , .dataB( temp2[10] ) , .S( dataB[2] ) , .dataOut( temp3[15] )) ;
mux2to1 MUX3_16 ( .dataA( temp2[16] ) , .dataB( temp2[11] ) , .S( dataB[2] ) , .dataOut( temp3[16] )) ;
mux2to1 MUX3_17 ( .dataA( temp2[17] ) , .dataB( temp2[12] ) , .S( dataB[2] ) , .dataOut( temp3[17] )) ;
mux2to1 MUX3_18 ( .dataA( temp2[18] ) , .dataB( temp2[13] ) , .S( dataB[2] ) , .dataOut( temp3[18] )) ;
mux2to1 MUX3_19 ( .dataA( temp2[19] ) , .dataB( temp2[14] ) , .S( dataB[2] ) , .dataOut( temp3[19] )) ;

mux2to1 MUX3_20 ( .dataA( temp2[20] ) , .dataB( temp2[15] ) , .S( dataB[2] ) , .dataOut( temp3[20] )) ;
mux2to1 MUX3_21 ( .dataA( temp2[21] ) , .dataB( temp2[16] ) , .S( dataB[2] ) , .dataOut( temp3[21] )) ;
mux2to1 MUX3_22 ( .dataA( temp2[22] ) , .dataB( temp2[17] ) , .S( dataB[2] ) , .dataOut( temp3[22] )) ;
mux2to1 MUX3_23 ( .dataA( temp2[23] ) , .dataB( temp2[18] ) , .S( dataB[2] ) , .dataOut( temp3[23] )) ;
mux2to1 MUX3_24 ( .dataA( temp2[24] ) , .dataB( temp2[19] ) , .S( dataB[2] ) , .dataOut( temp3[24] )) ;
mux2to1 MUX3_25 ( .dataA( temp2[25] ) , .dataB( temp2[20] ) , .S( dataB[2] ) , .dataOut( temp3[25] )) ;
mux2to1 MUX3_26 ( .dataA( temp2[26] ) , .dataB( temp2[21] ) , .S( dataB[2] ) , .dataOut( temp3[26] )) ;
mux2to1 MUX3_27 ( .dataA( temp2[27] ) , .dataB( temp2[22] ) , .S( dataB[2] ) , .dataOut( temp3[27] )) ;
mux2to1 MUX3_28 ( .dataA( temp2[28] ) , .dataB( temp2[23] ) , .S( dataB[2] ) , .dataOut( temp3[28] )) ;
mux2to1 MUX3_29 ( .dataA( temp2[29] ) , .dataB( temp2[24] ) , .S( dataB[2] ) , .dataOut( temp3[29] )) ;

mux2to1 MUX3_30 ( .dataA( temp2[30] ) , .dataB( temp2[25] ) , .S( dataB[2] ) , .dataOut( temp3[30] )) ;
mux2to1 MUX3_31 ( .dataA( temp2[31] ) , .dataB( temp2[26] ) , .S( dataB[2] ) , .dataOut( temp3[31] )) ;

// MUX4

mux2to1 MUX4_00 ( .dataA( temp3[0] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[0] )) ;
mux2to1 MUX4_01 ( .dataA( temp3[1] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[1] )) ;
mux2to1 MUX4_02 ( .dataA( temp3[2] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[2] )) ;
mux2to1 MUX4_03 ( .dataA( temp3[3] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[3] )) ;
mux2to1 MUX4_04 ( .dataA( temp3[4] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[4] )) ;
mux2to1 MUX4_05 ( .dataA( temp3[5] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[5] )) ;
mux2to1 MUX4_06 ( .dataA( temp3[6] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[6] )) ;
mux2to1 MUX4_07 ( .dataA( temp3[7] ) , .dataB( 1'b0 ) , .S( dataB[3] ) , .dataOut( temp4[7] )) ;
mux2to1 MUX4_08 ( .dataA( temp3[8] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[8] )) ;
mux2to1 MUX4_09 ( .dataA( temp3[9] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[9] )) ;

mux2to1 MUX4_10 ( .dataA( temp3[10] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[10] )) ;
mux2to1 MUX4_11 ( .dataA( temp3[11] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[11] )) ;
mux2to1 MUX4_12 ( .dataA( temp3[12] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[12] )) ;
mux2to1 MUX4_13 ( .dataA( temp3[13] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[13] )) ;
mux2to1 MUX4_14 ( .dataA( temp3[14] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[14] )) ;
mux2to1 MUX4_15 ( .dataA( temp3[15] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[15] )) ;
mux2to1 MUX4_16 ( .dataA( temp3[16] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[16] )) ;
mux2to1 MUX4_17 ( .dataA( temp3[17] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[17] )) ;
mux2to1 MUX4_18 ( .dataA( temp3[18] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[18] )) ;
mux2to1 MUX4_19 ( .dataA( temp3[19] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[19] )) ;

mux2to1 MUX4_20 ( .dataA( temp3[20] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[20] )) ;
mux2to1 MUX4_21 ( .dataA( temp3[21] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[21] )) ;
mux2to1 MUX4_22 ( .dataA( temp3[22] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[22] )) ;
mux2to1 MUX4_23 ( .dataA( temp3[23] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[23] )) ;
mux2to1 MUX4_24 ( .dataA( temp3[24] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[24] )) ;
mux2to1 MUX4_25 ( .dataA( temp3[25] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[25] )) ;
mux2to1 MUX4_26 ( .dataA( temp3[26] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[26] )) ;
mux2to1 MUX4_27 ( .dataA( temp3[27] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[27] )) ;
mux2to1 MUX4_28 ( .dataA( temp3[28] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[28] )) ;
mux2to1 MUX4_29 ( .dataA( temp3[29] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[29] )) ;

mux2to1 MUX4_30 ( .dataA( temp3[30] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[30] )) ;
mux2to1 MUX4_31 ( .dataA( temp3[31] ) , .dataB( temp3[0] ) , .S( dataB[3] ) , .dataOut( temp4[31] )) ;

// MUX5

mux2to1 MUX5_00 ( .dataA( temp4[0] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[0] )) ;
mux2to1 MUX5_01 ( .dataA( temp4[1] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[1] )) ;
mux2to1 MUX5_02 ( .dataA( temp4[2] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[2] )) ;
mux2to1 MUX5_03 ( .dataA( temp4[3] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[3] )) ;
mux2to1 MUX5_04 ( .dataA( temp4[4] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[4] )) ;
mux2to1 MUX5_05 ( .dataA( temp4[5] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[5] )) ;
mux2to1 MUX5_06 ( .dataA( temp4[6] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[6] )) ;
mux2to1 MUX5_07 ( .dataA( temp4[7] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[7] )) ;
mux2to1 MUX5_08 ( .dataA( temp4[8] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[8] )) ;
mux2to1 MUX5_09 ( .dataA( temp4[9] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[9] )) ;

mux2to1 MUX5_10 ( .dataA( temp4[10] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[10] )) ;
mux2to1 MUX5_11 ( .dataA( temp4[11] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[11] )) ;
mux2to1 MUX5_12 ( .dataA( temp4[12] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[12] )) ;
mux2to1 MUX5_13 ( .dataA( temp4[13] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[13] )) ;
mux2to1 MUX5_14 ( .dataA( temp4[14] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[14] )) ;
mux2to1 MUX5_15 ( .dataA( temp4[15] ) , .dataB( 1'b0 ) , .S( dataB[4] ) , .dataOut( temp5[15] )) ;
mux2to1 MUX5_16 ( .dataA( temp4[16] ) , .dataB( temp4[0]) , .S(dataB[4] ) , .dataOut( temp5[16] )) ;
mux2to1 MUX5_17 ( .dataA( temp4[17] ) , .dataB( temp4[1]) , .S(dataB[4] ) , .dataOut( temp5[17] )) ;
mux2to1 MUX5_18 ( .dataA( temp4[18] ) , .dataB( temp4[2]) , .S(dataB[4] ) , .dataOut( temp5[18] )) ;
mux2to1 MUX5_19 ( .dataA( temp4[19] ) , .dataB( temp4[3]) , .S(dataB[4] ) , .dataOut( temp5[19] )) ;

mux2to1 MUX5_20 ( .dataA( temp4[20] ) , .dataB( temp4[4]) , .S(dataB[4] ) , .dataOut( temp5[20] )) ;
mux2to1 MUX5_21 ( .dataA( temp4[21] ) , .dataB( temp4[5]) , .S(dataB[4] ) , .dataOut( temp5[21] )) ;
mux2to1 MUX5_22 ( .dataA( temp4[22] ) , .dataB( temp4[6]) , .S(dataB[4] ) , .dataOut( temp5[22] )) ;
mux2to1 MUX5_23 ( .dataA( temp4[23] ) , .dataB( temp4[7]) , .S(dataB[4] ) , .dataOut( temp5[23] )) ;
mux2to1 MUX5_24 ( .dataA( temp4[24] ) , .dataB( temp4[8]) , .S(dataB[4] ) , .dataOut( temp5[24] )) ;
mux2to1 MUX5_25 ( .dataA( temp4[25] ) , .dataB( temp4[9]) , .S(dataB[4] ) , .dataOut( temp5[25] )) ;
mux2to1 MUX5_26 ( .dataA( temp4[26] ) , .dataB( temp4[10]) , .S(dataB[4] ) , .dataOut( temp5[26] )) ;
mux2to1 MUX5_27 ( .dataA( temp4[27] ) , .dataB( temp4[11]) , .S(dataB[4] ) , .dataOut( temp5[27] )) ;
mux2to1 MUX5_28 ( .dataA( temp4[28] ) , .dataB( temp4[12]) , .S(dataB[4] ) , .dataOut( temp5[28] )) ;
mux2to1 MUX5_29 ( .dataA( temp4[29] ) , .dataB( temp4[13]) , .S(dataB[4] ) , .dataOut( temp5[29] )) ;

mux2to1 MUX5_30 ( .dataA( temp4[30] ) , .dataB( temp4[14]) , .S(dataB[4] ) , .dataOut( temp5[30] )) ;
mux2to1 MUX5_31 ( .dataA( temp4[31] ) , .dataB( temp4[15]) , .S(dataB[4] ) , .dataOut( temp5[31] )) ;


assign dataOut = ( Signal == SLL ) ? temp5 : 32'b0 ;
endmodule
