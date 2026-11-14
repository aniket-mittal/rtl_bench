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
    stim[0] = 17'h1a5d1;
    stim[1] = 17'h17348;
    stim[2] = 17'h1795d;
    stim[3] = 17'h022dd;
    stim[4] = 17'h0eb4f;
    stim[5] = 17'h1aa88;
    stim[6] = 17'h0dc0a;
    stim[7] = 17'h0e612;
    stim[8] = 17'h09fe4;
    stim[9] = 17'h13720;
    stim[10] = 17'h13d97;
    stim[11] = 17'h040d5;
    stim[12] = 17'h0b62c;
    stim[13] = 17'h050b1;
    stim[14] = 17'h06609;
    stim[15] = 17'h04797;
    stim[16] = 17'h19baf;
    stim[17] = 17'h15334;
    stim[18] = 17'h0d7af;
    stim[19] = 17'h0ca12;
    stim[20] = 17'h09958;
    stim[21] = 17'h13ab4;
    stim[22] = 17'h0a627;
    stim[23] = 17'h11793;
    stim[24] = 17'h0d5c8;
    stim[25] = 17'h0572a;
    stim[26] = 17'h1a0d7;
    stim[27] = 17'h1e727;
    stim[28] = 17'h1dba1;
    stim[29] = 17'h1f6be;
    stim[30] = 17'h1513e;
    stim[31] = 17'h0dd66;
    stim[32] = 17'h016c1;
    stim[33] = 17'h0f573;
    stim[34] = 17'h0fdc7;
    stim[35] = 17'h1ba3d;
    stim[36] = 17'h14353;
    stim[37] = 17'h0c040;
    stim[38] = 17'h19cc0;
    stim[39] = 17'h098ea;
    stim[40] = 17'h11b2e;
    stim[41] = 17'h0ed6a;
    stim[42] = 17'h06da4;
    stim[43] = 17'h12f95;
    stim[44] = 17'h196a4;
    stim[45] = 17'h0e34a;
    stim[46] = 17'h0be27;
    stim[47] = 17'h11638;
    stim[48] = 17'h0176d;
    stim[49] = 17'h147c7;
    stim[50] = 17'h1580f;
    stim[51] = 17'h1fc00;
    stim[52] = 17'h0baf9;
    stim[53] = 17'h109a5;
    stim[54] = 17'h11990;
    stim[55] = 17'h103fb;
    stim[56] = 17'h1a83c;
    stim[57] = 17'h1c6df;
    stim[58] = 17'h0af2c;
    stim[59] = 17'h0cb32;
    stim[60] = 17'h0178c;
    stim[61] = 17'h1fcd6;
    stim[62] = 17'h1fece;
    stim[63] = 17'h1e90e;
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
      expv[0] = 8'ha5;
      expv[1] = 8'h73;
      expv[2] = 8'h79;
      expv[3] = 8'hdd;
      expv[4] = 8'heb;
      expv[5] = 8'haa;
      expv[6] = 8'h0a;
      expv[7] = 8'h12;
      expv[8] = 8'h9f;
      expv[9] = 8'h37;
      expv[10] = 8'h3d;
      expv[11] = 8'hd5;
      expv[12] = 8'h2c;
      expv[13] = 8'hb1;
      expv[14] = 8'h09;
      expv[15] = 8'h47;
      expv[16] = 8'h9b;
      expv[17] = 8'h53;
      expv[18] = 8'hd7;
      expv[19] = 8'h12;
      expv[20] = 8'h99;
      expv[21] = 8'h3a;
      expv[22] = 8'h27;
      expv[23] = 8'h17;
      expv[24] = 8'hd5;
      expv[25] = 8'h57;
      expv[26] = 8'ha0;
      expv[27] = 8'he7;
      expv[28] = 8'hdb;
      expv[29] = 8'hf6;
      expv[30] = 8'h51;
      expv[31] = 8'hdd;
      expv[32] = 8'hc1;
      expv[33] = 8'hf5;
      expv[34] = 8'hfd;
      expv[35] = 8'hba;
      expv[36] = 8'h43;
      expv[37] = 8'h40;
      expv[38] = 8'h9c;
      expv[39] = 8'hea;
      expv[40] = 8'h1b;
      expv[41] = 8'hed;
      expv[42] = 8'h6d;
      expv[43] = 8'h2f;
      expv[44] = 8'h96;
      expv[45] = 8'he3;
      expv[46] = 8'h27;
      expv[47] = 8'h16;
      expv[48] = 8'h17;
      expv[49] = 8'h47;
      expv[50] = 8'h58;
      expv[51] = 8'hfc;
      expv[52] = 8'hf9;
      expv[53] = 8'h09;
      expv[54] = 8'h19;
      expv[55] = 8'h03;
      expv[56] = 8'ha8;
      expv[57] = 8'hc6;
      expv[58] = 8'haf;
      expv[59] = 8'hcb;
      expv[60] = 8'h17;
      expv[61] = 8'hfc;
      expv[62] = 8'hfe;
      expv[63] = 8'he9;
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
