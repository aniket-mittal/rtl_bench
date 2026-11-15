// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01005 dut (
    .clk(clk),
    .clk_noise(in_vec[21:21]),
    .non_clk_rst_n(in_vec[20:20]),
    .non_clk_control(in_vec[19:19]),
    .noise_D(in_vec[18:15]),
    .Noise_in(in_vec[14:14]),
    .DAC_RST(in_vec[13:13]),
    .D(in_vec[12:7]),
    .config_in(in_vec[6:1]),
    .VREF_in(in_vec[0:0]),
    .VREF_out(out_vec[1:1]),
    .VOUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3fbc13;
    stim[1] = 22'h077a6d;
    stim[2] = 22'h3c8304;
    stim[3] = 22'h1c90f1;
    stim[4] = 22'h34c0da;
    stim[5] = 22'h30980a;
    stim[6] = 22'h14c78c;
    stim[7] = 22'h3ed413;
    stim[8] = 22'h04c17d;
    stim[9] = 22'h218c52;
    stim[10] = 22'h33c5d4;
    stim[11] = 22'h26138a;
    stim[12] = 22'h090c80;
    stim[13] = 22'h384df7;
    stim[14] = 22'h31c328;
    stim[15] = 22'h00c9a3;
    stim[16] = 22'h2e87b9;
    stim[17] = 22'h24866c;
    stim[18] = 22'h210619;
    stim[19] = 22'h1d4119;
    stim[20] = 22'h329b90;
    stim[21] = 22'h198105;
    stim[22] = 22'h34c998;
    stim[23] = 22'h105129;
    stim[24] = 22'h210a02;
    stim[25] = 22'h271ae1;
    stim[26] = 22'h3e00a6;
    stim[27] = 22'h3880bb;
    stim[28] = 22'h338a8d;
    stim[29] = 22'h0e4bff;
    stim[30] = 22'h2e577c;
    stim[31] = 22'h320dd2;
    stim[32] = 22'h051647;
    stim[33] = 22'h288d65;
    stim[34] = 22'h0c4710;
    stim[35] = 22'h2fc361;
    stim[36] = 22'h3b84ef;
    stim[37] = 22'h104442;
    stim[38] = 22'h349630;
    stim[39] = 22'h2ad919;
    stim[40] = 22'h2f1bc7;
    stim[41] = 22'h239c62;
    stim[42] = 22'h1a00a6;
    stim[43] = 22'h1f9a70;
    stim[44] = 22'h0e47d1;
    stim[45] = 22'h1dc514;
    stim[46] = 22'h3cd1ab;
    stim[47] = 22'h1ad892;
    stim[48] = 22'h3090d5;
    stim[49] = 22'h26dd63;
    stim[50] = 22'h0c5af8;
    stim[51] = 22'h199646;
    stim[52] = 22'h1f55f2;
    stim[53] = 22'h100361;
    stim[54] = 22'h0e4180;
    stim[55] = 22'h39018e;
    stim[56] = 22'h0bdfd3;
    stim[57] = 22'h238c40;
    stim[58] = 22'h02c2f1;
    stim[59] = 22'h175e67;
    stim[60] = 22'h0e902c;
    stim[61] = 22'h0e97a9;
    stim[62] = 22'h2f5e4b;
    stim[63] = 22'h150acb;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h3;
      expv[3] = 2'h2;
      expv[4] = 2'h3;
      expv[5] = 2'h3;
      expv[6] = 2'h3;
      expv[7] = 2'h3;
      expv[8] = 2'h3;
      expv[9] = 2'h3;
      expv[10] = 2'h2;
      expv[11] = 2'h3;
      expv[12] = 2'h2;
      expv[13] = 2'h3;
      expv[14] = 2'h3;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h3;
      expv[19] = 2'h3;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h3;
      expv[25] = 2'h2;
      expv[26] = 2'h3;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h2;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h3;
      expv[42] = 2'h3;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h3;
      expv[48] = 2'h2;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h3;
      expv[56] = 2'h3;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h3;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h3;
      expv[63] = 2'h3;
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
