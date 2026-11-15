// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053259 dut (
    .clk(clk),
    .reset_n(in_vec[16:16]),
    .HVVoltage(in_vec[15:0]),
    .discharge_ctrl(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0de96;
    stim[1] = 17'h0b9c3;
    stim[2] = 17'h14ece;
    stim[3] = 17'h06c22;
    stim[4] = 17'h136c1;
    stim[5] = 17'h192b3;
    stim[6] = 17'h11d91;
    stim[7] = 17'h10827;
    stim[8] = 17'h174d7;
    stim[9] = 17'h180bf;
    stim[10] = 17'h1b533;
    stim[11] = 17'h10f36;
    stim[12] = 17'h1c92c;
    stim[13] = 17'h1c2b5;
    stim[14] = 17'h1553a;
    stim[15] = 17'h163d5;
    stim[16] = 17'h13c00;
    stim[17] = 17'h152cc;
    stim[18] = 17'h1da59;
    stim[19] = 17'h12efa;
    stim[20] = 17'h160cd;
    stim[21] = 17'h11b06;
    stim[22] = 17'h1a01c;
    stim[23] = 17'h1f432;
    stim[24] = 17'h1df9b;
    stim[25] = 17'h12507;
    stim[26] = 17'h13dcc;
    stim[27] = 17'h11ebc;
    stim[28] = 17'h14077;
    stim[29] = 17'h01aef;
    stim[30] = 17'h1f6d5;
    stim[31] = 17'h1f341;
    stim[32] = 17'h1ea01;
    stim[33] = 17'h14028;
    stim[34] = 17'h16bb8;
    stim[35] = 17'h15aaf;
    stim[36] = 17'h1db21;
    stim[37] = 17'h126bf;
    stim[38] = 17'h1bbc6;
    stim[39] = 17'h088b6;
    stim[40] = 17'h1d71f;
    stim[41] = 17'h13d06;
    stim[42] = 17'h10fcd;
    stim[43] = 17'h12c87;
    stim[44] = 17'h12376;
    stim[45] = 17'h1882e;
    stim[46] = 17'h1a43a;
    stim[47] = 17'h16fb8;
    stim[48] = 17'h14899;
    stim[49] = 17'h10b0a;
    stim[50] = 17'h177a9;
    stim[51] = 17'h10e9d;
    stim[52] = 17'h1ae2d;
    stim[53] = 17'h1ecdf;
    stim[54] = 17'h1e635;
    stim[55] = 17'h116cd;
    stim[56] = 17'h1da09;
    stim[57] = 17'h1fe74;
    stim[58] = 17'h145aa;
    stim[59] = 17'h1c68a;
    stim[60] = 17'h110f8;
    stim[61] = 17'h19b19;
    stim[62] = 17'h1de63;
    stim[63] = 17'h19f1b;
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
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
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
