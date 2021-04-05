`timescale 1ns / 1ps

module Control_Unit_tb;
reg [2:0]opcode;
reg reset;
wire [1:0] reg_dst, mem_to_reg, alu_op;
wire jump,mem_read,mem_write,alu_src,reg_write;
parameter [2:0] lw = 3'b000, sw = 3'b001, jmp = 3'b010, add = 3'b011, addi = 3'b100, sub = 3'b101;
control_unit control(opcode, reset, reg_dst, mem_to_reg, alu_op, jump, mem_read, mem_write, alu_src, reg_write);
initial begin
    #10
    opcode = lw;
    #10
    opcode = sw;
    #10
    opcode = jmp;
    #10
    opcode = add;
    #10
    opcode = addi;
    #10
    opcode = sub;
    #10
    opcode = 3'b111;
    #10 $finish;
end
endmodule
