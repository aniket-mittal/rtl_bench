// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151948 dut (
    .clk(clk),
    .reset(in_vec[34:34]),
    .start(in_vec[33:33]),
    .pulseCount(in_vec[32:1]),
    .waitOnMe(in_vec[0:0]),
    .pulse(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h733d5110c;
    stim[1] = 35'h5f1781bb7;
    stim[2] = 35'h16324aa7a;
    stim[3] = 35'h055b424bb;
    stim[4] = 35'h0154dadae;
    stim[5] = 35'h0b8f929cf;
    stim[6] = 35'h02d200f22;
    stim[7] = 35'h39134c057;
    stim[8] = 35'h00993dd02;
    stim[9] = 35'h2fadf8145;
    stim[10] = 35'h233058885;
    stim[11] = 35'h07adbd8d0;
    stim[12] = 35'h161e62f41;
    stim[13] = 35'h33633692f;
    stim[14] = 35'h356b4038f;
    stim[15] = 35'h10423b24d;
    stim[16] = 35'h230fa16d4;
    stim[17] = 35'h1e256d2ca;
    stim[18] = 35'h3a4500640;
    stim[19] = 35'h2f01895e9;
    stim[20] = 35'h3fc9727db;
    stim[21] = 35'h3b882f715;
    stim[22] = 35'h30bdb8a42;
    stim[23] = 35'h32896cf7a;
    stim[24] = 35'h29135d80a;
    stim[25] = 35'h11fcd9d7b;
    stim[26] = 35'h0676ade0c;
    stim[27] = 35'h0bc9e8ef0;
    stim[28] = 35'h180d369b9;
    stim[29] = 35'h1cb1d3fe6;
    stim[30] = 35'h26ae4331e;
    stim[31] = 35'h2f8dc47cc;
    stim[32] = 35'h0db3e3130;
    stim[33] = 35'h2f24e489f;
    stim[34] = 35'h0c206ee88;
    stim[35] = 35'h30377615d;
    stim[36] = 35'h342fdc600;
    stim[37] = 35'h240540c4f;
    stim[38] = 35'h36394e5ab;
    stim[39] = 35'h2f7a7bce1;
    stim[40] = 35'h390d8da5c;
    stim[41] = 35'h3d2368d70;
    stim[42] = 35'h24adac210;
    stim[43] = 35'h1374058cc;
    stim[44] = 35'h3da3b4215;
    stim[45] = 35'h14dafbe96;
    stim[46] = 35'h248cbf965;
    stim[47] = 35'h1617efd9b;
    stim[48] = 35'h2a714a10e;
    stim[49] = 35'h3b60cf534;
    stim[50] = 35'h34d116c5e;
    stim[51] = 35'h17f930679;
    stim[52] = 35'h1a843a6f7;
    stim[53] = 35'h210476cc5;
    stim[54] = 35'h1213f58b5;
    stim[55] = 35'h2fb2f0ce3;
    stim[56] = 35'h3a8a8e613;
    stim[57] = 35'h03b58dc0c;
    stim[58] = 35'h197430789;
    stim[59] = 35'h3d371467b;
    stim[60] = 35'h02171ea7a;
    stim[61] = 35'h489398b06;
    stim[62] = 35'h156db393f;
    stim[63] = 35'h35d3858eb;
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
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
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
