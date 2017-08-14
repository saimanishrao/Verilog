`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:29 11/08/2016 
// Design Name: 
// Module Name:    ripple_adder 
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
module ripple_adder(
    input [7:0] x,
    input [7:0] y,
	 output [7:0] sum,
    output  cout
    );
wire cin=1'b0; 
wire carry1,carry2,carry3,carry4,carry5,carry6,carry7;
full_add fa1(x[0],y[0],cin,sum[0],carry1);
full_add fa2(x[1],y[1],carry1,sum[1],carry2);
full_add fa3(x[2],y[2],carry2,sum[2],carry3);
full_add fa4(x[3],y[3],carry3,sum[3],carry4);
full_add fa5(x[4],y[4],carry4,sum[4],carry5);
full_add fa6(x[5],y[5],carry5,sum[5],carry6);
full_add fa7(x[6],y[6],carry6,sum[6],carry7);
full_add fa8(x[7],y[7],carry7,sum[7],cout);
endmodule 
