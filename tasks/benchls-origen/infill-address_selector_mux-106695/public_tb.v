// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106695 dut (
    .clk_50(clk),
    .Professor_address(in_vec[17:0]),
    .Address(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2ce6a;
    stim[1] = 18'h24cd4;
    stim[2] = 18'h2bc43;
    stim[3] = 18'h0cc6f;
    stim[4] = 18'h1555f;
    stim[5] = 18'h13dcb;
    stim[6] = 18'h21dae;
    stim[7] = 18'h2a960;
    stim[8] = 18'h21721;
    stim[9] = 18'h3d182;
    stim[10] = 18'h30dd3;
    stim[11] = 18'h23c5a;
    stim[12] = 18'h047db;
    stim[13] = 18'h009cb;
    stim[14] = 18'h13d5a;
    stim[15] = 18'h2fe37;
    stim[16] = 18'h20048;
    stim[17] = 18'h2f4f9;
    stim[18] = 18'h3522a;
    stim[19] = 18'h200b1;
    stim[20] = 18'h0ddc3;
    stim[21] = 18'h343bd;
    stim[22] = 18'h1cc24;
    stim[23] = 18'h0b8f3;
    stim[24] = 18'h1a91c;
    stim[25] = 18'h1b446;
    stim[26] = 18'h2da2e;
    stim[27] = 18'h138f6;
    stim[28] = 18'h032a1;
    stim[29] = 18'h0a881;
    stim[30] = 18'h1441f;
    stim[31] = 18'h15f66;
    stim[32] = 18'h08ed2;
    stim[33] = 18'h3e916;
    stim[34] = 18'h249e1;
    stim[35] = 18'h32351;
    stim[36] = 18'h09b9b;
    stim[37] = 18'h3db6b;
    stim[38] = 18'h1ba81;
    stim[39] = 18'h3e2e7;
    stim[40] = 18'h248d4;
    stim[41] = 18'h373be;
    stim[42] = 18'h2afdf;
    stim[43] = 18'h093f8;
    stim[44] = 18'h360ba;
    stim[45] = 18'h333fc;
    stim[46] = 18'h2ea2b;
    stim[47] = 18'h3c80e;
    stim[48] = 18'h359bc;
    stim[49] = 18'h1d078;
    stim[50] = 18'h15217;
    stim[51] = 18'h00048;
    stim[52] = 18'h01df1;
    stim[53] = 18'h077b7;
    stim[54] = 18'h2d6f0;
    stim[55] = 18'h23333;
    stim[56] = 18'h3d362;
    stim[57] = 18'h31ca2;
    stim[58] = 18'h0ac35;
    stim[59] = 18'h2b774;
    stim[60] = 18'h01218;
    stim[61] = 18'h081c2;
    stim[62] = 18'h17f7a;
    stim[63] = 18'h11da3;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h2ce6a;
      expv[2] = 18'h24cd4;
      expv[3] = 18'h2bc43;
      expv[4] = 18'h0cc6f;
      expv[5] = 18'h1555f;
      expv[6] = 18'h13dcb;
      expv[7] = 18'h21dae;
      expv[8] = 18'h2a960;
      expv[9] = 18'h21721;
      expv[10] = 18'h3d182;
      expv[11] = 18'h30dd3;
      expv[12] = 18'h23c5a;
      expv[13] = 18'h047db;
      expv[14] = 18'h009cb;
      expv[15] = 18'h13d5a;
      expv[16] = 18'h2fe37;
      expv[17] = 18'h20048;
      expv[18] = 18'h2f4f9;
      expv[19] = 18'h3522a;
      expv[20] = 18'h200b1;
      expv[21] = 18'h0ddc3;
      expv[22] = 18'h343bd;
      expv[23] = 18'h1cc24;
      expv[24] = 18'h0b8f3;
      expv[25] = 18'h1a91c;
      expv[26] = 18'h1b446;
      expv[27] = 18'h2da2e;
      expv[28] = 18'h138f6;
      expv[29] = 18'h032a1;
      expv[30] = 18'h0a881;
      expv[31] = 18'h1441f;
      expv[32] = 18'h15f66;
      expv[33] = 18'h08ed2;
      expv[34] = 18'h3e916;
      expv[35] = 18'h249e1;
      expv[36] = 18'h32351;
      expv[37] = 18'h09b9b;
      expv[38] = 18'h3db6b;
      expv[39] = 18'h1ba81;
      expv[40] = 18'h3e2e7;
      expv[41] = 18'h248d4;
      expv[42] = 18'h373be;
      expv[43] = 18'h2afdf;
      expv[44] = 18'h093f8;
      expv[45] = 18'h360ba;
      expv[46] = 18'h333fc;
      expv[47] = 18'h2ea2b;
      expv[48] = 18'h3c80e;
      expv[49] = 18'h359bc;
      expv[50] = 18'h1d078;
      expv[51] = 18'h15217;
      expv[52] = 18'h00048;
      expv[53] = 18'h01df1;
      expv[54] = 18'h077b7;
      expv[55] = 18'h2d6f0;
      expv[56] = 18'h23333;
      expv[57] = 18'h3d362;
      expv[58] = 18'h31ca2;
      expv[59] = 18'h0ac35;
      expv[60] = 18'h2b774;
      expv[61] = 18'h01218;
      expv[62] = 18'h081c2;
      expv[63] = 18'h17f7a;
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
