`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:19:28 11/16/2014
// Design Name:   vCounter
// Module Name:   /home/aneez/workspace/vLCDisplay/vCounterTB.v
// Project Name:  vLCDisplay
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vCounterTB;

	// Inputs
	reg enable;
	reg clk;

	// Outputs
	wire [3:0] count;
	wire carryout;

	// Instantiate the Unit Under Test (UUT)
	vCounter uut (
		.enable(enable),
		.rst(carryout),
		.clk(clk), 
		.count(count)
	);

	initial begin
		// Initialize Inputs
		enable = 0;
		clk = 0;

		#10 enable = 1;
		
		//#50 rst = 0;
		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
	end
	
	always #10 clk = ~clk;
      
endmodule

