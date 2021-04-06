`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 05:59:01 PM
// Design Name: 
// Module Name: Instruction_Mem_Fetch
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
    Given a 8'b address returns 8'b instruction value.
    Works in conjunction with the Program Counter.
*/
module Instruction_Mem_Fetch(
    input clock,
    input[7:0] address,
    output reg[7:0] data
    );
    
    // Declaration of 64 word memory array
    reg[7:0] instruction_mem[15:0];
    
    // load first 6 instructions for testing
    initial
    begin
    instruction_mem[0] <= 8'b00010000; // lw $t0, 0($t1)
    instruction_mem[1] <= 8'b01110000; // add $$t0, $t0, $t0
    instruction_mem[2] <= 8'b10000010; // addi $t0, $t0, 2
    instruction_mem[3] <= 8'b01000100; // j L1
    instruction_mem[4] <= 8'b00110000; // L1: sw $t0, 0($t1)
    instruction_mem[5] <= 8'b10111000; // sub $t1,$t1,$t
    end
    
    always @(posedge clock) // when address received
    begin
    data <= instruction_mem[address]; // output data to data 
    end
endmodule
