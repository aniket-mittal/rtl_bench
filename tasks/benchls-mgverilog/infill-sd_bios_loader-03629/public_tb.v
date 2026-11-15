// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03629 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .readdata(in_vec[32:1]),
    .waitrequest(in_vec[0:0]),
    .address(out_vec[65:38]),
    .byteenable(out_vec[37:34]),
    .write(out_vec[33:33]),
    .writedata(out_vec[32:1]),
    .read(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3c9c1d629;
    stim[1] = 34'h2d53765d9;
    stim[2] = 34'h099019aeb;
    stim[3] = 34'h0a87b7d2c;
    stim[4] = 34'h10fa912fd;
    stim[5] = 34'h020832460;
    stim[6] = 34'h14ee8c0aa;
    stim[7] = 34'h1ee55ec8d;
    stim[8] = 34'h0b4574d27;
    stim[9] = 34'h00115246b;
    stim[10] = 34'h140024474;
    stim[11] = 34'h118d5b4a6;
    stim[12] = 34'h1957c2b52;
    stim[13] = 34'h093870bc9;
    stim[14] = 34'h10ee46323;
    stim[15] = 34'h03ba15c93;
    stim[16] = 34'h1d20aadd4;
    stim[17] = 34'h161eb1d44;
    stim[18] = 34'h0c261fc90;
    stim[19] = 34'h0f3cff711;
    stim[20] = 34'h112916ef0;
    stim[21] = 34'h147ef8e14;
    stim[22] = 34'h0ff3389aa;
    stim[23] = 34'h18a37565c;
    stim[24] = 34'h013fe1384;
    stim[25] = 34'h1f650a8da;
    stim[26] = 34'h047fcbc06;
    stim[27] = 34'h16ac3733c;
    stim[28] = 34'h1c242aa19;
    stim[29] = 34'h091149bd2;
    stim[30] = 34'h13f2ce412;
    stim[31] = 34'h074cf0d5f;
    stim[32] = 34'h1f8529af9;
    stim[33] = 34'h0740a3ae6;
    stim[34] = 34'h0dac91a5b;
    stim[35] = 34'h1da077c2e;
    stim[36] = 34'h0e57887e7;
    stim[37] = 34'h0a6f91a55;
    stim[38] = 34'h083bc366c;
    stim[39] = 34'h17f308847;
    stim[40] = 34'h0a0682f0f;
    stim[41] = 34'h191a50688;
    stim[42] = 34'h0e2b58167;
    stim[43] = 34'h0e8441b8d;
    stim[44] = 34'h0f0a4c9ef;
    stim[45] = 34'h05a489a8f;
    stim[46] = 34'h09a8f915f;
    stim[47] = 34'h047b08465;
    stim[48] = 34'h167dcf68b;
    stim[49] = 34'h18d13d0d3;
    stim[50] = 34'h0b41cfcd9;
    stim[51] = 34'h011796cb0;
    stim[52] = 34'h0469ce229;
    stim[53] = 34'h098f12ad2;
    stim[54] = 34'h0d8e6d825;
    stim[55] = 34'h00dcb97aa;
    stim[56] = 34'h1f08fda9f;
    stim[57] = 34'h0cafc5d8a;
    stim[58] = 34'h107e7da34;
    stim[59] = 34'h14a42a56f;
    stim[60] = 34'h1d3fb1cc3;
    stim[61] = 34'h1a803e87e;
    stim[62] = 34'h03f074415;
    stim[63] = 34'h05aaab43d;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'h00000000000000000;
      expv[2] = 66'h00000000000000000;
      expv[3] = 66'h00000000000000000;
      expv[4] = 66'h00000000000000000;
      expv[5] = 66'h00000000000000000;
      expv[6] = 66'h00000000000000000;
      expv[7] = 66'h00000000000000000;
      expv[8] = 66'h00000000000000000;
      expv[9] = 66'h00000000000000000;
      expv[10] = 66'h00000000000000000;
      expv[11] = 66'h00000000000000000;
      expv[12] = 66'h00000000000000000;
      expv[13] = 66'h00000000000000000;
      expv[14] = 66'h00000000000000000;
      expv[15] = 66'h00000000000000000;
      expv[16] = 66'h00000000000000000;
      expv[17] = 66'h00000000000000000;
      expv[18] = 66'h00000000000000000;
      expv[19] = 66'h00000000000000000;
      expv[20] = 66'h00000000000000000;
      expv[21] = 66'h00000000000000000;
      expv[22] = 66'h00000000000000000;
      expv[23] = 66'h00000000000000000;
      expv[24] = 66'h00000000000000000;
      expv[25] = 66'h00000000000000000;
      expv[26] = 66'h00000000000000000;
      expv[27] = 66'h00000000000000000;
      expv[28] = 66'h00000000000000000;
      expv[29] = 66'h00000000000000000;
      expv[30] = 66'h00000000000000000;
      expv[31] = 66'h00000000000000000;
      expv[32] = 66'h00000000000000000;
      expv[33] = 66'h00000000000000000;
      expv[34] = 66'h00000000000000000;
      expv[35] = 66'h00000000000000000;
      expv[36] = 66'h00000000000000000;
      expv[37] = 66'h00000000000000000;
      expv[38] = 66'h00000000000000000;
      expv[39] = 66'h00000000000000000;
      expv[40] = 66'h00000000000000000;
      expv[41] = 66'h00000000000000000;
      expv[42] = 66'h00000000000000000;
      expv[43] = 66'h00000000000000000;
      expv[44] = 66'h00000000000000000;
      expv[45] = 66'h00000000000000000;
      expv[46] = 66'h00000000000000000;
      expv[47] = 66'h00000000000000000;
      expv[48] = 66'h00000000000000000;
      expv[49] = 66'h00000000000000000;
      expv[50] = 66'h00000000000000000;
      expv[51] = 66'h00000000000000000;
      expv[52] = 66'h00000000000000000;
      expv[53] = 66'h00000000000000000;
      expv[54] = 66'h00000000000000000;
      expv[55] = 66'h00000000000000000;
      expv[56] = 66'h00000000000000000;
      expv[57] = 66'h00000000000000000;
      expv[58] = 66'h00000000000000000;
      expv[59] = 66'h00000000000000000;
      expv[60] = 66'h00000000000000000;
      expv[61] = 66'h00000000000000000;
      expv[62] = 66'h00000000000000000;
      expv[63] = 66'h00000000000000000;
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
