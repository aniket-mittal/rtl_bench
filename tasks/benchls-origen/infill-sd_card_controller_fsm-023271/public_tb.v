// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023271 dut (
    .clk(clk),
    .start(in_vec[14:14]),
    .empty(in_vec[13:13]),
    .endCRC(in_vec[12:12]),
    .block(in_vec[11:11]),
    .hasNext(in_vec[10:10]),
    .bytes(in_vec[9:9]),
    .resetAll(in_vec[8:8]),
    .response(in_vec[7:0]),
    .count(out_vec[9:9]),
    .byteEnable(out_vec[8:8]),
    .reset(out_vec[7:7]),
    .loadCmd(out_vec[6:6]),
    .shiftCmd(out_vec[5:5]),
    .nextAddr(out_vec[4:4]),
    .dataSelect(out_vec[3:3]),
    .tokenSelect(out_vec[2:2]),
    .oe(out_vec[1:1]),
    .startCountData(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h3f98;
    stim[1] = 15'h5d47;
    stim[2] = 15'h77d4;
    stim[3] = 15'h7efa;
    stim[4] = 15'h64aa;
    stim[5] = 15'h0b39;
    stim[6] = 15'h0eba;
    stim[7] = 15'h6069;
    stim[8] = 15'h3ebd;
    stim[9] = 15'h5417;
    stim[10] = 15'h5831;
    stim[11] = 15'h74dc;
    stim[12] = 15'h5c0b;
    stim[13] = 15'h0ece;
    stim[14] = 15'h30f4;
    stim[15] = 15'h728e;
    stim[16] = 15'h6448;
    stim[17] = 15'h526d;
    stim[18] = 15'h7eb8;
    stim[19] = 15'h5680;
    stim[20] = 15'h02ff;
    stim[21] = 15'h06f4;
    stim[22] = 15'h7ebc;
    stim[23] = 15'h3eff;
    stim[24] = 15'h285c;
    stim[25] = 15'h6489;
    stim[26] = 15'h4cc7;
    stim[27] = 15'h7e91;
    stim[28] = 15'h6618;
    stim[29] = 15'h66c6;
    stim[30] = 15'h7cca;
    stim[31] = 15'h5051;
    stim[32] = 15'h2202;
    stim[33] = 15'h68ea;
    stim[34] = 15'h28e5;
    stim[35] = 15'h104a;
    stim[36] = 15'h3ee5;
    stim[37] = 15'h4424;
    stim[38] = 15'h0af0;
    stim[39] = 15'h5e9b;
    stim[40] = 15'h1811;
    stim[41] = 15'h76f6;
    stim[42] = 15'h464d;
    stim[43] = 15'h20c7;
    stim[44] = 15'h6e03;
    stim[45] = 15'h5461;
    stim[46] = 15'h7843;
    stim[47] = 15'h04c7;
    stim[48] = 15'h5ccf;
    stim[49] = 15'h704c;
    stim[50] = 15'h60b6;
    stim[51] = 15'h7e53;
    stim[52] = 15'h481b;
    stim[53] = 15'h24f7;
    stim[54] = 15'h301a;
    stim[55] = 15'h7206;
    stim[56] = 15'h66f8;
    stim[57] = 15'h1e1d;
    stim[58] = 15'h1c6b;
    stim[59] = 15'h18d7;
    stim[60] = 15'h107f;
    stim[61] = 15'h50b4;
    stim[62] = 15'h4ee4;
    stim[63] = 15'h1a07;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h080;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h080;
      expv[9] = 10'h000;
      expv[10] = 10'h042;
      expv[11] = 10'h022;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
