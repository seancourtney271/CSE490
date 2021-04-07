`timescale 1ns / 1ps
/*
    Takes a 5bit input and sign extends to 8 bits
*/
module Sign_Extend_Unit(
    input [4:0] j_addr,
    output reg[7:0] full_addr
    );
    always @(j_addr)
    begin
        full_addr <= $signed(j_addr);
    end
endmodule
