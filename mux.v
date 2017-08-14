`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:37 11/08/2016 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input [7:0] din,
    input [7:0] r0,
    input [7:0] r1,
    input [7:0] r2,
    input [7:0] r3,
    input [7:0] r4,
    input [7:0] r5,
    input [7:0] r6,
    input [7:0] r7,
    input [7:0] fout,
    input [4:0] sel,
    output reg [7:0] out
    );

always@(sel or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or din or fout)
begin:MUX
case(sel)
	5'b00000: out<=r0;
	5'b00100: out<=r1;
	5'b01000: out<=r2;
	5'b01100: out<=r3;
	5'b10000: out<=r4;
	5'b10100: out<=r5;
	5'b11000: out<=r6;
	5'b11100: out<=r7;
	5'b00010: out<=din;
	5'b00001: out<=fout;
endcase 	
end
endmodule
