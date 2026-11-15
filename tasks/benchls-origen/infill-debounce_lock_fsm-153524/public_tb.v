// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153524 dut (
    .clk(clk),
    .reset(in_vec[34:34]),
    .sig_in(in_vec[33:33]),
    .unlock(in_vec[32:32]),
    .timeout(in_vec[31:0]),
    .sig_out(out_vec[9:9]),
    .sig_changed(out_vec[8:8]),
    .cycles(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h768f5e52f;
    stim[1] = 35'h5fb389f9c;
    stim[2] = 35'h027364147;
    stim[3] = 35'h0d2658409;
    stim[4] = 35'h34b3d652e;
    stim[5] = 35'h1541d05b8;
    stim[6] = 35'h09967112e;
    stim[7] = 35'h0d2da1163;
    stim[8] = 35'h209e1607b;
    stim[9] = 35'h1e6910ba3;
    stim[10] = 35'h0fd1917d8;
    stim[11] = 35'h25209a6e4;
    stim[12] = 35'h1cb9a2705;
    stim[13] = 35'h16b800de9;
    stim[14] = 35'h03144bf03;
    stim[15] = 35'h1d824aac3;
    stim[16] = 35'h0dae732b1;
    stim[17] = 35'h0a113ae03;
    stim[18] = 35'h2c69e2720;
    stim[19] = 35'h106fcabcf;
    stim[20] = 35'h0bceb5628;
    stim[21] = 35'h3c3f80b5e;
    stim[22] = 35'h045dece55;
    stim[23] = 35'h29de57a4c;
    stim[24] = 35'h0aa9749f6;
    stim[25] = 35'h106cb2e65;
    stim[26] = 35'h20cda4675;
    stim[27] = 35'h2a3d30795;
    stim[28] = 35'h19ce202d7;
    stim[29] = 35'h1d7065f59;
    stim[30] = 35'h10ebf4181;
    stim[31] = 35'h2d0d31139;
    stim[32] = 35'h003d9db95;
    stim[33] = 35'h2334df3f0;
    stim[34] = 35'h121a7dfc5;
    stim[35] = 35'h3f1545bc8;
    stim[36] = 35'h284e27973;
    stim[37] = 35'h0e07785eb;
    stim[38] = 35'h0fb89916a;
    stim[39] = 35'h30ee1fcc4;
    stim[40] = 35'h2c343aeaf;
    stim[41] = 35'h26f4c59f2;
    stim[42] = 35'h29033d88a;
    stim[43] = 35'h31c6e49e1;
    stim[44] = 35'h29922649d;
    stim[45] = 35'h0611ad43c;
    stim[46] = 35'h1e40d139f;
    stim[47] = 35'h3fde1a373;
    stim[48] = 35'h2325c53e3;
    stim[49] = 35'h38fa84f91;
    stim[50] = 35'h15d4460e3;
    stim[51] = 35'h1a958929d;
    stim[52] = 35'h01d216d80;
    stim[53] = 35'h0e03aa030;
    stim[54] = 35'h237c006e8;
    stim[55] = 35'h1bb14e5b2;
    stim[56] = 35'h01ad54f5c;
    stim[57] = 35'h1d5bc6ecf;
    stim[58] = 35'h3c95022e3;
    stim[59] = 35'h3c58d4053;
    stim[60] = 35'h319e02ba4;
    stim[61] = 35'h324f1a3bb;
    stim[62] = 35'h2e75ce788;
    stim[63] = 35'h280eb21f6;
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
      expv[4] = 10'h000;
      expv[5] = 10'h100;
      expv[6] = 10'h300;
      expv[7] = 10'h200;
      expv[8] = 10'h200;
      expv[9] = 10'h201;
      expv[10] = 10'h202;
      expv[11] = 10'h202;
      expv[12] = 10'h302;
      expv[13] = 10'h302;
      expv[14] = 10'h202;
      expv[15] = 10'h202;
      expv[16] = 10'h202;
      expv[17] = 10'h202;
      expv[18] = 10'h202;
      expv[19] = 10'h302;
      expv[20] = 10'h302;
      expv[21] = 10'h202;
      expv[22] = 10'h203;
      expv[23] = 10'h303;
      expv[24] = 10'h103;
      expv[25] = 10'h004;
      expv[26] = 10'h004;
      expv[27] = 10'h104;
      expv[28] = 10'h204;
      expv[29] = 10'h205;
      expv[30] = 10'h205;
      expv[31] = 10'h205;
      expv[32] = 10'h305;
      expv[33] = 10'h305;
      expv[34] = 10'h206;
      expv[35] = 10'h207;
      expv[36] = 10'h307;
      expv[37] = 10'h207;
      expv[38] = 10'h208;
      expv[39] = 10'h208;
      expv[40] = 10'h209;
      expv[41] = 10'h209;
      expv[42] = 10'h209;
      expv[43] = 10'h209;
      expv[44] = 10'h209;
      expv[45] = 10'h209;
      expv[46] = 10'h309;
      expv[47] = 10'h009;
      expv[48] = 10'h00a;
      expv[49] = 10'h00a;
      expv[50] = 10'h00a;
      expv[51] = 10'h10a;
      expv[52] = 10'h00a;
      expv[53] = 10'h00a;
      expv[54] = 10'h00a;
      expv[55] = 10'h00b;
      expv[56] = 10'h00c;
      expv[57] = 10'h00c;
      expv[58] = 10'h00c;
      expv[59] = 10'h10c;
      expv[60] = 10'h20c;
      expv[61] = 10'h20c;
      expv[62] = 10'h20c;
      expv[63] = 10'h20c;
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
