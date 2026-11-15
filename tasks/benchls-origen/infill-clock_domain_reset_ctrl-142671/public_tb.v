// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142671 dut (
    .clk(clk),
    .resetn(in_vec[9:9]),
    .ctrl_pause(in_vec[8:8]),
    .ctrl_enable(in_vec[7:7]),
    .req_enable(in_vec[6:6]),
    .dest_clk(in_vec[5:5]),
    .dest_ext_resetn(in_vec[4:4]),
    .dest_enable(in_vec[3:3]),
    .src_clk(in_vec[2:2]),
    .src_ext_resetn(in_vec[1:1]),
    .src_enable(in_vec[0:0]),
    .req_enabled(out_vec[5:5]),
    .dest_enabled(out_vec[4:4]),
    .src_enabled(out_vec[3:3]),
    .req_resetn(out_vec[2:2]),
    .dest_resetn(out_vec[1:1]),
    .src_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0fd;
    stim[1] = 10'h182;
    stim[2] = 10'h310;
    stim[3] = 10'h360;
    stim[4] = 10'h33b;
    stim[5] = 10'h250;
    stim[6] = 10'h3c6;
    stim[7] = 10'h2d7;
    stim[8] = 10'h25c;
    stim[9] = 10'h3fd;
    stim[10] = 10'h2d1;
    stim[11] = 10'h2a0;
    stim[12] = 10'h368;
    stim[13] = 10'h3f8;
    stim[14] = 10'h3f6;
    stim[15] = 10'h233;
    stim[16] = 10'h3bc;
    stim[17] = 10'h3d4;
    stim[18] = 10'h2b6;
    stim[19] = 10'h3d2;
    stim[20] = 10'h217;
    stim[21] = 10'h38a;
    stim[22] = 10'h242;
    stim[23] = 10'h316;
    stim[24] = 10'h359;
    stim[25] = 10'h38a;
    stim[26] = 10'h2af;
    stim[27] = 10'h313;
    stim[28] = 10'h31f;
    stim[29] = 10'h21a;
    stim[30] = 10'h259;
    stim[31] = 10'h33a;
    stim[32] = 10'h36e;
    stim[33] = 10'h2e2;
    stim[34] = 10'h236;
    stim[35] = 10'h235;
    stim[36] = 10'h2e6;
    stim[37] = 10'h352;
    stim[38] = 10'h3de;
    stim[39] = 10'h2d0;
    stim[40] = 10'h20d;
    stim[41] = 10'h327;
    stim[42] = 10'h3ec;
    stim[43] = 10'h0e8;
    stim[44] = 10'h2db;
    stim[45] = 10'h349;
    stim[46] = 10'h384;
    stim[47] = 10'h349;
    stim[48] = 10'h20f;
    stim[49] = 10'h3d7;
    stim[50] = 10'h3d4;
    stim[51] = 10'h335;
    stim[52] = 10'h234;
    stim[53] = 10'h3dc;
    stim[54] = 10'h2dc;
    stim[55] = 10'h2c7;
    stim[56] = 10'h373;
    stim[57] = 10'h22c;
    stim[58] = 10'h295;
    stim[59] = 10'h247;
    stim[60] = 10'h135;
    stim[61] = 10'h23d;
    stim[62] = 10'h242;
    stim[63] = 10'h3f3;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
