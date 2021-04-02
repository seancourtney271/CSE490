`timescale 1ns / 1ps

module MUX2to1(a, b, s, f);
    input a, b, s;
    output reg f;
    
    always @(s)
        begin
            case(s)
                1'b0: f = a;
                1'b1: f = b;
            endcase
        end
endmodule