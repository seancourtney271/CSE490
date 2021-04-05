`timescale 1ns / 1ps
module Program_Counter_tb;
reg clock;
reg [7:0] change_address; // incomming address value
wire [7:0] new_address; // outgoing address value, only changes after delay loop
Program_Counter pc (clock, change_address, new_address);
initial begin
    #10
    clock = 1;//0
    change_address = 8'b00000000;
    #10
    clock = 0;
    #10
    clock = 1;//1
    change_address = 8'b00000001;
    #10
    clock = 0;
    #10
    clock = 1;//2
    change_address = 8'b00000010;
    #10
    clock = 0;
    #10
    clock = 1;//3
    change_address = 8'b00000011;
    #10
    clock = 0;
    #10
    clock = 1;//4
    change_address = 8'b00000100;
    #10
    clock = 0;
    #10
    clock = 1;//5
    change_address = 8'b00000101;
    #10
    clock = 0;
    #10
    clock = 1;//6
    change_address = 8'b00000110;
    #10
    clock = 0;
    #10
    clock = 1;//7
    change_address = 8'b00000111;
    #10
    clock = 0;
    #10 $finish;
end
endmodule
