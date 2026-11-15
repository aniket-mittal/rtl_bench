// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075202 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .start(in_vec[16:16]),
    .dvsr(in_vec[15:8]),
    .dvnd(in_vec[7:0]),
    .ready(out_vec[17:17]),
    .done_tick(out_vec[16:16]),
    .quo(out_vec[15:8]),
    .rmd(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h371e1;
    stim[1] = 18'h24012;
    stim[2] = 18'h1ed3d;
    stim[3] = 18'h073fa;
    stim[4] = 18'h04c1e;
    stim[5] = 18'h17607;
    stim[6] = 18'h1671c;
    stim[7] = 18'h3ef6c;
    stim[8] = 18'h1d93d;
    stim[9] = 18'h03481;
    stim[10] = 18'h06c9c;
    stim[11] = 18'h0a14e;
    stim[12] = 18'h0bd9b;
    stim[13] = 18'h1b02d;
    stim[14] = 18'h17433;
    stim[15] = 18'h18770;
    stim[16] = 18'h387c0;
    stim[17] = 18'h0a0e1;
    stim[18] = 18'h1731f;
    stim[19] = 18'h10066;
    stim[20] = 18'h13b23;
    stim[21] = 18'h1a669;
    stim[22] = 18'h08e51;
    stim[23] = 18'h0c521;
    stim[24] = 18'h012b3;
    stim[25] = 18'h0f980;
    stim[26] = 18'h13066;
    stim[27] = 18'h0fd41;
    stim[28] = 18'h1a8db;
    stim[29] = 18'h13306;
    stim[30] = 18'h182c9;
    stim[31] = 18'h1eb5a;
    stim[32] = 18'h0aa53;
    stim[33] = 18'h0b828;
    stim[34] = 18'h1334f;
    stim[35] = 18'h1db4d;
    stim[36] = 18'h10805;
    stim[37] = 18'h19ebf;
    stim[38] = 18'h1fbc2;
    stim[39] = 18'h1e5d1;
    stim[40] = 18'h0ac90;
    stim[41] = 18'h092bf;
    stim[42] = 18'h09d3a;
    stim[43] = 18'h0ee1a;
    stim[44] = 18'h19046;
    stim[45] = 18'h17d31;
    stim[46] = 18'h09395;
    stim[47] = 18'h1bc1e;
    stim[48] = 18'h0889e;
    stim[49] = 18'h0b6ad;
    stim[50] = 18'h18fb0;
    stim[51] = 18'h1775a;
    stim[52] = 18'h1e36d;
    stim[53] = 18'h0eab8;
    stim[54] = 18'h1252e;
    stim[55] = 18'h040d7;
    stim[56] = 18'h0868a;
    stim[57] = 18'h08a29;
    stim[58] = 18'h0dba0;
    stim[59] = 18'h04bea;
    stim[60] = 18'h15203;
    stim[61] = 18'h069a5;
    stim[62] = 18'h18a3a;
    stim[63] = 18'h1543f;
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
      expv[0] = 18'h20000;
      expv[1] = 18'h20000;
      expv[2] = 18'h20000;
      expv[3] = 18'h03d00;
      expv[4] = 18'h07a00;
      expv[5] = 18'h0f400;
      expv[6] = 18'h0e801;
      expv[7] = 18'h20000;
      expv[8] = 18'h20000;
      expv[9] = 18'h03d00;
      expv[10] = 18'h07a00;
      expv[11] = 18'h0f400;
      expv[12] = 18'h0e801;
      expv[13] = 18'h1d001;
      expv[14] = 18'h2d001;
      expv[15] = 18'h03300;
      expv[16] = 18'h20000;
      expv[17] = 18'h20000;
      expv[18] = 18'h20000;
      expv[19] = 18'h01f00;
      expv[20] = 18'h03e00;
      expv[21] = 18'h07c00;
      expv[22] = 18'h0f800;
      expv[23] = 18'h1f000;
      expv[24] = 18'h2f000;
      expv[25] = 18'h2f000;
      expv[26] = 18'h2f000;
      expv[27] = 18'h06600;
      expv[28] = 18'h0cc00;
      expv[29] = 18'h09801;
      expv[30] = 18'h03003;
      expv[31] = 18'h16003;
      expv[32] = 18'h26003;
      expv[33] = 18'h26003;
      expv[34] = 18'h26003;
      expv[35] = 18'h04f00;
      expv[36] = 18'h09e00;
      expv[37] = 18'h03c01;
      expv[38] = 18'h07802;
      expv[39] = 18'h1f002;
      expv[40] = 18'h2f002;
      expv[41] = 18'h2f002;
      expv[42] = 18'h2f002;
      expv[43] = 18'h2f002;
      expv[44] = 18'h2f002;
      expv[45] = 18'h04600;
      expv[46] = 18'h08c00;
      expv[47] = 18'h01801;
      expv[48] = 18'h03002;
      expv[49] = 18'h16002;
      expv[50] = 18'h26002;
      expv[51] = 18'h0b000;
      expv[52] = 18'h06001;
      expv[53] = 18'h0c002;
      expv[54] = 18'h08005;
      expv[55] = 18'h10005;
      expv[56] = 18'h20005;
      expv[57] = 18'h20005;
      expv[58] = 18'h20005;
      expv[59] = 18'h20005;
      expv[60] = 18'h20005;
      expv[61] = 18'h00300;
      expv[62] = 18'h00600;
      expv[63] = 18'h00c00;
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
