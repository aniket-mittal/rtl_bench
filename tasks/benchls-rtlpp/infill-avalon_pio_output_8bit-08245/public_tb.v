// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08245 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0827c2f7b4;
    stim[1] = 37'h1806657753;
    stim[2] = 37'h01b51bd24b;
    stim[3] = 37'h030d2f1f7e;
    stim[4] = 37'h0627e0ac34;
    stim[5] = 37'h0d2eeb228f;
    stim[6] = 37'h0fc11ea5f2;
    stim[7] = 37'h120b869c96;
    stim[8] = 37'h1efe772426;
    stim[9] = 37'h1373cea838;
    stim[10] = 37'h133b3a1657;
    stim[11] = 37'h0655de12a9;
    stim[12] = 37'h06992ae865;
    stim[13] = 37'h0b49146d5f;
    stim[14] = 37'h0b192f89bb;
    stim[15] = 37'h1d869b985a;
    stim[16] = 37'h0e4052aab5;
    stim[17] = 37'h1b2e9db822;
    stim[18] = 37'h0ec2e4192c;
    stim[19] = 37'h1b6dd3c245;
    stim[20] = 37'h03bda9dcec;
    stim[21] = 37'h0637e7534b;
    stim[22] = 37'h0609b947c1;
    stim[23] = 37'h01ccfd3fa6;
    stim[24] = 37'h1b12eeeacb;
    stim[25] = 37'h177c404064;
    stim[26] = 37'h136880cd7b;
    stim[27] = 37'h02c371dd75;
    stim[28] = 37'h123f87920f;
    stim[29] = 37'h0bdfba5990;
    stim[30] = 37'h17dad16f5a;
    stim[31] = 37'h0ff4d9875e;
    stim[32] = 37'h0731dc457b;
    stim[33] = 37'h064df4f488;
    stim[34] = 37'h07431f0619;
    stim[35] = 37'h170cf65c1b;
    stim[36] = 37'h1652bb98d8;
    stim[37] = 37'h16dd156819;
    stim[38] = 37'h03263474c6;
    stim[39] = 37'h0aafa010fc;
    stim[40] = 37'h07d81f5772;
    stim[41] = 37'h0b6d802c2f;
    stim[42] = 37'h1e4b2239f5;
    stim[43] = 37'h1f0c502d18;
    stim[44] = 37'h066b0b6cd5;
    stim[45] = 37'h0e50891043;
    stim[46] = 37'h032e80b7de;
    stim[47] = 37'h0a98e67cfd;
    stim[48] = 37'h1adc9428cc;
    stim[49] = 37'h1209a7dadc;
    stim[50] = 37'h1ae807f3c9;
    stim[51] = 37'h06d731ddbd;
    stim[52] = 37'h0781b19dce;
    stim[53] = 37'h0b276dece6;
    stim[54] = 37'h12e2589a24;
    stim[55] = 37'h03ed27b8e9;
    stim[56] = 37'h0ea820a503;
    stim[57] = 37'h12f1fda0d9;
    stim[58] = 37'h1b473b9b9f;
    stim[59] = 37'h0bb031a2f1;
    stim[60] = 37'h1eb59b6677;
    stim[61] = 37'h123c2f63bb;
    stim[62] = 37'h12e3287fb8;
    stim[63] = 37'h0ac770cfb4;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'ha9000000a9;
      expv[13] = 40'h6500000000;
      expv[14] = 40'h6500000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h4b0000004b;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h8800000088;
      expv[35] = 40'h8800000000;
      expv[36] = 40'h8800000000;
      expv[37] = 40'h8800000000;
      expv[38] = 40'h8800000088;
      expv[39] = 40'h8800000000;
      expv[40] = 40'h8800000088;
      expv[41] = 40'h8800000000;
      expv[42] = 40'h8800000000;
      expv[43] = 40'h8800000000;
      expv[44] = 40'h8800000088;
      expv[45] = 40'hd500000000;
      expv[46] = 40'hd5000000d5;
      expv[47] = 40'hd500000000;
      expv[48] = 40'hd500000000;
      expv[49] = 40'hd500000000;
      expv[50] = 40'hd500000000;
      expv[51] = 40'hd5000000d5;
      expv[52] = 40'hbd000000bd;
      expv[53] = 40'hbd00000000;
      expv[54] = 40'hbd00000000;
      expv[55] = 40'hbd000000bd;
      expv[56] = 40'hbd00000000;
      expv[57] = 40'hbd00000000;
      expv[58] = 40'hbd00000000;
      expv[59] = 40'hbd00000000;
      expv[60] = 40'hbd00000000;
      expv[61] = 40'hbd00000000;
      expv[62] = 40'hbd00000000;
      expv[63] = 40'hbd00000000;
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
