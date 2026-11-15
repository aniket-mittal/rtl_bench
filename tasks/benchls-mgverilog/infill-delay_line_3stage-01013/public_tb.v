// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01013 dut (
    .clk(clk),
    .wen(in_vec[8:8]),
    .din(in_vec[7:0]),
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
    stim[0] = 9'h05b;
    stim[1] = 9'h0cb;
    stim[2] = 9'h1af;
    stim[3] = 9'h12e;
    stim[4] = 9'h1de;
    stim[5] = 9'h197;
    stim[6] = 9'h116;
    stim[7] = 9'h0a0;
    stim[8] = 9'h086;
    stim[9] = 9'h1b8;
    stim[10] = 9'h1a0;
    stim[11] = 9'h085;
    stim[12] = 9'h00b;
    stim[13] = 9'h117;
    stim[14] = 9'h061;
    stim[15] = 9'h0d8;
    stim[16] = 9'h10b;
    stim[17] = 9'h0b4;
    stim[18] = 9'h17d;
    stim[19] = 9'h18f;
    stim[20] = 9'h1ab;
    stim[21] = 9'h0fd;
    stim[22] = 9'h1e6;
    stim[23] = 9'h0d1;
    stim[24] = 9'h0bc;
    stim[25] = 9'h165;
    stim[26] = 9'h031;
    stim[27] = 9'h0bd;
    stim[28] = 9'h0f8;
    stim[29] = 9'h1f9;
    stim[30] = 9'h048;
    stim[31] = 9'h1e3;
    stim[32] = 9'h121;
    stim[33] = 9'h107;
    stim[34] = 9'h10a;
    stim[35] = 9'h00f;
    stim[36] = 9'h153;
    stim[37] = 9'h121;
    stim[38] = 9'h012;
    stim[39] = 9'h173;
    stim[40] = 9'h0eb;
    stim[41] = 9'h1e3;
    stim[42] = 9'h08a;
    stim[43] = 9'h169;
    stim[44] = 9'h133;
    stim[45] = 9'h1fd;
    stim[46] = 9'h0a7;
    stim[47] = 9'h048;
    stim[48] = 9'h073;
    stim[49] = 9'h1fb;
    stim[50] = 9'h1d8;
    stim[51] = 9'h03e;
    stim[52] = 9'h084;
    stim[53] = 9'h14b;
    stim[54] = 9'h0d2;
    stim[55] = 9'h1ee;
    stim[56] = 9'h0df;
    stim[57] = 9'h028;
    stim[58] = 9'h17d;
    stim[59] = 9'h151;
    stim[60] = 9'h1d7;
    stim[61] = 9'h199;
    stim[62] = 9'h06d;
    stim[63] = 9'h0bd;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'haf;
      expv[6] = 8'h2e;
      expv[7] = 8'hde;
      expv[8] = 8'hde;
      expv[9] = 8'hde;
      expv[10] = 8'h97;
      expv[11] = 8'h16;
      expv[12] = 8'h16;
      expv[13] = 8'h16;
      expv[14] = 8'hb8;
      expv[15] = 8'hb8;
      expv[16] = 8'hb8;
      expv[17] = 8'ha0;
      expv[18] = 8'ha0;
      expv[19] = 8'h17;
      expv[20] = 8'h0b;
      expv[21] = 8'h7d;
      expv[22] = 8'h7d;
      expv[23] = 8'h8f;
      expv[24] = 8'h8f;
      expv[25] = 8'h8f;
      expv[26] = 8'hab;
      expv[27] = 8'hab;
      expv[28] = 8'hab;
      expv[29] = 8'hab;
      expv[30] = 8'he6;
      expv[31] = 8'he6;
      expv[32] = 8'h65;
      expv[33] = 8'hf9;
      expv[34] = 8'he3;
      expv[35] = 8'h21;
      expv[36] = 8'h21;
      expv[37] = 8'h07;
      expv[38] = 8'h0a;
      expv[39] = 8'h0a;
      expv[40] = 8'h53;
      expv[41] = 8'h53;
      expv[42] = 8'h21;
      expv[43] = 8'h21;
      expv[44] = 8'h73;
      expv[45] = 8'he3;
      expv[46] = 8'h69;
      expv[47] = 8'h69;
      expv[48] = 8'h69;
      expv[49] = 8'h69;
      expv[50] = 8'h33;
      expv[51] = 8'hfd;
      expv[52] = 8'hfd;
      expv[53] = 8'hfd;
      expv[54] = 8'hfb;
      expv[55] = 8'hfb;
      expv[56] = 8'hd8;
      expv[57] = 8'hd8;
      expv[58] = 8'hd8;
      expv[59] = 8'h4b;
      expv[60] = 8'hee;
      expv[61] = 8'h7d;
      expv[62] = 8'h51;
      expv[63] = 8'h51;
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
