`timescale 1ns / 1ps

module Data_Mem(
    input clock, read_write, // 0 read, 1 write
    input [7:0] address, write_data,
    output reg[7:0] read_data
    );
    integer i;
    reg[7:0] stack [31:0];
    
    initial begin
//        stack[0] = 8'b1;
        for(i = 0; i < 31; i = i + 1)begin
        stack[i] = 8'b0;
        end
//        stack[0] = 8'b00001010;
//        stack[3] = 8'b11101110;
    end
    
    always @(posedge clock)
    begin
    // write
        if(read_write) begin
            stack[address] = write_data;
        end
        else begin
            read_data = stack[address];
        end
    end
endmodule
