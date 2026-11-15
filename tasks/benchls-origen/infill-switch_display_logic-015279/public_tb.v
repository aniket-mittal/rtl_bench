// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015279 dut (
    .SW(in_vec[3:0]),
    .LEDR(out_vec[19:16]),
    .LEDG(out_vec[15:14]),
    .HEX0(out_vec[13:7]),
    .HEX1(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h0;
    stim[1] = 4'h7;
    stim[2] = 4'ha;
    stim[3] = 4'h8;
    stim[4] = 4'h7;
    stim[5] = 4'h7;
    stim[6] = 4'hb;
    stim[7] = 4'hf;
    stim[8] = 4'he;
    stim[9] = 4'hd;
    stim[10] = 4'h6;
    stim[11] = 4'h8;
    stim[12] = 4'h7;
    stim[13] = 4'ha;
    stim[14] = 4'h2;
    stim[15] = 4'he;
    stim[16] = 4'he;
    stim[17] = 4'h8;
    stim[18] = 4'h3;
    stim[19] = 4'h2;
    stim[20] = 4'h7;
    stim[21] = 4'ha;
    stim[22] = 4'h7;
    stim[23] = 4'h1;
    stim[24] = 4'hb;
    stim[25] = 4'hc;
    stim[26] = 4'h2;
    stim[27] = 4'h2;
    stim[28] = 4'h6;
    stim[29] = 4'h8;
    stim[30] = 4'hf;
    stim[31] = 4'h1;
    stim[32] = 4'h9;
    stim[33] = 4'ha;
    stim[34] = 4'he;
    stim[35] = 4'hc;
    stim[36] = 4'h5;
    stim[37] = 4'h4;
    stim[38] = 4'hc;
    stim[39] = 4'h7;
    stim[40] = 4'h7;
    stim[41] = 4'he;
    stim[42] = 4'h6;
    stim[43] = 4'hb;
    stim[44] = 4'he;
    stim[45] = 4'hc;
    stim[46] = 4'h7;
    stim[47] = 4'ha;
    stim[48] = 4'hf;
    stim[49] = 4'h0;
    stim[50] = 4'h8;
    stim[51] = 4'hc;
    stim[52] = 4'h7;
    stim[53] = 4'h1;
    stim[54] = 4'hb;
    stim[55] = 4'hf;
    stim[56] = 4'h9;
    stim[57] = 4'h9;
    stim[58] = 4'hd;
    stim[59] = 4'h5;
    stim[60] = 4'hd;
    stim[61] = 4'h3;
    stim[62] = 4'hb;
    stim[63] = 4'h7;
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
      expv[0] = 20'h02040;
      expv[1] = 20'h73c40;
      expv[2] = 20'ha5279;
      expv[3] = 20'h80040;
      expv[4] = 20'h73c40;
      expv[5] = 20'h73c40;
      expv[6] = 20'hb7cf9;
      expv[7] = 20'hf4979;
      expv[8] = 20'he4179;
      expv[9] = 20'hd7c79;
      expv[10] = 20'h60140;
      expv[11] = 20'h80040;
      expv[12] = 20'h73c40;
      expv[13] = 20'ha5279;
      expv[14] = 20'h21240;
      expv[15] = 20'he4179;
      expv[16] = 20'he4179;
      expv[17] = 20'h80040;
      expv[18] = 20'h31840;
      expv[19] = 20'h21240;
      expv[20] = 20'h73c40;
      expv[21] = 20'ha5279;
      expv[22] = 20'h73c40;
      expv[23] = 20'h13cc0;
      expv[24] = 20'hb7cf9;
      expv[25] = 20'hc6079;
      expv[26] = 20'h21240;
      expv[27] = 20'h21240;
      expv[28] = 20'h60140;
      expv[29] = 20'h80040;
      expv[30] = 20'hf4979;
      expv[31] = 20'h13cc0;
      expv[32] = 20'h90840;
      expv[33] = 20'ha5279;
      expv[34] = 20'he4179;
      expv[35] = 20'hc6079;
      expv[36] = 20'h50940;
      expv[37] = 20'h40cc0;
      expv[38] = 20'hc6079;
      expv[39] = 20'h73c40;
      expv[40] = 20'h73c40;
      expv[41] = 20'he4179;
      expv[42] = 20'h60140;
      expv[43] = 20'hb7cf9;
      expv[44] = 20'he4179;
      expv[45] = 20'hc6079;
      expv[46] = 20'h73c40;
      expv[47] = 20'ha5279;
      expv[48] = 20'hf4979;
      expv[49] = 20'h02040;
      expv[50] = 20'h80040;
      expv[51] = 20'hc6079;
      expv[52] = 20'h73c40;
      expv[53] = 20'h13cc0;
      expv[54] = 20'hb7cf9;
      expv[55] = 20'hf4979;
      expv[56] = 20'h90840;
      expv[57] = 20'h90840;
      expv[58] = 20'hd7c79;
      expv[59] = 20'h50940;
      expv[60] = 20'hd7c79;
      expv[61] = 20'h31840;
      expv[62] = 20'hb7cf9;
      expv[63] = 20'h73c40;
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
