`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   SUBMISSION 
//////////////////////////////////////////////////////////////////////////////////

 
module Processor_tb;
    reg clock;
    integer i, t = 10;

    wire Jump_Sig,
         bit_4_reg,
         bit_3_reg,
         Mem_write_signal,
         Reg_write_signal,
         ALU_MUX_signal,
         writeback_MUX_signal;
         
    wire [2:0] Op_code,
               ID_out_Imm_bits, // immediate value from instruction
               Ctrl_op_to_ALU;
    
    
    wire [7:0] Jump_Addr, // sign extended jump address
               PC_out,
               Fetched_Instruction,
               Immediate,
               read_data,
               writeback,
               t0_data,
               t1_data,
               ALU_MUX_to_ALU,
               alu_result;
    
    
    Register_File Registers(clock, bit_4_reg, bit_3_reg, Reg_write_signal, writeback, t0_data, t1_data);
    
    Control_Unit Control(Op_code, Ctrl_op_to_ALU, Jump_Sig, Mem_write_signal, ALU_MUX_signal, writeback_MUX_signal, Reg_write_signal);
    
    Program_Counter PC(clock, Jump_Sig, Jump_Addr, PC_out);
    
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    
    Instruction_Decode ID(Fetched_Instruction, Op_code, bit_4_reg, bit_3_reg, ID_out_Imm_bits, Jump_Addr);
    
    ALU EX(Op_code, t0_data, ALU_MUX_to_ALU, alu_result);
    
    Data_Mem Mem(clock, Mem_write_signal, alu_result, t1_data/*to mem*/, read_data/*from mem*/);
        
    Sign_Extend_Unit immediate_sign_extend(ID_out_Imm_bits, Immediate);
    
    MUX2to1 ALU_Input_MUX(t1_data, Immediate, ALU_MUX_signal, ALU_MUX_to_ALU);
    
    MUX2to1 Writeback_MUX(read_data, alu_result, writeback_MUX_signal, writeback);
    
    
    
        
    initial begin
        #20;
        for(i = 0; i < 10 ; i = i + 1)begin
            clock = 1;
            #t;
            clock = 0;
            #t;
        end 
    $finish;
    end
    
//    always
//    #50 clock = ~clock;
endmodule
