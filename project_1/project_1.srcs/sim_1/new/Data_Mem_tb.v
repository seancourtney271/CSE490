`timescale 1ns / 1ps

module Data_Mem_tb;
reg clock, read_write; // 0 read, 1 write
reg [7:0] address, write_data;
wire [7:0] read_data;
Data_Mem dm (clock, read_write, address, write_data, read_data);
initial begin
    #10
    clock = 1;//0
    read_write = 1;
    write_data = 8'b11111111;
    address = 8'b00000000;
    #10
    clock = 0;
    #10
    clock = 1;//1
    read_write = 1;
    write_data = 8'b11110000;
    address = 8'b00000001;
    #10
    clock = 0;
    #10
    clock = 1;//2
    read_write = 1;
    write_data = 8'b10101010;
    address = 8'b00000010;
    #10
    clock = 0;
    #10
    clock = 1;//3
    read_write = 1;
    write_data = 8'b11111111;
    address = 8'b00000100;
    #10
    clock = 0;
    #10
    clock = 1;//4
    read_write = 0;
    write_data = 8'b00000000;
    address = 8'b00000001;
    #10
    clock = 0;
    #10
    clock = 1;//5
    read_write = 0;
    address = 8'b00000100;
    #10
    clock = 0;
    #10
    clock = 1;//6
    read_write = 0;
    address = 8'b00000010;
    #10
    clock = 0;
    #10
    clock = 1;//7
    read_write = 0;
    address = 8'b00000000;
    #10
    clock = 0;
    #10 $finish;
end
endmodule
