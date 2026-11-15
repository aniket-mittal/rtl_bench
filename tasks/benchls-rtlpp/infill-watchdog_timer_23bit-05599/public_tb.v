// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05599 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[17:17]),
    .readdata(out_vec[16:1]),
    .resetrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h394217;
    stim[1] = 22'h241539;
    stim[2] = 22'h1ed9ff;
    stim[3] = 22'h2f6a5f;
    stim[4] = 22'h032a70;
    stim[5] = 22'h3aacab;
    stim[6] = 22'h1e3305;
    stim[7] = 22'h371824;
    stim[8] = 22'h3ab004;
    stim[9] = 22'h2f535d;
    stim[10] = 22'h3f6fda;
    stim[11] = 22'h1a370b;
    stim[12] = 22'h130ec3;
    stim[13] = 22'h1611ff;
    stim[14] = 22'h0733f2;
    stim[15] = 22'h2acb7e;
    stim[16] = 22'h0bafea;
    stim[17] = 22'h030a20;
    stim[18] = 22'h2ee921;
    stim[19] = 22'h1ea1a4;
    stim[20] = 22'h163f81;
    stim[21] = 22'h1b3598;
    stim[22] = 22'h03b1b9;
    stim[23] = 22'h1bf790;
    stim[24] = 22'h3b33ec;
    stim[25] = 22'h2a0816;
    stim[26] = 22'h2f6363;
    stim[27] = 22'h1f3e11;
    stim[28] = 22'h2f1747;
    stim[29] = 22'h366d5c;
    stim[30] = 22'h275045;
    stim[31] = 22'h1f43bd;
    stim[32] = 22'h068c43;
    stim[33] = 22'h330e58;
    stim[34] = 22'h33d0b6;
    stim[35] = 22'h0e7e6b;
    stim[36] = 22'h3fe3e6;
    stim[37] = 22'h3bfb7e;
    stim[38] = 22'h2e2e8d;
    stim[39] = 22'h06caf9;
    stim[40] = 22'h3ef3c0;
    stim[41] = 22'h12ac72;
    stim[42] = 22'h0f441a;
    stim[43] = 22'h2a8dba;
    stim[44] = 22'h3619b5;
    stim[45] = 22'h17a88a;
    stim[46] = 22'h0e03b5;
    stim[47] = 22'h225122;
    stim[48] = 22'h365d36;
    stim[49] = 22'h0ff462;
    stim[50] = 22'h1a9c0e;
    stim[51] = 22'h1422d0;
    stim[52] = 22'h16fa16;
    stim[53] = 22'h22de81;
    stim[54] = 22'h161094;
    stim[55] = 22'h23cc51;
    stim[56] = 22'h22a9d4;
    stim[57] = 22'h337663;
    stim[58] = 22'h1a382b;
    stim[59] = 22'h0aed58;
    stim[60] = 22'h3bf884;
    stim[61] = 22'h0271d0;
    stim[62] = 22'h169095;
    stim[63] = 22'h23bd48;
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
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00002;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00002;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00002;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
