`timescale 1ns / 1ps

module Register_File(
    input clock, read_reg1, read_reg2, write_reg,
    input [7:0] write_data,
    output reg [7:0] t0_data, t1_data);

    reg [7:0] t0, t1; // registers
    initial begin
        t0 = 8'b0;
        t1 = 8'b0;
    end
    
    always @ (*)
    begin
//        t0_data = 8'b10101010;
//        t1_data = 8'b01010101;
        if(read_reg1)
        begin
            t0_data = t1;
        end
        else
        begin
            t0_data = t0;
        end
        
        if(read_reg2)
        begin
            t1_data = t1;
        end
        else
        begin
            t1_data = t0;
        end
        
        if(write_reg)
        begin
            if(read_reg1)//Write to Reg2
            begin
                t1 = write_data;
            end
            else//Write to Reg1
            begin
                t0 = write_data;
            end
        end
        else 
        begin 
        end
    end
endmodule
