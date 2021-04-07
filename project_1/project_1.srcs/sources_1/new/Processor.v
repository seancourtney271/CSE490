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
    
    wire Jump_Sig, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_write_reg;
    wire [7:0] Jump_Addr;
    wire [7:0] PC_out;
    wire [7:0] Fetched_Instruction;
    wire [2:0] to_Ctrl_Op_bits;
    wire [4:0] ID_out_j_type_bits;
    wire [2:0] Ctrl_op_to_ALU;
    wire Ctrl_jump, Ctrl_Mem_Read, Ctrl_Alu_Src, Ctrl_Reg_Write;
    wire [2:0] ALU_op;
    
    
    
    
    Register_File Registers();
    
    Control_Unit(to_Ctrl_Op_bits, Ctrl_op_to_ALU, Ctrl_jump, Ctrl_Mem_Read, Ctrl_Alu_Src, Ctrl_Reg_Write);
    
    Program_Counter PC(clock, Jump_Sig, Jump_Addr, PC_out);
    
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    
    Instruction_Decode ID(Fetched_Instruction, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_write_reg, ID_out_j_type_bits);
    
    ALU EX(ALU_op, );
    
    Data_Mem Mem();
    
    

    
    
    
    

    
    
    always @ (posedge clock)
    begin     
        
    end
endmodule
