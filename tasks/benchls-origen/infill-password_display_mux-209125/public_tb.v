// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_209125 dut (
    .Level(in_vec[63:61]),
    .password_auth(in_vec[60:60]),
    .user_id(in_vec[59:56]),
    .Password(in_vec[55:52]),
    .RNG1(in_vec[51:48]),
    .RNG2(in_vec[47:44]),
    .PlayerTIn(in_vec[43:40]),
    .PlayerUIn(in_vec[39:36]),
    .FRndOrig(in_vec[35:32]),
    .FRndEncryp(in_vec[31:28]),
    .SRndEncryp(in_vec[27:24]),
    .SRndOrig(in_vec[23:20]),
    .SC_Tens_l2(in_vec[19:16]),
    .SC_Units_l2(in_vec[15:12]),
    .SC_Tens_l3(in_vec[11:8]),
    .SC_Units_l3(in_vec[7:4]),
    .index(in_vec[3:0]),
    .NumOut1(out_vec[29:26]),
    .NumOut2(out_vec[25:22]),
    .NumOut3(out_vec[21:18]),
    .NumOut4(out_vec[17:14]),
    .NumOut5(out_vec[13:10]),
    .NumOut6(out_vec[9:6]),
    .Encrypt_on1(out_vec[5:5]),
    .Encrypt_on2(out_vec[4:4]),
    .Encrypt_on3(out_vec[3:3]),
    .Encrypt_on4(out_vec[2:2]),
    .Encrypt_on5(out_vec[1:1]),
    .Encrypt_on6(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'ha8c69ad3304ab55d;
    stim[1] = 64'hd4d3690a5e50e294;
    stim[2] = 64'ha2196dd126cdb250;
    stim[3] = 64'h66b5b3b41984502a;
    stim[4] = 64'hdcfbc1b343fc4ac7;
    stim[5] = 64'heca6bee5c9569d98;
    stim[6] = 64'hb8d52294875ee68c;
    stim[7] = 64'ha4e7545d86af5574;
    stim[8] = 64'h74dd129d56aaa5b1;
    stim[9] = 64'h16bdec1518cbc6ea;
    stim[10] = 64'hea04b05fe1d2e2b8;
    stim[11] = 64'h6c55dbe8d39de568;
    stim[12] = 64'hf2cd06a1dc240231;
    stim[13] = 64'h503bf520011e543c;
    stim[14] = 64'h0323b0b0260d6fe8;
    stim[15] = 64'hd345c317d52592bf;
    stim[16] = 64'h7f4910e84638f648;
    stim[17] = 64'h8ac0e3a0fedd0e1c;
    stim[18] = 64'h34b8d09c44f68772;
    stim[19] = 64'hae6beeb76544dfc3;
    stim[20] = 64'h9a762032bae9ccf1;
    stim[21] = 64'h9dd2033605e90686;
    stim[22] = 64'h1421997707399d95;
    stim[23] = 64'h7365d91013864915;
    stim[24] = 64'h4d935a71f3e1e693;
    stim[25] = 64'hcd7291f8dbd79fbb;
    stim[26] = 64'h82e90d448f22c153;
    stim[27] = 64'h0505bb73110f9d47;
    stim[28] = 64'hb98133554c53666d;
    stim[29] = 64'hba365a85c9381914;
    stim[30] = 64'he5f1dd06c852333b;
    stim[31] = 64'hd80f399ce959457c;
    stim[32] = 64'hbcb5f8ad9a2b29f2;
    stim[33] = 64'hedbb39a89fb576ce;
    stim[34] = 64'h968dfe6c87e6f5f7;
    stim[35] = 64'hd5882050c389a340;
    stim[36] = 64'h2ba02db10d34d268;
    stim[37] = 64'h31b16adbe301e572;
    stim[38] = 64'h4f11e56506fe68f3;
    stim[39] = 64'h2a523c8eae76611d;
    stim[40] = 64'hcf58420bada6b8d8;
    stim[41] = 64'hb00ad43a7d178e0a;
    stim[42] = 64'h20332cf76b97e913;
    stim[43] = 64'h91c562bd2d68a13a;
    stim[44] = 64'h62228fdecc275e7c;
    stim[45] = 64'h17d4ae4ec7c6f6f4;
    stim[46] = 64'h9ca836fa0a2a1111;
    stim[47] = 64'h5aff7afc817926e2;
    stim[48] = 64'h6d69291202b6631f;
    stim[49] = 64'hdc8c16fc9f5f3ac1;
    stim[50] = 64'h135eaf545457314d;
    stim[51] = 64'h040e2d8be5069e79;
    stim[52] = 64'hb2efd5b0b6d26a2d;
    stim[53] = 64'hc423abf367998bca;
    stim[54] = 64'he21341a4515f37cf;
    stim[55] = 64'hcdc17a6cbfdcfac1;
    stim[56] = 64'h87a66051eeafdcff;
    stim[57] = 64'hc830a526a5a471ca;
    stim[58] = 64'h6663dba2cbc935b1;
    stim[59] = 64'hb47ca0a8bd03384a;
    stim[60] = 64'h3c1c504026c3e7b8;
    stim[61] = 64'h5d0b2d9b216bc6ae;
    stim[62] = 64'h94b0ebc0d744f75b;
    stim[63] = 64'h460b1e5dac0e0853;
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
      expv[0] = 30'h323fffcf;
      expv[1] = 30'h00000000;
      expv[2] = 30'h04bfffcf;
      expv[3] = 30'h2dbfffcf;
      expv[4] = 30'h00000000;
      expv[5] = 30'h2b3fffcf;
      expv[6] = 30'h00000000;
      expv[7] = 30'h393fffcf;
      expv[8] = 30'h344a56fc;
      expv[9] = 30'h00000000;
      expv[10] = 30'h02bfffcf;
      expv[11] = 30'h173fffcf;
      expv[12] = 30'h00000000;
      expv[13] = 30'h0c47f94c;
      expv[14] = 30'h08ffffcf;
      expv[15] = 30'h00000000;
      expv[16] = 30'h2443993c;
      expv[17] = 30'h32bfffcf;
      expv[18] = 30'h2f13ffcf;
      expv[19] = 30'h1bbfffcf;
      expv[20] = 30'h00000000;
      expv[21] = 30'h00000000;
      expv[22] = 30'h00000000;
      expv[23] = 30'h1764647c;
      expv[24] = 30'h277fffcf;
      expv[25] = 30'h1f7fffcf;
      expv[26] = 30'h38bfffcf;
      expv[27] = 30'h017fffcf;
      expv[28] = 30'h00000000;
      expv[29] = 30'h00000000;
      expv[30] = 30'h3d7fffcf;
      expv[31] = 30'h00000000;
      expv[32] = 30'h00000000;
      expv[33] = 30'h2f7fffcf;
      expv[34] = 30'h00000000;
      expv[35] = 30'h00000000;
      expv[36] = 30'h2affffcf;
      expv[37] = 30'h2efbffcf;
      expv[38] = 30'h07ffffcf;
      expv[39] = 30'h16bfffcf;
      expv[40] = 30'h17ffffcf;
      expv[41] = 30'h00000000;
      expv[42] = 30'h0c3fffcf;
      expv[43] = 30'h00000000;
      expv[44] = 30'h08bfffcf;
      expv[45] = 30'h00000000;
      expv[46] = 30'h00000000;
      expv[47] = 30'h3dc7e48c;
      expv[48] = 30'h1b7fffcf;
      expv[49] = 30'h00000000;
      expv[50] = 30'h00000000;
      expv[51] = 30'h013fffcf;
      expv[52] = 30'h00000000;
      expv[53] = 30'h093fffcf;
      expv[54] = 30'h04bfffcf;
      expv[55] = 30'h337fffcf;
      expv[56] = 30'h29ffffcf;
      expv[57] = 30'h0e3fffcf;
      expv[58] = 30'h19bfffcf;
      expv[59] = 30'h00000000;
      expv[60] = 30'h040bffcf;
      expv[61] = 30'h0187ef0c;
      expv[62] = 30'h00000000;
      expv[63] = 30'h01bfffcf;
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
