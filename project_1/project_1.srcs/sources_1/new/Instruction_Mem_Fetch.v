`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   SUBMISSION 
//////////////////////////////////////////////////////////////////////////////////


/*
    Given a 8'b address returns 8'b instruction value.
    Works in conjunction with the Program Counter.
*/
module Instruction_Mem_Fetch(
    input[7:0] address,
    output reg[7:0] data
    );
    
    // Declaration of 64 word memory array
    reg[7:0] instruction_mem[15:0];
    
    // load first 6 instructions for testing
    initial
    begin
        instruction_mem[0] = 8'b10011011; // addi $t1, $t1, 3    t0:0 , t1:3
        instruction_mem[1] = 8'b10000010; // addi $t0, $t0, 2    t0:2 , t1:3
        instruction_mem[2] = 8'b01100000; // add $t0, $t0, $t0   t0:4 , t1:3
        instruction_mem[3] = 8'b00101000; // sw $t1, 0($t0)  store to stack[4] = 3
        instruction_mem[4] = 8'b01000110; // j L1
        instruction_mem[6] = 8'b10101000; // sub $t0,$t0,$t1     t0:1  , t1:3
        instruction_mem[7] = 8'b01110000; // add $t1, $t1, $t0   t0:1 , t1:4
        instruction_mem[8] = 8'b00010000; // lw $t0, 0($t1)      t0:3 , t1:4
//        instruction_mem[9] = 8'b00010000; // display regs
    
//    instruction_mem[0] = 8'b00010000; //     lw $t0, 0($t1)
//    instruction_mem[1] = 8'b01100000; //     add $t0, $t0, $t0
//    instruction_mem[2] = 8'b10000010; //     addi $t0, $t0, 2
//    instruction_mem[3] = 8'b01000100; //     j L1
//    instruction_mem[4] = 8'b00110000; // L1: sw $t0, 0($t1)
//    instruction_mem[5] = 8'b10110000; //     sub $t1,$t1,$t0
//    instruction_mem[6] = 8'b01000000; //     j L1


            // ADDs
//        instruction_mem[0] = 8'b01100000; // add $t0, $t0, $t0
//        instruction_mem[1] = 8'b01100000; // add $t0, $t0, $t0
//        instruction_mem[2] = 8'b01100000; // add $t0,$t0,$t0
//        instruction_mem[3] = 8'b01100000; // add $t0,$t0,$t0

            // ADDis
//        instruction_mem[0] = 8'b10000001; // addi $t0, $t0, 1
//        instruction_mem[1] = 8'b10000001; // addi $t0, $t0, 1
//        instruction_mem[2] = 8'b10000001; // addi $t0, $t0, 1
//        instruction_mem[3] = 8'b10000001; // addi $t0, $t0, 1

            // SUBs
//        instruction_mem[0] = 8'b10110000; // sub $t1,$t1,$t0
//        instruction_mem[1] = 8'b10110000; // sub $t1,$t1,$t0
//        instruction_mem[2] = 8'b10110000; // sub $t1,$t1,$t0
//        instruction_mem[3] = 8'b10110000; // sub $t1,$t1,$t0

            // LW
//        instruction_mem[0] = 8'b00001000; // lw $t0, 0($t1)
//        instruction_mem[1] = 8'b00001000; // lw $t0, 0($t1)
//        instruction_mem[2] = 8'b00001000; // lw $t0, 0($t1)
//        instruction_mem[1] = 8'b11100000; // display regs
//        instruction_mem[2] = 8'b11100000; // display regs

            //SW
//        instruction_mem[0] = 8'b00101011; // sw $t0, 3($t1)
//        instruction_mem[1] = 8'b00001011; // lw $t0, 3($t1)
//        instruction_mem[2] = 8'b00110000; // sw $t0, 0($t1)

//        instruction_mem[0] = 8'b10101000; // sub $t0, $t1, $t0
//        instruction_mem[1] = 8'b10101000; // sub $t0, $t1, $t0
//        instruction_mem[2] = 8'b10101000; // sub $t0, $t1, $t0
    end
    
    always @(address) // when address received
    begin
    data <= instruction_mem[address]; // output data to data 
    end
endmodule
