// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104702 dut (
    .clock(clk),
    .in_xregsB_wenable(in_vec[37:37]),
    .in_xregsB_wdata(in_vec[36:5]),
    .in_xregsB_addr(in_vec[4:0]),
    .out_xregsB_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h19169e7eba;
    stim[1] = 38'h064efa573f;
    stim[2] = 38'h28c67b5608;
    stim[3] = 38'h2ecc7360ca;
    stim[4] = 38'h28dfbc7fd1;
    stim[5] = 38'h260130a918;
    stim[6] = 38'h337549da29;
    stim[7] = 38'h0107bac04f;
    stim[8] = 38'h13aed0627d;
    stim[9] = 38'h1e28513da2;
    stim[10] = 38'h0614734bd3;
    stim[11] = 38'h3c6ee58f12;
    stim[12] = 38'h03c926a5ff;
    stim[13] = 38'h37c80168d0;
    stim[14] = 38'h3a6a95593e;
    stim[15] = 38'h2b8fed234f;
    stim[16] = 38'h01cfc1f432;
    stim[17] = 38'h05cef859bf;
    stim[18] = 38'h128717ce71;
    stim[19] = 38'h318f190d66;
    stim[20] = 38'h1b9f2f7ff2;
    stim[21] = 38'h10807a8577;
    stim[22] = 38'h0a68a10117;
    stim[23] = 38'h36023c9bc6;
    stim[24] = 38'h084c94f6f7;
    stim[25] = 38'h3a26f7fb4f;
    stim[26] = 38'h27a2a8043f;
    stim[27] = 38'h0b1863a746;
    stim[28] = 38'h247eb2318b;
    stim[29] = 38'h1b5bd7b075;
    stim[30] = 38'h131024246c;
    stim[31] = 38'h0f8383bb5b;
    stim[32] = 38'h1c674079fc;
    stim[33] = 38'h39517cb046;
    stim[34] = 38'h1bb741ae78;
    stim[35] = 38'h01ef480fbe;
    stim[36] = 38'h3e9be8449f;
    stim[37] = 38'h16f367a0d7;
    stim[38] = 38'h245279f060;
    stim[39] = 38'h0cae4fb2bc;
    stim[40] = 38'h297cb74494;
    stim[41] = 38'h38d7491005;
    stim[42] = 38'h3154c7509f;
    stim[43] = 38'h049aeeaee3;
    stim[44] = 38'h38d296948c;
    stim[45] = 38'h0624e03e77;
    stim[46] = 38'h22baa99da8;
    stim[47] = 38'h371324a27d;
    stim[48] = 38'h04f9a93dc8;
    stim[49] = 38'h178875776c;
    stim[50] = 38'h3bbf5378f7;
    stim[51] = 38'h11105fd3ab;
    stim[52] = 38'h1f10047eb3;
    stim[53] = 38'h261c7b5f64;
    stim[54] = 38'h32abe3fac9;
    stim[55] = 38'h213d7354a8;
    stim[56] = 38'h2ca1f9b614;
    stim[57] = 38'h21b331727f;
    stim[58] = 38'h38e6819025;
    stim[59] = 38'h3f7cfd792d;
    stim[60] = 38'h3528c398f2;
    stim[61] = 38'h0c0ee698cd;
    stim[62] = 38'h237fcc3638;
    stim[63] = 38'h2e0fa216ee;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'he3772c78;
      expv[18] = 32'h00000000;
      expv[19] = 32'h46fde3fe;
      expv[20] = 32'h00000000;
      expv[21] = 32'he3772c78;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h8c78c86b;
      expv[25] = 32'h00000000;
      expv[26] = 32'h5c7f691a;
      expv[27] = 32'h00000000;
      expv[28] = 32'hb011e4de;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'hb011e4de;
      expv[35] = 32'h30098548;
      expv[36] = 32'hd354aac9;
      expv[37] = 32'h3d154021;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'hf4df4224;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h4633dab0;
      expv[48] = 32'h00000000;
      expv[49] = 32'h15d54ced;
      expv[50] = 32'hc694b4a4;
      expv[51] = 32'h00000000;
      expv[52] = 32'h23f5918c;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h9baa4ed1;
      expv[56] = 32'h15d54ced;
      expv[57] = 32'h4be5ba24;
      expv[58] = 32'h8aa63a84;
      expv[59] = 32'hc6ba4880;
      expv[60] = 32'h00000000;
      expv[61] = 32'he3772c78;
      expv[62] = 32'hfbe7ebc9;
      expv[63] = 32'h30098548;
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
