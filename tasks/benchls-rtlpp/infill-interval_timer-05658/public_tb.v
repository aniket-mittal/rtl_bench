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

  rtlpp_05658 dut (
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
    stim[0] = 22'h119ac1;
    stim[1] = 22'h0123c7;
    stim[2] = 22'h235285;
    stim[3] = 22'h368d7d;
    stim[4] = 22'h1bf4b2;
    stim[5] = 22'h3716c9;
    stim[6] = 22'h1ae281;
    stim[7] = 22'h05ddbb;
    stim[8] = 22'h060c0e;
    stim[9] = 22'h1fb32a;
    stim[10] = 22'h0a54fd;
    stim[11] = 22'h1bd7a6;
    stim[12] = 22'h27bbf7;
    stim[13] = 22'h363742;
    stim[14] = 22'h17f5c7;
    stim[15] = 22'h0c0330;
    stim[16] = 22'h26de33;
    stim[17] = 22'h2fb2c2;
    stim[18] = 22'h2ed431;
    stim[19] = 22'h3a2076;
    stim[20] = 22'h060523;
    stim[21] = 22'h2bcb08;
    stim[22] = 22'h1aa2c0;
    stim[23] = 22'h32c16a;
    stim[24] = 22'h369b3c;
    stim[25] = 22'h1b8a8c;
    stim[26] = 22'h071aa9;
    stim[27] = 22'h23420c;
    stim[28] = 22'h32b3e4;
    stim[29] = 22'h26d60d;
    stim[30] = 22'h3702e2;
    stim[31] = 22'h3760d1;
    stim[32] = 22'h1e1522;
    stim[33] = 22'h1e931f;
    stim[34] = 22'h0229c4;
    stim[35] = 22'h33ee3c;
    stim[36] = 22'h2f6beb;
    stim[37] = 22'h166593;
    stim[38] = 22'h0be309;
    stim[39] = 22'h1be1ea;
    stim[40] = 22'h3b1e99;
    stim[41] = 22'h1ffa77;
    stim[42] = 22'h3b51a4;
    stim[43] = 22'h3edd05;
    stim[44] = 22'h061e21;
    stim[45] = 22'h2e7202;
    stim[46] = 22'h1ed6e8;
    stim[47] = 22'h0fe9f4;
    stim[48] = 22'h273cdf;
    stim[49] = 22'h3707f5;
    stim[50] = 22'h1e487b;
    stim[51] = 22'h227868;
    stim[52] = 22'h020eed;
    stim[53] = 22'h127bd1;
    stim[54] = 22'h3b7734;
    stim[55] = 22'h1fcf47;
    stim[56] = 22'h13c065;
    stim[57] = 22'h13484a;
    stim[58] = 22'h0a62d9;
    stim[59] = 22'h2f318d;
    stim[60] = 22'h0bb2aa;
    stim[61] = 22'h36d824;
    stim[62] = 22'h3e229f;
    stim[63] = 22'h10b4a5;
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
      expv[4] = 17'h00000;
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
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h00000;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h01522;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h0c34f;
      expv[39] = 17'h00000;
      expv[40] = 17'h0931f;
      expv[41] = 17'h00000;
      expv[42] = 17'h0931f;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h0931f;
      expv[48] = 17'h00000;
      expv[49] = 17'h06593;
      expv[50] = 17'h00000;
      expv[51] = 17'h0d6e8;
      expv[52] = 17'h06593;
      expv[53] = 17'h00000;
      expv[54] = 17'h06593;
      expv[55] = 17'h00000;
      expv[56] = 17'h0487b;
      expv[57] = 17'h06593;
      expv[58] = 17'h06593;
      expv[59] = 17'h00000;
      expv[60] = 17'h0931f;
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
