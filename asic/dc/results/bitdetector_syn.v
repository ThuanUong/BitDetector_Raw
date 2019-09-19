/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Wed May 30 10:31:56 2018
/////////////////////////////////////////////////////////////


module bitdetector_1 ( clk, reset_n, o_ready, i_valid, i_sop, i_eop, inp, 
        i_ready, o_valid, o_sop, o_eop, outp );
  input clk, reset_n, o_ready, i_valid, i_sop, i_eop, inp;
  output i_ready, o_valid, o_sop, o_eop, outp;
  wire   inp_pre, N17, N18, N145, N146, N147, N148, N149, n2, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [31:0] state;

  DFFX1 inp_pre_reg ( .D(n2), .CLK(clk), .Q(inp_pre) );
  DFFX1 o_sop_reg ( .D(N145), .CLK(clk), .Q(o_sop), .QN(n29) );
  DFFX1 \state_reg[1]  ( .D(N18), .CLK(clk), .Q(state[1]), .QN(n28) );
  DFFX1 o_eop_reg ( .D(N149), .CLK(clk), .Q(o_eop), .QN(n30) );
  DFFX1 \state_reg[0]  ( .D(N17), .CLK(clk), .Q(state[0]) );
  DFFX1 i_ready_reg ( .D(N146), .CLK(clk), .Q(i_ready) );
  DFFX1 o_valid_reg ( .D(N148), .CLK(clk), .Q(o_valid) );
  DFFX1 outp_reg ( .D(N147), .CLK(clk), .Q(outp) );
  NAND3X0 U27 ( .IN1(i_sop), .IN2(state[0]), .IN3(n29), .QN(n20) );
  OA221X1 U28 ( .IN1(1'b0), .IN2(n28), .IN3(state[0]), .IN4(o_ready), .IN5(n20), .Q(n18) );
  NOR2X0 U29 ( .IN1(i_eop), .IN2(n30), .QN(n19) );
  NOR2X0 U30 ( .IN1(state[0]), .IN2(n28), .QN(n23) );
  OA221X1 U31 ( .IN1(n18), .IN2(n19), .IN3(n18), .IN4(n23), .IN5(reset_n), .Q(
        N17) );
  INVX0 U32 ( .INP(n23), .ZN(n25) );
  OA22X1 U33 ( .IN1(state[1]), .IN2(n20), .IN3(n19), .IN4(n25), .Q(n22) );
  INVX0 U34 ( .INP(reset_n), .ZN(n21) );
  NOR2X0 U35 ( .IN1(n22), .IN2(n21), .QN(N18) );
  AO21X1 U36 ( .IN1(state[0]), .IN2(n28), .IN3(n23), .Q(n27) );
  AND2X1 U37 ( .IN1(i_eop), .IN2(n27), .Q(N149) );
  AND3X1 U38 ( .IN1(o_ready), .IN2(i_valid), .IN3(n27), .Q(N148) );
  NAND4X0 U39 ( .IN1(o_ready), .IN2(i_valid), .IN3(inp), .IN4(inp_pre), .QN(
        n24) );
  NOR3X0 U40 ( .IN1(o_eop), .IN2(n25), .IN3(n24), .QN(N147) );
  NAND2X0 U41 ( .IN1(state[1]), .IN2(state[0]), .QN(n26) );
  AND3X1 U42 ( .IN1(reset_n), .IN2(o_ready), .IN3(n26), .Q(N146) );
  AND2X1 U43 ( .IN1(i_sop), .IN2(n27), .Q(N145) );
  MUX21X1 U44 ( .IN1(inp_pre), .IN2(inp), .S(reset_n), .Q(n2) );
endmodule

