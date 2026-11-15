// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_145663 dut (
    .clk(clk),
    .reset(in_vec[129:129]),
    .valid(in_vec[128:128]),
    .x1(in_vec[127:96]),
    .y1(in_vec[95:64]),
    .x2(in_vec[63:32]),
    .y2(in_vec[31:0]),
    .x3(out_vec[64:33]),
    .y3(out_vec[32:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h2a5d6233a99d2719f247ad9dab5d4e730;
    stim[1] = 130'h3d9a38e6a02204eea75eff0e24e99ba0b;
    stim[2] = 130'h137630cf04bc42913794ef69e471aa7b4;
    stim[3] = 130'h140073dde97115f74feffd05034aac7c6;
    stim[4] = 130'h191f10c956fe0f6ac190704abcd5def9c;
    stim[5] = 130'h1630a14b6d269ea584669f212d9af03a2;
    stim[6] = 130'h1615f65d4ac649d656aa035140b5d5026;
    stim[7] = 130'h0a75b0fc0290e723979d61132ef55ef7c;
    stim[8] = 130'h0bdf93d436cdff59d1c229a6e0b4e5daf;
    stim[9] = 130'h17806a8f71e71ecafb01079bb3b807afd;
    stim[10] = 130'h07111c306fdb7e1c7622b222c01d6f90c;
    stim[11] = 130'h05416924ff415b207d1f4f1af38048ab2;
    stim[12] = 130'h1c64690a82ff4e6c6ddea548808b5c317;
    stim[13] = 130'h03551a5aa08595ee3195ac926ee1c5b31;
    stim[14] = 130'h10038452c13a0fc4c7ed9495008098fc2;
    stim[15] = 130'h1e523f650fb0ce1ce1f6c26c428887f93;
    stim[16] = 130'h16bfd1a86ffc5a0690ddba72ca9aacc42;
    stim[17] = 130'h1334e07e8c30601ea69bc7889803e12b1;
    stim[18] = 130'h15517228537b30bb565355321afa353d0;
    stim[19] = 130'h01431f8872effaa9c34fe5b789012e3a1;
    stim[20] = 130'h180b33f3d58bd3d79f90d13d50e724b3e;
    stim[21] = 130'h1a28a2f4c6214dfd1486b659424bfa979;
    stim[22] = 130'h0d7a5dc15f8e3c3a37c1d5b4614226a6c;
    stim[23] = 130'h0b186068314960b23f6f31d850b21c931;
    stim[24] = 130'h023a5d851c9a33a6d0f56fe44998ebaa8;
    stim[25] = 130'h1513e48b40cd1819663a9bcc9b28f119a;
    stim[26] = 130'h06845e93b0cd22793c1b969064e3937dc;
    stim[27] = 130'h15b450d27e89d917b61dec1bca0b37264;
    stim[28] = 130'h0de69eaa6e4a1ecaba033b7615ba335a6;
    stim[29] = 130'h0dfa81eddc0708385c2e6fac5c1493bf4;
    stim[30] = 130'h1502f23e555c59415ecccfd77fea1a034;
    stim[31] = 130'h1109fccf9e8b8c512312e689542c21459;
    stim[32] = 130'h0f463dfb5b855347adfea6267f5247ee2;
    stim[33] = 130'h15957e03cdeb8c48cded1da5a755f9a28;
    stim[34] = 130'h0329423589358d1b6d55379921b88a7c1;
    stim[35] = 130'h1bc1607f207d51b2e55748bee29fee647;
    stim[36] = 130'h038544f464c346a0eef08dbfb6a5b0f8a;
    stim[37] = 130'h1d71cc5c185cc8e3b0e4d1c9557f55eeb;
    stim[38] = 130'h091ec18b46a5a8ba10f5f1399976af8a5;
    stim[39] = 130'h0d8f1ae442958ae685a7601f2199f4ee5;
    stim[40] = 130'h162523825db68814d4e5dad5374755311;
    stim[41] = 130'h12ce72b11f5072fadf421a1ab8f1c496e;
    stim[42] = 130'h1df80252091f808555a9aae998a5c8e77;
    stim[43] = 130'h165d8746103fae533b45fa779c6b49a5c;
    stim[44] = 130'h1832392ca1d7d4a57fdedaf1c2f48135c;
    stim[45] = 130'h07e15b9439b056542252fa41f42c921b6;
    stim[46] = 130'h0bdb67b4fa735fe2bc6271c9bf39caefc;
    stim[47] = 130'h0210ba4e34b19aae23a939a89d7ec2b1f;
    stim[48] = 130'h0677ef6e5895ada3ae3d4c40ab5701f8a;
    stim[49] = 130'h036b524ad42c52eea51710c9f79f1176f;
    stim[50] = 130'h160a1dfa8a6cafbd9059fd75720ddad4a;
    stim[51] = 130'h05c4b0d064464f8b061477bec4a1eac3d;
    stim[52] = 130'h0d14490716294c03531c2559d5a386e59;
    stim[53] = 130'h243a3e62c7e46adc935a86d6a6e78f355;
    stim[54] = 130'h1a9179a01d1a97ae19485d74d250c5def;
    stim[55] = 130'h10d889a9ffbadb3b6cea45cbda29125f1;
    stim[56] = 130'h0939ae41a8a1c77d20eff6947443481c6;
    stim[57] = 130'h05044f92b5362c6d836949fdf2683171f;
    stim[58] = 130'h16ee92d3144cb0eca28389bafff1b46c5;
    stim[59] = 130'h150d0550ba82d92b67890445684a568ab;
    stim[60] = 130'h0a26a268e89e840033922c736dbdce4dc;
    stim[61] = 130'h02063532ccde847e584c3238b8b3bc84d;
    stim[62] = 130'h051659adfa04433913080b034793ede4b;
    stim[63] = 130'h02d9ab8aa926337518c2cb77f8ae15c21;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'hxxxxxxxxxxxxxxxxx;
      expv[4] = 65'hxxxxxxxxxxxxxxxxx;
      expv[5] = 65'h1fbc5525xxxxxxxxx;
      expv[6] = 65'h0aa0fdd81203e12a9;
      expv[7] = 65'h0ad17f2705b2c2b51;
      expv[8] = 65'h0ad17f2705b2c2b51;
      expv[9] = 65'h0ad17f2705b2c2b51;
      expv[10] = 65'h06800ca30a736c537;
      expv[11] = 65'h06800ca30a736c537;
      expv[12] = 65'h06800ca30a736c537;
      expv[13] = 65'h0109609ec729ed937;
      expv[14] = 65'h0109609ec729ed937;
      expv[15] = 65'h0b79e35a1a0163275;
      expv[16] = 65'h1e92f2d9049590cf1;
      expv[17] = 65'h06b7026c028cd7d55;
      expv[18] = 65'h10c4e7c9c0074bf2f;
      expv[19] = 65'h132c7e0611fa668f9;
      expv[20] = 65'h132c7e0611fa668f9;
      expv[21] = 65'h0ec1c385d2a66ba99;
      expv[22] = 65'h1a168fa2cb97d9a3d;
      expv[23] = 65'h1a168fa2cb97d9a3d;
      expv[24] = 65'h1a168fa2cb97d9a3d;
      expv[25] = 65'h1a168fa2cb97d9a3d;
      expv[26] = 65'h175d742d1982adbf3;
      expv[27] = 65'h175d742d1982adbf3;
      expv[28] = 65'h0bb06dd30b9b7ae3d;
      expv[29] = 65'h0bb06dd30b9b7ae3d;
      expv[30] = 65'h0bb06dd30b9b7ae3d;
      expv[31] = 65'h0ef53ab8a52aaf41b;
      expv[32] = 65'h08f53a215a8565d17;
      expv[33] = 65'h08f53a215a8565d17;
      expv[34] = 65'h1bd80cc1c9ca27dff;
      expv[35] = 65'h1bd80cc1c9ca27dff;
      expv[36] = 65'h1a594734c58308e31;
      expv[37] = 65'h1a594734c58308e31;
      expv[38] = 65'h10fa7e0381dbe2d0d;
      expv[39] = 65'h10fa7e0381dbe2d0d;
      expv[40] = 65'h10fa7e0381dbe2d0d;
      expv[41] = 65'h0352c3b54f466e38b;
      expv[42] = 65'h026e4f4249ac65e85;
      expv[43] = 65'h1bdee668815f1a0a7;
      expv[44] = 65'h18bca588edc0fef57;
      expv[45] = 65'h105ac94ad783d1533;
      expv[46] = 65'h105ac94ad783d1533;
      expv[47] = 65'h105ac94ad783d1533;
      expv[48] = 65'h105ac94ad783d1533;
      expv[49] = 65'h105ac94ad783d1533;
      expv[50] = 65'h105ac94ad783d1533;
      expv[51] = 65'h0e905ed7dc3d04983;
      expv[52] = 65'h0e905ed7dc3d04983;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h1337c9202b26a084f;
      expv[56] = 65'h184c51d645cad0a3f;
      expv[57] = 65'h184c51d645cad0a3f;
      expv[58] = 65'h184c51d645cad0a3f;
      expv[59] = 65'h047a6114808a49895;
      expv[60] = 65'h0d1bc6e417669e26d;
      expv[61] = 65'h0d1bc6e417669e26d;
      expv[62] = 65'h0d1bc6e417669e26d;
      expv[63] = 65'h0d1bc6e417669e26d;
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
