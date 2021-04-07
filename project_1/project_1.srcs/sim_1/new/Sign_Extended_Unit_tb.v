`timescale 1ns / 1ps

module Sign_Extended_Unit_tb;
reg clock;
reg [4:0] j_addr;
wire [7:0] full_addr;
Sign_Extend_Unit seu(j_addr, full_addr);
initial begin
    #10
    clock = 1;//0
    j_addr = 4'b1111;
    #10
    clock = 0;
    #10
    clock = 1;//1
    j_addr = 4'b1010;
    #10
    clock = 0;
    #10
    clock = 1;//2
    j_addr = 4'b0011;
    #10
    clock = 0;
    #10
    clock = 1;//3
    j_addr = 4'b1000;

    #10 $finish;
    end
endmodule
