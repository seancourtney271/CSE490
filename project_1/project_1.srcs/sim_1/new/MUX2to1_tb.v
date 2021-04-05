`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 03:49:40 PM
// Design Name: 
// Module Name: MUX2to1_tb
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


module MUX2to1_tb;
reg [7:0] a, b;
reg s;
wire [7:0] f;
MUX2to1 mux(a, b, s, f);
initial begin
    #100
    a = 8'b00001111;
    b = 8'b11111111;
    s = 0;
    #100
    s = 1;
    #100 $finish;
end
endmodule
