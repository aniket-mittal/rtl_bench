// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  prim_count dut (
    .clk_i(clk),
    .rst_ni(in_vec[9:9]),
    .clr_i(in_vec[8:8]),
    .set_i(in_vec[7:7]),
    .set_cnt_i(in_vec[6:5]),
    .incr_en_i(in_vec[4:4]),
    .decr_en_i(in_vec[3:3]),
    .step_i(in_vec[2:1]),
    .commit_i(in_vec[0:0]),
    .cnt_o(out_vec[4:3]),
    .cnt_after_commit_o(out_vec[2:1]),
    .err_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h122;
    stim[1] = 10'h0cd;
    stim[2] = 10'h2a9;
    stim[3] = 10'h2a2;
    stim[4] = 10'h310;
    stim[5] = 10'h3c6;
    stim[6] = 10'h33d;
    stim[7] = 10'h27a;
    stim[8] = 10'h295;
    stim[9] = 10'h266;
    stim[10] = 10'h36e;
    stim[11] = 10'h226;
    stim[12] = 10'h27e;
    stim[13] = 10'h324;
    stim[14] = 10'h250;
    stim[15] = 10'h2b9;
    stim[16] = 10'h30c;
    stim[17] = 10'h2b8;
    stim[18] = 10'h210;
    stim[19] = 10'h3fd;
    stim[20] = 10'h31e;
    stim[21] = 10'h2ad;
    stim[22] = 10'h233;
    stim[23] = 10'h374;
    stim[24] = 10'h2eb;
    stim[25] = 10'h3ea;
    stim[26] = 10'h23b;
    stim[27] = 10'h36a;
    stim[28] = 10'h378;
    stim[29] = 10'h3de;
    stim[30] = 10'h2c4;
    stim[31] = 10'h3b8;
    stim[32] = 10'h234;
    stim[33] = 10'h2e8;
    stim[34] = 10'h23a;
    stim[35] = 10'h3ec;
    stim[36] = 10'h25a;
    stim[37] = 10'h2c2;
    stim[38] = 10'h3d8;
    stim[39] = 10'h383;
    stim[40] = 10'h3e6;
    stim[41] = 10'h2ed;
    stim[42] = 10'h35e;
    stim[43] = 10'h274;
    stim[44] = 10'h2eb;
    stim[45] = 10'h392;
    stim[46] = 10'h32d;
    stim[47] = 10'h29d;
    stim[48] = 10'h212;
    stim[49] = 10'h39a;
    stim[50] = 10'h252;
    stim[51] = 10'h387;
    stim[52] = 10'h216;
    stim[53] = 10'h31d;
    stim[54] = 10'h346;
    stim[55] = 10'h33d;
    stim[56] = 10'h20d;
    stim[57] = 10'h340;
    stim[58] = 10'h2dc;
    stim[59] = 10'h28b;
    stim[60] = 10'h2d8;
    stim[61] = 10'h3eb;
    stim[62] = 10'h392;
    stim[63] = 10'h237;
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
      expv[0] = 5'h00;
      expv[1] = 5'h04;
      expv[2] = 5'h02;
      expv[3] = 5'h0a;
      expv[4] = 5'h08;
      expv[5] = 5'h08;
      expv[6] = 5'h08;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h02;
      expv[16] = 5'h08;
      expv[17] = 5'h0a;
      expv[18] = 5'h0a;
      expv[19] = 5'h08;
      expv[20] = 5'h00;
      expv[21] = 5'h02;
      expv[22] = 5'h0c;
      expv[23] = 5'h10;
      expv[24] = 5'h16;
      expv[25] = 5'h18;
      expv[26] = 5'h1e;
      expv[27] = 5'h18;
      expv[28] = 5'h18;
      expv[29] = 5'h18;
      expv[30] = 5'h1c;
      expv[31] = 5'h18;
      expv[32] = 5'h1e;
      expv[33] = 5'h1e;
      expv[34] = 5'h1e;
      expv[35] = 5'h18;
      expv[36] = 5'h1e;
      expv[37] = 5'h1c;
      expv[38] = 5'h18;
      expv[39] = 5'h18;
      expv[40] = 5'h00;
      expv[41] = 5'h06;
      expv[42] = 5'h18;
      expv[43] = 5'h1e;
      expv[44] = 5'h1e;
      expv[45] = 5'h18;
      expv[46] = 5'h18;
      expv[47] = 5'h00;
      expv[48] = 5'h02;
      expv[49] = 5'h00;
      expv[50] = 5'h02;
      expv[51] = 5'h00;
      expv[52] = 5'h06;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h04;
      expv[59] = 5'h00;
      expv[60] = 5'h04;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h06;
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
