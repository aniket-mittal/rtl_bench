module autovcoder_075629 #(
      parameter NPORT     = 4'h4
    , parameter PORT_NUM  = 4'h0
    , parameter BROADCAST = ~(4'b1 << PORT_NUM)
) (
      input             sys_rst
    , input             sys_clk
    , input             req
    // recieve tuple from system
    , input      [95:0] tuple
    , output reg        ack
    // lookup
    , output reg [ 3:0] fwd_port
    //
    , input      [ 3:0] cmd_fwd_port
    // bonding test
    , input             cmd_mode
);

  [MASKED]

endmodule

