`timescale 1ns/1ps
// Simple testbench for bitdetector module
module testbit;
reg  clk, reset_n;
reg  o_ready, i_sop, i_valid, i_eop, inp;
wire i_ready, outp, o_sop, o_valid, o_eop;

bitdetector dut(.clk(clk),.reset_n(reset_n),
					 .o_ready(o_ready),.i_sop(i_sop),.inp(inp),.i_valid(i_valid),.i_eop(i_eop),
					 .i_ready(i_ready),.outp(outp),.o_valid(o_valid),.o_sop(o_sop),.o_eop(o_eop));
					 
always #2.5 clk = ~clk;

initial begin 
	clk = 0;
	reset_n = 0;
	o_ready = 0;
	inp = 0;
	i_sop = 0;
	i_valid = 0;
	i_eop = 0;
	#2.6;
	#5;
	o_ready = 1;
	#5;
	reset_n = 1;
	#5; 	
	i_sop = 1;
	i_valid = 1;
	inp = 1;
	#5;
	i_sop = 0;
	#15; 
	//inp = 0;
	#10;
	i_eop = 1;
	inp = 1;
	#5;
	inp = 1;
	i_eop = 0;
	i_valid = 0;
	#5;
	inp = 1;
	#10;
	inp = 0;
	reset_n = 0;
	#20 $stop;
end
endmodule