// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132938 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .sub(in_vec[0:0]),
    .result(out_vec[32:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1791c90189c546324;
    stim[1] = 65'h169f7efb0445a5cdd;
    stim[2] = 65'h19fb3901ba521c522;
    stim[3] = 65'h00796a6bdf81b4c37;
    stim[4] = 65'h1c40ab91540c0a289;
    stim[5] = 65'h1e1966ccbb40fe241;
    stim[6] = 65'h0473c1e3edfedd2ec;
    stim[7] = 65'h12598502ea3c8cd43;
    stim[8] = 65'h17680816327550bcd;
    stim[9] = 65'h05088b15e0863a2df;
    stim[10] = 65'h0c0d4ea0af21d0df1;
    stim[11] = 65'h04773e1daba26979f;
    stim[12] = 65'h0d052e17c8deda350;
    stim[13] = 65'h0997b0cce84c1ce8c;
    stim[14] = 65'h01d5cf626aaf53151;
    stim[15] = 65'h06b5b954f9ce48558;
    stim[16] = 65'h152b867a8c33b33c3;
    stim[17] = 65'h0aa4df1c44fdde131;
    stim[18] = 65'h193705f7247033ca2;
    stim[19] = 65'h19b97077766c4474a;
    stim[20] = 65'h15aa9f2f625c719dc;
    stim[21] = 65'h1b01e37d711f93b1a;
    stim[22] = 65'h13f811b23713abb0b;
    stim[23] = 65'h12779d8f9e27e6747;
    stim[24] = 65'h0663e34d41519bd7d;
    stim[25] = 65'h0cba3e6d5f757d8c4;
    stim[26] = 65'h12a9771e128da2c83;
    stim[27] = 65'h194311b962fc5d255;
    stim[28] = 65'h0294ed9c39203fd73;
    stim[29] = 65'h115a9ed526adf6807;
    stim[30] = 65'h12290a5d26d5455e5;
    stim[31] = 65'h112eebc0c24589234;
    stim[32] = 65'h0e9244ee0121545c9;
    stim[33] = 65'h0bddbbaa0d154c393;
    stim[34] = 65'h1b62086e9bb12f1ad;
    stim[35] = 65'h12b1d82a57fc28572;
    stim[36] = 65'h1f533e058fb3bf431;
    stim[37] = 65'h1e8ea7ae2470c3463;
    stim[38] = 65'h034dc2def99ab4d48;
    stim[39] = 65'h093a124f0b18b0cf1;
    stim[40] = 65'h0cc371e1d662704d5;
    stim[41] = 65'h1129997f4a898e408;
    stim[42] = 65'h0d88371889f052ba7;
    stim[43] = 65'h109ccd52a7f5d22b8;
    stim[44] = 65'h14fe0ca8f32395195;
    stim[45] = 65'h131de053d86e01568;
    stim[46] = 65'h15d550b0aab1f5d33;
    stim[47] = 65'h0a7cdc2df4695d715;
    stim[48] = 65'h0b26c54714778c3b3;
    stim[49] = 65'h09978660590d99c21;
    stim[50] = 65'h07e7a855ca0157319;
    stim[51] = 65'h0de78518ae02d3e64;
    stim[52] = 65'h0121012a3e3861cce;
    stim[53] = 65'h167dcc95019c11c46;
    stim[54] = 65'h0081046ba32e9278c;
    stim[55] = 65'h14dec276787a5c952;
    stim[56] = 65'h03218dc761bbdf07a;
    stim[57] = 65'h071158c7f22299216;
    stim[58] = 65'h096fad9a86320810f;
    stim[59] = 65'h17bf11e2e4d9068f8;
    stim[60] = 65'h062a145fd81166ab0;
    stim[61] = 65'h07b54865bb439fc29;
    stim[62] = 65'h10b4e4a4ba59f67e3;
    stim[63] = 65'h1246c0fd186295f02;
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
      expv[0] = 33'h01570f33d;
      expv[1] = 33'h1259d92d5;
      expv[2] = 33'h144d5553d;
      expv[3] = 33'h00f7b5a86;
      expv[4] = 33'h0834a168d;
      expv[5] = 33'h02d868a8b;
      expv[6] = 33'h12729f12a;
      expv[7] = 33'h081cf82ed;
      expv[8] = 33'h04f2b7597;
      expv[9] = 33'h048250e81;
      expv[10] = 33'h1ceb7dc1a;
      expv[11] = 33'h18d4d4a3c;
      expv[12] = 33'h15e4084cc;
      expv[13] = 33'h11e3cdb5a;
      expv[14] = 33'h17267c4d6;
      expv[15] = 33'h008401aa7;
      expv[16] = 33'h08f7d33e7;
      expv[17] = 33'h05a701095;
      expv[18] = 33'h1da739c14;
      expv[19] = 33'h1025b4ec1;
      expv[20] = 33'h180710cd2;
      expv[21] = 33'h0c21772f1;
      expv[22] = 33'h1ce466018;
      expv[23] = 33'h144fb71b2;
      expv[24] = 33'h051247759;
      expv[25] = 33'h0c2fbbf99;
      expv[26] = 33'h001bd455f;
      expv[27] = 33'h1646b4943;
      expv[28] = 33'h0974adc50;
      expv[29] = 33'h0aaca854d;
      expv[30] = 33'h0b53c4fef;
      expv[31] = 33'h137474e40;
      expv[32] = 33'h0d70f0919;
      expv[33] = 33'h1ec86f70e;
      expv[34] = 33'h1fb0d953c;
      expv[35] = 33'h0aae00817;
      expv[36] = 33'h0f9f7ec29;
      expv[37] = 33'h1a1de4681;
      expv[38] = 33'h1ce877b36;
      expv[39] = 33'h1e2161800;
      expv[40] = 33'h166101948;
      expv[41] = 33'h1bb327bfc;
      expv[42] = 33'h0397e45e3;
      expv[43] = 33'h18929f7e2;
      expv[44] = 33'h01da778fb;
      expv[45] = 33'h0b8be1aa5;
      expv[46] = 33'h0b235add9;
      expv[47] = 33'h16137ebca;
      expv[48] = 33'h16af390be;
      expv[49] = 33'h1089ec9e4;
      expv[50] = 33'h1de651244;
      expv[51] = 33'h1bea58fee;
      expv[52] = 33'h1f5962f70;
      expv[53] = 33'h1819de596;
      expv[54] = 33'h03af96e46;
      expv[55] = 33'h0d591f0b9;
      expv[56] = 33'h04dd6ccf0;
      expv[57] = 33'h1933f1e94;
      expv[58] = 33'h033da589b;
      expv[59] = 33'h1c9818726;
      expv[60] = 33'h1e3b7b0ac;
      expv[61] = 33'h0c71a8a32;
      expv[62] = 33'h165aee268;
      expv[63] = 33'h0aa956ed3;
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
