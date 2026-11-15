// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07976 dut (
    .clk_i(clk),
    .data_i(in_vec[32:1]),
    .en_i(in_vec[0:0]),
    .data_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h16de51e57;
    stim[1] = 33'h0dee4cc39;
    stim[2] = 33'h0ebf19670;
    stim[3] = 33'h1e561eaf4;
    stim[4] = 33'h1f74bff75;
    stim[5] = 33'h0d381797b;
    stim[6] = 33'h1b233c2c6;
    stim[7] = 33'h19f290acf;
    stim[8] = 33'h0f88285ca;
    stim[9] = 33'h11c88b489;
    stim[10] = 33'h09b6e065c;
    stim[11] = 33'h0bbb9c12b;
    stim[12] = 33'h11a4a9007;
    stim[13] = 33'h1a5dd1483;
    stim[14] = 33'h08abc8989;
    stim[15] = 33'h0b1afc8d1;
    stim[16] = 33'h141237096;
    stim[17] = 33'h1a8d27df2;
    stim[18] = 33'h0f357e2d9;
    stim[19] = 33'h1381f13e7;
    stim[20] = 33'h0cc58172b;
    stim[21] = 33'h01582247a;
    stim[22] = 33'h0b79862fc;
    stim[23] = 33'h01c6b4d70;
    stim[24] = 33'h1764227f3;
    stim[25] = 33'h1f072084c;
    stim[26] = 33'h0fa36dce5;
    stim[27] = 33'h1d0be773e;
    stim[28] = 33'h12897e606;
    stim[29] = 33'h0442524c8;
    stim[30] = 33'h16c71f51e;
    stim[31] = 33'h15f090b7f;
    stim[32] = 33'h0c4577b83;
    stim[33] = 33'h1f4d8a359;
    stim[34] = 33'h17f2591b9;
    stim[35] = 33'h0c4ad79d8;
    stim[36] = 33'h14b304f91;
    stim[37] = 33'h05a578930;
    stim[38] = 33'h03fcba983;
    stim[39] = 33'h1eed786d0;
    stim[40] = 33'h1dbbf7f08;
    stim[41] = 33'h1238b23b9;
    stim[42] = 33'h01505d4c9;
    stim[43] = 33'h036e266ae;
    stim[44] = 33'h0c7a54c48;
    stim[45] = 33'h148c08005;
    stim[46] = 33'h10253597f;
    stim[47] = 33'h0a9a41442;
    stim[48] = 33'h088c5a4a9;
    stim[49] = 33'h1837eadd9;
    stim[50] = 33'h1f605c248;
    stim[51] = 33'h1b5729406;
    stim[52] = 33'h09a6fc294;
    stim[53] = 33'h08d78f85a;
    stim[54] = 33'h11057a9b9;
    stim[55] = 33'h169aee4d9;
    stim[56] = 33'h03def70a1;
    stim[57] = 33'h1a1256d2e;
    stim[58] = 33'h1e4ebea68;
    stim[59] = 33'h12ac76af7;
    stim[60] = 33'h0a0feffdd;
    stim[61] = 33'h043779a8d;
    stim[62] = 33'h13f5ebeb1;
    stim[63] = 33'h06e330be3;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'hb6f28f2b;
      expv[2] = 32'h6f72661c;
      expv[3] = 32'h6f72661c;
      expv[4] = 32'h6f72661c;
      expv[5] = 32'hfba5ffba;
      expv[6] = 32'h69c0bcbd;
      expv[7] = 32'h69c0bcbd;
      expv[8] = 32'hcf948567;
      expv[9] = 32'hcf948567;
      expv[10] = 32'h8e445a44;
      expv[11] = 32'h8e445a44;
      expv[12] = 32'h5ddce095;
      expv[13] = 32'h8d254803;
      expv[14] = 32'hd2ee8a41;
      expv[15] = 32'h455e44c4;
      expv[16] = 32'h58d7e468;
      expv[17] = 32'h58d7e468;
      expv[18] = 32'h58d7e468;
      expv[19] = 32'h79abf16c;
      expv[20] = 32'h9c0f89f3;
      expv[21] = 32'h662c0b95;
      expv[22] = 32'h662c0b95;
      expv[23] = 32'h662c0b95;
      expv[24] = 32'h662c0b95;
      expv[25] = 32'hbb2113f9;
      expv[26] = 32'hbb2113f9;
      expv[27] = 32'h7d1b6e72;
      expv[28] = 32'h7d1b6e72;
      expv[29] = 32'h7d1b6e72;
      expv[30] = 32'h7d1b6e72;
      expv[31] = 32'h7d1b6e72;
      expv[32] = 32'haf8485bf;
      expv[33] = 32'h622bbdc1;
      expv[34] = 32'hfa6c51ac;
      expv[35] = 32'hbf92c8dc;
      expv[36] = 32'hbf92c8dc;
      expv[37] = 32'ha59827c8;
      expv[38] = 32'ha59827c8;
      expv[39] = 32'h1fe5d4c1;
      expv[40] = 32'h1fe5d4c1;
      expv[41] = 32'h1fe5d4c1;
      expv[42] = 32'h91c591dc;
      expv[43] = 32'h0a82ea64;
      expv[44] = 32'h0a82ea64;
      expv[45] = 32'h0a82ea64;
      expv[46] = 32'ha4604002;
      expv[47] = 32'h8129acbf;
      expv[48] = 32'h8129acbf;
      expv[49] = 32'h4462d254;
      expv[50] = 32'hc1bf56ec;
      expv[51] = 32'hc1bf56ec;
      expv[52] = 32'hc1bf56ec;
      expv[53] = 32'hc1bf56ec;
      expv[54] = 32'hc1bf56ec;
      expv[55] = 32'h882bd4dc;
      expv[56] = 32'hb4d7726c;
      expv[57] = 32'h1ef7b850;
      expv[58] = 32'h1ef7b850;
      expv[59] = 32'h1ef7b850;
      expv[60] = 32'h9563b57b;
      expv[61] = 32'h507f7fee;
      expv[62] = 32'h21bbcd46;
      expv[63] = 32'h9faf5f58;
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
