// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_027851 dut (
    .clk(clk),
    .gate(in_vec[32:32]),
    .delay(in_vec[31:0]),
    .q(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h11e001deb;
    stim[1] = 33'h1f7931a65;
    stim[2] = 33'h15125f9d7;
    stim[3] = 33'h1572712b2;
    stim[4] = 33'h052417fbd;
    stim[5] = 33'h1b9c0a880;
    stim[6] = 33'h0de96dd37;
    stim[7] = 33'h10d9de48f;
    stim[8] = 33'h15efc231a;
    stim[9] = 33'h1fa0071ce;
    stim[10] = 33'h0b6e28b4b;
    stim[11] = 33'h1498b97c9;
    stim[12] = 33'h010528f58;
    stim[13] = 33'h10142faad;
    stim[14] = 33'h08e72c349;
    stim[15] = 33'h018aec5ad;
    stim[16] = 33'h08cf74ccc;
    stim[17] = 33'h0b4b7b90f;
    stim[18] = 33'h094b28fe8;
    stim[19] = 33'h0d0523fdd;
    stim[20] = 33'h03af7ff43;
    stim[21] = 33'h144f50bbd;
    stim[22] = 33'h0eec19875;
    stim[23] = 33'h08848c352;
    stim[24] = 33'h1fdf836b5;
    stim[25] = 33'h1d51c9a80;
    stim[26] = 33'h1f55a4d0b;
    stim[27] = 33'h1b881d3b0;
    stim[28] = 33'h12e9d1d0c;
    stim[29] = 33'h114398de6;
    stim[30] = 33'h0f204603f;
    stim[31] = 33'h0e0751e7a;
    stim[32] = 33'h0c9dcda88;
    stim[33] = 33'h0994456f7;
    stim[34] = 33'h10ae53b44;
    stim[35] = 33'h15820499f;
    stim[36] = 33'h040148dce;
    stim[37] = 33'h160fd54cc;
    stim[38] = 33'h1cb2da161;
    stim[39] = 33'h0418418d0;
    stim[40] = 33'h1e5746aa3;
    stim[41] = 33'h0e22b007e;
    stim[42] = 33'h14a73023c;
    stim[43] = 33'h0af506bde;
    stim[44] = 33'h08d8bf337;
    stim[45] = 33'h11f648332;
    stim[46] = 33'h1dd446a4f;
    stim[47] = 33'h01dbe4c9f;
    stim[48] = 33'h117547154;
    stim[49] = 33'h05f948628;
    stim[50] = 33'h0d23acb20;
    stim[51] = 33'h02a9045bd;
    stim[52] = 33'h092e531ea;
    stim[53] = 33'h12bb69258;
    stim[54] = 33'h19acb39bb;
    stim[55] = 33'h06aa1d16d;
    stim[56] = 33'h11ee8a9d5;
    stim[57] = 33'h16486524b;
    stim[58] = 33'h0098ea21b;
    stim[59] = 33'h1d2b23bab;
    stim[60] = 33'h065ce7b66;
    stim[61] = 33'h1e39204ba;
    stim[62] = 33'h09da18a7b;
    stim[63] = 33'h072cdd158;
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
      expv[11] = 1'h0;
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
      expv[45] = 1'h0;
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
      expv[63] = 1'h0;
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
