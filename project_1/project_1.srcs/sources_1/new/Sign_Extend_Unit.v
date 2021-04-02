`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 08:46:26 PM
// Design Name: 
// Module Name: Sign_Extend_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
    Takes a 5bit input and sign extends to 8 bits
*/
module Sign_Extend_Unit(
    input clock,
    input [4:0] j_addr,
    output reg[7:0] full_addr
    );
    always @(posedge clock)
    begin
        full_addr <= $signed(j_addr);
    end
endmodule
