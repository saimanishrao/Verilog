`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:46 11/08/2016 
// Design Name: 
// Module Name:    full_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_add(
    input x,
    input y,
    input cin,
    output sum,
    output cout
    );
wire p_sum;
wire p_carry;
wire pp_carry;
half_adder ha1(x,y,p_sum,p_carry);
half_adder ha2(p_sum,cin,sum,pp_carry);
assign cout=p_carry||pp_carry;

endmodule