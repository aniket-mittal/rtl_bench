// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059597 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .tx_start(in_vec[9:9]),
    .clock_enable(in_vec[8:8]),
    .din(in_vec[7:0]),
    .tx_done(out_vec[2:2]),
    .tx_ack(out_vec[1:1]),
    .tx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6b1;
    stim[1] = 11'h7c1;
    stim[2] = 11'h3eb;
    stim[3] = 11'h1ca;
    stim[4] = 11'h2ef;
    stim[5] = 11'h204;
    stim[6] = 11'h164;
    stim[7] = 11'h209;
    stim[8] = 11'h23b;
    stim[9] = 11'h3d3;
    stim[10] = 11'h317;
    stim[11] = 11'h341;
    stim[12] = 11'h1aa;
    stim[13] = 11'h357;
    stim[14] = 11'h088;
    stim[15] = 11'h3d5;
    stim[16] = 11'h216;
    stim[17] = 11'h3f7;
    stim[18] = 11'h29d;
    stim[19] = 11'h1f7;
    stim[20] = 11'h0dc;
    stim[21] = 11'h608;
    stim[22] = 11'h12e;
    stim[23] = 11'h35e;
    stim[24] = 11'h3fa;
    stim[25] = 11'h388;
    stim[26] = 11'h340;
    stim[27] = 11'h3a4;
    stim[28] = 11'h068;
    stim[29] = 11'h3fa;
    stim[30] = 11'h12a;
    stim[31] = 11'h3d5;
    stim[32] = 11'h106;
    stim[33] = 11'h12b;
    stim[34] = 11'h1a9;
    stim[35] = 11'h26d;
    stim[36] = 11'h158;
    stim[37] = 11'h345;
    stim[38] = 11'h394;
    stim[39] = 11'h05a;
    stim[40] = 11'h1fb;
    stim[41] = 11'h2ef;
    stim[42] = 11'h308;
    stim[43] = 11'h5c6;
    stim[44] = 11'h018;
    stim[45] = 11'h118;
    stim[46] = 11'h1de;
    stim[47] = 11'h181;
    stim[48] = 11'h080;
    stim[49] = 11'h0fd;
    stim[50] = 11'h35d;
    stim[51] = 11'h129;
    stim[52] = 11'h211;
    stim[53] = 11'h007;
    stim[54] = 11'h260;
    stim[55] = 11'h301;
    stim[56] = 11'h3df;
    stim[57] = 11'h3c0;
    stim[58] = 11'h1a1;
    stim[59] = 11'h061;
    stim[60] = 11'h1b0;
    stim[61] = 11'h27d;
    stim[62] = 11'h133;
    stim[63] = 11'h025;
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
      expv[0] = 3'h3;
      expv[1] = 3'h3;
      expv[2] = 3'h3;
      expv[3] = 3'h1;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h3;
      expv[22] = 3'h1;
      expv[23] = 3'h3;
      expv[24] = 3'h1;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h3;
      expv[51] = 3'h1;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
