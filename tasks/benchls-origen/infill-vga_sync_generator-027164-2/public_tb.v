// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027164 dut (
    .vga_clk(clk),
    .clrn(in_vec[0:0]),
    .hsync_out(out_vec[47:47]),
    .vsync_out(out_vec[46:46]),
    .r(out_vec[45:38]),
    .g(out_vec[37:30]),
    .b(out_vec[29:22]),
    .vga_sync_n(out_vec[21:21]),
    .vga_blank_n(out_vec[20:20]),
    .row_addr(out_vec[19:10]),
    .col_addr(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h0;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 48'hc00000100000;
      expv[1] = 48'hc00000100000;
      expv[2] = 48'hc00000100000;
      expv[3] = 48'hc00000100000;
      expv[4] = 48'hc0003fd00001;
      expv[5] = 48'hc0003fd00002;
      expv[6] = 48'hc0003fd00003;
      expv[7] = 48'hc0003fd00004;
      expv[8] = 48'hc0003fd00005;
      expv[9] = 48'hc0003fd00006;
      expv[10] = 48'hc0003fd00007;
      expv[11] = 48'hc0003fd00008;
      expv[12] = 48'hc00000100000;
      expv[13] = 48'hc00000100000;
      expv[14] = 48'hc00000100000;
      expv[15] = 48'hc0003fd00001;
      expv[16] = 48'hc0003fd00002;
      expv[17] = 48'hc0003fd00003;
      expv[18] = 48'hc0003fd00004;
      expv[19] = 48'hc0003fd00005;
      expv[20] = 48'hc0003fd00006;
      expv[21] = 48'hc0003fd00007;
      expv[22] = 48'hc0003fd00008;
      expv[23] = 48'hc0003fd00009;
      expv[24] = 48'hc0003fd0000a;
      expv[25] = 48'hc0003fd0000b;
      expv[26] = 48'hc0003fd0000c;
      expv[27] = 48'hc0003fd0000d;
      expv[28] = 48'hc0003fd0000e;
      expv[29] = 48'hc0003fd0000f;
      expv[30] = 48'hc0003fd00010;
      expv[31] = 48'hc0003fd00011;
      expv[32] = 48'hc0003fd00012;
      expv[33] = 48'hc0003fd00013;
      expv[34] = 48'hc0003fd00014;
      expv[35] = 48'hc0003fd00015;
      expv[36] = 48'hc0003fd00016;
      expv[37] = 48'hc0003fd00017;
      expv[38] = 48'hc0003fd00018;
      expv[39] = 48'hc0003fd00019;
      expv[40] = 48'hc0003fd0001a;
      expv[41] = 48'hc0003fd0001b;
      expv[42] = 48'hc0003fd0001c;
      expv[43] = 48'hc0003fd0001d;
      expv[44] = 48'hc0003fd0001e;
      expv[45] = 48'hc0003fd0001f;
      expv[46] = 48'hc0003fd00020;
      expv[47] = 48'hc0003fd00021;
      expv[48] = 48'hc0003fd00022;
      expv[49] = 48'hc0003fd00023;
      expv[50] = 48'hc0003fd00024;
      expv[51] = 48'hc0003fd00025;
      expv[52] = 48'hc0003fd00026;
      expv[53] = 48'hc0003fd00027;
      expv[54] = 48'hc0003fd00028;
      expv[55] = 48'hc0003fd00029;
      expv[56] = 48'hc0003fd0002a;
      expv[57] = 48'hc0003fd0002b;
      expv[58] = 48'hc0003fd0002c;
      expv[59] = 48'hc0003fd0002d;
      expv[60] = 48'hc0003fd0002e;
      expv[61] = 48'hc0003fd0002f;
      expv[62] = 48'hc0003fd00030;
      expv[63] = 48'hc0003fd00031;
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
