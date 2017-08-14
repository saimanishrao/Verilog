`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:30 11/08/2016 
// Design Name: 
// Module Name:    regi 
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
module regi(
    input [7:0] in,
    input clk,
    input sel,
    output reg[7:0] out
    );

always@(negedge clk)
begin
if (sel==1'b1)
	begin
		out<=in;
	end
else 
	begin
		out <= out;
	end
end

//assign out=pout;
endmodule

