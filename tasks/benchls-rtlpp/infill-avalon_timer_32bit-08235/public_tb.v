// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08235 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0d9e14;
    stim[1] = 22'h28865d;
    stim[2] = 22'h0ae4fa;
    stim[3] = 22'h16255b;
    stim[4] = 22'h3bcf91;
    stim[5] = 22'h230ddd;
    stim[6] = 22'h285d41;
    stim[7] = 22'h063245;
    stim[8] = 22'h0f4bb8;
    stim[9] = 22'h0acb82;
    stim[10] = 22'h0f56c9;
    stim[11] = 22'h0ff1ad;
    stim[12] = 22'h3a8d38;
    stim[13] = 22'h2e4c54;
    stim[14] = 22'h23402e;
    stim[15] = 22'h33c5a1;
    stim[16] = 22'h2f50fc;
    stim[17] = 22'h225577;
    stim[18] = 22'h125aee;
    stim[19] = 22'h2b8ad8;
    stim[20] = 22'h0beb31;
    stim[21] = 22'h3e9f1b;
    stim[22] = 22'h1e3fb5;
    stim[23] = 22'h26756d;
    stim[24] = 22'h2edd60;
    stim[25] = 22'h0756c2;
    stim[26] = 22'h075101;
    stim[27] = 22'h074c9d;
    stim[28] = 22'h129272;
    stim[29] = 22'h1737eb;
    stim[30] = 22'h066162;
    stim[31] = 22'h3be9c0;
    stim[32] = 22'h267b31;
    stim[33] = 22'h3e4331;
    stim[34] = 22'h174ecb;
    stim[35] = 22'h2b66d0;
    stim[36] = 22'h033e1a;
    stim[37] = 22'h0b262b;
    stim[38] = 22'h3fb738;
    stim[39] = 22'h07075a;
    stim[40] = 22'h1617f6;
    stim[41] = 22'h0f56ae;
    stim[42] = 22'h3ea445;
    stim[43] = 22'h3b847e;
    stim[44] = 22'h0714fe;
    stim[45] = 22'h327164;
    stim[46] = 22'h37339b;
    stim[47] = 22'h0ec60a;
    stim[48] = 22'h333270;
    stim[49] = 22'h020559;
    stim[50] = 22'h036471;
    stim[51] = 22'h3e760f;
    stim[52] = 22'h13cc5b;
    stim[53] = 22'h264ce5;
    stim[54] = 22'h0e0631;
    stim[55] = 22'h3e4379;
    stim[56] = 22'h1a702d;
    stim[57] = 22'h2a2fcd;
    stim[58] = 22'h23b775;
    stim[59] = 22'h3453e6;
    stim[60] = 22'h2e576d;
    stim[61] = 22'h02f4c1;
    stim[62] = 22'h0ffb45;
    stim[63] = 22'h33dbeb;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0c34f;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h0c34f;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h0c34f;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h0c34f;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c34f;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h0c34f;
      expv[34] = 17'h00000;
      expv[35] = 17'h0c34f;
      expv[36] = 17'h03fb5;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h0c34f;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h017f6;
      expv[54] = 17'h0c34f;
      expv[55] = 17'h0000a;
      expv[56] = 17'h00000;
      expv[57] = 17'h03fb5;
      expv[58] = 17'h03fb5;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
