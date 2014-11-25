`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:05 11/16/2014 
// Design Name: 
// Module Name:    vCounter 
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
module vCounter(
	 input enable,
    input clk,
    output reg [3:0] count,
	 output carryout,
	 input grst
    );

	initial count = 3'b0;
	//wire rco;
	
	always@(posedge clk)
	begin
	if(grst)
		count <= 0;
	else if(enable)
		begin
			if(carryout)
				count <= 0;
			else
				count <= count+1;
		end
	else
		count <= count;		
	end
	assign carryout = count[3]&count[0]; //reset counter at 9
	
endmodule
