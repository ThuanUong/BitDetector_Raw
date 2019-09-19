/* Module bitdetector
	Author: Uong Kim Thuan
	EEET2475 - Advanced Digitial Design 1
*/
module bitdetector(clk, reset_n,
						 o_ready, i_valid, i_sop, i_eop, inp,
						 i_ready, o_valid, o_sop, o_eop, outp);
/* Module inputs and outputs	*/
input clk, reset_n;  
//		iSW[17],iSW[0]
input logic o_ready, i_valid, i_sop, i_eop, inp;
//				iSW[1],	iSW[2],	iSW[3], iSW[4], iSW[5]
output reg i_ready, o_valid, o_sop, o_eop, outp;
//			  iLEDR[0], oLEDR[1], oLEDR[2], oLEDR[3], oLED[4]
enum int unsigned  {S0 = 0, S1 = 1, S2 = 2} state, nextstate; // States for FSM
logic inp_pre;		// Store previous value of inp


// State define block
always_ff @ (posedge clk) begin
	if(!reset_n)	// reset_n = 0, back to state S0
		state <= S0;
	else begin 
		state <= nextstate;
		inp_pre <= inp;
	end 				
end 
// State transition block
always_comb begin 
	nextstate <= S0; 
	case (state)
		S0:	begin
					if (o_ready)
						nextstate <= S1;
					else 
						nextstate <= S0;
				end 
		S1:	begin
					if(i_sop != o_sop && i_sop)
						nextstate <= S2;
					else nextstate <= S1;
				end 
		S2: 	begin 
					if(!i_eop && i_eop != o_eop)
						nextstate <= S1;
					else 
						nextstate <= S2;
				end 
	default: nextstate <= S0;
	endcase
end
// Module output block
always_ff @ (posedge clk) begin
	// i_ready output 
	if(!reset_n)
		i_ready <= 0;
	else 
		i_ready <= o_ready;
	// Outputs for each state
		case (state)
			// Every outputs is 0
			S0:	begin
						outp <= 0;
						o_valid <= 0;
						o_eop <= 0;
						o_sop <= 0;
					end 
			// Start of output packet is not available yet so outp = 0
			S1: 	begin
						outp <= 0;
						o_eop <= i_eop;
						o_sop <= i_sop;
						if(!o_ready)
						o_valid <= 0;
						else
						o_valid <= i_valid;
					end 
			// In the detection state
			S2:	begin
						o_sop <= i_sop;
						o_eop <= i_eop;
						if(!o_ready) begin 
							o_valid <= 0;
							outp    <= 0;
						end 
						else begin 
							o_valid <= i_valid;
							if(!i_valid || o_eop)  
								outp <= 0;
							else begin
							if (inp == inp_pre)
									outp <= inp;
							else 
									outp <= 0;
							end 
						end 
					end 
		default: 	begin 
							o_valid <= 0;
							outp <= 0;		
							o_sop <= 0;
							o_eop <= 0;
							i_ready <= 0;
						end 
		endcase 
	end 
endmodule 
  