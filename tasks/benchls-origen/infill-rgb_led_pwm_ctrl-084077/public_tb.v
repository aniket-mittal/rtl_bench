// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_084077 dut (
    .pclk(clk),
    .nreset(in_vec[42:42]),
    .bus_write_en(in_vec[41:41]),
    .bus_read_en(in_vec[40:40]),
    .bus_addr(in_vec[39:32]),
    .bus_write_data(in_vec[31:0]),
    .bus_read_data(out_vec[34:3]),
    .pwm_r(out_vec[2:2]),
    .pwm_g(out_vec[1:1]),
    .pwm_b(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h48fdb997371;
    stim[1] = 43'h568542e4ee1;
    stim[2] = 43'h6eb1126ad7e;
    stim[3] = 43'h24aa39d4cad;
    stim[4] = 43'h2c28d96c0e1;
    stim[5] = 43'h1dc65899ba8;
    stim[6] = 43'h329d273d80b;
    stim[7] = 43'h3dd61c268a1;
    stim[8] = 43'h242a34223c7;
    stim[9] = 43'h31cf2de7af2;
    stim[10] = 43'h0301912a1e9;
    stim[11] = 43'h291c5fa9551;
    stim[12] = 43'h000b89f808c;
    stim[13] = 43'h0f1eaf8f749;
    stim[14] = 43'h1a46ab5abf4;
    stim[15] = 43'h1a9f697701d;
    stim[16] = 43'h3f6a1e6d21d;
    stim[17] = 43'h35b42e07fee;
    stim[18] = 43'h181a868deab;
    stim[19] = 43'h0d10681e9f7;
    stim[20] = 43'h284e0012309;
    stim[21] = 43'h1310b8875f3;
    stim[22] = 43'h377f02edfb1;
    stim[23] = 43'h38c82ca7964;
    stim[24] = 43'h3c2d4bf5e3b;
    stim[25] = 43'h1dfc8d63de2;
    stim[26] = 43'h11324d8fcb9;
    stim[27] = 43'h1436c79d598;
    stim[28] = 43'h31b55edeacc;
    stim[29] = 43'h0d52bc19f09;
    stim[30] = 43'h1e1836686f5;
    stim[31] = 43'h153c2707917;
    stim[32] = 43'h05e2add5261;
    stim[33] = 43'h13ff138c8bc;
    stim[34] = 43'h08939e50356;
    stim[35] = 43'h180416750c4;
    stim[36] = 43'h4a1819af2fa;
    stim[37] = 43'h22c21881975;
    stim[38] = 43'h161da9a2d4d;
    stim[39] = 43'h31258559690;
    stim[40] = 43'h0444d189e4a;
    stim[41] = 43'h36c788d9275;
    stim[42] = 43'h22e373baea0;
    stim[43] = 43'h3312054b644;
    stim[44] = 43'h103f3817e7a;
    stim[45] = 43'h342551ec81f;
    stim[46] = 43'h320ac413fa4;
    stim[47] = 43'h2be4a3bbdad;
    stim[48] = 43'h2a12b09374e;
    stim[49] = 43'h3f1bb94be23;
    stim[50] = 43'h1cdaa188eb7;
    stim[51] = 43'h2f74e406060;
    stim[52] = 43'h189f3b2a370;
    stim[53] = 43'h1af0330e4a4;
    stim[54] = 43'h2c5c3e90913;
    stim[55] = 43'h0fca7948d03;
    stim[56] = 43'h12ebbb97ddb;
    stim[57] = 43'h0a2dd9851a4;
    stim[58] = 43'h15486d8fe6e;
    stim[59] = 43'h1cface79e2c;
    stim[60] = 43'h0d3aa6615ac;
    stim[61] = 43'h3da727e1481;
    stim[62] = 43'h0f8e6ad8f5b;
    stim[63] = 43'h31fc1a0a747;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h000000000;
      expv[21] = 35'h000000000;
      expv[22] = 35'h000000000;
      expv[23] = 35'h000000000;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000000;
      expv[26] = 35'h000000000;
      expv[27] = 35'h000000000;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h000000000;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h000000000;
      expv[44] = 35'h000000000;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h000000000;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h000000000;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000000;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h000000000;
      expv[63] = 35'h000000000;
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
