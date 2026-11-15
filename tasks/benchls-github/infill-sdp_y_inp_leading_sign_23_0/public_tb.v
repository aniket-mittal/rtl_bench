// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_Y_INP_leading_sign_23_0 dut (
    .mantissa(in_vec[22:0]),
    .rtn(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h581968;
    stim[1] = 23'h4ad582;
    stim[2] = 23'h0b8bb4;
    stim[3] = 23'h4dcf78;
    stim[4] = 23'h378cad;
    stim[5] = 23'h666343;
    stim[6] = 23'h5f7267;
    stim[7] = 23'h268ff7;
    stim[8] = 23'h3df66d;
    stim[9] = 23'h40e4e2;
    stim[10] = 23'h1e0387;
    stim[11] = 23'h1bcfe0;
    stim[12] = 23'h2c7e99;
    stim[13] = 23'h41fdd1;
    stim[14] = 23'h310957;
    stim[15] = 23'h3e1c45;
    stim[16] = 23'h08fb08;
    stim[17] = 23'h74f43e;
    stim[18] = 23'h533636;
    stim[19] = 23'h4b3eb7;
    stim[20] = 23'h17cba0;
    stim[21] = 23'h4296bb;
    stim[22] = 23'h2cb1e6;
    stim[23] = 23'h3d6a4e;
    stim[24] = 23'h106b90;
    stim[25] = 23'h4b09c6;
    stim[26] = 23'h7541b4;
    stim[27] = 23'h107951;
    stim[28] = 23'h425876;
    stim[29] = 23'h780e75;
    stim[30] = 23'h3f2784;
    stim[31] = 23'h3fd9c0;
    stim[32] = 23'h781ed0;
    stim[33] = 23'h7f82b8;
    stim[34] = 23'h4dac0d;
    stim[35] = 23'h60c2bf;
    stim[36] = 23'h215d0c;
    stim[37] = 23'h7f9a0d;
    stim[38] = 23'h6cf67a;
    stim[39] = 23'h5576e4;
    stim[40] = 23'h558e2a;
    stim[41] = 23'h623f1e;
    stim[42] = 23'h5e0046;
    stim[43] = 23'h7ee41d;
    stim[44] = 23'h3744fb;
    stim[45] = 23'h6b1c74;
    stim[46] = 23'h6a8363;
    stim[47] = 23'h2f119a;
    stim[48] = 23'h716f85;
    stim[49] = 23'h698272;
    stim[50] = 23'h2b4f4c;
    stim[51] = 23'h16944c;
    stim[52] = 23'h1cc742;
    stim[53] = 23'h777e4e;
    stim[54] = 23'h6b3cc4;
    stim[55] = 23'h137174;
    stim[56] = 23'h04320e;
    stim[57] = 23'h69cac9;
    stim[58] = 23'h23f8e6;
    stim[59] = 23'h6fbe80;
    stim[60] = 23'h0235dd;
    stim[61] = 23'h2219c8;
    stim[62] = 23'h4731ac;
    stim[63] = 23'h4ff131;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h03;
      expv[3] = 5'h00;
      expv[4] = 5'h01;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h01;
      expv[8] = 5'h01;
      expv[9] = 5'h00;
      expv[10] = 5'h02;
      expv[11] = 5'h02;
      expv[12] = 5'h01;
      expv[13] = 5'h00;
      expv[14] = 5'h01;
      expv[15] = 5'h01;
      expv[16] = 5'h03;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h02;
      expv[21] = 5'h00;
      expv[22] = 5'h01;
      expv[23] = 5'h01;
      expv[24] = 5'h02;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h02;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h01;
      expv[31] = 5'h01;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h01;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h01;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h01;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h01;
      expv[51] = 5'h02;
      expv[52] = 5'h02;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h02;
      expv[56] = 5'h04;
      expv[57] = 5'h00;
      expv[58] = 5'h01;
      expv[59] = 5'h00;
      expv[60] = 5'h05;
      expv[61] = 5'h01;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
