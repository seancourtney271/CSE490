`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 04:00:50 PM
// Design Name: 
// Module Name: fourbit_adder
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
module FA(A , B , Cin , S , Cout);
  //define which variables are inputs/outputs
  input A , B , Cin;
  output S , Cout;
  wire a1 , a2 , a3; //for each and operation
  
  xor(S,  A,B,Cin); //sum bit
  
  and(a1,  A,B);
  and(a2,  B,Cin);
  and(a3,  A,Cin);
  
  or(Cout,  a1,a2,a3);
endmodule

module Four_Bit_Adder(
    input [3:0] a,
    input [3:0] b,
    input carry_in,
    output [3:0] sum,
    output carry_out
    );
  //make wires
  wire [2:0] carry;
  
  FA fa0(a[0], b[0], carry_in, sum[0], carry[0]);
  FA fa1(a[1], b[1], carry[1], sum[1], carry[1]);
  FA fa2(a[2], b[2], carry[2], sum[2], carry[2]);
  FA fa3(a[3], b[3], carry[3], sum[3], carry_out);
endmodule

