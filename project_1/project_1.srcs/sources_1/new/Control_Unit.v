`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 06:22:24 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(input [2:0] opcode,
                    input reset,
                    output reg [1:0] reg_dst, mem_to_reg, alu_op,
                    output reg jump,mem_read,mem_write,alu_src,reg_write,sign_extended);
    parameter [2:0] lw = 3'b000, sw = 3'b001, jmp = 3'b010, add = 3'b011, addi = 3'b100, sub = 3'b101; //create all possible parameters
    always @(opcode)
    begin
        case(opcode)
        lw:
        begin
            reg_dst = 2'b00;  
            mem_to_reg = 2'b01;
            alu_op = 2'b11; 
            jump = 1'b0;
            mem_read = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            reg_write = 1'b1;
        end
        sw:
        begin
            reg_dst = 2'b00;  
            mem_to_reg = 2'b00;
            alu_op = 2'b11; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            alu_src = 1'b1;
            reg_write = 1'b0;
        end
        jmp:
        begin
            reg_dst = 2'b00;  
            mem_to_reg = 2'b00;
            alu_op = 2'b00; 
            jump = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b0;
        end
        add:
        begin
            reg_dst = 2'b01;  
            mem_to_reg = 2'b00;
            alu_op = 2'b00; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
        end
        addi:
        begin
            reg_dst = 2'b00;  
            mem_to_reg = 2'b00;
            alu_op = 2'b00; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b1;
            reg_write = 1'b1;
        end
        sub:
        begin
            reg_dst = 2'b01;  
            mem_to_reg = 2'b00;
            alu_op = 2'b00; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
        end        
        endcase
    end
endmodule
