`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 03:41:14 PM
// Design Name: 
// Module Name: Data_Mem_tb
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


module Data_Mem_tb;
reg clock, read_write; // 0 read, 1 write
reg [7:0] address, write_data;
wire [7:0] read_data;
Data_Mem dm (clock, read_write, address, write_data, read_data);
initial begin
    #10
    clock = 1;//0
    address = 8'b00000000;
    #10
    clock = 0;
    #10
    clock = 1;//1
    address = 8'b00000001;
    #10
    clock = 0;
    #10
    clock = 1;//2
    address = 8'b00000010;
    #10
    clock = 0;
    #10
    clock = 1;//3
    address = 8'b00000011;
    #10
    clock = 0;
    #10
    clock = 1;//4
    address = 8'b00000100;
    #10
    clock = 0;
    #10
    clock = 1;//5
    address = 8'b00000101;
    #10
    clock = 0;
    #10
    clock = 1;//6
    address = 8'b00000110;
    #10
    clock = 0;
    #10
    clock = 1;//7
    address = 8'b00000111;
    #10
    clock = 0;
    #10 $finish;
end
endmodule
