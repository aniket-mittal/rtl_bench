// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009039 dut (
    .Rs1E(in_vec[40:36]),
    .Rs2E(in_vec[35:31]),
    .RdM(in_vec[30:26]),
    .RdW(in_vec[25:21]),
    .RegWriteM(in_vec[20:20]),
    .RegWriteW(in_vec[19:19]),
    .ResultSrc0(in_vec[18:18]),
    .RdE(in_vec[17:13]),
    .Rs1D(in_vec[12:8]),
    .Rs2D(in_vec[7:3]),
    .PCSrcE(in_vec[2:2]),
    .intrupt(in_vec[1:1]),
    .ret(in_vec[0:0]),
    .ForwardAE(out_vec[8:7]),
    .ForwardBE(out_vec[6:5]),
    .StallF(out_vec[4:4]),
    .StallD(out_vec[3:3]),
    .FlushE(out_vec[2:2]),
    .FlushD(out_vec[1:1]),
    .FlushM(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h16ff394117b;
    stim[1] = 41'h05d945a0097;
    stim[2] = 41'h0eae7d95178;
    stim[3] = 41'h0cadc6d1eda;
    stim[4] = 41'h0252003a82b;
    stim[5] = 41'h18966a89b48;
    stim[6] = 41'h080e1910432;
    stim[7] = 41'h1716dfc061c;
    stim[8] = 41'h0db51d4ed47;
    stim[9] = 41'h080bfd22400;
    stim[10] = 41'h1cddcb5fac3;
    stim[11] = 41'h04451076cb3;
    stim[12] = 41'h0310e6f69b0;
    stim[13] = 41'h1eb235dfdf9;
    stim[14] = 41'h11bc45dfd08;
    stim[15] = 41'h09674d5f53e;
    stim[16] = 41'h0173cd3e8d0;
    stim[17] = 41'h1940e07a2af;
    stim[18] = 41'h1b4653ff67a;
    stim[19] = 41'h1dbd8fac2e3;
    stim[20] = 41'h02f55172ee7;
    stim[21] = 41'h14127e2979f;
    stim[22] = 41'h1258c326915;
    stim[23] = 41'h1893b7fd787;
    stim[24] = 41'h0b3347b5591;
    stim[25] = 41'h19a34e7d15b;
    stim[26] = 41'h0f8ad4c63e4;
    stim[27] = 41'h100f51bb0d3;
    stim[28] = 41'h09cacc3646a;
    stim[29] = 41'h1bc2c588258;
    stim[30] = 41'h14f30d0f5d7;
    stim[31] = 41'h167b383259d;
    stim[32] = 41'h1e61847aedc;
    stim[33] = 41'h17a19dbe942;
    stim[34] = 41'h193139dc87e;
    stim[35] = 41'h07d7e11b130;
    stim[36] = 41'h0d6ca916dff;
    stim[37] = 41'h18e5dc21328;
    stim[38] = 41'h01c1dacefe4;
    stim[39] = 41'h1305e33f81c;
    stim[40] = 41'h1add8ba24a1;
    stim[41] = 41'h160816c8e25;
    stim[42] = 41'h06cbee30b7a;
    stim[43] = 41'h0daf62d2610;
    stim[44] = 41'h1ffaa22d542;
    stim[45] = 41'h1bec84a444b;
    stim[46] = 41'h0222d2b8647;
    stim[47] = 41'h19842e172cb;
    stim[48] = 41'h1c48ff03eac;
    stim[49] = 41'h052745fdb58;
    stim[50] = 41'h03c56865315;
    stim[51] = 41'h0b6e5e3f0db;
    stim[52] = 41'h1e2847c0978;
    stim[53] = 41'h0f6821e4559;
    stim[54] = 41'h18ae112e474;
    stim[55] = 41'h1f7f17715c8;
    stim[56] = 41'h0ac5a0fad34;
    stim[57] = 41'h0679cd196e8;
    stim[58] = 41'h04ba3ff9c80;
    stim[59] = 41'h15a19838684;
    stim[60] = 41'h01e3870ace6;
    stim[61] = 41'h11e2e13af3e;
    stim[62] = 41'h034e90e19ca;
    stim[63] = 41'h0c86295e9a7;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h007;
      expv[1] = 9'h107;
      expv[2] = 9'h000;
      expv[3] = 9'h007;
      expv[4] = 9'h007;
      expv[5] = 9'h000;
      expv[6] = 9'h007;
      expv[7] = 9'h006;
      expv[8] = 9'h007;
      expv[9] = 9'h000;
      expv[10] = 9'h007;
      expv[11] = 9'h007;
      expv[12] = 9'h000;
      expv[13] = 9'h002;
      expv[14] = 9'h100;
      expv[15] = 9'h007;
      expv[16] = 9'h000;
      expv[17] = 9'h007;
      expv[18] = 9'h007;
      expv[19] = 9'h007;
      expv[20] = 9'h007;
      expv[21] = 9'h007;
      expv[22] = 9'h006;
      expv[23] = 9'h007;
      expv[24] = 9'h002;
      expv[25] = 9'h007;
      expv[26] = 9'h01e;
      expv[27] = 9'h007;
      expv[28] = 9'h007;
      expv[29] = 9'h000;
      expv[30] = 9'h007;
      expv[31] = 9'h006;
      expv[32] = 9'h006;
      expv[33] = 9'h007;
      expv[34] = 9'h007;
      expv[35] = 9'h000;
      expv[36] = 9'h007;
      expv[37] = 9'h000;
      expv[38] = 9'h006;
      expv[39] = 9'h006;
      expv[40] = 9'h002;
      expv[41] = 9'h01e;
      expv[42] = 9'h007;
      expv[43] = 9'h000;
      expv[44] = 9'h007;
      expv[45] = 9'h007;
      expv[46] = 9'h007;
      expv[47] = 9'h007;
      expv[48] = 9'h006;
      expv[49] = 9'h000;
      expv[50] = 9'h006;
      expv[51] = 9'h007;
      expv[52] = 9'h000;
      expv[53] = 9'h002;
      expv[54] = 9'h106;
      expv[55] = 9'h000;
      expv[56] = 9'h006;
      expv[57] = 9'h000;
      expv[58] = 9'h01c;
      expv[59] = 9'h006;
      expv[60] = 9'h007;
      expv[61] = 9'h007;
      expv[62] = 9'h007;
      expv[63] = 9'h007;
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
