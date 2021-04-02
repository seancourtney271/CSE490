`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 09:27:37 PM
// Design Name: 
// Module Name: Data_Mem
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
    
*/
module Data_Mem(
    input clock, read_write, // 0 read, 1 write
    input [7:0] address, write_data,
    output reg[7:0] read_data
    );

    reg[7:0] stack [63:0];
    
    always @(posedge clock)
    begin
    // write
        if(read_write) begin
            stack[address] <= write_data;
        end
        else begin
            read_data <= stack[address];
        end
    end
endmodule
