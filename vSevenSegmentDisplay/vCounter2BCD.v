`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:26 11/16/2014 
// Design Name: 
// Module Name:    vCounter2BCD 
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
module vCounter4DigitBCD(
    input clk,
    output [15:0]count,
    input enable,
	 output cout,
	 input grst
    );
	
	wire [3:0]w0,w1,w2,w3;
	wire c_out0,c_out1,c_out2;
	wire rco0,rco1,rco2,rco3;
	
	assign rco0 = enable;
	assign rco1 = rco0 & c_out0;
	assign rco2 = rco1 & c_out1;
	assign rco3 = rco2 & c_out2;
	
	vCounter counterDigit0(
		.enable(rco0),
		.carryout(c_out0),
		.clk(clk), 
		.count(w0),
		.grst(grst)
	);
	
	vCounter counterDigit1(
		.enable(rco1),
		.carryout(c_out1),
		.clk(clk), 
		.count(w1),
		.grst(grst)
	);
	
	vCounter counterDigit2(
		.enable(rco2),
		.carryout(c_out2),
		.clk(clk), 
		.count(w2),
		.grst(grst)
	);
	
	vCounter counterDigit3(
		.enable(rco3),
		.carryout(cout),
		.clk(clk), 
		.count(w3),
		.grst(grst)
	);
	
	assign count = {w3,w2,w1,w0};
endmodule
