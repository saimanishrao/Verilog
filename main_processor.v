`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:18 11/11/2016 
// Design Name: 
// Module Name:    main_processor 
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
module main_processor(
    input [7:0]Din,
	 input clk,
	 output [2:0]state
    );
	 
cu cu_1(IR_out_1, clk,  mux_select, alu_select, r_enable, g_enable, a_enable, IR_enable, state);

regi R0(Bus, clk, r_enable[0], r0);
regi R1(Bus, clk, r_enable[1], r1);
regi R2(Bus, clk, r_enable[2], r2);
regi R3(Bus, clk, r_enable[3], r3);
regi R4(Bus, clk, r_enable[4], r4);
regi R5(Bus, clk, r_enable[5], r5);
regi R6(Bus, clk, r_enable[6], r6);
regi R7(Bus, clk, r_enable[7], r7);
regi A(Bus, clk, a_enable, a_out);
regi G(alu_out, clk, g_enable, g_out);
regi IR(Din, clk, IR_enable, IR_out_1);

mux m(Din, r0, r1, r2, r3, r4, r5, r6, r7, g_out, mux_select, Bus);

accu al(a_out, Bus, alu_select, alu_out);

wire [7:0]IR_out_1;
wire [7:0]Bus;
wire [7:0]a_out;
wire [7:0]g_out;
wire a_enable,g_enable;
wire [4:0]mux_select;
wire IR_enable;
wire [7:0]r_enable;
wire [7:0]r0;
wire [7:0]r1;
wire [7:0]r2;
wire [7:0]r3;
wire [7:0]r4;
wire [7:0]r5;
wire [7:0]r6;
wire [7:0]r7;
wire [7:0]alu_out;
wire [1:0]alu_select;

endmodule
