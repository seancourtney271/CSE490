`timescale 1ns / 1ps

module ALU_tb;
reg [2:0] opcode;
reg [7:0] op1, op2;
wire [7:0] result;

ALU alu(opcode, op1, op2, result);
initial begin
    #100
    opcode = 3'b011; // add $$t0, $t0, $t0
    op1 = 8'b00001010;
    op2 = 8'b00000101;
    #100
    opcode = 3'b100; // addi $t0, $t0, 2
    op1 = 8'b00000110;
    op2 = 8'b00000010;
    #100
    opcode = 3'b101; // sub $t1,$t1,$t
    op1 = 8'b00001011;
    op2 = 8'b00001010;
    #100 $finish;
end

endmodule
