// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  avl_adxcvr_octet_swap dut (
    .clk(clk),
    .reset(in_vec[38:38]),
    .in_valid(in_vec[37:37]),
    .in_data(in_vec[36:5]),
    .in_sof(in_vec[4:1]),
    .out_ready(in_vec[0:0]),
    .in_ready(out_vec[37:37]),
    .out_valid(out_vec[36:36]),
    .out_data(out_vec[35:4]),
    .out_sof(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h405ce4d908;
    stim[1] = 39'h47686d120f;
    stim[2] = 39'h0ffb3d2c2a;
    stim[3] = 39'h08bbaa4986;
    stim[4] = 39'h0ec86bbc71;
    stim[5] = 39'h248932b059;
    stim[6] = 39'h3ce053d60f;
    stim[7] = 39'h0eae9f21f4;
    stim[8] = 39'h01e97f472f;
    stim[9] = 39'h1f9197bccc;
    stim[10] = 39'h02ecca796b;
    stim[11] = 39'h35db64420f;
    stim[12] = 39'h14899458f0;
    stim[13] = 39'h108236ba36;
    stim[14] = 39'h11ca697251;
    stim[15] = 39'h136c50c777;
    stim[16] = 39'h36dadfd442;
    stim[17] = 39'h14e58f544a;
    stim[18] = 39'h12603b527f;
    stim[19] = 39'h1742db3a3d;
    stim[20] = 39'h371d2651d7;
    stim[21] = 39'h2111b70ede;
    stim[22] = 39'h054a7a6d07;
    stim[23] = 39'h0e1ed974cc;
    stim[24] = 39'h1f964f247f;
    stim[25] = 39'h0bdb146e5c;
    stim[26] = 39'h09ed817932;
    stim[27] = 39'h15ef6c2a2d;
    stim[28] = 39'h3a16dcde53;
    stim[29] = 39'h252b43c33c;
    stim[30] = 39'h331963f1da;
    stim[31] = 39'h12b9bb7bd6;
    stim[32] = 39'h22c3225571;
    stim[33] = 39'h33e2c32c4f;
    stim[34] = 39'h1054765c48;
    stim[35] = 39'h04afcca573;
    stim[36] = 39'h26f412448f;
    stim[37] = 39'h1f21c3cadf;
    stim[38] = 39'h192566b12e;
    stim[39] = 39'h24ac3a14a9;
    stim[40] = 39'h164490cc94;
    stim[41] = 39'h147b0a0184;
    stim[42] = 39'h33c6d9fd9e;
    stim[43] = 39'h1c8878b500;
    stim[44] = 39'h323e0a42cc;
    stim[45] = 39'h2d23091f1e;
    stim[46] = 39'h1dd5126e69;
    stim[47] = 39'h1de8638733;
    stim[48] = 39'h085939382d;
    stim[49] = 39'h1e9d35c5b2;
    stim[50] = 39'h3206be4274;
    stim[51] = 39'h454a02ea48;
    stim[52] = 39'h0a48e823ff;
    stim[53] = 39'h1aa0ffc8a0;
    stim[54] = 39'h2274364835;
    stim[55] = 39'h1a2be21a2b;
    stim[56] = 39'h0818c2e570;
    stim[57] = 39'h12108182eb;
    stim[58] = 39'h2a7bdebea8;
    stim[59] = 39'h3e9ba35063;
    stim[60] = 39'h2c09b5f10d;
    stim[61] = 39'h214dd7ec2f;
    stim[62] = 39'h36c0b6b570;
    stim[63] = 39'h3dd14c49e1;
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
      expv[0] = 38'h0c826e7022;
      expv[1] = 38'h29068433be;
      expv[2] = 38'h061e9d97fa;
      expv[3] = 38'h04c52dd45c;
      expv[4] = 38'h2e35d43761;
      expv[5] = 38'h3829549243;
      expv[6] = 38'h3b09e02e7e;
      expv[7] = 38'h00ff974755;
      expv[8] = 38'h239fa4b0fe;
      expv[9] = 38'h0e6bd8cfc6;
      expv[10] = 38'h2cb536617a;
      expv[11] = 38'h31022dbaee;
      expv[12] = 38'h0c7a24ca41;
      expv[13] = 38'h0d1b51184d;
      expv[14] = 38'h2924b538e1;
      expv[15] = 38'h23b86629bd;
      expv[16] = 38'h1a2fed6b68;
      expv[17] = 38'h0a27a2ca7a;
      expv[18] = 38'h293da0193f;
      expv[19] = 38'h2d1d916ba7;
      expv[20] = 38'h38e32e9b8d;
      expv[21] = 38'h176b88d08f;
      expv[22] = 38'h268d3532ac;
      expv[23] = 38'h0a6cbf6706;
      expv[24] = 38'h22379b2fcf;
      expv[25] = 38'h072a3d85e7;
      expv[26] = 38'h0c90b6c4f9;
      expv[27] = 38'h251617baf6;
      expv[28] = 38'h3f2e6b6d09;
      expv[29] = 38'h1191e5a297;
      expv[30] = 38'h18e1fcb98b;
      expv[31] = 38'h0dedbcd95d;
      expv[32] = 38'h3ab1219161;
      expv[33] = 38'h36219169fe;
      expv[34] = 38'h0e2b2a3822;
      expv[35] = 38'h22b657e259;
      expv[36] = 38'h32492a037e;
      expv[37] = 38'h2561e0ef9f;
      expv[38] = 38'h089352bc9e;
      expv[39] = 38'h3a5d061252;
      expv[40] = 38'h0648624b25;
      expv[41] = 38'h00c50d8a34;
      expv[42] = 38'h1eccf369ef;
      expv[43] = 38'h0a8c543e40;
      expv[44] = 38'h11652f0916;
      expv[45] = 38'h1f8481869f;
      expv[46] = 38'h27393a8ee2;
      expv[47] = 38'h2391c43ef9;
      expv[48] = 38'h2c1c9c9426;
      expv[49] = 38'h02daee9f49;
      expv[50] = 38'h113f235905;
      expv[51] = 38'h05217502a2;
      expv[52] = 38'h21f414752f;
      expv[53] = 38'h045fe07d50;
      expv[54] = 38'h341b2a1135;
      expv[55] = 38'h2d1105fd1a;
      expv[56] = 38'h02b17c6401;
      expv[57] = 38'h2170c8490a;
      expv[58] = 38'h1f5f5de532;
      expv[59] = 38'h3831addf48;
      expv[60] = 38'h388af4d606;
      expv[61] = 38'h361bf6e0ae;
      expv[62] = 38'h1abb505b61;
      expv[63] = 38'h34f628aee0;
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
