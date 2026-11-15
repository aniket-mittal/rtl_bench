// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_122751 dut (
    .clk(clk),
    .en(in_vec[13:13]),
    .pck_size(in_vec[12:9]),
    .reset(in_vec[8:8]),
    .freez(in_vec[7:7]),
    .ratio(in_vec[6:0]),
    .inject(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3f27;
    stim[1] = 14'h0f23;
    stim[2] = 14'h14a3;
    stim[3] = 14'h2cdb;
    stim[4] = 14'h1a90;
    stim[5] = 14'h2171;
    stim[6] = 14'h2096;
    stim[7] = 14'h0a8a;
    stim[8] = 14'h1800;
    stim[9] = 14'h0e1f;
    stim[10] = 14'h264b;
    stim[11] = 14'h1a74;
    stim[12] = 14'h3c56;
    stim[13] = 14'h0e00;
    stim[14] = 14'h0e76;
    stim[15] = 14'h1aad;
    stim[16] = 14'h04a8;
    stim[17] = 14'h32e4;
    stim[18] = 14'h0412;
    stim[19] = 14'h28fc;
    stim[20] = 14'h2ec7;
    stim[21] = 14'h2257;
    stim[22] = 14'h1e6d;
    stim[23] = 14'h023b;
    stim[24] = 14'h3060;
    stim[25] = 14'h1a52;
    stim[26] = 14'h023c;
    stim[27] = 14'h3ac4;
    stim[28] = 14'h120b;
    stim[29] = 14'h12bd;
    stim[30] = 14'h2a8c;
    stim[31] = 14'h1220;
    stim[32] = 14'h2a8f;
    stim[33] = 14'h1c50;
    stim[34] = 14'h0225;
    stim[35] = 14'h2479;
    stim[36] = 14'h04ac;
    stim[37] = 14'h36a8;
    stim[38] = 14'h16f4;
    stim[39] = 14'h00a9;
    stim[40] = 14'h2eda;
    stim[41] = 14'h1e65;
    stim[42] = 14'h289b;
    stim[43] = 14'h2093;
    stim[44] = 14'h285e;
    stim[45] = 14'h3a69;
    stim[46] = 14'h0ca0;
    stim[47] = 14'h2c6f;
    stim[48] = 14'h3aed;
    stim[49] = 14'h0000;
    stim[50] = 14'h045c;
    stim[51] = 14'h12fc;
    stim[52] = 14'h160c;
    stim[53] = 14'h2ed1;
    stim[54] = 14'h12a7;
    stim[55] = 14'h0ae2;
    stim[56] = 14'h086d;
    stim[57] = 14'h1246;
    stim[58] = 14'h1a93;
    stim[59] = 14'h3078;
    stim[60] = 14'h243e;
    stim[61] = 14'h020e;
    stim[62] = 14'h3029;
    stim[63] = 14'h36b7;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
