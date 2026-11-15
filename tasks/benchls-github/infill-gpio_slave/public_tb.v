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

  gpio_slave dut (
    .clk(clk),
    .reset_n(in_vec[10:10]),
    .sync(in_vec[9:9]),
    .mosi(in_vec[8:8]),
    .leds(in_vec[7:0]),
    .miso(out_vec[8:8]),
    .dipsw(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h348;
    stim[1] = 11'h182;
    stim[2] = 11'h60d;
    stim[3] = 11'h404;
    stim[4] = 11'h639;
    stim[5] = 11'h42e;
    stim[6] = 11'h5cf;
    stim[7] = 11'h488;
    stim[8] = 11'h7fb;
    stim[9] = 11'h467;
    stim[10] = 11'h7ad;
    stim[11] = 11'h734;
    stim[12] = 11'h506;
    stim[13] = 11'h777;
    stim[14] = 11'h4e7;
    stim[15] = 11'h601;
    stim[16] = 11'h611;
    stim[17] = 11'h6fa;
    stim[18] = 11'h5af;
    stim[19] = 11'h759;
    stim[20] = 11'h4de;
    stim[21] = 11'h5a5;
    stim[22] = 11'h6f6;
    stim[23] = 11'h6d9;
    stim[24] = 11'h1c5;
    stim[25] = 11'h73d;
    stim[26] = 11'h44c;
    stim[27] = 11'h66d;
    stim[28] = 11'h485;
    stim[29] = 11'h572;
    stim[30] = 11'h46f;
    stim[31] = 11'h67f;
    stim[32] = 11'h60b;
    stim[33] = 11'h50a;
    stim[34] = 11'h648;
    stim[35] = 11'h6e1;
    stim[36] = 11'h6da;
    stim[37] = 11'h6e0;
    stim[38] = 11'h632;
    stim[39] = 11'h5fc;
    stim[40] = 11'h552;
    stim[41] = 11'h5bb;
    stim[42] = 11'h705;
    stim[43] = 11'h5ec;
    stim[44] = 11'h665;
    stim[45] = 11'h5d2;
    stim[46] = 11'h536;
    stim[47] = 11'h65d;
    stim[48] = 11'h60b;
    stim[49] = 11'h750;
    stim[50] = 11'h588;
    stim[51] = 11'h78f;
    stim[52] = 11'h68c;
    stim[53] = 11'h7d7;
    stim[54] = 11'h63a;
    stim[55] = 11'h4d5;
    stim[56] = 11'h456;
    stim[57] = 11'h634;
    stim[58] = 11'h7fe;
    stim[59] = 11'h5fb;
    stim[60] = 11'h5e6;
    stim[61] = 11'h4c8;
    stim[62] = 11'h45d;
    stim[63] = 11'h650;
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
      expv[2] = 9'h100;
      expv[3] = 9'h000;
      expv[4] = 9'h100;
      expv[5] = 9'h000;
      expv[6] = 9'h100;
      expv[7] = 9'h100;
      expv[8] = 9'h000;
      expv[9] = 9'h040;
      expv[10] = 9'h040;
      expv[11] = 9'h050;
      expv[12] = 9'h1a8;
      expv[13] = 9'h1a8;
      expv[14] = 9'h0ea;
      expv[15] = 9'h0ea;
      expv[16] = 9'h07a;
      expv[17] = 9'h03d;
      expv[18] = 9'h11e;
      expv[19] = 9'h01e;
      expv[20] = 9'h087;
      expv[21] = 9'h187;
      expv[22] = 9'h187;
      expv[23] = 9'h1b0;
      expv[24] = 9'h100;
      expv[25] = 9'h100;
      expv[26] = 9'h000;
      expv[27] = 9'h100;
      expv[28] = 9'h040;
      expv[29] = 9'h140;
      expv[30] = 9'h040;
      expv[31] = 9'h040;
      expv[32] = 9'h044;
      expv[33] = 9'h022;
      expv[34] = 9'h022;
      expv[35] = 9'h188;
      expv[36] = 9'h044;
      expv[37] = 9'h122;
      expv[38] = 9'h111;
      expv[39] = 9'h108;
      expv[40] = 9'h008;
      expv[41] = 9'h108;
      expv[42] = 9'h108;
      expv[43] = 9'h0e0;
      expv[44] = 9'h1e0;
      expv[45] = 9'h0f8;
      expv[46] = 9'h1f8;
      expv[47] = 9'h0f8;
      expv[48] = 9'h0df;
      expv[49] = 9'h06f;
      expv[50] = 9'h137;
      expv[51] = 9'h137;
      expv[52] = 9'h0cd;
      expv[53] = 9'h1e6;
      expv[54] = 9'h073;
      expv[55] = 9'h1b9;
      expv[56] = 9'h0b9;
      expv[57] = 9'h1b9;
      expv[58] = 9'h117;
      expv[59] = 9'h10b;
      expv[60] = 9'h00b;
      expv[61] = 9'h00b;
      expv[62] = 9'h00b;
      expv[63] = 9'h00b;
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
