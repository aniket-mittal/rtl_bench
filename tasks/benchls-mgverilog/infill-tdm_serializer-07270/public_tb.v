// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07270 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .tdmfrm(in_vec[9:9]),
    .tdmrx(in_vec[8:8]),
    .din(in_vec[7:0]),
    .tdmtx(out_vec[8:8]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h493;
    stim[1] = 11'h64f;
    stim[2] = 11'h2d8;
    stim[3] = 11'h2ef;
    stim[4] = 11'h0bc;
    stim[5] = 11'h3a4;
    stim[6] = 11'h2d5;
    stim[7] = 11'h051;
    stim[8] = 11'h3dc;
    stim[9] = 11'h3a2;
    stim[10] = 11'h05e;
    stim[11] = 11'h229;
    stim[12] = 11'h07e;
    stim[13] = 11'h2a6;
    stim[14] = 11'h2c5;
    stim[15] = 11'h18c;
    stim[16] = 11'h328;
    stim[17] = 11'h0f9;
    stim[18] = 11'h1c4;
    stim[19] = 11'h3c2;
    stim[20] = 11'h08f;
    stim[21] = 11'h310;
    stim[22] = 11'h124;
    stim[23] = 11'h3f8;
    stim[24] = 11'h0c0;
    stim[25] = 11'h3c2;
    stim[26] = 11'h1f8;
    stim[27] = 11'h17f;
    stim[28] = 11'h18c;
    stim[29] = 11'h136;
    stim[30] = 11'h18b;
    stim[31] = 11'h69a;
    stim[32] = 11'h33e;
    stim[33] = 11'h3fe;
    stim[34] = 11'h058;
    stim[35] = 11'h0ac;
    stim[36] = 11'h356;
    stim[37] = 11'h1fb;
    stim[38] = 11'h107;
    stim[39] = 11'h67a;
    stim[40] = 11'h3d7;
    stim[41] = 11'h286;
    stim[42] = 11'h396;
    stim[43] = 11'h28f;
    stim[44] = 11'h3ed;
    stim[45] = 11'h161;
    stim[46] = 11'h113;
    stim[47] = 11'h3e6;
    stim[48] = 11'h161;
    stim[49] = 11'h306;
    stim[50] = 11'h1af;
    stim[51] = 11'h023;
    stim[52] = 11'h175;
    stim[53] = 11'h339;
    stim[54] = 11'h2c8;
    stim[55] = 11'h1e8;
    stim[56] = 11'h1f1;
    stim[57] = 11'h330;
    stim[58] = 11'h3a2;
    stim[59] = 11'h0f2;
    stim[60] = 11'h16f;
    stim[61] = 11'h0bf;
    stim[62] = 11'h026;
    stim[63] = 11'h2e7;
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
      expv[0] = 9'h100;
      expv[1] = 9'h100;
      expv[2] = 9'h000;
      expv[3] = 9'h100;
      expv[4] = 9'h000;
      expv[5] = 9'h100;
      expv[6] = 9'h004;
      expv[7] = 9'h004;
      expv[8] = 9'h104;
      expv[9] = 9'h104;
      expv[10] = 9'h106;
      expv[11] = 9'h004;
      expv[12] = 9'h100;
      expv[13] = 9'h100;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h002;
      expv[17] = 9'h006;
      expv[18] = 9'h104;
      expv[19] = 9'h004;
      expv[20] = 9'h10c;
      expv[21] = 9'h00c;
      expv[22] = 9'h00c;
      expv[23] = 9'h00e;
      expv[24] = 9'h00e;
      expv[25] = 9'h00c;
      expv[26] = 9'h00c;
      expv[27] = 9'h10e;
      expv[28] = 9'h10e;
      expv[29] = 9'h10e;
      expv[30] = 9'h01e;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h101;
      expv[34] = 9'h003;
      expv[35] = 9'h101;
      expv[36] = 9'h001;
      expv[37] = 9'h109;
      expv[38] = 9'h10b;
      expv[39] = 9'h000;
      expv[40] = 9'h100;
      expv[41] = 9'h101;
      expv[42] = 9'h101;
      expv[43] = 9'h103;
      expv[44] = 9'h001;
      expv[45] = 9'h003;
      expv[46] = 9'h003;
      expv[47] = 9'h007;
      expv[48] = 9'h00f;
      expv[49] = 9'h10f;
      expv[50] = 9'h10f;
      expv[51] = 9'h00f;
      expv[52] = 9'h00b;
      expv[53] = 9'h10b;
      expv[54] = 9'h01b;
      expv[55] = 9'h019;
      expv[56] = 9'h01b;
      expv[57] = 9'h01f;
      expv[58] = 9'h11f;
      expv[59] = 9'h11f;
      expv[60] = 9'h11d;
      expv[61] = 9'h11d;
      expv[62] = 9'h015;
      expv[63] = 9'h105;
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
