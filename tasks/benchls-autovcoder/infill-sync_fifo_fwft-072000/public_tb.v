// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072000 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc5c;
    stim[1] = 12'hd98;
    stim[2] = 12'h0e1;
    stim[3] = 12'h00b;
    stim[4] = 12'h698;
    stim[5] = 12'h3ff;
    stim[6] = 12'h43b;
    stim[7] = 12'h6fc;
    stim[8] = 12'h533;
    stim[9] = 12'h571;
    stim[10] = 12'h266;
    stim[11] = 12'h3e8;
    stim[12] = 12'h327;
    stim[13] = 12'h2ea;
    stim[14] = 12'h169;
    stim[15] = 12'h466;
    stim[16] = 12'h389;
    stim[17] = 12'h7c8;
    stim[18] = 12'h190;
    stim[19] = 12'h5e2;
    stim[20] = 12'h7bf;
    stim[21] = 12'h276;
    stim[22] = 12'h0f9;
    stim[23] = 12'h62e;
    stim[24] = 12'h4dc;
    stim[25] = 12'h6d1;
    stim[26] = 12'h2a5;
    stim[27] = 12'h2bf;
    stim[28] = 12'h24a;
    stim[29] = 12'h0c6;
    stim[30] = 12'h532;
    stim[31] = 12'h5e6;
    stim[32] = 12'h118;
    stim[33] = 12'h270;
    stim[34] = 12'h095;
    stim[35] = 12'h463;
    stim[36] = 12'h7ab;
    stim[37] = 12'h246;
    stim[38] = 12'h412;
    stim[39] = 12'h60c;
    stim[40] = 12'h795;
    stim[41] = 12'h1cf;
    stim[42] = 12'h62a;
    stim[43] = 12'h13b;
    stim[44] = 12'h3c6;
    stim[45] = 12'h238;
    stim[46] = 12'h1e2;
    stim[47] = 12'h358;
    stim[48] = 12'h361;
    stim[49] = 12'h20d;
    stim[50] = 12'h44a;
    stim[51] = 12'h17c;
    stim[52] = 12'h78c;
    stim[53] = 12'h5fb;
    stim[54] = 12'h088;
    stim[55] = 12'h5e6;
    stim[56] = 12'h400;
    stim[57] = 12'h7c9;
    stim[58] = 12'h16e;
    stim[59] = 12'h249;
    stim[60] = 12'h0af;
    stim[61] = 12'h376;
    stim[62] = 12'h0c7;
    stim[63] = 12'h293;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h198;
      expv[6] = 10'h198;
      expv[7] = 10'h198;
      expv[8] = 10'h198;
      expv[9] = 10'h198;
      expv[10] = 10'h333;
      expv[11] = 10'h333;
      expv[12] = 10'h333;
      expv[13] = 10'h333;
      expv[14] = 10'h333;
      expv[15] = 10'h333;
      expv[16] = 10'h333;
      expv[17] = 10'h333;
      expv[18] = 10'h371;
      expv[19] = 10'h371;
      expv[20] = 10'h371;
      expv[21] = 10'h3c8;
      expv[22] = 10'h3c8;
      expv[23] = 10'h3c8;
      expv[24] = 10'h3e2;
      expv[25] = 10'h3e2;
      expv[26] = 10'h3bf;
      expv[27] = 10'h3bf;
      expv[28] = 10'h3bf;
      expv[29] = 10'h3bf;
      expv[30] = 10'h3bf;
      expv[31] = 10'h3bf;
      expv[32] = 10'h3bf;
      expv[33] = 10'h3bf;
      expv[34] = 10'h3bf;
      expv[35] = 10'h3bf;
      expv[36] = 10'h3bf;
      expv[37] = 10'h332;
      expv[38] = 10'h332;
      expv[39] = 10'h332;
      expv[40] = 10'h3e6;
      expv[41] = 10'h3ab;
      expv[42] = 10'h3ab;
      expv[43] = 10'h395;
      expv[44] = 10'h395;
      expv[45] = 10'h395;
      expv[46] = 10'h395;
      expv[47] = 10'h395;
      expv[48] = 10'h395;
      expv[49] = 10'h395;
      expv[50] = 10'h395;
      expv[51] = 10'h395;
      expv[52] = 10'h395;
      expv[53] = 10'h195;
      expv[54] = 10'h38c;
      expv[55] = 10'h38c;
      expv[56] = 10'h38c;
      expv[57] = 10'h38c;
      expv[58] = 10'h3fb;
      expv[59] = 10'h3fb;
      expv[60] = 10'h3fb;
      expv[61] = 10'h3fb;
      expv[62] = 10'h3fb;
      expv[63] = 10'h3fb;
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
