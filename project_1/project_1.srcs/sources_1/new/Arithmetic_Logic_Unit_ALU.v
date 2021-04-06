`timescale 1ns / 1ps

//ALU
module ALU(opcode, op1, op2, result);
input [2:0] opcode;
input [7:0] op1, op2;
output reg [7:0] result = 8'b0;
parameter [2:0] lw = 3'b000, sw = 3'b001, jmp = 3'b010, add = 3'b011, addi = 3'b100, sub = 3'b101;
    always @(opcode or op1 or op2) //update result on any of these changing
        begin 
        case(opcode)
        add:
        begin
            result = op1 + op2;
        end
        addi:
        begin
            result = op1 + op2;
        end
        sub:
        begin
            result = op1 - op2;
        end
        default:
        begin
            result = 8'b0;
        end
        endcase     
        end
endmodule
