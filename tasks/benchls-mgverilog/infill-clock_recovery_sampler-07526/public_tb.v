// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07526 dut (
    .clock_50(clk),
    .clock_recovery(in_vec[9:9]),
    .reset_n(in_vec[8:8]),
    .data_rec(in_vec[7:0]),
    .data_stand(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2dd;
    stim[1] = 10'h237;
    stim[2] = 10'h1ad;
    stim[3] = 10'h177;
    stim[4] = 10'h198;
    stim[5] = 10'h3d2;
    stim[6] = 10'h180;
    stim[7] = 10'h3e6;
    stim[8] = 10'h3fb;
    stim[9] = 10'h135;
    stim[10] = 10'h300;
    stim[11] = 10'h1ab;
    stim[12] = 10'h3f5;
    stim[13] = 10'h1de;
    stim[14] = 10'h12e;
    stim[15] = 10'h1d7;
    stim[16] = 10'h3b8;
    stim[17] = 10'h1ce;
    stim[18] = 10'h2e5;
    stim[19] = 10'h194;
    stim[20] = 10'h38d;
    stim[21] = 10'h188;
    stim[22] = 10'h3d9;
    stim[23] = 10'h3d7;
    stim[24] = 10'h14f;
    stim[25] = 10'h128;
    stim[26] = 10'h1b8;
    stim[27] = 10'h15a;
    stim[28] = 10'h355;
    stim[29] = 10'h300;
    stim[30] = 10'h17c;
    stim[31] = 10'h17e;
    stim[32] = 10'h39e;
    stim[33] = 10'h103;
    stim[34] = 10'h179;
    stim[35] = 10'h174;
    stim[36] = 10'h3df;
    stim[37] = 10'h10a;
    stim[38] = 10'h14d;
    stim[39] = 10'h1b7;
    stim[40] = 10'h1df;
    stim[41] = 10'h338;
    stim[42] = 10'h377;
    stim[43] = 10'h34f;
    stim[44] = 10'h3a0;
    stim[45] = 10'h100;
    stim[46] = 10'h133;
    stim[47] = 10'h310;
    stim[48] = 10'h105;
    stim[49] = 10'h3b6;
    stim[50] = 10'h3fd;
    stim[51] = 10'h15e;
    stim[52] = 10'h13e;
    stim[53] = 10'h1f4;
    stim[54] = 10'h39e;
    stim[55] = 10'h158;
    stim[56] = 10'h16d;
    stim[57] = 10'h307;
    stim[58] = 10'h3f5;
    stim[59] = 10'h121;
    stim[60] = 10'h3a4;
    stim[61] = 10'h105;
    stim[62] = 10'h1c1;
    stim[63] = 10'h301;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'hd2;
      expv[7] = 8'hd2;
      expv[8] = 8'he6;
      expv[9] = 8'hfb;
      expv[10] = 8'hfb;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'hf5;
      expv[14] = 8'hf5;
      expv[15] = 8'hf5;
      expv[16] = 8'hf5;
      expv[17] = 8'hb8;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h8d;
      expv[22] = 8'h8d;
      expv[23] = 8'hd9;
      expv[24] = 8'hd7;
      expv[25] = 8'hd7;
      expv[26] = 8'hd7;
      expv[27] = 8'hd7;
      expv[28] = 8'hd7;
      expv[29] = 8'h55;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h9e;
      expv[34] = 8'h9e;
      expv[35] = 8'h9e;
      expv[36] = 8'h9e;
      expv[37] = 8'hdf;
      expv[38] = 8'hdf;
      expv[39] = 8'hdf;
      expv[40] = 8'hdf;
      expv[41] = 8'hdf;
      expv[42] = 8'h38;
      expv[43] = 8'h77;
      expv[44] = 8'h4f;
      expv[45] = 8'ha0;
      expv[46] = 8'ha0;
      expv[47] = 8'ha0;
      expv[48] = 8'h10;
      expv[49] = 8'h10;
      expv[50] = 8'hb6;
      expv[51] = 8'hfd;
      expv[52] = 8'hfd;
      expv[53] = 8'hfd;
      expv[54] = 8'hfd;
      expv[55] = 8'h9e;
      expv[56] = 8'h9e;
      expv[57] = 8'h9e;
      expv[58] = 8'h07;
      expv[59] = 8'hf5;
      expv[60] = 8'hf5;
      expv[61] = 8'ha4;
      expv[62] = 8'ha4;
      expv[63] = 8'ha4;
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
