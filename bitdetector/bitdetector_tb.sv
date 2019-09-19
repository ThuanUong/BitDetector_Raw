`timescale 1ns/1ps
// Advanced testbench for bitdetector module
module bitdetector_tb;	
	reg reset_n, clk;
	reg o_ready, i_valid, i_sop, i_eop, inp;
	wire i_ready, o_valid, o_sop, o_eop, outp;
	
	reg exoutp, exi_ready, exo_valid, exo_sop, exo_eop;
	integer iinp, io_ready, ii_valid, ii_sop, ii_eop;
	integer ooutp, oi_ready, oo_valid, oo_sop, oo_eop;
	integer moutp, mi_ready, mo_valid, mo_sop, mo_eop;
	integer sIinp, sIo_ready, sIi_valid, sIi_sop, sIi_eop; 
	integer sOoutp, sOi_ready, sOo_valid, sOo_sop, sOo_eop;
	
	bitdetector dut(.clk(clk), .reset_n(reset_n),
						 .o_ready(o_ready),.i_valid(i_valid),.i_sop(i_sop),.i_eop(i_eop),.inp(inp),
						 .outp(outp),.o_eop(o_eop),.o_sop(o_sop),.o_valid(o_valid),.i_ready(i_ready));
	
	always #2.5 clk = ~clk;
	
	initial begin
		clk = 1'b0;
		reset_n = 1'b1;
		o_ready = 1'b0;
		i_valid = 1'b0;
		i_sop   = 1'b0;
		i_eop   = 1'b0;
		inp 	  = 1'b0;
		iinp 		=	$fopen("inp.txt","r");
		io_ready =	$fopen("o_ready.txt","r");
		ii_valid	=	$fopen("i_valid.txt","r");
		ii_sop 	=	$fopen("i_sop.txt","r");
		ii_eop 	=	$fopen("i_eop.txt","r");
		ooutp		= 	$fopen("outp.txt","r");
		oi_ready	= 	$fopen("i_ready.txt","r");
		oo_valid	= 	$fopen("o_valid.txt","r");
		oo_sop	= 	$fopen("o_sop.txt","r");
		oo_eop	= 	$fopen("o_eop.txt","r");
		moutp		= 	$fopen("moutp.txt","w");
		mi_ready	= 	$fopen("mi_ready.txt","w");
		mo_valid	= 	$fopen("mo_valid.txt","w"); 
		mo_sop	= 	$fopen("mo_sop.txt","w");
		mo_eop	= 	$fopen("mo_eop.txt","w");;	
	end
	initial begin
		while(!$feof(iinp) && !$feof(io_ready) && !$feof(ii_valid) && !$feof(ii_sop) && !$feof(ii_eop))
			begin
				@(posedge clk);
				sIinp 		= $fscanf(iinp,"%h\n",inp);
				sIo_ready 	= $fscanf(io_ready,"%h\n",o_ready);
				sIi_valid	= $fscanf(ii_valid,"%h\n",i_valid);
				sIi_sop		= $fscanf(ii_sop,"%h\n",i_sop);
				sIi_eop		= $fscanf(ii_eop,"%h\n",i_eop);
			end
			
			@ (posedge clk);
			$fclose (iinp);
			$fclose (io_ready);
			$fclose (ii_valid);
			$fclose (ii_sop);
			$fclose (ii_eop);
			$fclose (moutp);
			$fclose (mi_ready);
			$fclose (mo_valid);
			$fclose (mo_sop);
			$fclose (mo_eop);
			$fclose (ooutp);
			$fclose (oi_ready);
			$fclose (oo_valid);
			$fclose (oo_sop);
			$fclose (oo_eop);
			$finish;
	end 
	always @ (posedge clk)
		begin
			$fwrite(moutp,"%h\n",outp);
			$fwrite(mi_ready,"%h\n",i_ready);
			$fwrite(mo_valid,"%h\n",o_valid);
			$fwrite(mo_sop,"%h\n",o_sop);
			$fwrite(mo_eop,"%h\n",o_eop);
			sOoutp		=	$fscanf(ooutp,"%h\n",exoutp);
			sOi_ready	=	$fscanf(oi_ready,"%h\n",exi_ready);
			sOo_valid	=	$fscanf(oo_valid,"%h\n",exo_valid);
			sOo_sop		=	$fscanf(oo_sop,"%h\n",exo_sop);
			sOo_eop		=	$fscanf(oo_eop,"%h\n",exo_eop);
			// Display result part
			if(outp !== exoutp || i_ready !== exi_ready || o_valid !== exo_valid || o_sop !== exo_sop || o_eop !== exo_eop)
			//If one of the outputs is unmatched, prompt result
			begin
				$display("%dns Error: input and output does not match",$time);
				$display("Got:	outp:	%h		i_ready:	%h		o_valid:	%h		o_sop: %h	o_eop: %h",	outp, i_ready, o_valid, o_sop, o_eop);
				$display("Exp:	outp:	%h		i_ready:	%h		o_valid:	%h		o_sop: %h	o_eop: %h",	exoutp, exi_ready, exo_valid, exo_sop, exo_eop);
			end 
			else 
			//	Else, display matched outputs
			begin
				$display("%dns Match: input and output match",$time);
				$display("Got:	outp:	%h		i_ready:	%h		o_valid:	%h		o_sop: %h	o_eop: %h",	outp, i_ready, o_valid, o_sop, o_eop);
				$display("Exp:	outp:	%h		i_ready:	%h		o_valid:	%h		o_sop: %h	o_eop: %h",	exoutp, exi_ready, exo_valid, exo_sop, exo_eop);
			end 
		end
endmodule 