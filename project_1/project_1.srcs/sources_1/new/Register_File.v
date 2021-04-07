`timescale 1ns / 1ps

module Register_File(
    input clock, read_reg2, read_reg1, write_reg, control,
    input [7:0] write_data,
    output reg [7:0] t0_data, t1_data);
    
    reg [7:0] t0, t1;
    
    always @ (posedge clock)
    begin
        t0_data <= t0;
        t1_data <= t1;
        if(control)
        begin
            if(write_reg)//Write to Reg2
            begin
                t1 <= write_data;
            end
            else//Write to Reg1
            begin
                t0 <= write_data;
            end
        end
        else 
        begin 
        end
    end
endmodule
