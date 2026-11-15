// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104339 dut (
    .A(in_vec[36:5]),
    .cnt(in_vec[4:0]),
    .B(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1d164663c3;
    stim[1] = 37'h1d7dfc8297;
    stim[2] = 37'h0b4abe031d;
    stim[3] = 37'h1430ee561c;
    stim[4] = 37'h176d96849b;
    stim[5] = 37'h167179b2ce;
    stim[6] = 37'h1adb7d4bd1;
    stim[7] = 37'h0bf5720f6b;
    stim[8] = 37'h0679dd9214;
    stim[9] = 37'h07eb98005c;
    stim[10] = 37'h1543ad0f06;
    stim[11] = 37'h02d7c532ba;
    stim[12] = 37'h0837485ee6;
    stim[13] = 37'h16d2c799b5;
    stim[14] = 37'h0276079667;
    stim[15] = 37'h04c068e0d3;
    stim[16] = 37'h14f2a4c885;
    stim[17] = 37'h1fa7c881f4;
    stim[18] = 37'h12dbaa61f3;
    stim[19] = 37'h0ad6131aa3;
    stim[20] = 37'h199b00f891;
    stim[21] = 37'h08d7ee447c;
    stim[22] = 37'h0b0cb5e02f;
    stim[23] = 37'h0fa998ff1f;
    stim[24] = 37'h00c1e382fd;
    stim[25] = 37'h1dd90d5132;
    stim[26] = 37'h12e6a771bd;
    stim[27] = 37'h06ba54bc47;
    stim[28] = 37'h0c5963f709;
    stim[29] = 37'h1d925b2939;
    stim[30] = 37'h11542cbe82;
    stim[31] = 37'h0fed5c6f29;
    stim[32] = 37'h0c6d8edf07;
    stim[33] = 37'h1f5fe65cf5;
    stim[34] = 37'h15b2ba6fce;
    stim[35] = 37'h16b5885133;
    stim[36] = 37'h1b0670c64d;
    stim[37] = 37'h1259ddb376;
    stim[38] = 37'h0f247b3098;
    stim[39] = 37'h0f691c3021;
    stim[40] = 37'h134a8fe819;
    stim[41] = 37'h1f6693543b;
    stim[42] = 37'h06af54b983;
    stim[43] = 37'h1014d81989;
    stim[44] = 37'h070807ec58;
    stim[45] = 37'h08a2213f49;
    stim[46] = 37'h13bc0d1b03;
    stim[47] = 37'h1f61b389bd;
    stim[48] = 37'h05ce073afd;
    stim[49] = 37'h0f5cd3f603;
    stim[50] = 37'h15bb6f9a9a;
    stim[51] = 37'h075b25a882;
    stim[52] = 37'h060424caea;
    stim[53] = 37'h0fc3d81941;
    stim[54] = 37'h0435c5d06f;
    stim[55] = 37'h07f29d321f;
    stim[56] = 37'h15caf4aac3;
    stim[57] = 37'h191545ef0d;
    stim[58] = 37'h141f22a13c;
    stim[59] = 37'h099ec7bf8c;
    stim[60] = 37'h0e885442bd;
    stim[61] = 37'h08289f4e04;
    stim[62] = 37'h1f7300cd2b;
    stim[63] = 37'h15cdf07f73;
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
      expv[0] = 32'h1d164663;
      expv[1] = 32'h000001d7;
      expv[2] = 32'h00000002;
      expv[3] = 32'h0000000a;
      expv[4] = 32'h00000017;
      expv[5] = 32'h0002ce2f;
      expv[6] = 32'h00006b6d;
      expv[7] = 32'h000bf572;
      expv[8] = 32'h0000033c;
      expv[9] = 32'h00000003;
      expv[10] = 32'h02a875a1;
      expv[11] = 32'h00000005;
      expv[12] = 32'h0106e90b;
      expv[13] = 32'h000005b4;
      expv[14] = 32'h00276079;
      expv[15] = 32'h000004c0;
      expv[16] = 32'h053ca932;
      expv[17] = 32'h00000fd3;
      expv[18] = 32'h000012db;
      expv[19] = 32'h0ad6131a;
      expv[20] = 32'h0000666c;
      expv[21] = 32'h00000004;
      expv[22] = 32'h0000b0cb;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00003bb2;
      expv[26] = 32'h00000004;
      expv[27] = 32'h006ba54b;
      expv[28] = 32'h0031658f;
      expv[29] = 32'h00000076;
      expv[30] = 32'h22a8597d;
      expv[31] = 32'h003fb571;
      expv[32] = 32'h00c6d8ed;
      expv[33] = 32'h000007d7;
      expv[34] = 32'h0002b657;
      expv[35] = 32'h000016b5;
      expv[36] = 32'h0006c19c;
      expv[37] = 32'h0000024b;
      expv[38] = 32'h00000079;
      expv[39] = 32'h3da470c0;
      expv[40] = 32'h0000004d;
      expv[41] = 32'h0000001f;
      expv[42] = 32'h06af54b9;
      expv[43] = 32'h00405360;
      expv[44] = 32'h00000038;
      expv[45] = 32'h00228884;
      expv[46] = 32'h13bc0d1b;
      expv[47] = 32'h00000007;
      expv[48] = 32'h00000007;
      expv[49] = 32'h0f5cd3f6;
      expv[50] = 32'h0000002b;
      expv[51] = 32'h0eb64b51;
      expv[52] = 32'h000c0849;
      expv[53] = 32'h3f0f6065;
      expv[54] = 32'h0000435c;
      expv[55] = 32'h00000000;
      expv[56] = 32'h15caf4aa;
      expv[57] = 32'h00064551;
      expv[58] = 32'h0000000a;
      expv[59] = 32'h0004cf63;
      expv[60] = 32'h00000003;
      expv[61] = 32'h04144fa7;
      expv[62] = 32'h001f7300;
      expv[63] = 32'h000015cd;
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
