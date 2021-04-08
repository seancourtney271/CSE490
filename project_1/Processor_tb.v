`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 10:03:33 PM
// Design Name: 
// Module Name: Processor_tb
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

 
module Processor_tb;
    reg clock;
    integer i, t = 10;
    reg j = 0; // for test/debug

    wire Jump_Sig,
         ID_out_reg1_bit,
         ID_out_reg2_bit,
         Ctrl_Mem_Read,
         Ctrl_Alu_Src,
         Ctrl_Reg_Write,
         data_read_write_signal,
         input_MUX_signal,
         input_MUX_to_ALU,
         output_MUX_signal;
         
    wire [2:0] Op_code,
               ID_out_Imm_bits, // immediate value from instruction
               Ctrl_op_to_ALU;
    
    
    wire [7:0] Jump_Addr, // sign extended jump address
               PC_out,
               Fetched_Instruction,
               Immediate,
               read_address,
               write_data,
               read_data,
               writeback,
               t0_data,
               t1_data,
               alu_result;
    
    
    Register_File Registers(clock, ID_out_reg1_bit, ID_out_reg2_bit, Ctrl_Reg_Write, writeback, t0_data, t1_data);
    
    Control_Unit Control(Op_code, Ctrl_op_to_ALU, Jump_Sig, Ctrl_Mem_Read, Ctrl_Alu_Src, Ctrl_Reg_Write);
    
    Program_Counter PC(.clock(clock), .jump_signal(Jump_Sig), .change_address(Jump_Addr), .new_address(PC_out));
    
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    
    Instruction_Decode ID(Fetched_Instruction, Op_code, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_Imm_bits, Jump_Addr);
    
    ALU EX(Op_code, t0_data, input_MUX_to_ALU, alu_result);
    
    Data_Mem Mem(clock, data_read_write_signal, read_address, write_data/*to mem*/, read_data/*from mem*/);
        
    Sign_Extend_Unit immediate_sign_extend(ID_out_Imm_bits, Immediate);
    
    MUX2to1 ALU_Input_MUX( t1_data, Immediate, input_MUX_signal, input_MUX_to_ALU);
    
    MUX2to1 ALU_Output_MUX( read_data, alu_result, output_MUX_signal, writeback);
    
    initial begin
    
        #t;
        for(i = 0; i < 100 ; i = i + 1)begin
            clock = 1;
            #t;
            clock = 0;
            #t;
        end
    
    
    $finish;
    end
endmodule
