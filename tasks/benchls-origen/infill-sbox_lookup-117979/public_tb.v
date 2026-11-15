// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_117979 dut (
    .in_6bit(in_vec[5:0]),
    .out_4bit(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h15;
    stim[1] = 6'h0f;
    stim[2] = 6'h26;
    stim[3] = 6'h3e;
    stim[4] = 6'h1d;
    stim[5] = 6'h00;
    stim[6] = 6'h24;
    stim[7] = 6'h26;
    stim[8] = 6'h0c;
    stim[9] = 6'h07;
    stim[10] = 6'h2c;
    stim[11] = 6'h0c;
    stim[12] = 6'h2d;
    stim[13] = 6'h0e;
    stim[14] = 6'h3c;
    stim[15] = 6'h22;
    stim[16] = 6'h27;
    stim[17] = 6'h03;
    stim[18] = 6'h10;
    stim[19] = 6'h17;
    stim[20] = 6'h37;
    stim[21] = 6'h3e;
    stim[22] = 6'h04;
    stim[23] = 6'h03;
    stim[24] = 6'h02;
    stim[25] = 6'h0c;
    stim[26] = 6'h1f;
    stim[27] = 6'h28;
    stim[28] = 6'h25;
    stim[29] = 6'h13;
    stim[30] = 6'h2a;
    stim[31] = 6'h29;
    stim[32] = 6'h0f;
    stim[33] = 6'h20;
    stim[34] = 6'h0d;
    stim[35] = 6'h04;
    stim[36] = 6'h16;
    stim[37] = 6'h00;
    stim[38] = 6'h35;
    stim[39] = 6'h24;
    stim[40] = 6'h39;
    stim[41] = 6'h25;
    stim[42] = 6'h0d;
    stim[43] = 6'h18;
    stim[44] = 6'h34;
    stim[45] = 6'h0b;
    stim[46] = 6'h06;
    stim[47] = 6'h28;
    stim[48] = 6'h1f;
    stim[49] = 6'h01;
    stim[50] = 6'h2c;
    stim[51] = 6'h3b;
    stim[52] = 6'h39;
    stim[53] = 6'h2e;
    stim[54] = 6'h1c;
    stim[55] = 6'h31;
    stim[56] = 6'h28;
    stim[57] = 6'h25;
    stim[58] = 6'h37;
    stim[59] = 6'h2d;
    stim[60] = 6'h24;
    stim[61] = 6'h09;
    stim[62] = 6'h0b;
    stim[63] = 6'h24;
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
      expv[0] = 4'h1;
      expv[1] = 4'he;
      expv[2] = 4'hb;
      expv[3] = 4'hf;
      expv[4] = 4'hb;
      expv[5] = 4'hf;
      expv[6] = 4'h7;
      expv[7] = 4'hb;
      expv[8] = 4'h3;
      expv[9] = 4'h7;
      expv[10] = 4'hd;
      expv[11] = 4'h3;
      expv[12] = 4'h4;
      expv[13] = 4'h4;
      expv[14] = 4'h2;
      expv[15] = 4'he;
      expv[16] = 4'h1;
      expv[17] = 4'hd;
      expv[18] = 4'h9;
      expv[19] = 4'ha;
      expv[20] = 4'hc;
      expv[21] = 4'hf;
      expv[22] = 4'h8;
      expv[23] = 4'hd;
      expv[24] = 4'h1;
      expv[25] = 4'h3;
      expv[26] = 4'h5;
      expv[27] = 4'ha;
      expv[28] = 4'ha;
      expv[29] = 4'h0;
      expv[30] = 4'h4;
      expv[31] = 4'h3;
      expv[32] = 4'he;
      expv[33] = 4'h0;
      expv[34] = 4'h8;
      expv[35] = 4'h8;
      expv[36] = 4'hd;
      expv[37] = 4'hf;
      expv[38] = 4'h7;
      expv[39] = 4'h7;
      expv[40] = 4'h0;
      expv[41] = 4'ha;
      expv[42] = 4'h8;
      expv[43] = 4'hc;
      expv[44] = 4'hc;
      expv[45] = 4'h2;
      expv[46] = 4'he;
      expv[47] = 4'ha;
      expv[48] = 4'h5;
      expv[49] = 4'h3;
      expv[50] = 4'hd;
      expv[51] = 4'h5;
      expv[52] = 4'h0;
      expv[53] = 4'h1;
      expv[54] = 4'h5;
      expv[55] = 4'hb;
      expv[56] = 4'ha;
      expv[57] = 4'ha;
      expv[58] = 4'hc;
      expv[59] = 4'h4;
      expv[60] = 4'h7;
      expv[61] = 4'hf;
      expv[62] = 4'h2;
      expv[63] = 4'h7;
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
