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
    
    wire Jump_Signal,
         ID_out_reg1_bit,
         ID_out_reg2_bit,
         Mem_write_signal,
         Reg_write_signal,
         ALU_MUX_signal,
         writeback_MUX_signal;
         
    wire [2:0] Op_code,
               Ctrl_op_to_ALU,
               ID_out_Imm_bits; // immediate value from instruction
    
    
    wire [7:0] Jump_Addr, // sign extended jump address
               PC_out,
               Fetched_Instruction,
               Immediate,
               read_data,
               writeback,
               t0_data,
               t1_data,
               input_MUX_to_ALU,
               alu_result;
    
    
    Register_File Registers(clock, ID_out_reg1_bit, ID_out_reg2_bit, Reg_write_signal, writeback, t0_data, t1_data);
    
    Control_Unit Control(Op_code, Ctrl_op_to_ALU, Jump_Signal, Mem_write_signal, ALU_MUX_signal, writeback_MUX_signal, Reg_write_signal);
    
    Program_Counter PC(clock, Jump_Signal, Jump_Addr, PC_out);
    
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    
    Instruction_Decode ID(Fetched_Instruction, Op_code, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_Imm_bits, Jump_Addr);
    
    ALU EX(Op_code, t0_data, input_MUX_to_ALU, alu_result);
    
    Data_Mem Mem(clock, Mem_write_signal, alu_result, t1_data/*to mem*/, read_data/*from mem*/);
        
    Sign_Extend_Unit immediate_sign_extend(ID_out_Imm_bits, Immediate);
    
    MUX2to1 ALU_Input_MUX(t1_data, Immediate, ALU_MUX_signal, input_MUX_to_ALU);
    
    MUX2to1 ALU_Output_MUX(read_data, alu_result, writeback_MUX_signal, writeback);
    
    

    
    
    
    

    
    
    always @ (posedge clock)
    begin
        
        
    end
endmodule
