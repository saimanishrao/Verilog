`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:03 11/08/2016 
// Design Name: 
// Module Name:    cu 
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
module cu(instruction_register, clk, mux_select, alu_select, register_enable, g_enable, a_enable, IR_enable,
	state);	
input [7:0]instruction_register;
input clk;
output reg[4:0]mux_select;
output reg [1:0]alu_select;
output reg [7:0]register_enable;
output reg g_enable;
output reg a_enable;
output reg IR_enable;
output reg [2:0]state;
reg [2:0]next_state;
initial 
	begin 
		 state = 3'b000;
		 next_state = 3'b000;
	end
integer bookmark;
always@(posedge clk)
	begin 
		mux_select = 5'b11111;
		register_enable = 8'b00000000;
		//next_state = 3'b000;
		a_enable = 1'b0;
		g_enable = 1'b0;
		bookmark = instruction_register[5:3];
		if( state == 3'b000)
			begin 
				IR_enable <= 1'b1;
				next_state <= 3'b001;
			end
		else if (state == 3'b001)
			begin 
				IR_enable <= 1'b0;
				next_state <= 3'b010;
			end
		else if (state == 3'b010)
			begin 
				if (instruction_register[7:6] == 2'b00)
					begin 
						mux_select[4:2] <= instruction_register[2:0];
						mux_select[1:0] <= 2'b00;
						register_enable[bookmark] <= 1'b1;
						next_state <= 3'b000;
					end
				else if (instruction_register[7:6] == 2'b01)
					begin 
						register_enable[bookmark] <= 1'b1;
						mux_select <= 5'b00010;
						next_state <= 3'b000;
					end
				else if(instruction_register[7:6] == 2'b10)
					begin 
						mux_select[4:2] <= instruction_register[5:3];
						mux_select[1:0] <= 2'b00;
						a_enable <= 1'b1;
						next_state <= 3'b011;
					end
				else if (instruction_register[7:6] == 2'b11)
					begin
						mux_select[4:2] <= instruction_register[5:3];
						mux_select[1:0] <= 2'b00;
						a_enable <= 1'b1;
						next_state <= 3'b101;
					end
			end
		else if (state == 3'b011)
			begin
				mux_select[4:2] <= instruction_register[2:0];
				mux_select[1:0] <= 2'b00;
				alu_select <= 2'b00;
				g_enable <= 1'b1;
				next_state <= 3'b100;
			end
		else if (state == 3'b100)
			begin 
				mux_select <= 5'b00001;
				register_enable[bookmark] <= 1'b1;
				next_state <= 3'b000;
			end	
		else if (state == 3'b101)
			begin
				mux_select[4:2] <= instruction_register[2:0];
				mux_select[1:0] <= 2'b00;
				alu_select <= 2'b01;
				g_enable <=1'b1;
				next_state <= 3'b100;
			end
	end
always@(negedge clk)
	begin
		state <= next_state;
	end
endmodule
