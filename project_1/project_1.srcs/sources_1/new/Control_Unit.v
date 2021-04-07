`timescale 1ns / 1ps

module Control_Unit(input [2:0] opcode,
                    output reg [2:0] alu_op,
//                    output reg reg_dst, mem_to_reg,
                    output reg jump,mem_read,mem_write,alu_src,reg_write);
    parameter [2:0] lw = 3'b000, sw = 3'b001, jmp = 3'b010, add = 3'b011, addi = 3'b100, sub = 3'b101; //create all possible parameters
    always @(opcode)
    
    begin
        case(opcode)
        lw:
        begin
//            reg_dst = 2'b00;  
//            mem_to_reg = 2'b01;
            alu_op = opcode; 
            jump = 1'b0;
            mem_read = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            reg_write = 1'b1;
        end
        sw:
        begin
//            reg_dst = 2'b00;  
//            mem_to_reg = 2'b00;
            alu_op = opcode; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            alu_src = 1'b1;
            reg_write = 1'b0;
        end
        jmp: //Add when there is a jump instruction need to foward a 1 bit to the PC
        begin
//            reg_dst = 2'b00;  
//            mem_to_reg = 2'b00;
            alu_op = opcode; 
            jump = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b0;
        end
        add:
        begin
//            reg_dst = 2'b01;  
//            mem_to_reg = 2'b00;
            alu_op = opcode; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
        end
        addi:
        begin
//            reg_dst = 2'b00;  
//            mem_to_reg = 2'b00;
            alu_op = opcode; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b1;
            reg_write = 1'b1;
        end
        sub:
        begin
//            reg_dst = 2'b01;  
//            mem_to_reg = 2'b00;
            alu_op = opcode; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
        end
        default:
        begin
//            reg_dst = 2'b00;  
//            mem_to_reg = 2'b00;
            alu_op = 2'b00; 
            jump = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b0;
        end        
        endcase
    end
endmodule
