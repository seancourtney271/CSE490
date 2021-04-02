`timescale 1ns / 1ps

//ALU
module ALU(opcode, op1, op2, result, fCarry, fZero);
input [2:0] opcode;
input [7:0] op1, op2;
output reg [15:0] result = 16'b0000000000000000;
output reg [0:0]fCarry, fZero = 1'b0;
    always @(opcode or op1 or op2) 
        begin 
        if(opcode == 000)
            begin
            result = op1 + op2;
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end
        else if(opcode == 001)
            begin
            result = op1 - op2;
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end
        else if(opcode == 010)
            begin
            result = op1 * op2;
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end
        else if(opcode == 011)
            begin
            result = op1 & op2;
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end
        else if(opcode == 100)
            begin
            result = op1 | op2;
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end
        else if(opcode == 101)
            begin
            result = ~(op1 & op2);
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end
        else if(opcode == 110)
            begin
            result = ~(op1 | op2);
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end        
        else if(opcode == 111)
            begin
            result = op1 ^ op2;
            fCarry = result[8];
            fZero = (result == 16'b0000000000000000);
            end            
        end
endmodule
