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
    wire [7:0] Jump_Addr; // sign extended jump address
    wire [7:0] PC_out;
    wire [7:0] Fetched_Instruction;
    wire [2:0] Op_code;
    wire [2:0] ID_out_Imm_bits; // immediate value from instruction
    wire [2:0] Ctrl_op_to_ALU;
    wire Ctrl_jump, Ctrl_Mem_Read, Ctrl_Alu_Src, Ctrl_Reg_Write;
    wire [2:0] ALU_op;
    wire [7:0] Immediate;
    
    
    
    
    Register_File Registers();
    
    Control_Unit(Op_code, Ctrl_op_to_ALU, Ctrl_jump, Ctrl_Mem_Read, Ctrl_Alu_Src, Ctrl_Reg_Write);
    
    Program_Counter PC(clock, Jump_Sig, Jump_Addr, PC_out);
    
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    
    Instruction_Decode ID(Fetched_Instruction, Op_code, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_write_reg, ID_out_Imm_bits, Jump_Addr);
    
    ALU EX(ALU_op, );
    
    Data_Mem Mem();
        
    Sign_Extend_Unit immediate_sign_extend(ID_out_Imm_bits, Immediate);
    
    MUX2to1 ALU_Input_MUX( , , , );
    
    MUX2to1 ALU_Output_MUX( , , , );
    
    

    
    
    
    

    
    
    always @ (posedge clock)
    begin     
        
    end
endmodule
