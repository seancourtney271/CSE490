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
    
    wire Jump_Sig,
         ID_out_reg1_bit,
         ID_out_reg2_bit,
         ID_out_write_reg,
         Ctrl_jump,
         Ctrl_Mem_Read,
         Ctrl_Alu_Src,
         Ctrl_Reg_Write,
         data_read_write_signal,
         input_MUX_signal,
         input_MUX_to_ALU,
         output_MUX_signal;
         
    wire [2:0] Op_code,
               ID_out_Imm_bits, // immediate value from instruction
               Ctrl_op_to_ALU,
               ALU_op;
    
    
    wire [7:0] Jump_Addr, // sign extended jump address
               PC_out,
               Fetched_Instruction,
               Immediate,
               read_address, write_data, read_data,
               writeback,
               t0_data,
               t1_data;
    
    
    Register_File Registers(clock, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_write_reg, /*control*/, writeback, t0_data, t1_data);
    
    Control_Unit(Op_code, Ctrl_op_to_ALU, Ctrl_jump, Ctrl_Mem_Read, Ctrl_Alu_Src, Ctrl_Reg_Write);
    
    Program_Counter PC(clock, Jump_Sig, Jump_Addr, PC_out);
    
    Instruction_Mem_Fetch IF(PC_out, Fetched_Instruction);
    
    Instruction_Decode ID(Fetched_Instruction, Op_code, ID_out_reg1_bit, ID_out_reg2_bit, ID_out_write_reg, ID_out_Imm_bits, Jump_Addr);
    
    ALU EX(ALU_op, ); // def not done
    
    Data_Mem Mem(clock, data_read_write_signal, read_address, write_data/*to mem*/, read_data/*from mem*/);
        
    Sign_Extend_Unit immediate_sign_extend(ID_out_Imm_bits, Immediate);
    
    MUX2to1 ALU_Input_MUX( t1_data, Immediate, input_MUX_signal, input_MUX_to_ALU); // def not done
    
    MUX2to1 ALU_Output_MUX( read_data, /*alu output*/, output_MUX_signal, writeback); // def not done
    
    

    
    
    
    

    
    
    always @ (posedge clock)
    begin     
        
    end
endmodule
