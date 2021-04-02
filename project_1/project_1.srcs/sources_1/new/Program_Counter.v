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
    input clock,
    input[7:0] change_address,
    output reg[7:0] new_address
    );
    
    reg[7:0] position = 8'b0;
    
    always @(posedge clock)
    begin
        if(change_address)
            begin
            position <= change_address;
            end
        else
            begin
            position <= position + 1;
            end
        
        new_address <= position;        
    end
endmodule
