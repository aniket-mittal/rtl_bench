// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02325 dut (
    .d(in_vec[4:1]),
    .en(in_vec[0:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0a;
    stim[1] = 5'h1e;
    stim[2] = 5'h10;
    stim[3] = 5'h1f;
    stim[4] = 5'h07;
    stim[5] = 5'h12;
    stim[6] = 5'h04;
    stim[7] = 5'h15;
    stim[8] = 5'h19;
    stim[9] = 5'h14;
    stim[10] = 5'h13;
    stim[11] = 5'h06;
    stim[12] = 5'h0f;
    stim[13] = 5'h00;
    stim[14] = 5'h0d;
    stim[15] = 5'h02;
    stim[16] = 5'h01;
    stim[17] = 5'h06;
    stim[18] = 5'h0c;
    stim[19] = 5'h01;
    stim[20] = 5'h17;
    stim[21] = 5'h00;
    stim[22] = 5'h07;
    stim[23] = 5'h08;
    stim[24] = 5'h19;
    stim[25] = 5'h0f;
    stim[26] = 5'h0c;
    stim[27] = 5'h12;
    stim[28] = 5'h07;
    stim[29] = 5'h03;
    stim[30] = 5'h0b;
    stim[31] = 5'h19;
    stim[32] = 5'h02;
    stim[33] = 5'h0a;
    stim[34] = 5'h00;
    stim[35] = 5'h11;
    stim[36] = 5'h1a;
    stim[37] = 5'h08;
    stim[38] = 5'h03;
    stim[39] = 5'h0a;
    stim[40] = 5'h10;
    stim[41] = 5'h0f;
    stim[42] = 5'h08;
    stim[43] = 5'h02;
    stim[44] = 5'h1d;
    stim[45] = 5'h04;
    stim[46] = 5'h1c;
    stim[47] = 5'h1e;
    stim[48] = 5'h1c;
    stim[49] = 5'h19;
    stim[50] = 5'h0c;
    stim[51] = 5'h1a;
    stim[52] = 5'h09;
    stim[53] = 5'h04;
    stim[54] = 5'h1d;
    stim[55] = 5'h0b;
    stim[56] = 5'h14;
    stim[57] = 5'h07;
    stim[58] = 5'h0f;
    stim[59] = 5'h0b;
    stim[60] = 5'h1c;
    stim[61] = 5'h05;
    stim[62] = 5'h0a;
    stim[63] = 5'h11;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hf;
      expv[4] = 4'h3;
      expv[5] = 4'h3;
      expv[6] = 4'h3;
      expv[7] = 4'ha;
      expv[8] = 4'hc;
      expv[9] = 4'hc;
      expv[10] = 4'h9;
      expv[11] = 4'h9;
      expv[12] = 4'h7;
      expv[13] = 4'h7;
      expv[14] = 4'h6;
      expv[15] = 4'h6;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'hb;
      expv[21] = 4'hb;
      expv[22] = 4'h3;
      expv[23] = 4'h3;
      expv[24] = 4'hc;
      expv[25] = 4'h7;
      expv[26] = 4'h7;
      expv[27] = 4'h7;
      expv[28] = 4'h3;
      expv[29] = 4'h1;
      expv[30] = 4'h5;
      expv[31] = 4'hc;
      expv[32] = 4'hc;
      expv[33] = 4'hc;
      expv[34] = 4'hc;
      expv[35] = 4'h8;
      expv[36] = 4'h8;
      expv[37] = 4'h8;
      expv[38] = 4'h1;
      expv[39] = 4'h1;
      expv[40] = 4'h1;
      expv[41] = 4'h7;
      expv[42] = 4'h7;
      expv[43] = 4'h7;
      expv[44] = 4'he;
      expv[45] = 4'he;
      expv[46] = 4'he;
      expv[47] = 4'he;
      expv[48] = 4'he;
      expv[49] = 4'hc;
      expv[50] = 4'hc;
      expv[51] = 4'hc;
      expv[52] = 4'h4;
      expv[53] = 4'h4;
      expv[54] = 4'he;
      expv[55] = 4'h5;
      expv[56] = 4'h5;
      expv[57] = 4'h3;
      expv[58] = 4'h7;
      expv[59] = 4'h5;
      expv[60] = 4'h5;
      expv[61] = 4'h2;
      expv[62] = 4'h2;
      expv[63] = 4'h8;
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
