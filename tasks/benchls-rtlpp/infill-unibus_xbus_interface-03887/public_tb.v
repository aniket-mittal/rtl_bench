// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03887 dut (
    .clk(clk),
    .addr(in_vec[57:36]),
    .datain(in_vec[35:4]),
    .req(in_vec[3:3]),
    .write(in_vec[2:2]),
    .timedout(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .dataout(out_vec[35:4]),
    .ack(out_vec[3:3]),
    .decode(out_vec[2:2]),
    .interrupt(out_vec[1:1]),
    .promdisable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h1e02e214b73b86b;
    stim[1] = 58'h196f26a2dd0c3f9;
    stim[2] = 58'h3d3a27774be48ec;
    stim[3] = 58'h0f942085c67eccc;
    stim[4] = 58'h02958cb9e92e476;
    stim[5] = 58'h0af8191a4375b2a;
    stim[6] = 58'h15071fa158752ba;
    stim[7] = 58'h1d0231d1dd19cd2;
    stim[8] = 58'h0ba166a66520576;
    stim[9] = 58'h16c8f0db08a0412;
    stim[10] = 58'h2b4d4f2e592f064;
    stim[11] = 58'h12c21ee491fe052;
    stim[12] = 58'h2ad8301c028f0fe;
    stim[13] = 58'h23bcc7607cb6932;
    stim[14] = 58'h029f52d7bcfbda2;
    stim[15] = 58'h13bf243d84202f4;
    stim[16] = 58'h0952a2ab81beb9e;
    stim[17] = 58'h30d2e0b634a4fea;
    stim[18] = 58'h040c79dd01211f8;
    stim[19] = 58'h1b2122ef0366e56;
    stim[20] = 58'h35710116303f8da;
    stim[21] = 58'h2959333d479fe2c;
    stim[22] = 58'h2b59b6e0e197de8;
    stim[23] = 58'h17fb0c88c157506;
    stim[24] = 58'h309988282f866b2;
    stim[25] = 58'h0bc0b0cfe9f38a4;
    stim[26] = 58'h1cc124556dda42e;
    stim[27] = 58'h1fb31d819c2cffe;
    stim[28] = 58'h0c6cf558d157376;
    stim[29] = 58'h3ade65be8dd6fb2;
    stim[30] = 58'h3cc12138270eb9e;
    stim[31] = 58'h00e83bf08542eea;
    stim[32] = 58'h34d58797369576c;
    stim[33] = 58'h133787a038c35d4;
    stim[34] = 58'h02ba741e292b504;
    stim[35] = 58'h1250584073ccb9a;
    stim[36] = 58'h0b51b6b237c4fb6;
    stim[37] = 58'h0234e04b49b2dc8;
    stim[38] = 58'h10ff362b7f58f9a;
    stim[39] = 58'h3a8ce6d9413387a;
    stim[40] = 58'h13f59c4c7f8a3f0;
    stim[41] = 58'h122309397274268;
    stim[42] = 58'h0e7fcd799737612;
    stim[43] = 58'h1352df33941f532;
    stim[44] = 58'h3c05f5ef9fdc834;
    stim[45] = 58'h0cb199ec0d83a54;
    stim[46] = 58'h01531c456a33728;
    stim[47] = 58'h0417fa4c72779f6;
    stim[48] = 58'h1a9b069a583501c;
    stim[49] = 58'h0fe94a3055adeca;
    stim[50] = 58'h362153a5388fbd2;
    stim[51] = 58'h0c154b42f582242;
    stim[52] = 58'h2aac1c461816024;
    stim[53] = 58'h29499f18b1fc70e;
    stim[54] = 58'h36a79b64c47ed44;
    stim[55] = 58'h0fff64407a1d6ae;
    stim[56] = 58'h1d023304143a7e8;
    stim[57] = 58'h0dd60fde3e1024a;
    stim[58] = 58'h07ecfdca9b435f0;
    stim[59] = 58'h05ddd0e1cb694dc;
    stim[60] = 58'h0480dada9e3d954;
    stim[61] = 58'h1ecd5d4437491f2;
    stim[62] = 58'h0ab601726ed06c6;
    stim[63] = 58'h1b79971b5755e14;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'h000000000;
      expv[2] = 36'h000000000;
      expv[3] = 36'h000000000;
      expv[4] = 36'h000000000;
      expv[5] = 36'h000000000;
      expv[6] = 36'h000000000;
      expv[7] = 36'h000000000;
      expv[8] = 36'h000000000;
      expv[9] = 36'h000000000;
      expv[10] = 36'h000000000;
      expv[11] = 36'h000000000;
      expv[12] = 36'h000000000;
      expv[13] = 36'h000000000;
      expv[14] = 36'h000000000;
      expv[15] = 36'h000000000;
      expv[16] = 36'h000000000;
      expv[17] = 36'h000000000;
      expv[18] = 36'h000000000;
      expv[19] = 36'h000000000;
      expv[20] = 36'h000000000;
      expv[21] = 36'h000000000;
      expv[22] = 36'h000000000;
      expv[23] = 36'h000000000;
      expv[24] = 36'h000000000;
      expv[25] = 36'h000000000;
      expv[26] = 36'h000000000;
      expv[27] = 36'h000000000;
      expv[28] = 36'h000000000;
      expv[29] = 36'h000000000;
      expv[30] = 36'h000000000;
      expv[31] = 36'h000000000;
      expv[32] = 36'h000000000;
      expv[33] = 36'h000000000;
      expv[34] = 36'h000000000;
      expv[35] = 36'h000000000;
      expv[36] = 36'h000000000;
      expv[37] = 36'h000000000;
      expv[38] = 36'h000000000;
      expv[39] = 36'h000000000;
      expv[40] = 36'h000000000;
      expv[41] = 36'h000000000;
      expv[42] = 36'h000000000;
      expv[43] = 36'h000000000;
      expv[44] = 36'h000000000;
      expv[45] = 36'h000000000;
      expv[46] = 36'h000000000;
      expv[47] = 36'h000000000;
      expv[48] = 36'h000000000;
      expv[49] = 36'h000000000;
      expv[50] = 36'h000000000;
      expv[51] = 36'h000000000;
      expv[52] = 36'h000000000;
      expv[53] = 36'h000000000;
      expv[54] = 36'h000000000;
      expv[55] = 36'h000000000;
      expv[56] = 36'h000000000;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000000;
      expv[59] = 36'h000000000;
      expv[60] = 36'h000000000;
      expv[61] = 36'h000000000;
      expv[62] = 36'h000000000;
      expv[63] = 36'h000000000;
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
