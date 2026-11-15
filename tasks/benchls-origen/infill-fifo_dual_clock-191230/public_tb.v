// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_191230 dut (
    .clk_in(clk),
    .data_in(in_vec[36:5]),
    .clk_out(in_vec[4:4]),
    .insert(in_vec[3:3]),
    .remove(in_vec[2:2]),
    .flush(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[49:18]),
    .wr_ptr_wr(out_vec[17:9]),
    .rd_ptr_rd(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0227db978d;
    stim[1] = 37'h1c792e584b;
    stim[2] = 37'h035123eb98;
    stim[3] = 37'h116b093fb4;
    stim[4] = 37'h188de87362;
    stim[5] = 37'h10b79b89ba;
    stim[6] = 37'h141a037aba;
    stim[7] = 37'h186591f868;
    stim[8] = 37'h0a9da09a50;
    stim[9] = 37'h0fa536ead6;
    stim[10] = 37'h1c83de7bf2;
    stim[11] = 37'h1aec40bab8;
    stim[12] = 37'h1a889ed8f5;
    stim[13] = 37'h04773ff472;
    stim[14] = 37'h066d98a1b8;
    stim[15] = 37'h03eff9aeee;
    stim[16] = 37'h083a5c56ea;
    stim[17] = 37'h0d2863a590;
    stim[18] = 37'h1c06c5932e;
    stim[19] = 37'h03f6ef1bf8;
    stim[20] = 37'h0c3d82184e;
    stim[21] = 37'h03fd5acc02;
    stim[22] = 37'h1bb3f894ce;
    stim[23] = 37'h1c778bc7be;
    stim[24] = 37'h1400c743b0;
    stim[25] = 37'h16c02dc312;
    stim[26] = 37'h045490c7fe;
    stim[27] = 37'h1bc063f30a;
    stim[28] = 37'h11c9344b62;
    stim[29] = 37'h0f830de37a;
    stim[30] = 37'h1bed30f93a;
    stim[31] = 37'h07e535ba50;
    stim[32] = 37'h0a2e7d7ad8;
    stim[33] = 37'h11aeb82fe0;
    stim[34] = 37'h06ae08585e;
    stim[35] = 37'h1d13a80c98;
    stim[36] = 37'h099432e91c;
    stim[37] = 37'h19ef2bfe8c;
    stim[38] = 37'h01a693197e;
    stim[39] = 37'h0ed7afc418;
    stim[40] = 37'h0209806718;
    stim[41] = 37'h010ee5c68a;
    stim[42] = 37'h13a3c21a46;
    stim[43] = 37'h155ca50144;
    stim[44] = 37'h0347074042;
    stim[45] = 37'h04c07530d2;
    stim[46] = 37'h138dc66880;
    stim[47] = 37'h1b0d9a2d98;
    stim[48] = 37'h14ef98d142;
    stim[49] = 37'h1599e216e2;
    stim[50] = 37'h0fa58e003e;
    stim[51] = 37'h0f8cc69bb8;
    stim[52] = 37'h030c6d84e4;
    stim[53] = 37'h01b83eb008;
    stim[54] = 37'h01945b4d74;
    stim[55] = 37'h0dac8307fa;
    stim[56] = 37'h128bada8d8;
    stim[57] = 37'h1c0d1002c2;
    stim[58] = 37'h14e86c3d2c;
    stim[59] = 37'h0e6e542602;
    stim[60] = 37'h0127e76a50;
    stim[61] = 37'h14c3a56830;
    stim[62] = 37'h05eb3d146c;
    stim[63] = 37'h1fe3ffe7f0;
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
      expv[0] = 50'hxxxxxxxxx0000;
      expv[1] = 50'hxxxxxxxxx0000;
      expv[2] = 50'hxxxxxxxxx0000;
      expv[3] = 50'hxxxxxxxxx0200;
      expv[4] = 50'hxxxxxxxxx0200;
      expv[5] = 50'hxxxxxxxxx0000;
      expv[6] = 50'hxxxxxxxxx0000;
      expv[7] = 50'hxxxxxxxxx0000;
      expv[8] = 50'hxxxxxxxxx0200;
      expv[9] = 50'hxxxxxxxxx0200;
      expv[10] = 50'hxxxxxxxxx0000;
      expv[11] = 50'hxxxxxxxxx0000;
      expv[12] = 50'hxxxxxxxxx0000;
      expv[13] = 50'hxxxxxxxxx0000;
      expv[14] = 50'hxxxxxxxxx0000;
      expv[15] = 50'hxxxxxxxxx0200;
      expv[16] = 50'hxxxxxxxxx0000;
      expv[17] = 50'hxxxxxxxxx0000;
      expv[18] = 50'hxxxxxxxxx0000;
      expv[19] = 50'hxxxxxxxxx0000;
      expv[20] = 50'hxxxxxxxxx0200;
      expv[21] = 50'hxxxxxxxxx0000;
      expv[22] = 50'hxxxxxxxxx0000;
      expv[23] = 50'hxxxxxxxxx0000;
      expv[24] = 50'hxxxxxxxxx0000;
      expv[25] = 50'hxxxxxxxxx0000;
      expv[26] = 50'hxxxxxxxxx0000;
      expv[27] = 50'hxxxxxxxxx0000;
      expv[28] = 50'hxxxxxxxxx0000;
      expv[29] = 50'hxxxxxxxxx0000;
      expv[30] = 50'hxxxxxxxxx0000;
      expv[31] = 50'hxxxxxxxxx0000;
      expv[32] = 50'hxxxxxxxxx0000;
      expv[33] = 50'hxxxxxxxxx0200;
      expv[34] = 50'hxxxxxxxxx0200;
      expv[35] = 50'hxxxxxxxxx0000;
      expv[36] = 50'hxxxxxxxxx0200;
      expv[37] = 50'hxxxxxxxxx0400;
      expv[38] = 50'hxxxxxxxxx0600;
      expv[39] = 50'hxxxxxxxxx0000;
      expv[40] = 50'hxxxxxxxxx0200;
      expv[41] = 50'hxxxxxxxxx0400;
      expv[42] = 50'hxxxxxxxxx0000;
      expv[43] = 50'hxxxxxxxxx0000;
      expv[44] = 50'hxxxxxxxxx0000;
      expv[45] = 50'hxxxxxxxxx0000;
      expv[46] = 50'hxxxxxxxxx0000;
      expv[47] = 50'hxxxxxxxxx0000;
      expv[48] = 50'hxxxxxxxxx0200;
      expv[49] = 50'hxxxxxxxxx0000;
      expv[50] = 50'hxxxxxxxxx0000;
      expv[51] = 50'hxxxxxxxxx0000;
      expv[52] = 50'hxxxxxxxxx0200;
      expv[53] = 50'hxxxxxxxxx0200;
      expv[54] = 50'h1f198d3740401;
      expv[55] = 50'h1f198d3740401;
      expv[56] = 50'h1f198d3740001;
      expv[57] = 50'h1f198d3740201;
      expv[58] = 50'h1f198d3740001;
      expv[59] = 50'h1f198d3740201;
      expv[60] = 50'h1f198d3740001;
      expv[61] = 50'h1f198d3740001;
      expv[62] = 50'h1f198d3740001;
      expv[63] = 50'h1f198d3740201;
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
