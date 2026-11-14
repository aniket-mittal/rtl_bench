// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h06577;
    stim[1] = 17'h15d66;
    stim[2] = 17'h1f6c9;
    stim[3] = 17'h0da71;
    stim[4] = 17'h0d655;
    stim[5] = 17'h0d8f1;
    stim[6] = 17'h05238;
    stim[7] = 17'h17d79;
    stim[8] = 17'h16aea;
    stim[9] = 17'h14ebe;
    stim[10] = 17'h16d5b;
    stim[11] = 17'h04eb3;
    stim[12] = 17'h0dd2e;
    stim[13] = 17'h1c926;
    stim[14] = 17'h11397;
    stim[15] = 17'h0c721;
    stim[16] = 17'h0e388;
    stim[17] = 17'h12dc2;
    stim[18] = 17'h1e146;
    stim[19] = 17'h05399;
    stim[20] = 17'h0ff75;
    stim[21] = 17'h06801;
    stim[22] = 17'h0d971;
    stim[23] = 17'h16c2b;
    stim[24] = 17'h0fd50;
    stim[25] = 17'h0480e;
    stim[26] = 17'h180ac;
    stim[27] = 17'h0eb80;
    stim[28] = 17'h16b78;
    stim[29] = 17'h1b161;
    stim[30] = 17'h1113c;
    stim[31] = 17'h1e17e;
    stim[32] = 17'h101ec;
    stim[33] = 17'h1fe2f;
    stim[34] = 17'h1e714;
    stim[35] = 17'h14df5;
    stim[36] = 17'h14737;
    stim[37] = 17'h18800;
    stim[38] = 17'h1c858;
    stim[39] = 17'h1bc4a;
    stim[40] = 17'h14783;
    stim[41] = 17'h02579;
    stim[42] = 17'h1df72;
    stim[43] = 17'h0c736;
    stim[44] = 17'h153ab;
    stim[45] = 17'h01ae1;
    stim[46] = 17'h035b5;
    stim[47] = 17'h1e078;
    stim[48] = 17'h0008c;
    stim[49] = 17'h171ee;
    stim[50] = 17'h126ba;
    stim[51] = 17'h1587c;
    stim[52] = 17'h1942d;
    stim[53] = 17'h1d95a;
    stim[54] = 17'h1dfbc;
    stim[55] = 17'h09919;
    stim[56] = 17'h12f94;
    stim[57] = 17'h01ef7;
    stim[58] = 17'h080ca;
    stim[59] = 17'h16c26;
    stim[60] = 17'h1e33f;
    stim[61] = 17'h1f6c9;
    stim[62] = 17'h01d84;
    stim[63] = 17'h0a545;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h77;
      expv[1] = 8'hba;
      expv[2] = 8'h6f;
      expv[3] = 8'h71;
      expv[4] = 8'h55;
      expv[5] = 8'hf1;
      expv[6] = 8'h38;
      expv[7] = 8'hbe;
      expv[8] = 8'h56;
      expv[9] = 8'h72;
      expv[10] = 8'hb6;
      expv[11] = 8'hb3;
      expv[12] = 8'h2e;
      expv[13] = 8'h93;
      expv[14] = 8'hc8;
      expv[15] = 8'h21;
      expv[16] = 8'h88;
      expv[17] = 8'hb4;
      expv[18] = 8'h87;
      expv[19] = 8'h99;
      expv[20] = 8'h75;
      expv[21] = 8'h01;
      expv[22] = 8'h71;
      expv[23] = 8'h36;
      expv[24] = 8'h50;
      expv[25] = 8'h0e;
      expv[26] = 8'h01;
      expv[27] = 8'h80;
      expv[28] = 8'hd6;
      expv[29] = 8'h8d;
      expv[30] = 8'h88;
      expv[31] = 8'h87;
      expv[32] = 8'h80;
      expv[33] = 8'h7f;
      expv[34] = 8'he7;
      expv[35] = 8'hb2;
      expv[36] = 8'he2;
      expv[37] = 8'h11;
      expv[38] = 8'h13;
      expv[39] = 8'h3d;
      expv[40] = 8'he2;
      expv[41] = 8'h79;
      expv[42] = 8'hfb;
      expv[43] = 8'h36;
      expv[44] = 8'hca;
      expv[45] = 8'he1;
      expv[46] = 8'hb5;
      expv[47] = 8'h07;
      expv[48] = 8'h8c;
      expv[49] = 8'h8e;
      expv[50] = 8'h64;
      expv[51] = 8'h1a;
      expv[52] = 8'h29;
      expv[53] = 8'h9b;
      expv[54] = 8'hfb;
      expv[55] = 8'h19;
      expv[56] = 8'hf4;
      expv[57] = 8'hf7;
      expv[58] = 8'hca;
      expv[59] = 8'h36;
      expv[60] = 8'hc7;
      expv[61] = 8'h6f;
      expv[62] = 8'h84;
      expv[63] = 8'h45;
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
