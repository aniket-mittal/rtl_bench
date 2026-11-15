// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_008353 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .valid(in_vec[18:18]),
    .last(in_vec[17:17]),
    .data(in_vec[16:1]),
    .inf_ready(in_vec[0:0]),
    .inf_valid(out_vec[17:17]),
    .inf_last(out_vec[16:16]),
    .inf_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hd1afa;
    stim[1] = 20'he2e6b;
    stim[2] = 20'h6209a;
    stim[3] = 20'h41a8e;
    stim[4] = 20'h5dbe6;
    stim[5] = 20'h627a8;
    stim[6] = 20'h1fbf7;
    stim[7] = 20'h75aba;
    stim[8] = 20'h0426c;
    stim[9] = 20'h2d774;
    stim[10] = 20'h4e141;
    stim[11] = 20'h6d9fc;
    stim[12] = 20'h803a9;
    stim[13] = 20'h09278;
    stim[14] = 20'h28dfb;
    stim[15] = 20'h7b5d5;
    stim[16] = 20'h0e281;
    stim[17] = 20'h34eb4;
    stim[18] = 20'h29746;
    stim[19] = 20'h67251;
    stim[20] = 20'h44f14;
    stim[21] = 20'h01ca0;
    stim[22] = 20'h22b74;
    stim[23] = 20'h0d4d3;
    stim[24] = 20'h1bbbf;
    stim[25] = 20'h227e0;
    stim[26] = 20'h01341;
    stim[27] = 20'h39327;
    stim[28] = 20'h09bdc;
    stim[29] = 20'h1b673;
    stim[30] = 20'h1da0a;
    stim[31] = 20'h67d1a;
    stim[32] = 20'h42931;
    stim[33] = 20'h6868a;
    stim[34] = 20'h4f158;
    stim[35] = 20'h218dc;
    stim[36] = 20'h18b49;
    stim[37] = 20'h3b645;
    stim[38] = 20'h0b3a7;
    stim[39] = 20'h61934;
    stim[40] = 20'h26152;
    stim[41] = 20'h1720d;
    stim[42] = 20'h0034d;
    stim[43] = 20'h0593c;
    stim[44] = 20'h42b7b;
    stim[45] = 20'h53c0c;
    stim[46] = 20'h7d1b5;
    stim[47] = 20'h1faed;
    stim[48] = 20'h79cf6;
    stim[49] = 20'h3898d;
    stim[50] = 20'h01e66;
    stim[51] = 20'h2b2fa;
    stim[52] = 20'h14df2;
    stim[53] = 20'h5c1cc;
    stim[54] = 20'h6d437;
    stim[55] = 20'h1ca72;
    stim[56] = 20'h7af8f;
    stim[57] = 20'h440ac;
    stim[58] = 20'h59671;
    stim[59] = 20'h3550e;
    stim[60] = 20'h69a91;
    stim[61] = 20'h09c7e;
    stim[62] = 20'h72463;
    stim[63] = 20'h5f02b;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h3104d;
      expv[5] = 18'h3104d;
      expv[6] = 18'h3104d;
      expv[7] = 18'h20d47;
      expv[8] = 18'h20d47;
      expv[9] = 18'h20d47;
      expv[10] = 18'h20d47;
      expv[11] = 18'h2edf3;
      expv[12] = 18'h2edf3;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h3daea;
      expv[18] = 18'h3daea;
      expv[19] = 18'h3daea;
      expv[20] = 18'h00000;
      expv[21] = 18'h33928;
      expv[22] = 18'h33928;
      expv[23] = 18'h33928;
      expv[24] = 18'h2278a;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h33e8d;
      expv[34] = 18'h33e8d;
      expv[35] = 18'h33e8d;
      expv[36] = 18'h33e8d;
      expv[37] = 18'h21498;
      expv[38] = 18'h34345;
      expv[39] = 18'h278ac;
      expv[40] = 18'h278ac;
      expv[41] = 18'h278ac;
      expv[42] = 18'h30c9a;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h215bd;
      expv[47] = 18'h29e06;
      expv[48] = 18'h3e8da;
      expv[49] = 18'h3e8da;
      expv[50] = 18'h3ce7b;
      expv[51] = 18'h3ce7b;
      expv[52] = 18'h3ce7b;
      expv[53] = 18'h3ce7b;
      expv[54] = 18'h3ce7b;
      expv[55] = 18'h2e0e6;
      expv[56] = 18'h2e0e6;
      expv[57] = 18'h36a1b;
      expv[58] = 18'h36a1b;
      expv[59] = 18'h3d7c7;
      expv[60] = 18'h3d7c7;
      expv[61] = 18'h22056;
      expv[62] = 18'h22056;
      expv[63] = 18'h2cb38;
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
