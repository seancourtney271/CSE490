`timescale 1ns / 1ps

module MUX2to1(a, b, signal, f);
    input [7:0] a, b;
    input signal;
    output reg [7:0] f;
    
    always @(signal)
        begin
            case(signal)
                1'b0: f = a; //Bit 0 choose A
                1'b1: f = b; //Bit 1 choose B
            endcase
        end
endmodule