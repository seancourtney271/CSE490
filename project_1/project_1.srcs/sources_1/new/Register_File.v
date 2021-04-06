`timescale 1ns / 1ps

module Register_File(
    input clock, read_reg2, read_reg1, write_reg1,
    input [7:0] write_data,
    output [7:0] t0_data, t1_data);
    always @ (clock)
    begin
        if(write_reg1)//Write to Reg1
        begin
            
        end   
        
        else //Write to Reg2
        begin 
            
        end
    end
endmodule
