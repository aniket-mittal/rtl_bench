// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009801 dut (
    .clk_i(clk),
    .ce_i(in_vec[34:34]),
    .rst_i(in_vec[33:33]),
    .start_i(in_vec[32:32]),
    .dat_binary_i(in_vec[31:0]),
    .dat_bcd_o(out_vec[24:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h2933e5908;
    stim[1] = 35'h283368f65;
    stim[2] = 35'h446d2aa19;
    stim[3] = 35'h0c6d4eb81;
    stim[4] = 35'h068629875;
    stim[5] = 35'h4abaf83c5;
    stim[6] = 35'h4afc22944;
    stim[7] = 35'h10a928963;
    stim[8] = 35'h0a8f684b0;
    stim[9] = 35'h1f2e92a22;
    stim[10] = 35'h19991963b;
    stim[11] = 35'h482799173;
    stim[12] = 35'h49e4098cd;
    stim[13] = 35'h4bfc06992;
    stim[14] = 35'h0658890f7;
    stim[15] = 35'h14bd5b523;
    stim[16] = 35'h152ca36e1;
    stim[17] = 35'h459b77c64;
    stim[18] = 35'h046cf6b8d;
    stim[19] = 35'h5a5ad3ec0;
    stim[20] = 35'h12ab88772;
    stim[21] = 35'h12caab9ea;
    stim[22] = 35'h180bbabf7;
    stim[23] = 35'h15c19fea6;
    stim[24] = 35'h1a7160018;
    stim[25] = 35'h007bdf26c;
    stim[26] = 35'h02eab38de;
    stim[27] = 35'h05a104c8d;
    stim[28] = 35'h1a516c5f0;
    stim[29] = 35'h457d81e85;
    stim[30] = 35'h507063ac8;
    stim[31] = 35'h4bc5f313f;
    stim[32] = 35'h11850649b;
    stim[33] = 35'h1b63fcf63;
    stim[34] = 35'h1beb1be99;
    stim[35] = 35'h0d142eeae;
    stim[36] = 35'h5c91f24a1;
    stim[37] = 35'h0118e1e13;
    stim[38] = 35'h1d0865db1;
    stim[39] = 35'h49272969c;
    stim[40] = 35'h40c497de4;
    stim[41] = 35'h4b1fd17b0;
    stim[42] = 35'h5da1d1223;
    stim[43] = 35'h0a966306b;
    stim[44] = 35'h4a0570bcc;
    stim[45] = 35'h01c3d4f84;
    stim[46] = 35'h14295fd63;
    stim[47] = 35'h47c740925;
    stim[48] = 35'h0603e310b;
    stim[49] = 35'h088aa4ec3;
    stim[50] = 35'h5b6fc899b;
    stim[51] = 35'h1311e57c8;
    stim[52] = 35'h15e745bb9;
    stim[53] = 35'h53004b216;
    stim[54] = 35'h4de38ca3d;
    stim[55] = 35'h16cd6c8f9;
    stim[56] = 35'h571b1bfd0;
    stim[57] = 35'h59cdf46e5;
    stim[58] = 35'h03d6cd013;
    stim[59] = 35'h54bb66aef;
    stim[60] = 35'h138c382d5;
    stim[61] = 35'h185d9d4f3;
    stim[62] = 35'h47d84c1d2;
    stim[63] = 35'h0b1cc3dca;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'h0000001;
      expv[2] = 25'h0000001;
      expv[3] = 25'h0000001;
      expv[4] = 25'h0000001;
      expv[5] = 25'h0000001;
      expv[6] = 25'h0000001;
      expv[7] = 25'h0000001;
      expv[8] = 25'h0000000;
      expv[9] = 25'h0000000;
      expv[10] = 25'h0000000;
      expv[11] = 25'h0000000;
      expv[12] = 25'h0000000;
      expv[13] = 25'h0000000;
      expv[14] = 25'h0000000;
      expv[15] = 25'h0000000;
      expv[16] = 25'h0000000;
      expv[17] = 25'h0000000;
      expv[18] = 25'h0000000;
      expv[19] = 25'h0000000;
      expv[20] = 25'h0000000;
      expv[21] = 25'h0000000;
      expv[22] = 25'h0000000;
      expv[23] = 25'h0000000;
      expv[24] = 25'h0000000;
      expv[25] = 25'h0000000;
      expv[26] = 25'h0000000;
      expv[27] = 25'h0000000;
      expv[28] = 25'h0000000;
      expv[29] = 25'h0000000;
      expv[30] = 25'h0000000;
      expv[31] = 25'h0000000;
      expv[32] = 25'h0000000;
      expv[33] = 25'h0000000;
      expv[34] = 25'h0000000;
      expv[35] = 25'h0000000;
      expv[36] = 25'h0000000;
      expv[37] = 25'h0000000;
      expv[38] = 25'h0000000;
      expv[39] = 25'h0000000;
      expv[40] = 25'h0000000;
      expv[41] = 25'h0000000;
      expv[42] = 25'h0000000;
      expv[43] = 25'h0000000;
      expv[44] = 25'h0000000;
      expv[45] = 25'h0000000;
      expv[46] = 25'h0000000;
      expv[47] = 25'h0000000;
      expv[48] = 25'h0000000;
      expv[49] = 25'h0000000;
      expv[50] = 25'h0000000;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000000;
      expv[53] = 25'h0000000;
      expv[54] = 25'h0000000;
      expv[55] = 25'h0000000;
      expv[56] = 25'h0000000;
      expv[57] = 25'h0000000;
      expv[58] = 25'h0000000;
      expv[59] = 25'h0000000;
      expv[60] = 25'h0000000;
      expv[61] = 25'h0000000;
      expv[62] = 25'h0000000;
      expv[63] = 25'h0000000;
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
