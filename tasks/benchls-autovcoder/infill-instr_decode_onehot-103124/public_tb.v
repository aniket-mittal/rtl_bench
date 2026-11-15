// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103124 dut (
    .IRin(in_vec[37:6]),
    .Gra(in_vec[5:5]),
    .Grb(in_vec[4:4]),
    .Grc(in_vec[3:3]),
    .Rin(in_vec[2:2]),
    .Rout(in_vec[1:1]),
    .BAout(in_vec[0:0]),
    .opcode(out_vec[68:64]),
    .regin(out_vec[63:48]),
    .regout(out_vec[47:32]),
    .C_sign_extended(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h24d3b2c1f5;
    stim[1] = 38'h0ebd8e2b22;
    stim[2] = 38'h22ccf3955d;
    stim[3] = 38'h1f65d61d04;
    stim[4] = 38'h099e470b18;
    stim[5] = 38'h0ab8e91243;
    stim[6] = 38'h0d0fd9ac7b;
    stim[7] = 38'h2a7f6cf414;
    stim[8] = 38'h25057262e6;
    stim[9] = 38'h0c191fc5ae;
    stim[10] = 38'h198d4ecd2f;
    stim[11] = 38'h1345999b06;
    stim[12] = 38'h051650025d;
    stim[13] = 38'h0136dcd86a;
    stim[14] = 38'h3166f9c003;
    stim[15] = 38'h02d1f810e6;
    stim[16] = 38'h1ec5b1604f;
    stim[17] = 38'h01968fea7b;
    stim[18] = 38'h32eeb073dc;
    stim[19] = 38'h269b3aa39e;
    stim[20] = 38'h1d7ad23201;
    stim[21] = 38'h1fa91382b7;
    stim[22] = 38'h1ad5bd9a55;
    stim[23] = 38'h2f92512f0a;
    stim[24] = 38'h03055bb0dc;
    stim[25] = 38'h3c1b914cbc;
    stim[26] = 38'h1803ca53fa;
    stim[27] = 38'h013e45d9b3;
    stim[28] = 38'h2e57d97a19;
    stim[29] = 38'h26603f5e62;
    stim[30] = 38'h2df0557239;
    stim[31] = 38'h1e0795e245;
    stim[32] = 38'h214bb948c0;
    stim[33] = 38'h211ec66a2d;
    stim[34] = 38'h3023c8435a;
    stim[35] = 38'h046d13d740;
    stim[36] = 38'h175ce88ec5;
    stim[37] = 38'h3735010297;
    stim[38] = 38'h35ecade72c;
    stim[39] = 38'h2f52760561;
    stim[40] = 38'h1605730998;
    stim[41] = 38'h13861535e0;
    stim[42] = 38'h3b9cae8e62;
    stim[43] = 38'h399739ad02;
    stim[44] = 38'h20898444b4;
    stim[45] = 38'h1466f3445a;
    stim[46] = 38'h236f710246;
    stim[47] = 38'h1cc7846fb9;
    stim[48] = 38'h0060aed9a7;
    stim[49] = 38'h2c869b1b96;
    stim[50] = 38'h2723baebd0;
    stim[51] = 38'h09d9d3488b;
    stim[52] = 38'h0dfe674300;
    stim[53] = 38'h15865a3e32;
    stim[54] = 38'h27ceed290d;
    stim[55] = 38'h3a60a4f8d2;
    stim[56] = 38'h35cd03c421;
    stim[57] = 38'h0d9c405a6c;
    stim[58] = 38'h03b19ecfb0;
    stim[59] = 38'h0294d170ca;
    stim[60] = 38'h0e5d375a22;
    stim[61] = 38'h3956094cdc;
    stim[62] = 38'h105148524b;
    stim[63] = 38'h3a24eaa04e;
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
      expv[0] = 69'h1280008000fffecb07;
      expv[1] = 69'h0700000020fffe38ac;
      expv[2] = 69'h11008000800003ce55;
      expv[3] = 69'h0f00010000ffff5874;
      expv[4] = 69'h040000000000011c2c;
      expv[5] = 69'h05000000010003a449;
      expv[6] = 69'h0600008000ffff66b1;
      expv[7] = 69'h1580000000fffdb3d0;
      expv[8] = 69'h1201000100fffdc98b;
      expv[9] = 69'h0601000100fffc7f16;
      expv[10] = 69'h0c40004000fffd3b34;
      expv[11] = 69'h0900010001fffe666c;
      expv[12] = 69'h020800080000014009;
      expv[13] = 69'h000000800000037361;
      expv[14] = 69'h18000000010003e700;
      expv[15] = 69'h0100400040ffffe043;
      expv[16] = 69'h0f20002000fffec581;
      expv[17] = 69'h000000800000023fa9;
      expv[18] = 69'h19008000000002c1cf;
      expv[19] = 69'h1320002000fffcea8e;
      expv[20] = 69'h0e00000001000348c8;
      expv[21] = 69'h0f20002000fffc4e0a;
      expv[22] = 69'h0d04000400fffef669;
      expv[23] = 69'h1700000004000144bc;
      expv[24] = 69'h0104000000fffd6ec3;
      expv[25] = 69'h1e20000000fffe4532;
      expv[26] = 69'h0c00008000ffff294f;
      expv[27] = 69'h000000800000011766;
      expv[28] = 69'h1700008000ffff65e8;
      expv[29] = 69'h13000000080000fd79;
      expv[30] = 69'h1600008000000155c8;
      expv[31] = 69'h0f00010001fffe5789;
      expv[32] = 69'h1000000000fffee523;
      expv[33] = 69'h1040004000000319a8;
      expv[34] = 69'h1800008000ffff210d;
      expv[35] = 69'h0200000000fffc4f5d;
      expv[36] = 69'h0b000100010003a23b;
      expv[37] = 69'h1b04000400fffc040a;
      expv[38] = 69'h1a800000000002b79c;
      expv[39] = 69'h17000004000001d815;
      expv[40] = 69'h0b00000000fffdcc26;
      expv[41] = 69'h0900000000000054d7;
      expv[42] = 69'h1d000010000002ba39;
      expv[43] = 69'h1c00000001fffce6b4;
      expv[44] = 69'h1000100000fffe1112;
      expv[45] = 69'h0a000000800003cd11;
      expv[46] = 69'h1100010001fffdc409;
      expv[47] = 69'h0e00008000fffe11be;
      expv[48] = 69'h00000800080002bb66;
      expv[49] = 69'h160008000800026c6e;
      expv[50] = 69'h1300000000fffeebaf;
      expv[51] = 69'h0400004000ffff4d22;
      expv[52] = 69'h060000000000019d0c;
      expv[53] = 69'h0a00008000000168f8;
      expv[54] = 69'h13008000800003b4a4;
      expv[55] = 69'h1d00000001000293e3;
      expv[56] = 69'h1a00004000fffc0f10;
      expv[57] = 69'h064000000000010169;
      expv[58] = 69'h0100000000fffe7b3e;
      expv[59] = 69'h0100000040000345c3;
      expv[60] = 69'h0700000004fffcdd68;
      expv[61] = 69'h1c0800000000002533;
      expv[62] = 69'h0800000400fffd2149;
      expv[63] = 69'h1d008000800003aa81;
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
