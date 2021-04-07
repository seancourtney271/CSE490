`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 12:23:31 PM
// Design Name: 
// Module Name: Instruction_Decode
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


module Instruction_Decode(
    input [7:0]instruction,
    output reg [2:0]control,
    output reg read_reg_1,
    output reg read_reg_2,
    output reg write_reg,
    output reg [4:0]sign_extended
    );
    //Break up instruction
    wire [2:0]opcode = instruction[7:5]; //grab opcode from unstruction
//    parameter [2:0] lw = 3'b000, sw = 3'b001, jmp = 3'b010, add = 3'b011, addi = 3'b100, sub = 3'b101; //create all possible parameters
    always @ (instruction) //update when instruction changes
        begin
                control = opcode; //set all necesarry bits for future modules.
                read_reg_1 = instruction[4];
                read_reg_2 = instruction[3];
                write_reg = instruction[4];
                sign_extended = instruction[4:0];
        end
endmodule
