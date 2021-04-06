`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 07:10:16 PM
// Design Name: 
// Module Name: Program_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Program_Counter(
    input clock, jump_signal,
    input[7:0] change_address, // incomming address value
    output reg[7:0] new_address // outgoing address value, only changes after delay loop
    );
    
    integer delay = 1; // counter to prevent over running instruction execution process
    reg[7:0] position = 8'b0; // 

    
    always @(posedge clock)
    begin
        
        if(jump_signal != 1) begin
        
        
            if(delay == 0) begin // change address
                position <= position + 1;
                new_address <= position;                
                delay = delay + 1; // increment counter
            end
            else begin // no address change
                if(delay < 3) begin
                    delay = delay + 1; // increment counter
                    new_address <= position; // address no change
                end
                else begin
                    delay = 0; // reset counter
                    new_address <= position; // address no change
                end
            end
        end
        else begin
            position <= change_address;
            new_address <= position;
            delay = 1; // reset counter
        end
    end
endmodule
