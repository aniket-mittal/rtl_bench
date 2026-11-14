// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06501 dut (
    .activate_0r(in_vec[34:34]),
    .inp_0a(in_vec[33:33]),
    .inp_0d(in_vec[32:1]),
    .out_0a(in_vec[0:0]),
    .activate_0a(out_vec[34:34]),
    .inp_0r(out_vec[33:33]),
    .out_0r(out_vec[32:32]),
    .out_0d(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h3dd38c756;
    stim[1] = 35'h3d6321dee;
    stim[2] = 35'h21b1cb7b7;
    stim[3] = 35'h5fafc10d6;
    stim[4] = 35'h296fe1882;
    stim[5] = 35'h11225e617;
    stim[6] = 35'h3b1487dd4;
    stim[7] = 35'h17689ac9e;
    stim[8] = 35'h4c8b93d87;
    stim[9] = 35'h59b1f43ea;
    stim[10] = 35'h4c4b552a6;
    stim[11] = 35'h30b470d93;
    stim[12] = 35'h3721f396f;
    stim[13] = 35'h5809151ef;
    stim[14] = 35'h3503c3496;
    stim[15] = 35'h6f9666eaf;
    stim[16] = 35'h1b2054982;
    stim[17] = 35'h6e70f6878;
    stim[18] = 35'h5f0728348;
    stim[19] = 35'h1cb823599;
    stim[20] = 35'h4b67fe172;
    stim[21] = 35'h363f1397b;
    stim[22] = 35'h52191582a;
    stim[23] = 35'h0046f3ca1;
    stim[24] = 35'h5aacdc365;
    stim[25] = 35'h033f63e2d;
    stim[26] = 35'h3f0429ac0;
    stim[27] = 35'h06a79b729;
    stim[28] = 35'h55b04a6b7;
    stim[29] = 35'h6cb0260e8;
    stim[30] = 35'h71d89d5b3;
    stim[31] = 35'h7e23653ee;
    stim[32] = 35'h088be4616;
    stim[33] = 35'h729e4fa3a;
    stim[34] = 35'h6c2f6fd9f;
    stim[35] = 35'h7b338a8ad;
    stim[36] = 35'h23c861f79;
    stim[37] = 35'h70bb0699f;
    stim[38] = 35'h7a846b9db;
    stim[39] = 35'h31fc5284f;
    stim[40] = 35'h35c1064f8;
    stim[41] = 35'h09ed5477d;
    stim[42] = 35'h1bfa90f18;
    stim[43] = 35'h06cd29079;
    stim[44] = 35'h6cc4847c4;
    stim[45] = 35'h2e4e5e3ce;
    stim[46] = 35'h33f0d133a;
    stim[47] = 35'h1a8bdb7b1;
    stim[48] = 35'h418794086;
    stim[49] = 35'h1a2316b55;
    stim[50] = 35'h60973f34e;
    stim[51] = 35'h20471e583;
    stim[52] = 35'h77419fb1e;
    stim[53] = 35'h49683339c;
    stim[54] = 35'h6f77be1e2;
    stim[55] = 35'h656b53ed9;
    stim[56] = 35'h077abeccd;
    stim[57] = 35'h268cc02ea;
    stim[58] = 35'h43bb6e44a;
    stim[59] = 35'h192d7cb2a;
    stim[60] = 35'h5bc1b8cb4;
    stim[61] = 35'h44160afb6;
    stim[62] = 35'h1db9586a9;
    stim[63] = 35'h7fea495ef;
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
      expv[0] = 35'h1ee9c63ab;
      expv[1] = 35'h1eb190ef7;
      expv[2] = 35'h50d8e5bdb;
      expv[3] = 35'h2fd7e086b;
      expv[4] = 35'h14b7f0c41;
      expv[5] = 35'h48912f30b;
      expv[6] = 35'h1d8a43eea;
      expv[7] = 35'h0bb44d64f;
      expv[8] = 35'h6645c9ec3;
      expv[9] = 35'h2cd8fa1f5;
      expv[10] = 35'h2625aa953;
      expv[11] = 35'h585a386c9;
      expv[12] = 35'h5b90f9cb7;
      expv[13] = 35'h6c048a8f7;
      expv[14] = 35'h1a81e1a4b;
      expv[15] = 35'h77cb33757;
      expv[16] = 35'h0d902a4c1;
      expv[17] = 35'h37387b43c;
      expv[18] = 35'h2f83941a4;
      expv[19] = 35'h4e5c11acc;
      expv[20] = 35'h25b3ff0b9;
      expv[21] = 35'h5b1f89cbd;
      expv[22] = 35'h290c8ac15;
      expv[23] = 35'h402379e50;
      expv[24] = 35'h6d566e1b2;
      expv[25] = 35'h419fb1f16;
      expv[26] = 35'h1f8214d60;
      expv[27] = 35'h4353cdb94;
      expv[28] = 35'h6ad82535b;
      expv[29] = 35'h365813074;
      expv[30] = 35'h78ec4ead9;
      expv[31] = 35'h3f11b29f7;
      expv[32] = 35'h0445f230b;
      expv[33] = 35'h394f27d1d;
      expv[34] = 35'h7617b7ecf;
      expv[35] = 35'h7d99c5456;
      expv[36] = 35'h51e430fbc;
      expv[37] = 35'h785d834cf;
      expv[38] = 35'h7d4235ced;
      expv[39] = 35'h58fe29427;
      expv[40] = 35'h1ae08327c;
      expv[41] = 35'h44f6aa3be;
      expv[42] = 35'h0dfd4878c;
      expv[43] = 35'h43669483c;
      expv[44] = 35'h3662423e2;
      expv[45] = 35'h17272f1e7;
      expv[46] = 35'h19f86899d;
      expv[47] = 35'h4d45edbd8;
      expv[48] = 35'h20c3ca043;
      expv[49] = 35'h4d118b5aa;
      expv[50] = 35'h304b9f9a7;
      expv[51] = 35'h50238f2c1;
      expv[52] = 35'h3ba0cfd8f;
      expv[53] = 35'h24b4199ce;
      expv[54] = 35'h37bbdf0f1;
      expv[55] = 35'h72b5a9f6c;
      expv[56] = 35'h43bd5f666;
      expv[57] = 35'h134660175;
      expv[58] = 35'h21ddb7225;
      expv[59] = 35'h0c96be595;
      expv[60] = 35'h2de0dc65a;
      expv[61] = 35'h220b057db;
      expv[62] = 35'h4edcac354;
      expv[63] = 35'h7ff524af7;
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
