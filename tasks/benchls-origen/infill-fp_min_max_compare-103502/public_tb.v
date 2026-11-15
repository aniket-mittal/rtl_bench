// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103502 dut (
    .clk(clk),
    .src1(in_vec[68:37]),
    .src2(in_vec[36:5]),
    .req(in_vec[4:4]),
    .op(in_vec[3:1]),
    .nrst(in_vec[0:0]),
    .res(out_vec[33:2]),
    .invalid(out_vec[1:1]),
    .ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h0139578b78c11cc799;
    stim[1] = 69'h193b4e5361d8f6617f;
    stim[2] = 69'h159aeb70524738a7ee;
    stim[3] = 69'h1508d53c58006e32c8;
    stim[4] = 69'h1fbe980b8301dc8682;
    stim[5] = 69'h13bdcda4b0c2c329f2;
    stim[6] = 69'h00bbc293a31b4cb516;
    stim[7] = 69'h1ede100eb03f64cd52;
    stim[8] = 69'h128c492dd25db5ec36;
    stim[9] = 69'h06edb3bb9a0cb2be4c;
    stim[10] = 69'h012ba0c7fca308ea6e;
    stim[11] = 69'h139f480e1cb49d63c2;
    stim[12] = 69'h129c9c0dbf94e51792;
    stim[13] = 69'h01e9a7d2b1cefb4fe6;
    stim[14] = 69'h07570eb5fd73325430;
    stim[15] = 69'h0c6114975e1a7f64e8;
    stim[16] = 69'h15580c2815bb46c870;
    stim[17] = 69'h1fe716ac9ffd59da9c;
    stim[18] = 69'h008863e4042f4240b6;
    stim[19] = 69'h0229cc735147825790;
    stim[20] = 69'h0530632dc311d3a26a;
    stim[21] = 69'h0b0e6d661c1e27c068;
    stim[22] = 69'h1b1e9f3eebc86eada8;
    stim[23] = 69'h1140abb5dde3d49482;
    stim[24] = 69'h0ed1fc242611d60282;
    stim[25] = 69'h0d9d885854edf0afc0;
    stim[26] = 69'h0e3de3b84689d9ad56;
    stim[27] = 69'h0075263453c8bcb42c;
    stim[28] = 69'h0a48acbee945731364;
    stim[29] = 69'h0dd7902fd07ccf7054;
    stim[30] = 69'h019a92aa6dc28b2a9a;
    stim[31] = 69'h0d2073517a20111ef0;
    stim[32] = 69'h0526f85c8c257642bc;
    stim[33] = 69'h1df584216af2c9b1cc;
    stim[34] = 69'h19e35d18de10151022;
    stim[35] = 69'h09cc8b26da24be29f2;
    stim[36] = 69'h08396cfbe0a4a83bd6;
    stim[37] = 69'h1495ce54609845df66;
    stim[38] = 69'h06ff11e0a67b30acba;
    stim[39] = 69'h0b6ba1d30e0d473b12;
    stim[40] = 69'h02e10572b121dcab9a;
    stim[41] = 69'h13f7e5107df8876f16;
    stim[42] = 69'h1dd0ec8c4e06bedeca;
    stim[43] = 69'h046b2449d2782aaaac;
    stim[44] = 69'h0f49f362dc7bdc85e8;
    stim[45] = 69'h0e279b2a5708de58e2;
    stim[46] = 69'h1ce5e3b61fa8cf1ef6;
    stim[47] = 69'h0dd94adf16ea851ca6;
    stim[48] = 69'h01b2f9b13aa3fdf8de;
    stim[49] = 69'h0b21c5400db9106bda;
    stim[50] = 69'h152e237c97731dd23b;
    stim[51] = 69'h129bcb385a43942706;
    stim[52] = 69'h1c0b5c002e669e2e00;
    stim[53] = 69'h0656585466f5e31b54;
    stim[54] = 69'h1f4fe3691afb9968be;
    stim[55] = 69'h0b853562abb34f5fbe;
    stim[56] = 69'h0e640bf434bd7dc094;
    stim[57] = 69'h03cab47fee87e31666;
    stim[58] = 69'h0bf30908bee1a34e54;
    stim[59] = 69'h0608f9227c44033e6a;
    stim[60] = 69'h05637b7451f74eef3c;
    stim[61] = 69'h1100efce06f3d1a1d0;
    stim[62] = 69'h1acb2f103c7ac881ea;
    stim[63] = 69'h1072c1cb467524c9ea;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h0272af16d;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h000000000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000000;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
