// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 193;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086025 dut (
    .clk(clk),
    .reset(in_vec[192:192]),
    .x_vertice_1(in_vec[191:160]),
    .x_vertice_2(in_vec[159:128]),
    .x_vertice_3(in_vec[127:96]),
    .y_vertice_1(in_vec[95:64]),
    .y_vertice_2(in_vec[63:32]),
    .y_vertice_3(in_vec[31:0]),
    .x_Coordinate_1(out_vec[127:96]),
    .x_Coordinate_2(out_vec[95:64]),
    .y_Coordinate_1(out_vec[63:32]),
    .y_Coordinate_2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 193'h1932a0616d62b4aa474a26eba9b7389f809806a033e8deb58;
    stim[1] = 193'h12ac16562379228c7eec371044d2f071e07e817557b85941a;
    stim[2] = 193'h1275e390a46fd7bcccdb45446dc2573a19ad8348e679e885b;
    stim[3] = 193'h0168ae844a4e8bbb2aa09afdd5f561e14010138cd6c449301;
    stim[4] = 193'h0f0ebbddd58de37a215ef2f7d7d1bb477c38b938bd2d10390;
    stim[5] = 193'h0ee1decd9a626e0a25d0834a92cb5cf5029d078aa156c8ad7;
    stim[6] = 193'h0a58bad4721accbc3ff75fb8194dfb789116daef1ea9d9690;
    stim[7] = 193'h07b1560df3dc27ca0cab727953be78ca7eb46aeca439cf268;
    stim[8] = 193'h02a4ecba275a22f3e7b408e8522811c6b785209411bda9284;
    stim[9] = 193'h0e15bc1711bf9da5e88ba90b1a05f1cb9ea1727c05c9c9cc5;
    stim[10] = 193'h08cc45bade5d353fd5db716c8595217037728df1e3418525f;
    stim[11] = 193'h080d6d47d786c261a7c90e2e68b9b3c6e90daeff24f147ef9;
    stim[12] = 193'h07db557e24d94d20d68ffb19724eb725ac65b3cd0026e9075;
    stim[13] = 193'h0a2ca08c9093bedc191b64744faa287b3e29bf6d9f56d12d3;
    stim[14] = 193'h0157f341f0831cc319468adb5875f329622619d6f7bae9753;
    stim[15] = 193'h06624313ee07afdc359878d4ddb0f4c63d7159caf69263094;
    stim[16] = 193'h01e0ce4dbcd9bffe903739fa128d515dcbf801c399b98ad94;
    stim[17] = 193'h024f576211d3b95743408f74ab170ca38de39065ad1c30c11;
    stim[18] = 193'h07957e8b160a76f7310b46bf4aef82d32d706def98d8bea59;
    stim[19] = 193'h0f6150421ab72dba5d277352582585c6428ba2a47d206f8d0;
    stim[20] = 193'h0dbd8c4aa31d46af5b5658f98109d6f3f6c04a2a7ef89f4e4;
    stim[21] = 193'h00196c116b7e4492245781425ea08b0637efda5bb43ac9888;
    stim[22] = 193'h00fca6eb3548214f4c25d2a974ee5f642b62e3c2eb3ec8741;
    stim[23] = 193'h037928d78826b30f995676817fa7452870364f255ee37f3a5;
    stim[24] = 193'h0b86c4214105033684fa5028af157a989c26808c3db5590ff;
    stim[25] = 193'h063fbd0a07e5fba34cffe8d5b0184a419a37e74694ac543a4;
    stim[26] = 193'h08e20758a7241c540e75dff475c250d2cadea1798d22a07d8;
    stim[27] = 193'h0f923d933e27f84f97162c58d1a40f13564e6a2f188517b36;
    stim[28] = 193'h0acf15ef2cbfbd7a5a53a9499eb206f05e35098d19ddf464e;
    stim[29] = 193'h0f8902f736fad4d8e470901f6cc83fb02745ecbc2961d8dc3;
    stim[30] = 193'h093d2715e16d94b0b335407c476ce554e26bc10eca8d565f2;
    stim[31] = 193'h0f60be7057e90640ced585a95132652dcc67ebf8f4b38d849;
    stim[32] = 193'h05448d1096a80fd5cd1a8885e54a31e36920d0c5c3812ff47;
    stim[33] = 193'h06df8897e6f1d8c0d5ff3365ca0efaf5909034bf9209c9035;
    stim[34] = 193'h0dc4de58e47b1d8de417766eda850c1564d5b62d8e97cf39f;
    stim[35] = 193'h14490cd8f2fa75f96b759cc7c0b2f38d8156603b8bebd2399;
    stim[36] = 193'h094791ee41b230a22368777e55981c943abfcea48c474b3da;
    stim[37] = 193'h04cb6a6ff7f6b713bc69d8686e6c739c40affd7903df306d8;
    stim[38] = 193'h00bafb795f9d7f56e40918f95ea476385300cf18199cd252e;
    stim[39] = 193'h0d3b50b4bc251a071e32e24bf9222054044efa00c71edcd6d;
    stim[40] = 193'h0daa91c40937cbcd8e50700000c44872162dffcdf0c882f41;
    stim[41] = 193'h0b11b49915c99c82f227ed8a888d97bbd203a52dca38d592c;
    stim[42] = 193'h05c4f24e24055d68667d03265e067fb4bf5b9f889f77ff10b;
    stim[43] = 193'h0c978c5391930b36aa64b78aebc05d555e2b2ecd617ae323b;
    stim[44] = 193'h0b4a9a438d89e1bdc3d82e3dbe0698c804f211c417eaa1ac4;
    stim[45] = 193'h04665dbb2a2c9831dd5d7033582bf68a27ac78fe835aff03d;
    stim[46] = 193'h0790ade3b5d4aac2f0753105f6cbc13f0741a8b9eb6752fd4;
    stim[47] = 193'h08831c0e2a6b60b8f915c8a4ec919790423db44e94b8f0312;
    stim[48] = 193'h0e439168b6aaa71501136ec232fab27555e0a4e4cc0f278ea;
    stim[49] = 193'h057f824ff80251d46ea5960205f7a1adc1680353b3210d0f5;
    stim[50] = 193'h054ec3020c34d494d2791ad9e430d8cbe8ab0a9d496bc4bed;
    stim[51] = 193'h087a160089fbc1e78bb88bf529c3c56d71bf41d00323a7314;
    stim[52] = 193'h09db4954c87bac14d9cb0cbd501a9a2ca293dbb72b432000b;
    stim[53] = 193'h0f9575a822df9817f69e80203f3cf52dfd643ab3f07680da6;
    stim[54] = 193'h003d5549af19b9390da527aa45e91ca87ca94f46ea8d12756;
    stim[55] = 193'h04b120486a59dbf34e95612595f30c16617c71f953035532a;
    stim[56] = 193'h0daa6c3ec7d543d6fec11592647aa2600c8fdefbaff511b22;
    stim[57] = 193'h0401c9b9b18a7265bf873b99a7fba97625531663c93bfe600;
    stim[58] = 193'h0aa01c301917a986afcf59fd7f783cad68feb734050f8dbee;
    stim[59] = 193'h029a7218a785254ed19525d7a9217a76f644403cc7d0d802f;
    stim[60] = 193'h03bfe98f55d8d34b94e62782819bf623420a7d0e5f71a5de7;
    stim[61] = 193'h041a89bcfacffc775a4d9f055d54f55d5e1621eb04538e358;
    stim[62] = 193'h003230108a16de01c6534c05fdfb80ac89bc7218ca78a210f;
    stim[63] = 193'h004a495adf556227b576e1b53e8b843c201b9f431aa9824bb;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'h00000000000000000000000000000000;
      expv[4] = 128'h168ae844a4e8bbb25f561e14010138cd;
      expv[5] = 128'hf0ebbddd15ef2f7d7d1bb477d2d10390;
      expv[6] = 128'ha626e0a25d0834a929d078aa156c8ad7;
      expv[7] = 128'ha58bad4721accbc394dfb789116daef1;
      expv[8] = 128'h7b1560dfcab727953be78ca7439cf268;
      expv[9] = 128'h75a22f3e7b408e85785209411bda9284;
      expv[10] = 128'he15bc1711bf9da5ea05f1cb9ea1727c0;
      expv[11] = 128'h8cc45bad5db716c8595217033418525f;
      expv[12] = 128'h786c261a7c90e2e690daeff24f147ef9;
      expv[13] = 128'h7db557e24d94d20d24eb725ac65b3cd0;
      expv[14] = 128'ha2ca08c991b64744faa287b3f56d12d3;
      expv[15] = 128'h0831cc319468adb522619d6f7bae9753;
      expv[16] = 128'h6624313ee07afdc3db0f4c63d7159caf;
      expv[17] = 128'h1e0ce4db03739fa128d515dc9b98ad94;
      expv[18] = 128'h1d3b95743408f74ade39065ad1c30c11;
      expv[19] = 128'h7957e8b160a76f73aef82d32d706def9;
      expv[20] = 128'hf6150421d277352582585c64d206f8d0;
      expv[21] = 128'h31d46af5b5658f986c04a2a7ef89f4e4;
      expv[22] = 128'h0196c116b7e44922ea08b0637efda5bb;
      expv[23] = 128'h0fca6eb3c25d2a974ee5f642b3ec8741;
      expv[24] = 128'h826b30f9956768170364f255ee37f3a5;
      expv[25] = 128'hb86c421410503368f157a989c26808c3;
      expv[26] = 128'h63fbd0a0cffe8d5b0184a4194ac543a4;
      expv[27] = 128'h7241c540e75dff47adea1798d22a07d8;
      expv[28] = 128'hf923d933e27f84f91a40f13564e6a2f1;
      expv[29] = 128'hacf15ef2a53a9499eb206f059ddf464e;
      expv[30] = 128'h6fad4d8e470901f6745ecbc2961d8dc3;
      expv[31] = 128'h93d2715e16d94b0b76ce554e26bc10ec;
      expv[32] = 128'hf60be705ed585a95132652dc4b38d849;
      expv[33] = 128'h6a80fd5cd1a8885e920d0c5c3812ff47;
      expv[34] = 128'h6df8897e6f1d8c0da0efaf5909034bf9;
      expv[35] = 128'h00000000000000000000000000000000;
      expv[36] = 128'h00000000000000000000000000000000;
      expv[37] = 128'h94791ee41b230a225981c943abfcea48;
      expv[38] = 128'h4cb6a6ffc69d8686e6c739c43df306d8;
      expv[39] = 128'hf9d7f56e40918f95300cf18199cd252e;
      expv[40] = 128'hd3b50b4bc251a0719222054044efa00c;
      expv[41] = 128'hdaa91c40e50700000c4487210c882f41;
      expv[42] = 128'h5c99c82f227ed8a8203a52dca38d592c;
      expv[43] = 128'h5c4f24e24055d686e067fb4bf5b9f889;
      expv[44] = 128'hc978c539a64b78aebc05d55517ae323b;
      expv[45] = 128'hd89e1bdc3d82e3db4f211c417eaa1ac4;
      expv[46] = 128'h4665dbb2a2c9831d82bf68a27ac78fe8;
      expv[47] = 128'h790ade3b0753105f6cbc13f0b6752fd4;
      expv[48] = 128'ha6b60b8f915c8a4e23db44e94b8f0312;
      expv[49] = 128'he439168b6aaa71502fab27555e0a4e4c;
      expv[50] = 128'h57f824ffea5960205f7a1adc3210d0f5;
      expv[51] = 128'hc34d494d2791ad9e8ab0a9d496bc4bed;
      expv[52] = 128'h87a160089fbc1e789c3c56d71bf41d00;
      expv[53] = 128'h9db4954c9cb0cbd501a9a2cab432000b;
      expv[54] = 128'h2df9817f69e80203d643ab3f07680da6;
      expv[55] = 128'h03d5549af19b93905e91ca87ca94f46e;
      expv[56] = 128'h4b120486e95612595f30c1663035532a;
      expv[57] = 128'h7d543d6fec115926c8fdefbaff511b22;
      expv[58] = 128'h401c9b9b18a7265b7fba97625531663c;
      expv[59] = 128'haa01c301fcf59fd7f783cad650f8dbee;
      expv[60] = 128'h785254ed19525d7a644403cc7d0d802f;
      expv[61] = 128'h3bfe98f55d8d34b919bf623420a7d0e5;
      expv[62] = 128'h41a89bcfa4d9f055d54f55d54538e358;
      expv[63] = 128'ha16de01c6534c05f9bc7218ca78a210f;
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
