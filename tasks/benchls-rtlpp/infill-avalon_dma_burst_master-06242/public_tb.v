// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06242 dut (
    .clk(clk),
    .reset(in_vec[85:85]),
    .sw_reset(in_vec[84:84]),
    .sw_stop(in_vec[83:83]),
    .length(in_vec[82:51]),
    .eop_enabled(in_vec[50:50]),
    .eop(in_vec[49:49]),
    .ready(in_vec[48:48]),
    .valid(in_vec[47:47]),
    .early_termination(in_vec[46:46]),
    .address_in(in_vec[45:14]),
    .write_in(in_vec[13:13]),
    .max_burst_count(in_vec[12:10]),
    .write_fifo_used(in_vec[9:4]),
    .waitrequest(in_vec[3:3]),
    .short_first_access_enable(in_vec[2:2]),
    .short_last_access_enable(in_vec[1:1]),
    .short_first_and_last_access_enable(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h29bcbc493737a8c0a3d628;
    stim[1] = 86'h2bab1c9b962fa2cea89d7c;
    stim[2] = 86'h0128a62feb74ec1e0973d7;
    stim[3] = 86'h148256fa3fc6e200b88e0e;
    stim[4] = 86'h0aabbd87b41881c2c81689;
    stim[5] = 86'h18c4f74e0ce3bea26503a0;
    stim[6] = 86'h01009e70f94720c8a5c1e5;
    stim[7] = 86'h0717aab8b5de7da4b84a03;
    stim[8] = 86'h0923a3200b18c947de2885;
    stim[9] = 86'h0a2f04b2ff09a7fa8218e4;
    stim[10] = 86'h3096a504838ce50f84a511;
    stim[11] = 86'h0b2c658101a9d74002cee4;
    stim[12] = 86'h1963f708352886a1591825;
    stim[13] = 86'h18de52bd84681c15719c43;
    stim[14] = 86'h071f4688da1c3d6b86e8ea;
    stim[15] = 86'h09a423401e74f7e5be3258;
    stim[16] = 86'h1364c38f776e83c04f788a;
    stim[17] = 86'h1af88fa771256e38ec48e7;
    stim[18] = 86'h080a372a64259f0934c0a3;
    stim[19] = 86'h1799ae5a1dc03fdb1a9f38;
    stim[20] = 86'h194f57fc76d428a746339f;
    stim[21] = 86'h171bdf704fa11d05b950c0;
    stim[22] = 86'h0d997ed7a98a411e0ce3e6;
    stim[23] = 86'h10ef0cd75ca7b3ea110a8d;
    stim[24] = 86'h1de99d6da4eaf8a098a1c1;
    stim[25] = 86'h16e507f61fdb4466a60938;
    stim[26] = 86'h033c3e487e9ab869144737;
    stim[27] = 86'h1e912475a2062130c046cc;
    stim[28] = 86'h14d2dd6bf32c3c9704f931;
    stim[29] = 86'h03223af8e7b83aa1b1922e;
    stim[30] = 86'h00d96432dcef850c456453;
    stim[31] = 86'h118bc017a30bd6a7d24717;
    stim[32] = 86'h10726dfea0b4b01a18b82d;
    stim[33] = 86'h042b6a0a68cfd4e285e8b8;
    stim[34] = 86'h035ccfb1ecfbaa1962f011;
    stim[35] = 86'h074432cdbc52c691321cc3;
    stim[36] = 86'h16676fe8f72b624f7d07d3;
    stim[37] = 86'h05042f91d7d4ab996aad8a;
    stim[38] = 86'h1657926a5e4daca4649c67;
    stim[39] = 86'h1014c6fccd164a35c45dd1;
    stim[40] = 86'h14dcf777a076f35de0b220;
    stim[41] = 86'h0041d06280499dafd30422;
    stim[42] = 86'h1cf014dd23704882271431;
    stim[43] = 86'h1df9468b2c7867899e80d0;
    stim[44] = 86'h09355cde0127c474241da6;
    stim[45] = 86'h0e92fac9b20667b58834bf;
    stim[46] = 86'h1d2a55b0c958863afa1073;
    stim[47] = 86'h05dc82e6963289c9fe95a3;
    stim[48] = 86'h049b925c79b114debb7ff1;
    stim[49] = 86'h0d6d2b9c1936927b39c363;
    stim[50] = 86'h1da25a108b1a926b4078b4;
    stim[51] = 86'h167390ba6ef89378286c6e;
    stim[52] = 86'h147a9384d4f8f033a75c83;
    stim[53] = 86'h072649eb13c4475d36ce20;
    stim[54] = 86'h04f3e1938513d43dbda092;
    stim[55] = 86'h0ba924ed336a15a805767b;
    stim[56] = 86'h01b9e7a206bd2f42660c91;
    stim[57] = 86'h19cef19b11fe474ee9d5aa;
    stim[58] = 86'h00ce738b9f517da74d456c;
    stim[59] = 86'h0dbebcc86a51d6ec6166ba;
    stim[60] = 86'h0e11fa89ccc3405c92a10e;
    stim[61] = 86'h195b551dcb789b41b17f9f;
    stim[62] = 86'h123d81cbf99ca6492ada22;
    stim[63] = 86'h12cab0b63a171a2a65d08a;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 39'h0000000005;
      expv[1] = 39'h0000000005;
      expv[2] = 39'h0000000004;
      expv[3] = 39'h69d83c12c8;
      expv[4] = 39'h69d83c12c8;
      expv[5] = 39'h69d83c12c8;
      expv[6] = 39'h69d83c128c;
      expv[7] = 39'h69d83c128c;
      expv[8] = 39'h69d83c128d;
      expv[9] = 39'h31928fbc0d;
      expv[10] = 39'h0000000006;
      expv[11] = 39'h0000000005;
      expv[12] = 39'h0000000007;
      expv[13] = 39'h0000000007;
      expv[14] = 39'h0000000004;
      expv[15] = 39'h387ad70dc8;
      expv[16] = 39'h387ad70dc8;
      expv[17] = 39'h387ad70dc8;
      expv[18] = 39'h387ad70d8d;
      expv[19] = 39'h387ad70d8e;
      expv[20] = 39'h387ad70d8f;
      expv[21] = 39'h28514e8c0e;
      expv[22] = 39'h28514e8c0d;
      expv[23] = 39'h14823c198e;
      expv[24] = 39'h14823c198f;
      expv[25] = 39'h55f141310e;
      expv[26] = 39'h55f141310c;
      expv[27] = 39'h55f141310f;
      expv[28] = 39'h55f141310e;
      expv[29] = 39'h58792e098c;
      expv[30] = 39'h58792e098c;
      expv[31] = 39'h5f0a188ac8;
      expv[32] = 39'h5f0a188a8e;
      expv[33] = 39'h696034310c;
      expv[34] = 39'h1fa9c50bc8;
      expv[35] = 39'h1fa9c50b8c;
      expv[36] = 39'h1fa9c50b8e;
      expv[37] = 39'h1fa9c50b8c;
      expv[38] = 39'h295732d548;
      expv[39] = 39'h295732d50e;
      expv[40] = 39'h295732d50e;
      expv[41] = 39'h6de6bbc10c;
      expv[42] = 39'h6de6bbc10f;
      expv[43] = 39'h6de6bbc10f;
      expv[44] = 39'h6de6bbc10d;
      expv[45] = 39'h6de6bbc10d;
      expv[46] = 39'h0ccf6b100f;
      expv[47] = 39'h0ccf6b100c;
      expv[48] = 39'h0ccf6b100c;
      expv[49] = 39'h6229bd76c8;
      expv[50] = 39'h6229bd768f;
      expv[51] = 39'h3524d6808e;
      expv[52] = 39'h7126f0508e;
      expv[53] = 39'h7126f0508c;
      expv[54] = 39'h7126f0508c;
      expv[55] = 39'h27a87b7b48;
      expv[56] = 39'h27a87b7b48;
      expv[57] = 39'h27a87b7b0f;
      expv[58] = 39'h27a87b7b0c;
      expv[59] = 39'h27a87b7b0d;
      expv[60] = 39'h23add8c28d;
      expv[61] = 39'h0680b9250f;
      expv[62] = 39'h713683628e;
      expv[63] = 39'h713683628e;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
