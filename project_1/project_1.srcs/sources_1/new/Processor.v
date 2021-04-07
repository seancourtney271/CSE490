`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 11:09:43 AM
// Design Name: 
// Module Name: Processor
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


module Processor(
    input clock
    );
    
    wire Jump_Sig;
    wire [7:0] Jump_Addr;
    wire [7:0] PC_out;
    wire [7:0] Fetched_Instruction;
    
    
    
    Register_File Registers();
    Control_Unit();
    Program_Counter PC(clock, Jump_Sig, Jump_Addr, PC_out);
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    Instruction_Decode ID();
    ALU EX();
    Data_Mem Mem();
    
    

    
    
    
    

    
    
    always @ (posedge clock)
    begin     
        
    end
endmodule
