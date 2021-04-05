`timescale 1ns / 1ps
module Program_Counter_tb;
reg clock;
reg jump;
reg [7:0] change_address; // incomming address value
wire [7:0] new_address; // outgoing address value, only changes after delay loop
Program_Counter pc (.clock(clock), .jump_signal(jump), .change_address(change_address), .new_address(new_address));
integer i;
initial begin
    
    
    jump = 0;
    change_address = 1;
    for(i = 0; i < 12 ; i = i + 1)begin
        clock = 1;//0
        #10;
        clock = 0;
        #10;
    end
    
    jump = 1;
    clock = 1;
    #10;
    clock = 0;
    #10;
    jump = 0;
    for(i = 0; i < 11 ; i = i + 1)begin
        clock = 1;//0
        #10;
        clock = 0;
        #10;
    end
  
    $finish;
end
endmodule
