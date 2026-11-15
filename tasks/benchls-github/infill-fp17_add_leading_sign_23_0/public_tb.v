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

  FP17_ADD_leading_sign_23_0 dut (
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
    stim[0] = 23'h041b20;
    stim[1] = 23'h52d1ec;
    stim[2] = 23'h34fd0a;
    stim[3] = 23'h19d23c;
    stim[4] = 23'h66536c;
    stim[5] = 23'h63d1cd;
    stim[6] = 23'h5d176d;
    stim[7] = 23'h28e081;
    stim[8] = 23'h5a87e1;
    stim[9] = 23'h51c015;
    stim[10] = 23'h21d5f1;
    stim[11] = 23'h768e0a;
    stim[12] = 23'h32a15d;
    stim[13] = 23'h7903ef;
    stim[14] = 23'h630cb8;
    stim[15] = 23'h71a799;
    stim[16] = 23'h370ee1;
    stim[17] = 23'h682c60;
    stim[18] = 23'h25d8be;
    stim[19] = 23'h0b6c96;
    stim[20] = 23'h6a8f5c;
    stim[21] = 23'h1c7f56;
    stim[22] = 23'h3b48de;
    stim[23] = 23'h4cad72;
    stim[24] = 23'h7ea18f;
    stim[25] = 23'h34d2c2;
    stim[26] = 23'h154176;
    stim[27] = 23'h3933d6;
    stim[28] = 23'h07dee5;
    stim[29] = 23'h5baa06;
    stim[30] = 23'h665272;
    stim[31] = 23'h501a09;
    stim[32] = 23'h447983;
    stim[33] = 23'h3ed600;
    stim[34] = 23'h32d29e;
    stim[35] = 23'h2bb20d;
    stim[36] = 23'h3a3536;
    stim[37] = 23'h56ba11;
    stim[38] = 23'h118acb;
    stim[39] = 23'h76dc06;
    stim[40] = 23'h0d2001;
    stim[41] = 23'h3cd4dc;
    stim[42] = 23'h2bfcbf;
    stim[43] = 23'h4e1fbb;
    stim[44] = 23'h4c04e4;
    stim[45] = 23'h34224c;
    stim[46] = 23'h07a941;
    stim[47] = 23'h655986;
    stim[48] = 23'h2f9899;
    stim[49] = 23'h41bd57;
    stim[50] = 23'h185aee;
    stim[51] = 23'h1d69b5;
    stim[52] = 23'h696433;
    stim[53] = 23'h0b2a8f;
    stim[54] = 23'h0e5bc8;
    stim[55] = 23'h64ebf6;
    stim[56] = 23'h141f52;
    stim[57] = 23'h7943d0;
    stim[58] = 23'h279267;
    stim[59] = 23'h25c2d2;
    stim[60] = 23'h1a6151;
    stim[61] = 23'h76322a;
    stim[62] = 23'h36d625;
    stim[63] = 23'h011f53;
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
      expv[0] = 5'h04;
      expv[1] = 5'h00;
      expv[2] = 5'h01;
      expv[3] = 5'h02;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h01;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h01;
      expv[11] = 5'h00;
      expv[12] = 5'h01;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h01;
      expv[17] = 5'h00;
      expv[18] = 5'h01;
      expv[19] = 5'h03;
      expv[20] = 5'h00;
      expv[21] = 5'h02;
      expv[22] = 5'h01;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h01;
      expv[26] = 5'h02;
      expv[27] = 5'h01;
      expv[28] = 5'h04;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h01;
      expv[34] = 5'h01;
      expv[35] = 5'h01;
      expv[36] = 5'h01;
      expv[37] = 5'h00;
      expv[38] = 5'h02;
      expv[39] = 5'h00;
      expv[40] = 5'h03;
      expv[41] = 5'h01;
      expv[42] = 5'h01;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h01;
      expv[46] = 5'h04;
      expv[47] = 5'h00;
      expv[48] = 5'h01;
      expv[49] = 5'h00;
      expv[50] = 5'h02;
      expv[51] = 5'h02;
      expv[52] = 5'h00;
      expv[53] = 5'h03;
      expv[54] = 5'h03;
      expv[55] = 5'h00;
      expv[56] = 5'h02;
      expv[57] = 5'h00;
      expv[58] = 5'h01;
      expv[59] = 5'h01;
      expv[60] = 5'h02;
      expv[61] = 5'h00;
      expv[62] = 5'h01;
      expv[63] = 5'h06;
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
