`timescale 1ns / 1ps

module Instruction_Decode_tb;
reg [7:0] instruction;
wire [2:0]control;
wire read_reg_1;
wire read_reg_2;
wire [2:0]mux_write_reg;
wire [4:0]sign_extended;

Instruction_Decode decoder(instruction, control, read_reg_1, read_reg_2, mux_write_reg, sign_extended);
initial begin 
//    $dumpvars(1, test);
    #100
    instruction = 8'b00000000;
    #100
    instruction = 8'b00010000; // lw $t0, 0($t1)
    #100
    instruction = 8'b01110000; // add $$t0, $t0, $t0
    #100
    instruction = 8'b10000010; // addi $t0, $t0, 2
    #100
    instruction = 8'b01000100; // j L1
    #100
    instruction = 8'b00110000; // L1: sw $t0, 0($t1)
    #100
    instruction = 8'b10111000; // sub $t1,$t1,$t
    #100 $finish;
end
endmodule
