`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:49:09 11/23/2014
// Design Name:   clkEnable_gen
// Module Name:   /home/aneez/workspace/vSevenSegmentDisplay/clkEnable_gen_tb.v
// Project Name:  vSevenSegmentDisplay
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clkEnable_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clkEnable_gen_tb;

	// Inputs
	reg clock;
	reg reset;
	
	// Outputs
	wire enable1, enable2;
	

	// Instantiate the Unit Under Test (UUT)
	clkEnable_gen #(.DES_CLOCK(4000)) uut1(
		.enable(enable1), 
		.clock(clock),
		.greset(reset)
	);
	
		clkEnable_gen uut2(
		.enable(enable2), 
		.clock(clock),
		.greset(reset)
	);


	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #10 clock = ~clock;
      
endmodule

