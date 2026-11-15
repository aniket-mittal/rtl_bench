// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151823 dut (
    .clk(clk),
    .reset(in_vec[52:52]),
    .we(in_vec[51:51]),
    .ExcEnter(in_vec[50:50]),
    .Din(in_vec[49:18]),
    .CP0Index(in_vec[17:13]),
    .ExcCode(in_vec[12:8]),
    .HWInt(in_vec[7:0]),
    .DOut(out_vec[72:41]),
    .EPC(out_vec[40:9]),
    .SR_IM(out_vec[8:1]),
    .SR_IE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h12822d47912cd2;
    stim[1] = 53'h19a08562da3e00;
    stim[2] = 53'h0f0ce7abdf7932;
    stim[3] = 53'h01d187a59fd35a;
    stim[4] = 53'h08872b2cef968c;
    stim[5] = 53'h0b7cd18d86c816;
    stim[6] = 53'h078e136d911867;
    stim[7] = 53'h0565b2670cbe66;
    stim[8] = 53'h0824c7f43544a7;
    stim[9] = 53'h0822605096b587;
    stim[10] = 53'h062c32bb057281;
    stim[11] = 53'h0b0c1f7ca47495;
    stim[12] = 53'h0ddc5573675fe0;
    stim[13] = 53'h0290ff3a99bd14;
    stim[14] = 53'h0121e826b3d172;
    stim[15] = 53'h0953d6e6cbac41;
    stim[16] = 53'h1d6cb86906cc75;
    stim[17] = 53'h0f0bdada523aff;
    stim[18] = 53'h0b7a19e5b191ee;
    stim[19] = 53'h04f252ed31204d;
    stim[20] = 53'h1834e35be54e6c;
    stim[21] = 53'h0089b7afbeac6d;
    stim[22] = 53'h09c0e485507d59;
    stim[23] = 53'h00150aa0e44c01;
    stim[24] = 53'h0cb7bf0a63a3e6;
    stim[25] = 53'h085aa976706005;
    stim[26] = 53'h08b932262cdaea;
    stim[27] = 53'h0e2c44257ac0de;
    stim[28] = 53'h0dfc34c8d1b1d9;
    stim[29] = 53'h0c5bbd38b9dfca;
    stim[30] = 53'h013c7eb538b0ec;
    stim[31] = 53'h07ff1129c6487a;
    stim[32] = 53'h06bec15e87e870;
    stim[33] = 53'h0cef11fffd63e9;
    stim[34] = 53'h0dfb4c296248ed;
    stim[35] = 53'h0afa01cbb7a63a;
    stim[36] = 53'h0d20cec0d969c6;
    stim[37] = 53'h07a7100d2164a2;
    stim[38] = 53'h0b469fa1d86f97;
    stim[39] = 53'h07509f0354ce64;
    stim[40] = 53'h045cda027b271c;
    stim[41] = 53'h077ca8c3d56906;
    stim[42] = 53'h00c33e9618981d;
    stim[43] = 53'h09f2e3f634ad42;
    stim[44] = 53'h09d796539c7235;
    stim[45] = 53'h098e0b876f02b9;
    stim[46] = 53'h00a39f1597dcc7;
    stim[47] = 53'h06ec96b20aa112;
    stim[48] = 53'h0407ab0e4fa00c;
    stim[49] = 53'h0af673ea74def9;
    stim[50] = 53'h0c30ae41ee31fe;
    stim[51] = 53'h0bcd34fc50b61c;
    stim[52] = 53'h0deb9dcbebc325;
    stim[53] = 53'h0294e4c58d5ac4;
    stim[54] = 53'h0c3e3bf51d42ed;
    stim[55] = 53'h033f6f4fe217c5;
    stim[56] = 53'h082f202bda08b3;
    stim[57] = 53'h00a4aae76ce49a;
    stim[58] = 53'h04023227946e5f;
    stim[59] = 53'h0555835e47bc6c;
    stim[60] = 53'h0d4289d521aa80;
    stim[61] = 53'h015acd48805abc;
    stim[62] = 53'h005cbfefb62aec;
    stim[63] = 53'h0c78787afee017;
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
      expv[0] = 73'h00000000xxxxxxxxxff;
      expv[1] = 73'h00000000xxxxxxxxxff;
      expv[2] = 73'h00000000xxxxxxxxxff;
      expv[3] = 73'h0000000018673d5ee00;
      expv[4] = 73'h0000000018673d5ee00;
      expv[5] = 73'h0000000018673d5ee00;
      expv[6] = 73'h0000000018673d5ee00;
      expv[7] = 73'h000000001c709b6c800;
      expv[8] = 73'h000000000b2d9338600;
      expv[9] = 73'h000000000b2d9338600;
      expv[10] = 73'h000000000b2d9338600;
      expv[11] = 73'h00000000116195d8200;
      expv[12] = 73'h00000000116195d8200;
      expv[13] = 73'h000003fc0ee2ab9b200;
      expv[14] = 73'h000000000ee2ab9b200;
      expv[15] = 73'h000000000ee2ab9b200;
      expv[16] = 73'h000000000ee2ab9b3ff;
      expv[17] = 73'h000000000ee2ab9b3ff;
      expv[18] = 73'h00000000185ed6d2800;
      expv[19] = 73'h00000000185ed6d28f2;
      expv[20] = 73'h00000000079297699ff;
      expv[21] = 73'h00000000079297699ff;
      expv[22] = 73'h00000000079297699ff;
      expv[23] = 73'h00000000079297699ff;
      expv[24] = 73'h00000000079297699ff;
      expv[25] = 73'h0000000005bdf853000;
      expv[26] = 73'h0000000005bdf853000;
      expv[27] = 73'h0000000005bdf853000;
      expv[28] = 73'h0000001bd162212bc00;
      expv[29] = 73'h0fe1a6468fe1a646800;
      expv[30] = 73'h0000000002dde9c5c00;
      expv[31] = 73'h0000000002dde9c5c00;
      expv[32] = 73'h000000001ff8894e200;
      expv[33] = 73'h0000000015f60af4200;
      expv[34] = 73'h0000000007788fffe00;
      expv[35] = 73'h000000000fda614b000;
      expv[36] = 73'h000000000fda614b000;
      expv[37] = 73'h0000000009067606c00;
      expv[38] = 73'h000000001d388069000;
      expv[39] = 73'h000000001d388069000;
      expv[40] = 73'h000000001a84f81aa00;
      expv[41] = 73'h0000000002e6d013c00;
      expv[42] = 73'h000000001be5461ea00;
      expv[43] = 73'h000000001be5461ea00;
      expv[44] = 73'h000000001be5461ea00;
      expv[45] = 73'h000000001be5461ea00;
      expv[46] = 73'h000000001be5461ea00;
      expv[47] = 73'h000000001be5461ea00;
      expv[48] = 73'h000000001764b590400;
      expv[49] = 73'h00000000003d5872600;
      expv[50] = 73'h00000000003d5872600;
      expv[51] = 73'h000000000185720f600;
      expv[52] = 73'h000000000185720f600;
      expv[53] = 73'h000000000f5cee5f400;
      expv[54] = 73'h000000000f5cee5f400;
      expv[55] = 73'h0000000001f1dfa8e00;
      expv[56] = 73'h0000000001f1dfa8e00;
      expv[57] = 73'h0000000001f1dfa8e00;
      expv[58] = 73'h0000000001f1dfa8e00;
      expv[59] = 73'h000000000011913ca00;
      expv[60] = 73'h0000038d8aac1af2200;
      expv[61] = 73'h000000000a144ea9000;
      expv[62] = 73'h000000000a144ea9000;
      expv[63] = 73'h000000000a144ea9000;
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
