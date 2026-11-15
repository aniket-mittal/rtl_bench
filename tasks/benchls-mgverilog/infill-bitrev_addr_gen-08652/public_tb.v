// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08652 dut (
    .clk(clk),
    .en(in_vec[9:9]),
    .din(in_vec[8:1]),
    .pre_first_in(in_vec[0:0]),
    .y_out(out_vec[17:10]),
    .yaddr(out_vec[9:2]),
    .ywe(out_vec[1:1]),
    .pre_first_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2a8;
    stim[1] = 10'h16a;
    stim[2] = 10'h079;
    stim[3] = 10'h3a9;
    stim[4] = 10'h065;
    stim[5] = 10'h2b7;
    stim[6] = 10'h1c1;
    stim[7] = 10'h0b5;
    stim[8] = 10'h05d;
    stim[9] = 10'h13d;
    stim[10] = 10'h079;
    stim[11] = 10'h387;
    stim[12] = 10'h103;
    stim[13] = 10'h25a;
    stim[14] = 10'h2d5;
    stim[15] = 10'h1fb;
    stim[16] = 10'h2fb;
    stim[17] = 10'h015;
    stim[18] = 10'h3d3;
    stim[19] = 10'h1f3;
    stim[20] = 10'h349;
    stim[21] = 10'h1ef;
    stim[22] = 10'h23d;
    stim[23] = 10'h10f;
    stim[24] = 10'h38b;
    stim[25] = 10'h197;
    stim[26] = 10'h02d;
    stim[27] = 10'h07d;
    stim[28] = 10'h2a9;
    stim[29] = 10'h095;
    stim[30] = 10'h3e1;
    stim[31] = 10'h15e;
    stim[32] = 10'h1bf;
    stim[33] = 10'h273;
    stim[34] = 10'h3db;
    stim[35] = 10'h1ab;
    stim[36] = 10'h0c5;
    stim[37] = 10'h351;
    stim[38] = 10'h0a5;
    stim[39] = 10'h289;
    stim[40] = 10'h275;
    stim[41] = 10'h38f;
    stim[42] = 10'h383;
    stim[43] = 10'h1a7;
    stim[44] = 10'h1f7;
    stim[45] = 10'h207;
    stim[46] = 10'h355;
    stim[47] = 10'h3b5;
    stim[48] = 10'h2ed;
    stim[49] = 10'h235;
    stim[50] = 10'h11b;
    stim[51] = 10'h293;
    stim[52] = 10'h2a5;
    stim[53] = 10'h0af;
    stim[54] = 10'h38b;
    stim[55] = 10'h185;
    stim[56] = 10'h06f;
    stim[57] = 10'h1c1;
    stim[58] = 10'h273;
    stim[59] = 10'h1e9;
    stim[60] = 10'h0d1;
    stim[61] = 10'h023;
    stim[62] = 10'h1a5;
    stim[63] = 10'h1ed;
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
      expv[0] = 18'h35xxx;
      expv[1] = 18'h0dxxx;
      expv[2] = 18'h2f001;
      expv[3] = 18'h15001;
      expv[4] = 18'h2c803;
      expv[5] = 18'h36c01;
      expv[6] = 18'h18003;
      expv[7] = 18'h36801;
      expv[8] = 18'h2b801;
      expv[9] = 18'h07801;
      expv[10] = 18'h2f001;
      expv[11] = 18'h10c01;
      expv[12] = 18'h00403;
      expv[13] = 18'h2b400;
      expv[14] = 18'h3a801;
      expv[15] = 18'h1f403;
      expv[16] = 18'h3f401;
      expv[17] = 18'h22803;
      expv[18] = 18'h1a401;
      expv[19] = 18'h1e403;
      expv[20] = 18'h09001;
      expv[21] = 18'h1dc03;
      expv[22] = 18'h27801;
      expv[23] = 18'h01c03;
      expv[24] = 18'h11401;
      expv[25] = 18'h12c03;
      expv[26] = 18'h25801;
      expv[27] = 18'h2f801;
      expv[28] = 18'h35001;
      expv[29] = 18'h32803;
      expv[30] = 18'h1c001;
      expv[31] = 18'h0bc02;
      expv[32] = 18'h17c01;
      expv[33] = 18'h2e401;
      expv[34] = 18'h1b403;
      expv[35] = 18'h15403;
      expv[36] = 18'h38801;
      expv[37] = 18'h0a001;
      expv[38] = 18'h34803;
      expv[39] = 18'h31001;
      expv[40] = 18'h2e803;
      expv[41] = 18'h11c03;
      expv[42] = 18'h10403;
      expv[43] = 18'h14c03;
      expv[44] = 18'h1ec01;
      expv[45] = 18'h20c01;
      expv[46] = 18'h0a803;
      expv[47] = 18'h16803;
      expv[48] = 18'h3d803;
      expv[49] = 18'h26803;
      expv[50] = 18'h03403;
      expv[51] = 18'h32401;
      expv[52] = 18'h34803;
      expv[53] = 18'h35c03;
      expv[54] = 18'h11401;
      expv[55] = 18'h10803;
      expv[56] = 18'h2dc01;
      expv[57] = 18'h18001;
      expv[58] = 18'h2e401;
      expv[59] = 18'h1d003;
      expv[60] = 18'h3a001;
      expv[61] = 18'h24401;
      expv[62] = 18'h14801;
      expv[63] = 18'h1d801;
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
