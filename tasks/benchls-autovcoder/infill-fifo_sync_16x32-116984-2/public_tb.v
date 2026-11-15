// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_116984 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .read_req(in_vec[33:33]),
    .write_data(in_vec[32:1]),
    .write_enable(in_vec[0:0]),
    .read_data(out_vec[33:2]),
    .fifo_empty(out_vec[1:1]),
    .rdata_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h50fd3ce63;
    stim[1] = 35'h60a1b23fe;
    stim[2] = 35'h128f3b7ff;
    stim[3] = 35'h029eb660e;
    stim[4] = 35'h3257a321f;
    stim[5] = 35'h0e7c8d2d5;
    stim[6] = 35'h126597290;
    stim[7] = 35'h1431aa7c5;
    stim[8] = 35'h35c9aca27;
    stim[9] = 35'h12cca98c4;
    stim[10] = 35'h11e6545f8;
    stim[11] = 35'h05505cf27;
    stim[12] = 35'h030a0e20a;
    stim[13] = 35'h1152443b8;
    stim[14] = 35'h2c81146b1;
    stim[15] = 35'h1b0f26113;
    stim[16] = 35'h00f32e5df;
    stim[17] = 35'h2733f707d;
    stim[18] = 35'h3ced01c74;
    stim[19] = 35'h1f950ae59;
    stim[20] = 35'h759fb362d;
    stim[21] = 35'h3b6852b95;
    stim[22] = 35'h20b6c9ed8;
    stim[23] = 35'h2e7b6eb7a;
    stim[24] = 35'h3c4fc4c72;
    stim[25] = 35'h1160f7083;
    stim[26] = 35'h321460415;
    stim[27] = 35'h3d391e1c7;
    stim[28] = 35'h2115775f5;
    stim[29] = 35'h0db472b23;
    stim[30] = 35'h25a334398;
    stim[31] = 35'h34e730884;
    stim[32] = 35'h3ab986c56;
    stim[33] = 35'h1b4d51c11;
    stim[34] = 35'h2ce4bf87d;
    stim[35] = 35'h22858055c;
    stim[36] = 35'h3c9b93063;
    stim[37] = 35'h0bd1b42fc;
    stim[38] = 35'h1fb948cf4;
    stim[39] = 35'h3824b0f7b;
    stim[40] = 35'h1afe177f3;
    stim[41] = 35'h18f60eed0;
    stim[42] = 35'h05f29a6bf;
    stim[43] = 35'h37222fb15;
    stim[44] = 35'h11f3ca238;
    stim[45] = 35'h11ec80b23;
    stim[46] = 35'h02d09f198;
    stim[47] = 35'h23570004e;
    stim[48] = 35'h36c513461;
    stim[49] = 35'h0cf5cd37a;
    stim[50] = 35'h1203e1d05;
    stim[51] = 35'h0075af51d;
    stim[52] = 35'h221750212;
    stim[53] = 35'h3f411c721;
    stim[54] = 35'h173f750c8;
    stim[55] = 35'h0ec990e38;
    stim[56] = 35'h19905e647;
    stim[57] = 35'h1c530be64;
    stim[58] = 35'h3c8d736c1;
    stim[59] = 35'h3a4cf049f;
    stim[60] = 35'h183d79f65;
    stim[61] = 35'h23790429d;
    stim[62] = 35'h3a1734a30;
    stim[63] = 35'h22ef80345;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'h251e76ffd;
      expv[6] = 34'h251e76ffc;
      expv[7] = 34'h251e76ffc;
      expv[8] = 34'h251e76ffc;
      expv[9] = 34'h24af4643d;
      expv[10] = 34'h24af4643c;
      expv[11] = 34'h24af4643c;
      expv[12] = 34'h24af4643c;
      expv[13] = 34'h24af4643c;
      expv[14] = 34'h24af4643c;
      expv[15] = 34'h1cf91a5a9;
      expv[16] = 34'h1cf91a5a8;
      expv[17] = 34'h1cf91a5a8;
      expv[18] = 34'h286354f89;
      expv[19] = 34'h2b935944d;
      expv[20] = 34'h2b935944c;
      expv[21] = 34'h0aa0b9e4e;
      expv[22] = 34'h0aa0b9e4c;
      expv[23] = 34'h36d0a572b;
      expv[24] = 34'h36d0a572a;
      expv[25] = 34'h36d0a572a;
      expv[26] = 34'h36d0a5728;
      expv[27] = 34'h22c1ee105;
      expv[28] = 34'h2428c0829;
      expv[29] = 34'h3a723c38d;
      expv[30] = 34'h3a723c38c;
      expv[31] = 34'h022aeebe9;
      expv[32] = 34'h1b68e5647;
      expv[33] = 34'h1b68e5646;
      expv[34] = 34'h1b68e5644;
      expv[35] = 34'h369aa3821;
      expv[36] = 34'h19c97f0fb;
      expv[37] = 34'h19c97f0f8;
      expv[38] = 34'h19c97f0f8;
      expv[39] = 34'h19c97f0f8;
      expv[40] = 34'h3937260c5;
      expv[41] = 34'h3937260c4;
      expv[42] = 34'h3937260c4;
      expv[43] = 34'h3937260c4;
      expv[44] = 34'h304961ef5;
      expv[45] = 34'h304961ef4;
      expv[46] = 34'h304961ef4;
      expv[47] = 34'h304961ef4;
      expv[48] = 34'h35fc2efe5;
      expv[49] = 34'h0be534d7d;
      expv[50] = 34'h0be534d7c;
      expv[51] = 34'h0be534d7c;
      expv[52] = 34'h0be534d7c;
      expv[53] = 34'h2e445f629;
      expv[54] = 34'h23d901645;
      expv[55] = 34'h23d901644;
      expv[56] = 34'h23d901644;
      expv[57] = 34'h23d901644;
      expv[58] = 34'h23d901644;
      expv[59] = 34'h2d8a268c1;
      expv[60] = 34'h2407c3a09;
      expv[61] = 34'h2407c3a08;
      expv[62] = 34'h00eb5ea39;
      expv[63] = 34'h3e8238e41;
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
