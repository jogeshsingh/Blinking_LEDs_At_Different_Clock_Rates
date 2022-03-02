`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:44 10/14/2021
// Design Name:   Top_design_module
// Module Name:   /home/ise/xilinx/Blinking_leds/Top_design_module_tb.v
// Project Name:  Blinking_leds
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_design_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_design_module_tb;

	// Inputs
	reg i_clk= 0;
	reg i_select_s1;
	reg i_select_s0;
	reg i_enable ;

	// Outputs
	wire o_led_drive = 0;
	// Instantiate the Unit Under Test (UUT)
	Top_design_module uut (
		.i_clk(i_clk), 
		.i_select_s1(i_select_s1), 
		.i_select_s0(i_select_s0), 
		.i_enable (i_enable),
		.o_led_drive(o_led_drive)
	);

      
		always #5 i_clk = ~i_clk ;
		
		
		initial 
		  begin
		  i_enable = 0 ;
		  i_select_s1 = 0;
		  i_select_s0 = 0 ;
		  end
		  
		initial 
		  begin
		  
		  i_enable = 1;
		 i_select_s1 = 0 ; 
		 i_select_s0 = 0 ;
		
		 #2000000;
		 
		 i_select_s1 = 0;
		 i_select_s0 = 1;
		 #2000000;
		 
		  i_select_s1 = 0 ; 
		 i_select_s0 = 0 ;
		 #2000000;
		 
		 i_select_s1 = 0;
		 i_select_s0 = 1;
		 #2000000;
		 
		 end
		 endmodule
		 
		 
		
		
		
		
		
		
		
		


