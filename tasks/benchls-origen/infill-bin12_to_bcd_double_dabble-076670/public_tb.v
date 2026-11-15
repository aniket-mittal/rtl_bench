// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_076670 dut (
    .clk(clk),
    .rst_n(in_vec[12:12]),
    .bin(in_vec[11:0]),
    .one(out_vec[15:12]),
    .ten(out_vec[11:8]),
    .hun(out_vec[7:4]),
    .tho(out_vec[3:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h03d6;
    stim[1] = 13'h0175;
    stim[2] = 13'h1a5b;
    stim[3] = 13'h1766;
    stim[4] = 13'h1bbf;
    stim[5] = 13'h151f;
    stim[6] = 13'h1af1;
    stim[7] = 13'h159c;
    stim[8] = 13'h0bfa;
    stim[9] = 13'h1e90;
    stim[10] = 13'h17c6;
    stim[11] = 13'h1d24;
    stim[12] = 13'h1d7e;
    stim[13] = 13'h1068;
    stim[14] = 13'h03db;
    stim[15] = 13'h1787;
    stim[16] = 13'h1f95;
    stim[17] = 13'h13ef;
    stim[18] = 13'h188a;
    stim[19] = 13'h1f86;
    stim[20] = 13'h11a4;
    stim[21] = 13'h132a;
    stim[22] = 13'h1e60;
    stim[23] = 13'h1340;
    stim[24] = 13'h1b13;
    stim[25] = 13'h1bb9;
    stim[26] = 13'h1f7e;
    stim[27] = 13'h1c68;
    stim[28] = 13'h13cb;
    stim[29] = 13'h19f2;
    stim[30] = 13'h1e4a;
    stim[31] = 13'h130b;
    stim[32] = 13'h1dbf;
    stim[33] = 13'h1f95;
    stim[34] = 13'h1058;
    stim[35] = 13'h1654;
    stim[36] = 13'h19d7;
    stim[37] = 13'h111d;
    stim[38] = 13'h1095;
    stim[39] = 13'h1530;
    stim[40] = 13'h11e8;
    stim[41] = 13'h1a87;
    stim[42] = 13'h1862;
    stim[43] = 13'h1186;
    stim[44] = 13'h164b;
    stim[45] = 13'h1825;
    stim[46] = 13'h1844;
    stim[47] = 13'h1fd8;
    stim[48] = 13'h16cb;
    stim[49] = 13'h1444;
    stim[50] = 13'h1dd5;
    stim[51] = 13'h1237;
    stim[52] = 13'h1879;
    stim[53] = 13'h1c0b;
    stim[54] = 13'h17cb;
    stim[55] = 13'h19cd;
    stim[56] = 13'h1ec2;
    stim[57] = 13'h1f61;
    stim[58] = 13'h1090;
    stim[59] = 13'h1c48;
    stim[60] = 13'h14ae;
    stim[61] = 13'h1957;
    stim[62] = 13'h1eae;
    stim[63] = 13'h13d8;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h000f;
      expv[30] = 16'h000e;
      expv[31] = 16'h000e;
      expv[32] = 16'h000e;
      expv[33] = 16'h000e;
      expv[34] = 16'h000e;
      expv[35] = 16'h000e;
      expv[36] = 16'h000e;
      expv[37] = 16'h000e;
      expv[38] = 16'h000e;
      expv[39] = 16'h000e;
      expv[40] = 16'h000e;
      expv[41] = 16'h000e;
      expv[42] = 16'h000e;
      expv[43] = 16'h0005;
      expv[44] = 16'h0004;
      expv[45] = 16'h0004;
      expv[46] = 16'h0004;
      expv[47] = 16'h0004;
      expv[48] = 16'h0004;
      expv[49] = 16'h0004;
      expv[50] = 16'h0004;
      expv[51] = 16'h0004;
      expv[52] = 16'h0004;
      expv[53] = 16'h0004;
      expv[54] = 16'h0004;
      expv[55] = 16'h0004;
      expv[56] = 16'h0004;
      expv[57] = 16'h000d;
      expv[58] = 16'h000c;
      expv[59] = 16'h000c;
      expv[60] = 16'h000c;
      expv[61] = 16'h000c;
      expv[62] = 16'h000c;
      expv[63] = 16'h000c;
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
