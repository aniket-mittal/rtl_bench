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

  rtlpp_02264 dut (
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
    stim[0] = 22'h10ae72;
    stim[1] = 22'h2c6452;
    stim[2] = 22'h0b2e26;
    stim[3] = 22'h0a2c06;
    stim[4] = 22'h0a446d;
    stim[5] = 22'h0a0cf0;
    stim[6] = 22'h362891;
    stim[7] = 22'h26e604;
    stim[8] = 22'h32b87c;
    stim[9] = 22'h3b7ce5;
    stim[10] = 22'h06834c;
    stim[11] = 22'h3e51d9;
    stim[12] = 22'h033163;
    stim[13] = 22'h1f764a;
    stim[14] = 22'h1ea54d;
    stim[15] = 22'h1fd96e;
    stim[16] = 22'h170db6;
    stim[17] = 22'h172059;
    stim[18] = 22'h13765a;
    stim[19] = 22'h166caf;
    stim[20] = 22'h364568;
    stim[21] = 22'h17fa56;
    stim[22] = 22'h3eea70;
    stim[23] = 22'h2b4b22;
    stim[24] = 22'h2636e5;
    stim[25] = 22'h17caf7;
    stim[26] = 22'h2b0541;
    stim[27] = 22'h37fa17;
    stim[28] = 22'h16ba3e;
    stim[29] = 22'h23f644;
    stim[30] = 22'h22b341;
    stim[31] = 22'h2f65a6;
    stim[32] = 22'h07cdaa;
    stim[33] = 22'h3f9f86;
    stim[34] = 22'h23eea9;
    stim[35] = 22'h2e1d84;
    stim[36] = 22'h1b3829;
    stim[37] = 22'h1745b2;
    stim[38] = 22'h2aed01;
    stim[39] = 22'h33b381;
    stim[40] = 22'h06486a;
    stim[41] = 22'h2ad3a6;
    stim[42] = 22'h26ad97;
    stim[43] = 22'h1ba9d5;
    stim[44] = 22'h2b1fdb;
    stim[45] = 22'h1338e6;
    stim[46] = 22'h3af546;
    stim[47] = 22'h3201d9;
    stim[48] = 22'h1681f1;
    stim[49] = 22'h36742c;
    stim[50] = 22'h1e3af5;
    stim[51] = 22'h16e5d9;
    stim[52] = 22'h0e591d;
    stim[53] = 22'h36b274;
    stim[54] = 22'h260847;
    stim[55] = 22'h2776bc;
    stim[56] = 22'h036a48;
    stim[57] = 22'h2ff0de;
    stim[58] = 22'h27c022;
    stim[59] = 22'h02f9e6;
    stim[60] = 22'h3f8ab8;
    stim[61] = 22'h37be72;
    stim[62] = 22'h1f8bef;
    stim[63] = 22'h2b7505;
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
      expv[16] = 17'h0a54d;
      expv[17] = 17'h0c34f;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h0c34f;
      expv[20] = 17'h0c34f;
      expv[21] = 17'h00000;
      expv[22] = 17'h06caf;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h06caf;
      expv[27] = 17'h0a54d;
      expv[28] = 17'h00000;
      expv[29] = 17'h06caf;
      expv[30] = 17'h06caf;
      expv[31] = 17'h06caf;
      expv[32] = 17'h0a54d;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h06caf;
      expv[36] = 17'h0a54d;
      expv[37] = 17'h0a54d;
      expv[38] = 17'h0ba3e;
      expv[39] = 17'h0a54d;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0a54d;
      expv[43] = 17'h0ba3e;
      expv[44] = 17'h0a54d;
      expv[45] = 17'h0a54d;
      expv[46] = 17'h0ba3e;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h0ba3e;
      expv[50] = 17'h00000;
      expv[51] = 17'h0a54d;
      expv[52] = 17'h081f1;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h0ba3e;
      expv[56] = 17'h0e5d8;
      expv[57] = 17'h00002;
      expv[58] = 17'h03af5;
      expv[59] = 17'h0e5d8;
      expv[60] = 17'h00002;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h03af5;
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
