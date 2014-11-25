`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:45 11/23/2014 
// Design Name: 
// Module Name:    ssg_display 
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
module ssg_display(
	 //input [3:0] sw,
	 input clk,
	 input greset,
	 output [7:0] sseg_cathode,
	 output [3:0] sseg_anode
    );
	 
	 wire dp;
	 //assign sseg_anode = 4'b1110;
	 assign dp = 1;
	 

	 wire clkEnable_100Hz,clkEnable_25Hz;
	 clkEnable_gen #(.DES_CLOCK(250000)) Clock_100Hz (
		.enable(clkEnable_100Hz), 
		.clock(clk),
		.greset(greset));
		
	clkEnable_gen #(.DES_CLOCK(6000000)) Clock_25Hz (
		.enable(clkEnable_25Hz), 
		.clock(clk),
		.greset(greset));
	 
	 wire [15:0] BCDCount;
	 vCounter4DigitBCD BCDCounter_4Dig(.enable(clkEnable_25Hz),
		.clk(clk),
		.count(BCDCount),
		.grst(greset)
		);
	
	reg [1:0] cnt;
	initial cnt = 2'b0;
	always @(posedge clk)
	begin
		if (clkEnable_100Hz)
			cnt = cnt + 1;
		else
			cnt = cnt;
	end
	
	wire [3:0] hex_in;
	assign sseg_anode = (cnt == 2'b00)? 4'b0111 : ( cnt==2'b01 )? 4'b1011:( cnt==2'b10 )?4'b1101 : 4'b1110;
	assign hex_in = ( cnt == 0 )? BCDCount[15:12] : ( cnt == 1 )? BCDCount[11:8] : ( cnt == 2 )? BCDCount[7:4] : BCDCount[3:0];
	hex_to_sseg hexToSSEG(
		.hex(hex_in),
		.dp(dp),
		.sseg(sseg_cathode)
		);
	
endmodule
