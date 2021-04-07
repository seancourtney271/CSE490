`timescale 1ns / 1ps

module Register_File_tb;
reg clock, read_reg2, read_reg1, write_reg, control;
reg [7:0] write_data;
wire [7:0] t0_data, t1_data;
Register_File register(clock, read_reg2, read_reg1, write_reg, control, write_data, t0_data, t1_data);
initial begin
    #10
    control = 1;
    write_reg = 1;//t1
    write_data = 8'b11110101;
    clock = 1;//0
    #10
    clock = 0;
    #10
    write_reg = 0;
    write_data = 8'b11001011;
    clock = 1;//1
    #10
    clock = 0;
    #10
    clock = 1;//2
    #10
    clock = 0;
    #10
    control = 0;
    write_data = 8'b10101010;
    clock = 1;//3
    #10
    clock = 0;
    #10
    control = 1;
    clock = 1;//4
    #10
    clock = 0;
    #10
    clock = 1;//5
    #10
    clock = 0;
    #10
    clock = 1;//6
    #10
    clock = 0;
    #10
    clock = 1;//7
    #10 $finish;
end
endmodule
