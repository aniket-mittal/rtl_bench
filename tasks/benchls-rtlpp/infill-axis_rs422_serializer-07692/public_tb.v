// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07692 dut (
    .aclk(clk),
    .S_AXIS_tdata(in_vec[42:11]),
    .S_AXIS_tkeep(in_vec[10:7]),
    .S_AXIS_tlast(in_vec[6:6]),
    .S_AXIS_tstrb(in_vec[5:2]),
    .S_AXIS_tvalid(in_vec[1:1]),
    .aresetn(in_vec[0:0]),
    .S_AXIS_tready(out_vec[3:3]),
    .rs422_clk(out_vec[2:2]),
    .rs422_cs(out_vec[1:1]),
    .rs422_data(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h39e2925b7a8;
    stim[1] = 43'h23f7bbb0eea;
    stim[2] = 43'h5342b18b403;
    stim[3] = 43'h0b74aa1a8ef;
    stim[4] = 43'h744d92b2cbd;
    stim[5] = 43'h02687262c85;
    stim[6] = 43'h2cc79d19715;
    stim[7] = 43'h36205820ab5;
    stim[8] = 43'h6b784cb2567;
    stim[9] = 43'h7f40e2ce16f;
    stim[10] = 43'h75a25cf7ff9;
    stim[11] = 43'h10a23054b69;
    stim[12] = 43'h661f2e66d5a;
    stim[13] = 43'h6edbccdf069;
    stim[14] = 43'h1b21e967c33;
    stim[15] = 43'h6f6cdd91d5b;
    stim[16] = 43'h2861f89ea77;
    stim[17] = 43'h07bd8f4ef35;
    stim[18] = 43'h4ee3335dd89;
    stim[19] = 43'h3308ce09f7b;
    stim[20] = 43'h4b4d4f42283;
    stim[21] = 43'h2ba4fb936f9;
    stim[22] = 43'h06c55188db1;
    stim[23] = 43'h282b973d425;
    stim[24] = 43'h694aa6d83d7;
    stim[25] = 43'h448683e7393;
    stim[26] = 43'h62ec8ba37cd;
    stim[27] = 43'h16a43a427f1;
    stim[28] = 43'h7c6dc62abaf;
    stim[29] = 43'h6b340e84ca3;
    stim[30] = 43'h46feba9e6c1;
    stim[31] = 43'h24ba6efa8df;
    stim[32] = 43'h7a6c38d39dd;
    stim[33] = 43'h6c18b9f78e9;
    stim[34] = 43'h5fd6c6a2705;
    stim[35] = 43'h03209fdfe67;
    stim[36] = 43'h4319c2b671b;
    stim[37] = 43'h1dcee496789;
    stim[38] = 43'h601224d6461;
    stim[39] = 43'h155d06fc14b;
    stim[40] = 43'h0fe3add9d1d;
    stim[41] = 43'h64c93fed21b;
    stim[42] = 43'h2aa91439e95;
    stim[43] = 43'h0a4cdcaef71;
    stim[44] = 43'h72a5119f857;
    stim[45] = 43'h37c8685bdbb;
    stim[46] = 43'h069c44e7eab;
    stim[47] = 43'h760f64b566f;
    stim[48] = 43'h251f0cc4757;
    stim[49] = 43'h72b19ed1a1f;
    stim[50] = 43'h7b9ebf06e0f;
    stim[51] = 43'h6342815d41f;
    stim[52] = 43'h74b2880ea45;
    stim[53] = 43'h0f3c9b9b8af;
    stim[54] = 43'h65c243a7b7d;
    stim[55] = 43'h1f6c7271fad;
    stim[56] = 43'h44ad2141e93;
    stim[57] = 43'h1cf4d98d0bf;
    stim[58] = 43'h024dfd705c7;
    stim[59] = 43'h7e19bfff30d;
    stim[60] = 43'h43104d35adb;
    stim[61] = 43'h2e43c99b22b;
    stim[62] = 43'h1892e338e73;
    stim[63] = 43'h0c87e03a30d;
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
      expv[0] = 4'h8;
      expv[1] = 4'h8;
      expv[2] = 4'h8;
      expv[3] = 4'h0;
      expv[4] = 4'he;
      expv[5] = 4'hc;
      expv[6] = 4'hc;
      expv[7] = 4'hc;
      expv[8] = 4'hc;
      expv[9] = 4'h4;
      expv[10] = 4'ha;
      expv[11] = 4'h8;
      expv[12] = 4'h8;
      expv[13] = 4'h8;
      expv[14] = 4'h8;
      expv[15] = 4'h0;
      expv[16] = 4'hf;
      expv[17] = 4'h5;
      expv[18] = 4'hb;
      expv[19] = 4'h9;
      expv[20] = 4'h1;
      expv[21] = 4'hf;
      expv[22] = 4'hd;
      expv[23] = 4'hd;
      expv[24] = 4'hd;
      expv[25] = 4'h5;
      expv[26] = 4'ha;
      expv[27] = 4'h8;
      expv[28] = 4'h8;
      expv[29] = 4'h0;
      expv[30] = 4'hf;
      expv[31] = 4'hd;
      expv[32] = 4'h5;
      expv[33] = 4'hb;
      expv[34] = 4'h9;
      expv[35] = 4'h9;
      expv[36] = 4'h1;
      expv[37] = 4'hf;
      expv[38] = 4'hd;
      expv[39] = 4'hd;
      expv[40] = 4'h5;
      expv[41] = 4'ha;
      expv[42] = 4'h0;
      expv[43] = 4'he;
      expv[44] = 4'hc;
      expv[45] = 4'h4;
      expv[46] = 4'hb;
      expv[47] = 4'h1;
      expv[48] = 4'hf;
      expv[49] = 4'h5;
      expv[50] = 4'ha;
      expv[51] = 4'h0;
      expv[52] = 4'hf;
      expv[53] = 4'hd;
      expv[54] = 4'h5;
      expv[55] = 4'hb;
      expv[56] = 4'h9;
      expv[57] = 4'h1;
      expv[58] = 4'hf;
      expv[59] = 4'h5;
      expv[60] = 4'ha;
      expv[61] = 4'h0;
      expv[62] = 4'hf;
      expv[63] = 4'h5;
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
