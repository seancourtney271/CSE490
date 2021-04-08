`timescale 1ns / 1ps

module Register_File(
    input clock, read_reg1, read_reg2, write_reg,
    input [7:0] write_data,
    output reg [7:0] t0_data, t1_data);

    reg [7:0] t0, t1; // registers
    
    always @ (posedge clock)
    begin
        if(read_reg1 & read_reg2) //11
        begin
            t0_data <= t1;
            t1_data <= t1;
        end
        else if(!read_reg1 & !read_reg2)//00
        begin
            t0_data <= t0;
            t1_data <= t0;
        end
        else if(read_reg1 & !read_reg2)//10
        begin
            t0_data <= t1;
            t1_data <= t0;
        end
        else if(!read_reg1 & read_reg2)//01
        begin
            t0_data <= t0;
            t1_data <= t1;
        end
        
        if(write_reg)
        begin
            if(read_reg1)//Write to Reg2
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
