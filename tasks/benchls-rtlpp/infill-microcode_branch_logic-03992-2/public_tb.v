// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 153;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03992 dut (
    .clk(clk),
    .state_fetch(in_vec[152:152]),
    .ob(in_vec[151:120]),
    .r(in_vec[119:88]),
    .alu(in_vec[87:55]),
    .ir(in_vec[54:6]),
    .aeqm(in_vec[5:5]),
    .destintctl(in_vec[4:4]),
    .nopa(in_vec[3:3]),
    .sintr(in_vec[2:2]),
    .vmaok(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .int_enable(out_vec[4:4]),
    .jcond(out_vec[3:3]),
    .lc_byte_mode(out_vec[2:2]),
    .prog_unibus_reset(out_vec[1:1]),
    .sequence_break(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 153'h00b9e9a17d93792a929e370815fc8da4781c831;
    stim[1] = 153'h09c80cdda5c75f8089434a5bee4fbbc72340ff5;
    stim[2] = 153'h1706a7cd613c649a7b139e86bb22bc1040a7ac6;
    stim[3] = 153'h024df0de1a8f07f11cfb3d46fa7bb1e183c4832;
    stim[4] = 153'h0b833fb4364098566d83dfca308c998c751c7d8;
    stim[5] = 153'h0b88eb7d38b58ce5300abcde9441ad048205604;
    stim[6] = 153'h0c57d8c297be12dcab19a724da99f8473b85360;
    stim[7] = 153'h00e65b93b77bcaa39000fc7f6aa022fe98979ca;
    stim[8] = 153'h1318df39551104bda36d2cc573ec87c1f26a032;
    stim[9] = 153'h16f7bdcaf22ea1d9ac3b89faeded9256ac47dc0;
    stim[10] = 153'h0eebcf940514850b97fc73551e1533b18111eda;
    stim[11] = 153'h0833e5132ac152b53abee2e5875ee4889c4d280;
    stim[12] = 153'h029fb8a61cad2118012c834af3fba481c90d9a6;
    stim[13] = 153'h19c26e0cbafa54fa8b12757c5a203d3c3a00487;
    stim[14] = 153'h19e8c5a68435a114e1ba132fd151767097f5168;
    stim[15] = 153'h0885397f9f713ad77071fe8543324d02661ce40;
    stim[16] = 153'h19f8dfd19d85c29640cbb7a343be8a08325c39a;
    stim[17] = 153'h0ae270d5abf3237782a4a22e56145031d6ad02c;
    stim[18] = 153'h1b05f8855437a416ea405c58504e4689cc752f4;
    stim[19] = 153'h14c86643c7dfb307dd94eb78d3a62cf4941b900;
    stim[20] = 153'h024ad10f74245f3515d8d2cb61d1fe8b5995574;
    stim[21] = 153'h11b8aa88c49fda609d7b4da33889bc88d731a10;
    stim[22] = 153'h00a80bc4e387cf4b04cff0c68008f7240bf9ebe;
    stim[23] = 153'h19bb977c653da2ef399c6d19bd548e58e4303a0;
    stim[24] = 153'h1aa7b51fdefe938c58ae98f1bae2ee0ce8f81a4;
    stim[25] = 153'h01aa44b4e323df5a2e0ae9735fc583400cbaa46;
    stim[26] = 153'h10684e798e6db34041fa41f5266b58b38ff2a7a;
    stim[27] = 153'h1ef048ef438b8dfe76cbe5669954675d748c144;
    stim[28] = 153'h0c86b4dc8caa9bd8b4445df373ffd33b0ddca1e;
    stim[29] = 153'h0d803a88f4d12f1927ed0f3f2b710dc5040fb14;
    stim[30] = 153'h09012e13d741d8fb34384541c558b56f94d86f6;
    stim[31] = 153'h1aae5ef2a0afcc48fb3f8d440e3f2e87df3c4a6;
    stim[32] = 153'h0dcd0e517c474e4e4f125dcd1162de72c826eee;
    stim[33] = 153'h17dc20650d8d6dee300c963cb74c0c4ea36959a;
    stim[34] = 153'h147a90750b0656993e912d3f6bf9d4755ccc0de;
    stim[35] = 153'h1c32194f7da48d6d8527f63242a32613fb3c3c0;
    stim[36] = 153'h182e7dc9caf3e087dcb9414c2d05628425e1006;
    stim[37] = 153'h0a580e9ab129bb036e1ddfcc8a02060b995d002;
    stim[38] = 153'h1cf93c7d86fbda2c5d1c20efe1cdd92f7eb2d30;
    stim[39] = 153'h05b7b8b742f2652abc06f48d2519e18184dcdce;
    stim[40] = 153'h06d454201730edea52171d6c7997ec1400869d6;
    stim[41] = 153'h1d7aaeb3ce830e47fc5972c4a8bfa1628ad92d8;
    stim[42] = 153'h10015c5d4c303114834fad875a7f7864606a2ee;
    stim[43] = 153'h1fbb031cb8939a50960ef862eb2274c9b6eb200;
    stim[44] = 153'h135b913790fcf8686344c703ed7cc8461466e92;
    stim[45] = 153'h04810c3061f96bfeaf1c96c7a2c08eabd622fec;
    stim[46] = 153'h0cf929c342399fc002a646b4970591f0dd58148;
    stim[47] = 153'h1ec282c02c399836f331a8c7dcb5df3c35ee82e;
    stim[48] = 153'h12974809f093a7ff093653dd5da87f0d7714e98;
    stim[49] = 153'h126c0d61bbd7c12422ba5a748c392328d2b8952;
    stim[50] = 153'h1a901f936670b851c8fac6ab940243070dbd1e0;
    stim[51] = 153'h1539a98c290f5283c20841a554583a401515650;
    stim[52] = 153'h0b439483ca28b439df32223834c39607b969e9c;
    stim[53] = 153'h1f29cb1dcb39c4f9cf28146984fe3af1765e840;
    stim[54] = 153'h114208b70c07ec62539f7ec186f20579a8c2a20;
    stim[55] = 153'h06bfcc25fb09c8b1163f09824b89cfe841c0816;
    stim[56] = 153'h1e8e6379bd7e05e85412cff1127e2ee438eb0a2;
    stim[57] = 153'h1c6c78bd50815758bfcdf834de92df357695558;
    stim[58] = 153'h1e9cf65c1f71e0f97c10c4d31870fe0fc27db14;
    stim[59] = 153'h1b125296c4d78d5538fa3097e6ecab457179d82;
    stim[60] = 153'h1a5ebb7bfbac1e71077edd80bddf92b6a32b998;
    stim[61] = 153'h1db43b4a23879cdd09d01c245e9cff21d33ab4a;
    stim[62] = 153'h0c828e73f56b679a14821671a549b4520bb9e9a;
    stim[63] = 153'h1605cbd7644f29864b38bfd51ae31818e167797;
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
      expv[0] = 5'h08;
      expv[1] = 5'h08;
      expv[2] = 5'h00;
      expv[3] = 5'h08;
      expv[4] = 5'h00;
      expv[5] = 5'h08;
      expv[6] = 5'h00;
      expv[7] = 5'h08;
      expv[8] = 5'h00;
      expv[9] = 5'h0e;
      expv[10] = 5'h06;
      expv[11] = 5'h0e;
      expv[12] = 5'h06;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h13;
      expv[18] = 5'h13;
      expv[19] = 5'h0e;
      expv[20] = 5'h0e;
      expv[21] = 5'h0e;
      expv[22] = 5'h12;
      expv[23] = 5'h1a;
      expv[24] = 5'h1a;
      expv[25] = 5'h1a;
      expv[26] = 5'h12;
      expv[27] = 5'h09;
      expv[28] = 5'h09;
      expv[29] = 5'h09;
      expv[30] = 5'h09;
      expv[31] = 5'h09;
      expv[32] = 5'h09;
      expv[33] = 5'h09;
      expv[34] = 5'h1f;
      expv[35] = 5'h01;
      expv[36] = 5'h09;
      expv[37] = 5'h01;
      expv[38] = 5'h09;
      expv[39] = 5'h19;
      expv[40] = 5'h19;
      expv[41] = 5'h19;
      expv[42] = 5'h03;
      expv[43] = 5'h0b;
      expv[44] = 5'h03;
      expv[45] = 5'h0f;
      expv[46] = 5'h07;
      expv[47] = 5'h0f;
      expv[48] = 5'h0f;
      expv[49] = 5'h14;
      expv[50] = 5'h05;
      expv[51] = 5'h05;
      expv[52] = 5'h0a;
      expv[53] = 5'h0a;
      expv[54] = 5'h0a;
      expv[55] = 5'h0a;
      expv[56] = 5'h0a;
      expv[57] = 5'h0a;
      expv[58] = 5'h09;
      expv[59] = 5'h14;
      expv[60] = 5'h1c;
      expv[61] = 5'h05;
      expv[62] = 5'h05;
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
