module autovcoder_104702 (
    input             [ 1-1:0] in_xregsB_wenable,
    input  signed     [32-1:0] in_xregsB_wdata,
    input             [ 5-1:0] in_xregsB_addr,
    output reg signed [32-1:0] out_xregsB_rdata,
    input                      clock
);
  reg signed [32-1:0] buffer[32-1:0];
  always @(posedge clock) begin
    if (in_xregsB_wenable) begin
      buffer[in_xregsB_addr] <= in_xregsB_wdata;
    end
    out_xregsB_rdata <= buffer[in_xregsB_addr];
  end
  initial begin
    buffer[0]  = 0;
    buffer[1]  = 0;
    buffer[2]  = 0;
    buffer[3]  = 0;
    buffer[4]  = 0;
    buffer[5]  = 0;
    buffer[6]  = 0;
    buffer[7]  = 0;
    buffer[8]  = 0;
    buffer[9]  = 0;
    buffer[10] = 0;
    buffer[11] = 0;
    buffer[12] = 0;
    buffer[13] = 0;
    buffer[14] = 0;
    buffer[15] = 0;
    buffer[16] = 0;
    buffer[17] = 0;
    buffer[18] = 0;
    buffer[19] = 0;
    buffer[20] = 0;
    buffer[21] = 0;
    buffer[22] = 0;
    buffer[23] = 0;
    buffer[24] = 0;
    buffer[25] = 0;
    buffer[26] = 0;
    buffer[27] = 0;
    buffer[28] = 0;
    buffer[29] = 0;
    buffer[30] = 0;
    buffer[31] = 0;
  end

endmodule

