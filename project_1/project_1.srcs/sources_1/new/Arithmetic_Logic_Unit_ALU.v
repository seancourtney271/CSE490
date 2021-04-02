`timescale 1ns / 1ps

//ALU
module ALU(opcode, op1, op2, result);
input [2:0] opcode;
input [7:0] op1, op2;
output reg [15:0] result = 16'b0000000000000000;
    always @(opcode or op1 or op2) //update result on any of these changing
        begin 
        if(opcode == 000)//ADD
            begin
            result = op1 + op2;
            end
        else if(opcode == 001)//SUB
            begin
            result = op1 - op2;
            end
        else
            begin
            end            
        end
endmodule
