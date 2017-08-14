`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:05 11/08/2016 
// Design Name: 
// Module Name:    accu 
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
module accu(
    input [7:0] a,
    input [7:0] b,
    input [1:0] sel,
	 output reg [7:0] out
    );
wire cout,cout1,cout3;
wire [7:0] out1,out2,out3,tout;

reg [7:0] b_c=8'b00000001;

wire[7:0] not_b;

assign not_b=~b;
ripple_adder ra3(not_b,b_c,tout,cout3);
ripple_adder ra2(a,tout,out2,cout1);
ripple_adder ra1(a,b,out1,cout);
assign out3=b;
	
always@(*)
begin
if(sel==2'b00)
begin
	out<=out1;
end
	else if(sel==2'b01)
begin
	out<=out2;
end
else
begin
	out<=out3;
end
end	
endmodule
