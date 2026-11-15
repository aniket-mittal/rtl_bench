// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_002264 dut (
    .rin_A(in_vec[132:101]),
    .rin_B(in_vec[100:69]),
    .ir_data(in_vec[68:37]),
    .pc(in_vec[36:5]),
    .alu_srcA(in_vec[4:4]),
    .alu_srcB(in_vec[3:2]),
    .alu_ctrl(in_vec[1:0]),
    .zero(out_vec[32:32]),
    .res(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h02f8a32da68358de9dd357dd0501bc7700;
    stim[1] = 133'h1b1d60048445bdf02344a09a885fb1c3e2;
    stim[2] = 133'h00530ff78fa837b03d4895be74f4ac2ff1;
    stim[3] = 133'h0335376453476bca8f1dd76ed98b8d0129;
    stim[4] = 133'h01bb0fb0dfa7adc6580d5f837cc6f1183e;
    stim[5] = 133'h0145da47214500f5c1398aeadcf0945fef;
    stim[6] = 133'h0c9376aed904eda9b14b2a3c16ced69a03;
    stim[7] = 133'h0b901941e413b079134fd15442980c0031;
    stim[8] = 133'h0f74f222078f0ee8c71cf8a0ff4ec476a9;
    stim[9] = 133'h1cd9143671cfbfd196a8caf41d133f4532;
    stim[10] = 133'h1b5c64cb58d44de3c5e347c9fadd26dbb2;
    stim[11] = 133'h1e35f54f97617a2abdc5c227358e99fa14;
    stim[12] = 133'h057e6d231999bfb64edd8bee090af82e24;
    stim[13] = 133'h084ee8a4bf0255fdd4cd903daf5ce0cac1;
    stim[14] = 133'h1d41e097393a3cefa0b62002f0359616c5;
    stim[15] = 133'h078128d3bcad26234b6def8d6f20742f71;
    stim[16] = 133'h09061ec4dad339d822f15fa4d77bdb4f8d;
    stim[17] = 133'h0f7b4ba176213e66b002248c834d8a5933;
    stim[18] = 133'h12eda03d07b735b3819907d5a89e8a0b92;
    stim[19] = 133'h09cc19d8ec0aca48116f5f78e5109317da;
    stim[20] = 133'h150b14629d98f6ef3d923320339595297c;
    stim[21] = 133'h0476cb7c8280de0c4c4787871d932c2d02;
    stim[22] = 133'h110b8d1831c4d13d8c8989bb6bcdce0e19;
    stim[23] = 133'h0aae2e2641a0a9395601ff941f5c0b753a;
    stim[24] = 133'h12f571d53206a7dbc9e2d70d22f6411813;
    stim[25] = 133'h1ec9582cb934eee83ea44c1bd684ff365e;
    stim[26] = 133'h0ca2a98ebd1a10fa23874aed0213d89cbb;
    stim[27] = 133'h11e6e1435d81861db97c19842461e2769b;
    stim[28] = 133'h0c131d34cb2ceedde8ee96a8d5afd8b138;
    stim[29] = 133'h12b93df94afa33343416ccda9dbc107328;
    stim[30] = 133'h0fae1725cc6bf0d30f2ef49e862d7339f0;
    stim[31] = 133'h16aac6852bd21560d94f9f4abf363a857d;
    stim[32] = 133'h1bf748ff9bdf2a67843abc21908d821f33;
    stim[33] = 133'h1f079f787bf78e2a45b5e1a55e84a041e5;
    stim[34] = 133'h1120e7184fd2c6b55c55cc6696c9651fc0;
    stim[35] = 133'h047a7fdcb68bc7aee9017d72b477bbf39b;
    stim[36] = 133'h0f068d7bdbc329d01b0504d21b4dd24999;
    stim[37] = 133'h1eb2eeafc7e8562a7a463731d389ed7a5c;
    stim[38] = 133'h0ca0f7179485c44febacaeaf9df94d6b38;
    stim[39] = 133'h006bcc87073eb9144a5be2a8e19e210028;
    stim[40] = 133'h16e71e63790b560f1a4ce00066af44dbbe;
    stim[41] = 133'h0688177abd5f7b6dd50dfa8e7a530cf282;
    stim[42] = 133'h0a3424b1885ee8289a813cd35126d1cc77;
    stim[43] = 133'h1554bf9d2377af09e6cea2328dd4f7aaee;
    stim[44] = 133'h023ac4da2ff409c94c5824cb8f682d3113;
    stim[45] = 133'h028dd353595a07e540bb24b88644f7d0c2;
    stim[46] = 133'h15b811496006267bf6608619baa729b6bc;
    stim[47] = 133'h0f12fae59a939396ae08fe170c8b05e14d;
    stim[48] = 133'h17098fc703b9911cffd154ec324714c78e;
    stim[49] = 133'h01323accf42439d5981d0db1675f79f1c1;
    stim[50] = 133'h1739eb292e408254dc3d61678022da8dd2;
    stim[51] = 133'h16b64088e96f5c26ba32c66332ee4c953b;
    stim[52] = 133'h0e0feeadef3e018acfdb51f828882316c2;
    stim[53] = 133'h10f87bdbdd1193fae2bd682809a41ffbc6;
    stim[54] = 133'h0cf6368f8fed2a3a6bbcade82b22471b21;
    stim[55] = 133'h050b8cfed0c218058222e70d570b393cc7;
    stim[56] = 133'h0a4982582b97a57495c89ccc25de842bdf;
    stim[57] = 133'h098da126028bfde36fac471fec3c99e1af;
    stim[58] = 133'h06b467efca79221e76b9e7dcb70b2628a3;
    stim[59] = 133'h1774d9a5fbd8cd65269c4ffb9341a98e8e;
    stim[60] = 133'h07b8ea3fc0758907cb389412d3160ad88a;
    stim[61] = 133'h140a3c2d094d21572e45ae094fba85db36;
    stim[62] = 133'h04dd1638319daf4c1bafb6a3eef0496a8b;
    stim[63] = 133'h196d14fda7ece7b38b609d10a187e4d8b8;
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
      expv[0] = 33'h04bdfe061;
      expv[1] = 33'h00510105a;
      expv[2] = 33'h02a63a3fe;
      expv[3] = 33'h019a9ffac;
      expv[4] = 33'h000000324;
      expv[5] = 33'h000005210;
      expv[6] = 33'h040032544;
      expv[7] = 33'h0f422dc39;
      expv[8] = 33'h07ba7cc09;
      expv[9] = 33'h011020152;
      expv[10] = 33'h029148020;
      expv[11] = 33'h0ac74cfd1;
      expv[12] = 33'h02bf36919;
      expv[13] = 33'h04a649537;
      expv[14] = 33'h0ea0f04b8;
      expv[15] = 33'h0939a7061;
      expv[16] = 33'h04830f900;
      expv[17] = 33'h010085201;
      expv[18] = 33'h082020223;
      expv[19] = 33'h000000400;
      expv[20] = 33'h09cac424c;
      expv[21] = 33'h0c8490419;
      expv[22] = 33'h05e6e2295;
      expv[23] = 33'h000000056;
      expv[24] = 33'h0103008c0;
      expv[25] = 33'h04bd80601;
      expv[26] = 33'h000004460;
      expv[27] = 33'h0230f0020;
      expv[28] = 33'h0ad7e7acf;
      expv[29] = 33'h095ca569e;
      expv[30] = 33'h094cb2067;
      expv[31] = 33'h0f9b1d9d6;
      expv[32] = 33'h084681038;
      expv[33] = 33'h0f83cfbc2;
      expv[34] = 33'h0079d6e6c;
      expv[35] = 33'h0a3bdcb94;
      expv[36] = 33'h0da6e6bbc;
      expv[37] = 33'h09c4f2560;
      expv[38] = 33'h0efcae0d5;
      expv[39] = 33'h0035e797f;
      expv[40] = 33'h0ca85d920;
      expv[41] = 33'h001040400;
      expv[42] = 33'h000000001;
      expv[43] = 33'h0555a0202;
      expv[44] = 33'h07b004808;
      expv[45] = 33'h021014045;
      expv[46] = 33'h0d5397e82;
      expv[47] = 33'h07897e674;
      expv[48] = 33'h000000086;
      expv[49] = 33'h0687007bb;
      expv[50] = 33'h08ce92911;
      expv[51] = 33'h000002009;
      expv[52] = 33'h086008280;
      expv[53] = 33'h0783c2120;
      expv[54] = 33'h0e84862a9;
      expv[55] = 33'h100000000;
      expv[56] = 33'h02ef42040;
      expv[57] = 33'h000000830;
      expv[58] = 33'h011811072;
      expv[59] = 33'h044590000;
      expv[60] = 33'h000000e01;
      expv[61] = 33'h0822bd126;
      expv[62] = 33'h026e8b101;
      expv[63] = 33'h00c3f0f4a;
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
