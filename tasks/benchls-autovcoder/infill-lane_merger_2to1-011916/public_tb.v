// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011916 dut (
    .clk_2f_c(clk),
    .reset(in_vec[66:66]),
    .valid_0(in_vec[65:65]),
    .lane_0(in_vec[64:33]),
    .valid_1(in_vec[32:32]),
    .lane_1(in_vec[31:0]),
    .valid_out_c(out_vec[32:32]),
    .Data_out_c(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h5ce256d39b5987c63;
    stim[1] = 67'h5ec4a64d7e92983eb;
    stim[2] = 67'h19beb6c4cc27f8c3d;
    stim[3] = 67'h1fa3ab83ba1445f38;
    stim[4] = 67'h27c2afa0eb774fb7f;
    stim[5] = 67'h01244807d4d6ece06;
    stim[6] = 67'h20cdee470b7fe58fd;
    stim[7] = 67'h36bd9114bef4c64a1;
    stim[8] = 67'h0ec8fd41e9377089f;
    stim[9] = 67'h3d11b38a0aa347188;
    stim[10] = 67'h14da86810a289a175;
    stim[11] = 67'h175f9f114d3591086;
    stim[12] = 67'h1fee6082c0719315b;
    stim[13] = 67'h1fef9e4759bdbbc1d;
    stim[14] = 67'h08180ae324ed5c47b;
    stim[15] = 67'h25f1dfeded42dc847;
    stim[16] = 67'h2584f4ff56c5872a0;
    stim[17] = 67'h3aec2fe53b71205e5;
    stim[18] = 67'h0ba2b2f6ecfaed387;
    stim[19] = 67'h3ec12fdbd5e0c252a;
    stim[20] = 67'h307cce9df0d71d9b9;
    stim[21] = 67'h3a265fe846ffaedb8;
    stim[22] = 67'h2c3c7d39e8c45f313;
    stim[23] = 67'h37149376cc5113281;
    stim[24] = 67'h04068402941cf56c5;
    stim[25] = 67'h2ad8b052f23f14945;
    stim[26] = 67'h350ee0a0efd6c2d79;
    stim[27] = 67'h0486a5cbfcd4226c8;
    stim[28] = 67'h3f9dcbcba2c25c24e;
    stim[29] = 67'h0775f7f13c76a0558;
    stim[30] = 67'h299f42aa847d43f07;
    stim[31] = 67'h0149da944d617651d;
    stim[32] = 67'h2e400e05d2867d304;
    stim[33] = 67'h35c6c93bd603b2a76;
    stim[34] = 67'h3f5f444c9ac40c876;
    stim[35] = 67'h0202fba7efdeadc75;
    stim[36] = 67'h00f43549fd04e8939;
    stim[37] = 67'h27e0c60223d52bc2c;
    stim[38] = 67'h2cf617b91e16fa094;
    stim[39] = 67'h333e489d3634fe795;
    stim[40] = 67'h059fcdd0569c70c35;
    stim[41] = 67'h13d4c77668d554301;
    stim[42] = 67'h2fb7b291bc4df5c2b;
    stim[43] = 67'h358bf8b052b78a7f5;
    stim[44] = 67'h09d36e6f8eeac7e9e;
    stim[45] = 67'h0235392f80ec9390a;
    stim[46] = 67'h27dfebf222fb55dc4;
    stim[47] = 67'h0b0ba2228913e56a9;
    stim[48] = 67'h1635d643595b6e774;
    stim[49] = 67'h321bc9d716a9463a3;
    stim[50] = 67'h08997d32f164aafd7;
    stim[51] = 67'h3bb8e105d040c95c3;
    stim[52] = 67'h1f08cecc7eb5ee00b;
    stim[53] = 67'h27c952cf6bd5830cc;
    stim[54] = 67'h3a9f96070ac72eac5;
    stim[55] = 67'h0dc9b61c7c9d5a935;
    stim[56] = 67'h05386cb642a65551c;
    stim[57] = 67'h0f59dc5ccbb6d3835;
    stim[58] = 67'h01024d8c618331a59;
    stim[59] = 67'h342773eb85d005203;
    stim[60] = 67'h33b22f9d8dc107dbb;
    stim[61] = 67'h2e6889704186e99d6;
    stim[62] = 67'h5cc867678ee6ea640;
    stim[63] = 67'h2879d9450c7fc3935;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h1b5987c63;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h1b5ec88a5;
      expv[9] = 33'h000000000;
      expv[10] = 33'h1e88d9c50;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h12f8eff6f;
      expv[17] = 33'h16c5872a0;
      expv[18] = 33'h1d7617f29;
      expv[19] = 33'h000000000;
      expv[20] = 33'h1f6097ede;
      expv[21] = 33'h10d71d9b9;
      expv[22] = 33'h1d132ff42;
      expv[23] = 33'h000000000;
      expv[24] = 33'h1b8a49bb6;
      expv[25] = 33'h141cf56c5;
      expv[26] = 33'h156c58297;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h12867d304;
      expv[34] = 33'h1ae3649de;
      expv[35] = 33'h1ac40c876;
      expv[36] = 33'h000000000;
      expv[37] = 33'h1d04e8939;
      expv[38] = 33'h13f063011;
      expv[39] = 33'h1e16fa094;
      expv[40] = 33'h199f244e9;
      expv[41] = 33'h169c70c35;
      expv[42] = 33'h000000000;
      expv[43] = 33'h1c4df5c2b;
      expv[44] = 33'h1ac5fc582;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h195b6e774;
      expv[50] = 33'h190de4eb8;
      expv[51] = 33'h1164aafd7;
      expv[52] = 33'h1ddc7082e;
      expv[53] = 33'h1eb5ee00b;
      expv[54] = 33'h13e4a967b;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h1a13b9f5c;
      expv[61] = 33'h000000000;
      expv[62] = 33'h173444b82;
      expv[63] = 33'h000000000;
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
