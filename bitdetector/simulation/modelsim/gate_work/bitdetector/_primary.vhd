library verilog;
use verilog.vl_types.all;
entity bitdetector is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        o_ready         : in     vl_logic;
        i_valid         : in     vl_logic;
        i_sop           : in     vl_logic;
        i_eop           : in     vl_logic;
        inp             : in     vl_logic;
        i_ready         : out    vl_logic;
        o_valid         : out    vl_logic;
        o_sop           : out    vl_logic;
        o_eop           : out    vl_logic;
        outp            : out    vl_logic
    );
end bitdetector;
