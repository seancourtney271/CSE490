`timescale 1ns / 1ps

module MUX2to1(a, b, s, f);
    input [7:0] a, b;
    input s;
    output reg [7:0] f;
    
    always @(s)
        begin
            case(s)
                1'b0: f = a; //Bit 0 choose A
                1'b1: f = b; //Bit 1 choose B
            endcase
        end
endmodule