// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00364 dut (
    .din_a(in_vec[11:8]),
    .din_b(in_vec[7:4]),
    .din_c(in_vec[3:0]),
    .dout(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h13c;
    stim[1] = 12'hf76;
    stim[2] = 12'hbd3;
    stim[3] = 12'haad;
    stim[4] = 12'h657;
    stim[5] = 12'h074;
    stim[6] = 12'h7dc;
    stim[7] = 12'h890;
    stim[8] = 12'h941;
    stim[9] = 12'haaf;
    stim[10] = 12'h75a;
    stim[11] = 12'h7be;
    stim[12] = 12'h17d;
    stim[13] = 12'he80;
    stim[14] = 12'h3d2;
    stim[15] = 12'he28;
    stim[16] = 12'haf2;
    stim[17] = 12'hfff;
    stim[18] = 12'h9a9;
    stim[19] = 12'h235;
    stim[20] = 12'h65b;
    stim[21] = 12'h080;
    stim[22] = 12'h573;
    stim[23] = 12'h79b;
    stim[24] = 12'hc19;
    stim[25] = 12'h20e;
    stim[26] = 12'hd02;
    stim[27] = 12'h599;
    stim[28] = 12'h184;
    stim[29] = 12'hc9e;
    stim[30] = 12'he66;
    stim[31] = 12'h004;
    stim[32] = 12'h06d;
    stim[33] = 12'hee1;
    stim[34] = 12'h73d;
    stim[35] = 12'h41e;
    stim[36] = 12'hcc3;
    stim[37] = 12'h33f;
    stim[38] = 12'h2c3;
    stim[39] = 12'h0e4;
    stim[40] = 12'hf39;
    stim[41] = 12'h0dd;
    stim[42] = 12'h972;
    stim[43] = 12'hcae;
    stim[44] = 12'hb5f;
    stim[45] = 12'h634;
    stim[46] = 12'h311;
    stim[47] = 12'h179;
    stim[48] = 12'ha22;
    stim[49] = 12'h2e6;
    stim[50] = 12'h71b;
    stim[51] = 12'ha8a;
    stim[52] = 12'he01;
    stim[53] = 12'hc55;
    stim[54] = 12'h572;
    stim[55] = 12'hbc6;
    stim[56] = 12'hfcb;
    stim[57] = 12'hafc;
    stim[58] = 12'h83b;
    stim[59] = 12'h54e;
    stim[60] = 12'h849;
    stim[61] = 12'hb11;
    stim[62] = 12'ha9d;
    stim[63] = 12'h9bf;
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
      expv[0] = 4'h4;
      expv[1] = 4'h6;
      expv[2] = 4'h8;
      expv[3] = 4'h4;
      expv[4] = 4'hb;
      expv[5] = 4'h7;
      expv[6] = 4'h4;
      expv[7] = 4'h1;
      expv[8] = 4'hd;
      expv[9] = 4'h4;
      expv[10] = 4'hc;
      expv[11] = 4'h2;
      expv[12] = 4'h8;
      expv[13] = 4'h6;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h9;
      expv[17] = 4'he;
      expv[18] = 4'h3;
      expv[19] = 4'h5;
      expv[20] = 4'hb;
      expv[21] = 4'h8;
      expv[22] = 4'hc;
      expv[23] = 4'h0;
      expv[24] = 4'hd;
      expv[25] = 4'h2;
      expv[26] = 4'hd;
      expv[27] = 4'he;
      expv[28] = 4'h9;
      expv[29] = 4'h5;
      expv[30] = 4'h4;
      expv[31] = 4'h0;
      expv[32] = 4'h6;
      expv[33] = 4'hc;
      expv[34] = 4'ha;
      expv[35] = 4'h5;
      expv[36] = 4'h8;
      expv[37] = 4'h6;
      expv[38] = 4'he;
      expv[39] = 4'he;
      expv[40] = 4'h2;
      expv[41] = 4'hd;
      expv[42] = 4'h0;
      expv[43] = 4'h6;
      expv[44] = 4'h0;
      expv[45] = 4'h9;
      expv[46] = 4'h4;
      expv[47] = 4'h8;
      expv[48] = 4'hc;
      expv[49] = 4'h0;
      expv[50] = 4'h8;
      expv[51] = 4'h2;
      expv[52] = 4'he;
      expv[53] = 4'h1;
      expv[54] = 4'hc;
      expv[55] = 4'h7;
      expv[56] = 4'hb;
      expv[57] = 4'h9;
      expv[58] = 4'hb;
      expv[59] = 4'h9;
      expv[60] = 4'hc;
      expv[61] = 4'hc;
      expv[62] = 4'h3;
      expv[63] = 4'h4;
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
