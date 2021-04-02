`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 04:59:33 PM
// Design Name: 
// Module Name: testbench
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


module test;

reg [3:0] a;
reg [3:0] b;
reg carry_in;
wire [3:0] sum;
wire carry_out;

fourbit_adder dut (a, b, carry_in, sum, carry_out);
initial begin
    $dumpvars(1, test);
    
    #5;
    a = 0;
    b = 0;
    carry_in = 0;
    
    #5
    a = 2;
    b = 3;
    
    #5
    carry_in = 1;
    
    #5
    carry_in = 0;
    a = 4'b1000;
    b = 4'b0111;
    
    #5
    carry_in = 1;
    
    #5 $finish;
    
  end

endmodule

module ALU8bit_tb;

 // Inputs

 reg [2:0] Opcode;

 reg [7:0] Operand1;

 reg [7:0] Operand2;

 // Outputs

 wire [15:0] Result;

 wire flagC;

 wire flagZ;

 //Temporary variable

 reg [2:0] count = 3'd0;

 // Instantiate the Unit Under Test (UUT)

 ALU uut (

  .Opcode(Opcode), 

  .Operand1(Operand1), 

  .Operand2(Operand2), 

  .Result(Result), 

  .flagC(flagC), 

  .flagZ(flagZ)

  );

 initial begin

  // Initialize Inputs

  Opcode   = 3'b0;

  Operand1 = 8'd0;

  Operand2 = 8'd0;

  // Wait 100 ns for global reset to finish

  #100;    

  // Add stimulus here  

  Operand1 = 8'hAA;

  Operand2 = 8'h55;  

  for (count = 0; count < 8; count = count + 1'b1) 

  begin

   Opcode = count;

   #20;

  end

 end     

endmodule
