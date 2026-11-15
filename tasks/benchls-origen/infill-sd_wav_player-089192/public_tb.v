// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_089192 dut (
    .clk_50M(clk),
    .SD_clk(in_vec[12:12]),
    .init(in_vec[11:11]),
    .data_come(in_vec[10:10]),
    .mydata(in_vec[9:2]),
    .myvalid(in_vec[1:1]),
    .wav_rden(in_vec[0:0]),
    .wav_data(out_vec[16:1]),
    .read_SD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1e9d;
    stim[1] = 13'h1a43;
    stim[2] = 13'h02ba;
    stim[3] = 13'h10d2;
    stim[4] = 13'h08d0;
    stim[5] = 13'h0c36;
    stim[6] = 13'h0bbb;
    stim[7] = 13'h11eb;
    stim[8] = 13'h0495;
    stim[9] = 13'h1757;
    stim[10] = 13'h0009;
    stim[11] = 13'h04c7;
    stim[12] = 13'h0a63;
    stim[13] = 13'h0808;
    stim[14] = 13'h08bc;
    stim[15] = 13'h10e6;
    stim[16] = 13'h0bfc;
    stim[17] = 13'h105e;
    stim[18] = 13'h121f;
    stim[19] = 13'h00c9;
    stim[20] = 13'h0413;
    stim[21] = 13'h09e6;
    stim[22] = 13'h0b4a;
    stim[23] = 13'h1e87;
    stim[24] = 13'h1f93;
    stim[25] = 13'h1b43;
    stim[26] = 13'h194c;
    stim[27] = 13'h05fc;
    stim[28] = 13'h1bb4;
    stim[29] = 13'h1c2f;
    stim[30] = 13'h063a;
    stim[31] = 13'h1dbf;
    stim[32] = 13'h07b6;
    stim[33] = 13'h0e96;
    stim[34] = 13'h012f;
    stim[35] = 13'h17a2;
    stim[36] = 13'h1682;
    stim[37] = 13'h03fd;
    stim[38] = 13'h0653;
    stim[39] = 13'h03cc;
    stim[40] = 13'h1027;
    stim[41] = 13'h0635;
    stim[42] = 13'h15c5;
    stim[43] = 13'h169a;
    stim[44] = 13'h1913;
    stim[45] = 13'h07a4;
    stim[46] = 13'h0fd8;
    stim[47] = 13'h0992;
    stim[48] = 13'h14fc;
    stim[49] = 13'h076b;
    stim[50] = 13'h046a;
    stim[51] = 13'h1dc1;
    stim[52] = 13'h12cb;
    stim[53] = 13'h02c5;
    stim[54] = 13'h0e87;
    stim[55] = 13'h02d3;
    stim[56] = 13'h141c;
    stim[57] = 13'h1f75;
    stim[58] = 13'h0d70;
    stim[59] = 13'h1b4c;
    stim[60] = 13'h1b54;
    stim[61] = 13'h07fd;
    stim[62] = 13'h0abb;
    stim[63] = 13'h1cf1;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'hxxx6x;
      expv[8] = 17'hxxxfx;
      expv[9] = 17'hxxxf4;
      expv[10] = 17'hxxxaa;
      expv[11] = 17'hxxxaa;
      expv[12] = 17'hxxxaa;
      expv[13] = 17'hxxxaa;
      expv[14] = 17'hxxxaa;
      expv[15] = 17'hxxxaa;
      expv[16] = 17'hxxxaa;
      expv[17] = 17'hxxxaa;
      expv[18] = 17'hxxxaa;
      expv[19] = 17'hxxx2e;
      expv[20] = 17'hxxx2e;
      expv[21] = 17'hxxx2e;
      expv[22] = 17'hxxx2e;
      expv[23] = 17'hxxx2e;
      expv[24] = 17'hxxx42;
      expv[25] = 17'hxxx42;
      expv[26] = 17'hxxx42;
      expv[27] = 17'hxxx42;
      expv[28] = 17'hxxx42;
      expv[29] = 17'hxxx42;
      expv[30] = 17'hxxx42;
      expv[31] = 17'hxxx42;
      expv[32] = 17'hxxxde;
      expv[33] = 17'hxxxde;
      expv[34] = 17'hxxxde;
      expv[35] = 17'hxxxde;
      expv[36] = 17'hxxxde;
      expv[37] = 17'hxxxde;
      expv[38] = 17'hxxxd0;
      expv[39] = 17'hxxxd0;
      expv[40] = 17'hxxxd0;
      expv[41] = 17'hxxx12;
      expv[42] = 17'hxxx12;
      expv[43] = 17'hxxx12;
      expv[44] = 17'hxxx12;
      expv[45] = 17'hxxx12;
      expv[46] = 17'hxxx12;
      expv[47] = 17'hxxx12;
      expv[48] = 17'hxxx12;
      expv[49] = 17'hxxx12;
      expv[50] = 17'hxxx12;
      expv[51] = 17'hxxx12;
      expv[52] = 17'hxxx12;
      expv[53] = 17'hxxx12;
      expv[54] = 17'hxxx12;
      expv[55] = 17'hxxx12;
      expv[56] = 17'hxxx12;
      expv[57] = 17'hxxx12;
      expv[58] = 17'hxxx12;
      expv[59] = 17'hxxx12;
      expv[60] = 17'hxxx12;
      expv[61] = 17'hxxx12;
      expv[62] = 17'hxxx12;
      expv[63] = 17'hxxx12;
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
