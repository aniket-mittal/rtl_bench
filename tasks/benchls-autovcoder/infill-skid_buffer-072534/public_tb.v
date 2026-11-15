// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072534 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h618;
    stim[1] = 11'h606;
    stim[2] = 11'h1bd;
    stim[3] = 11'h1de;
    stim[4] = 11'h34a;
    stim[5] = 11'h000;
    stim[6] = 11'h2e7;
    stim[7] = 11'h3d9;
    stim[8] = 11'h2fb;
    stim[9] = 11'h20e;
    stim[10] = 11'h076;
    stim[11] = 11'h19f;
    stim[12] = 11'h200;
    stim[13] = 11'h03f;
    stim[14] = 11'h3d9;
    stim[15] = 11'h161;
    stim[16] = 11'h00d;
    stim[17] = 11'h13d;
    stim[18] = 11'h0de;
    stim[19] = 11'h30e;
    stim[20] = 11'h237;
    stim[21] = 11'h32f;
    stim[22] = 11'h194;
    stim[23] = 11'h00c;
    stim[24] = 11'h066;
    stim[25] = 11'h1b9;
    stim[26] = 11'h0f1;
    stim[27] = 11'h2d8;
    stim[28] = 11'h35d;
    stim[29] = 11'h0c6;
    stim[30] = 11'h2ae;
    stim[31] = 11'h036;
    stim[32] = 11'h2b5;
    stim[33] = 11'h3d3;
    stim[34] = 11'h320;
    stim[35] = 11'h3bc;
    stim[36] = 11'h0ed;
    stim[37] = 11'h0a9;
    stim[38] = 11'h220;
    stim[39] = 11'h332;
    stim[40] = 11'h317;
    stim[41] = 11'h07a;
    stim[42] = 11'h024;
    stim[43] = 11'h271;
    stim[44] = 11'h102;
    stim[45] = 11'h180;
    stim[46] = 11'h354;
    stim[47] = 11'h082;
    stim[48] = 11'h3d1;
    stim[49] = 11'h0f9;
    stim[50] = 11'h3e7;
    stim[51] = 11'h16d;
    stim[52] = 11'h227;
    stim[53] = 11'h0ba;
    stim[54] = 11'h132;
    stim[55] = 11'h2a7;
    stim[56] = 11'h54c;
    stim[57] = 11'h38a;
    stim[58] = 11'h079;
    stim[59] = 11'h2c5;
    stim[60] = 11'h29f;
    stim[61] = 11'h303;
    stim[62] = 11'h131;
    stim[63] = 11'h04b;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'h408;
      expv[3] = 12'hc08;
      expv[4] = 12'hbbd;
      expv[5] = 12'h3be;
      expv[6] = 12'h3be;
      expv[7] = 12'he95;
      expv[8] = 12'he90;
      expv[9] = 12'hdf5;
      expv[10] = 12'h5f6;
      expv[11] = 12'h5f6;
      expv[12] = 12'hc1d;
      expv[13] = 12'hc1d;
      expv[14] = 12'h87d;
      expv[15] = 12'h878;
      expv[16] = 12'h878;
      expv[17] = 12'h878;
      expv[18] = 12'h878;
      expv[19] = 12'h9bd;
      expv[20] = 12'h1be;
      expv[21] = 12'he1d;
      expv[22] = 12'he5d;
      expv[23] = 12'he5d;
      expv[24] = 12'he5d;
      expv[25] = 12'h65e;
      expv[26] = 12'h8cd;
      expv[27] = 12'h8c8;
      expv[28] = 12'h8c8;
      expv[29] = 12'h8c8;
      expv[30] = 12'h98d;
      expv[31] = 12'h18e;
      expv[32] = 12'h18e;
      expv[33] = 12'hd5d;
      expv[34] = 12'hfa5;
      expv[35] = 12'hfa5;
      expv[36] = 12'hfa5;
      expv[37] = 12'hfa0;
      expv[38] = 12'hfa0;
      expv[39] = 12'hfa0;
      expv[40] = 12'he65;
      expv[41] = 12'he2d;
      expv[42] = 12'h62e;
      expv[43] = 12'h62e;
      expv[44] = 12'h8f5;
      expv[45] = 12'h0f6;
      expv[46] = 12'h0f6;
      expv[47] = 12'h0f6;
      expv[48] = 12'h0f6;
      expv[49] = 12'ha05;
      expv[50] = 12'ha00;
      expv[51] = 12'hfcd;
      expv[52] = 12'hfc8;
      expv[53] = 12'hc4d;
      expv[54] = 12'h44e;
      expv[55] = 12'h44e;
      expv[56] = 12'h975;
      expv[57] = 12'h170;
      expv[58] = 12'hf10;
      expv[59] = 12'hf10;
      expv[60] = 12'hf10;
      expv[61] = 12'hd3d;
      expv[62] = 12'he05;
      expv[63] = 12'he00;
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
