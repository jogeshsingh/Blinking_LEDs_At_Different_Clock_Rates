`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:42 10/14/2021 
// Design Name: 
// Module Name:    Top_design_module 
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
module Top_design_module(
    input i_clk,
	 input i_select_s1, 
	 input i_select_s0, 
    input i_enable ,	 
    output o_led_drive 
    );
	

parameter DATA_WIDTH_10HZ = 24 ;	
parameter DATA_WIDTH_5HZ = 25 ;
parameter DATA_WIDTH_2HZ = 26 ;
parameter DATA_WIDTH_1HZ = 27 ;
///these parameters will be the signals for the different frequencies///	 
parameter CNT_10HZ = 5_000_000;
parameter CNT_5HZ  = 10_000_000;
parameter CNT_2HZ = 25_000_000;
parameter CNT_1HZ = 50_000_000;

///these will be the counters for counting upto certain period //
reg [DATA_WIDTH_10HZ-1:0] reg_CNT_10HZ = 0 ;
reg [DATA_WIDTH_5HZ-1:0] reg_CNT_5HZ = 0 ;
reg [DATA_WIDTH_2HZ-1:0] reg_CNT_2HZ = 0;
reg [DATA_WIDTH_1HZ-1:0] reg_CNT_1HZ = 0 ;


///these will be intermediate registers for toggling the operation of frequencies//

reg TOGGLE_CNT_10HZ = 1'b0; 
reg TOGGLE_CNT_5HZ  = 1'b0;
reg TOGGLE_CNT_2HZ  = 1'b0; 
reg TOGGLE_CNT_1HZ  = 1'b0;

///for selcting the operation //
reg r_LED_SELECT ;
//10HZ clock block///
always @ (posedge i_clk)
begin
if (reg_CNT_10HZ == CNT_10HZ-1)
begin
TOGGLE_CNT_10HZ <= !TOGGLE_CNT_10HZ ;
reg_CNT_10HZ <= 0 ;
end
else
begin
reg_CNT_10HZ <= reg_CNT_10HZ + 1'b1 ;
end
end

///5HZ clock block///
always @ (posedge i_clk)
begin
if (reg_CNT_5HZ == CNT_5HZ-1 )
begin
TOGGLE_CNT_5HZ <= !TOGGLE_CNT_5HZ ;
reg_CNT_5HZ <= 0 ;
end
else
begin
reg_CNT_5HZ <= reg_CNT_5HZ + 1'b1 ;
end
end

///2HZ clock block////
always @ (posedge i_clk)
begin
if (reg_CNT_2HZ == CNT_2HZ-1 )
begin
TOGGLE_CNT_2HZ <= !TOGGLE_CNT_2HZ ;
reg_CNT_2HZ <= 0 ;
end
else
begin
reg_CNT_2HZ <= reg_CNT_2HZ + 1'b1 ;
end
end

///1HZ clock block///
always @ (posedge i_clk)
begin
if (reg_CNT_1HZ == CNT_1HZ-1 )
begin
TOGGLE_CNT_1HZ <= !TOGGLE_CNT_1HZ ;
reg_CNT_1HZ <= 0 ;
end
else
begin
reg_CNT_1HZ <= reg_CNT_1HZ + 1'b1 ;
end
end

///combinational block for multiplexing the above frequency signals for routing to one signal path///
always @(*)
begin
case({i_select_s1 , i_select_s0})
2'b00 : r_LED_SELECT <= TOGGLE_CNT_10HZ ;
2'b01 : r_LED_SELECT <= TOGGLE_CNT_5HZ ;
2'b10 : r_LED_SELECT <= TOGGLE_CNT_2HZ ;
2'b11 : r_LED_SELECT <= TOGGLE_CNT_1HZ ;
endcase
end 


assign o_led_drive = r_LED_SELECT & i_enable;

endmodule  

