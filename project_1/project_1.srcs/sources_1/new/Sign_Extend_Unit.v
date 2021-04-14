`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   SUBMISSION 
//////////////////////////////////////////////////////////////////////////////////


/*
    Takes a 5bit input and sign extends to 8 bits
*/
module Sign_Extend_Unit(
    input [2:0] immediate,
    output reg[7:0] full_Imm
    );
    always @(immediate)
    begin
        full_Imm = $signed(immediate);
    end
endmodule
 