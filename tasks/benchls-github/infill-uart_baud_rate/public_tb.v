// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  uart_baud_rate dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .baud_division(in_vec[32:1]),
    .en(in_vec[0:0]),
    .baud_tick(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h27a488d99;
    stim[1] = 34'h3b36264a8;
    stim[2] = 34'h1359c8680;
    stim[3] = 34'h0f4060263;
    stim[4] = 34'h0736e0147;
    stim[5] = 34'h013b2709e;
    stim[6] = 34'h128afc3b6;
    stim[7] = 34'h159d6944b;
    stim[8] = 34'h16cb50b1b;
    stim[9] = 34'h03d1e298a;
    stim[10] = 34'h0e0dad711;
    stim[11] = 34'h01d644a14;
    stim[12] = 34'h1cc147c92;
    stim[13] = 34'h1c39005dd;
    stim[14] = 34'h13e8c6153;
    stim[15] = 34'h07e43fa03;
    stim[16] = 34'h13dbfff13;
    stim[17] = 34'h0687e757a;
    stim[18] = 34'h1daa2f41f;
    stim[19] = 34'h1321b1334;
    stim[20] = 34'h03657d2cb;
    stim[21] = 34'h0e27b445a;
    stim[22] = 34'h028234a52;
    stim[23] = 34'h0242ebf04;
    stim[24] = 34'h04424c0b6;
    stim[25] = 34'h088473117;
    stim[26] = 34'h0b78083a5;
    stim[27] = 34'h119827f88;
    stim[28] = 34'h0332850ec;
    stim[29] = 34'h0cfc0bf5e;
    stim[30] = 34'h120526d60;
    stim[31] = 34'h0b62ae4b3;
    stim[32] = 34'h0e66df4f4;
    stim[33] = 34'h1a5991c2c;
    stim[34] = 34'h04ecc3244;
    stim[35] = 34'h093b272e2;
    stim[36] = 34'h05e79f05e;
    stim[37] = 34'h18412fcd8;
    stim[38] = 34'h02326bf7a;
    stim[39] = 34'h04a61646a;
    stim[40] = 34'h12991b9b2;
    stim[41] = 34'h1e91ae33f;
    stim[42] = 34'h02921b17e;
    stim[43] = 34'h0fcf881c8;
    stim[44] = 34'h153585ada;
    stim[45] = 34'h0a362e5df;
    stim[46] = 34'h0435cae9b;
    stim[47] = 34'h0de7b1c47;
    stim[48] = 34'h01cce25bd;
    stim[49] = 34'h09315068d;
    stim[50] = 34'h1792ca49c;
    stim[51] = 34'h0039375d6;
    stim[52] = 34'h02a702ad0;
    stim[53] = 34'h0818ef025;
    stim[54] = 34'h1c2453854;
    stim[55] = 34'h165fb5134;
    stim[56] = 34'h1d8fa31a4;
    stim[57] = 34'h04ded5b54;
    stim[58] = 34'h083c70a57;
    stim[59] = 34'h1bf4f887d;
    stim[60] = 34'h0a64cf689;
    stim[61] = 34'h1d70230ee;
    stim[62] = 34'h0e66f5321;
    stim[63] = 34'h151d88b99;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
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
