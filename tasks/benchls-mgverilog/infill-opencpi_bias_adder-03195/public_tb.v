// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 127;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03195 dut (
    .clk(clk),
    .rst_n(in_vec[126:126]),
    .wci_MCmd(in_vec[125:123]),
    .wci_MAddrSpace(in_vec[122:122]),
    .wci_MByteEn(in_vec[121:118]),
    .wci_MAddr(in_vec[117:98]),
    .wci_MData(in_vec[97:66]),
    .wci_MFlag(in_vec[65:64]),
    .wsi0_MCmd(in_vec[63:61]),
    .wsi0_MReqLast(in_vec[60:60]),
    .wsi0_MBurstPrecise(in_vec[59:59]),
    .wsi0_MBurstLength(in_vec[58:47]),
    .wsi0_MData(in_vec[46:15]),
    .wsi0_MByteEn(in_vec[14:11]),
    .wsi0_MReqInfo(in_vec[10:3]),
    .wsi1_SThreadBusy(in_vec[2:2]),
    .wsi_m_SReset_n(in_vec[1:1]),
    .wsi_s_MReset_n(in_vec[0:0]),
    .wci_SResp(out_vec[100:99]),
    .wci_SData(out_vec[98:67]),
    .wci_SFlag(out_vec[66:65]),
    .wci_SThreadBusy(out_vec[64:64]),
    .wsi0_SThreadBusy(out_vec[63:63]),
    .wsi1_MCmd(out_vec[62:60]),
    .wsi1_MReqLast(out_vec[59:59]),
    .wsi1_MBurstPrecise(out_vec[58:58]),
    .wsi1_MBurstLength(out_vec[57:46]),
    .wsi1_MData(out_vec[45:14]),
    .wsi1_MByteEn(out_vec[13:10]),
    .wsi1_MReqInfo(out_vec[9:2]),
    .wsi_m_MReset_n(out_vec[1:1]),
    .wsi_s_SReset_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 127'h21120f139454859fa2bdf75ed260fc30;
    stim[1] = 127'h1f712fd2a5ad54ac9f8d05b8bd723fbe;
    stim[2] = 127'h6196c0431dbe290a4af02d1970c475c9;
    stim[3] = 127'h5bf4152537f8c3ab85f22d45aa456f95;
    stim[4] = 127'h5a5fc0447c4f9f4035f15c771bd17689;
    stim[5] = 127'h66f4e0e94f1e33b887fcd594393595b4;
    stim[6] = 127'h489f280da9e9a7b329ae9c60cf5d9001;
    stim[7] = 127'h747d5fe3cbeb9b62415109064c65d37e;
    stim[8] = 127'h5bee44d8576408b60464c29f9ef18128;
    stim[9] = 127'h48320d28c9458f9ca25e591a76442e54;
    stim[10] = 127'h52f450c851f4bed09d499592a9b601fc;
    stim[11] = 127'h5c8a7fbee312242604a73db3c616b052;
    stim[12] = 127'h54b9f9c5679a838528235601d75f8188;
    stim[13] = 127'h56d34dff3aec840bb238d7a49ccb5346;
    stim[14] = 127'h4c4244d692d6891126df40c8dde8b080;
    stim[15] = 127'h4b5d214418644deeb70fcbf74b87d8e1;
    stim[16] = 127'h598c304d2d537a72a04047ed4c5c70c1;
    stim[17] = 127'h7a8e10c27497f4e688d318312d69d269;
    stim[18] = 127'h5ae695ce0975080ea26fca50d7fc0869;
    stim[19] = 127'h7a9e4104cca5ea84cb55e43e3a1768a3;
    stim[20] = 127'h4eed6e7c28457edbc5d63480e11ed62f;
    stim[21] = 127'h5694d948c8c9eb19a80b4632415d6304;
    stim[22] = 127'h5449ef0d491d6125f7e621be6bb2c6c2;
    stim[23] = 127'h74a5fbd5fd5d2630a3d128b7e65404f0;
    stim[24] = 127'h5e77e7c29cc7ac1a46be677f0708e2b1;
    stim[25] = 127'h6f3e8d6d7648745cc566ad4720503aee;
    stim[26] = 127'h5cf97f3dbfeca3a0e6e7bb7f6a658cb7;
    stim[27] = 127'h51c92e6817b4411e80a9cc2e058cb24c;
    stim[28] = 127'h713000dc35652ed493f2d6752907bfdd;
    stim[29] = 127'h5cfa5d4ba4e75d5172dd63841cdda531;
    stim[30] = 127'h6c5f4b840ced1b38ccab7c0a5e37c4a7;
    stim[31] = 127'h48b043a4c20f6143e3f05c708cd88cf6;
    stim[32] = 127'h6a1b613b698cd34041e673a710306506;
    stim[33] = 127'h612ec3549c3fecd965711b8f826e894e;
    stim[34] = 127'h7f872226f9dbac7e671b30e6f4984435;
    stim[35] = 127'h6b4fa5a8f931e11655afa39b5d2f6ae9;
    stim[36] = 127'h5a66b250961657f9719718c0184c21ad;
    stim[37] = 127'h5ee6578868a269145dfc6627d5e6b10f;
    stim[38] = 127'h558994fcb59abe8ea898c66afe47aa01;
    stim[39] = 127'h616349e9ef414556b2e2e7084300192c;
    stim[40] = 127'h69fd1b79abe83e3b7182659758ef6bad;
    stim[41] = 127'h5d13575f08de1f5995f1faf1079d9544;
    stim[42] = 127'h77ce6ee1446165185ce75336f98d3c8b;
    stim[43] = 127'h419b4e0f60b4f635d825df3b2c28352b;
    stim[44] = 127'h7d829169b96c142f2ef7bdcaa54c38a3;
    stim[45] = 127'h718a1e09a0635b8649705462429ce66c;
    stim[46] = 127'h5a614e779452c08f81561ec519094185;
    stim[47] = 127'h59f180521c13175136b8f81fde6a17d2;
    stim[48] = 127'h4dfc8337d056f80592e3d839cf94d558;
    stim[49] = 127'h6e5e361c2606ea549f1bea39f4f6563c;
    stim[50] = 127'h4600897e5513d8ecf272a725e07d6f65;
    stim[51] = 127'h669ef4f34c0b186bfb27f91529c93e57;
    stim[52] = 127'h4d5dd3921efd5059ad7a29b909245742;
    stim[53] = 127'h78769a117ce23fd8287f58e1dc2b5356;
    stim[54] = 127'h4e84b40cfbff255174b95ef4f3c8ef0f;
    stim[55] = 127'h5543328085848c78761cdb26a4bc2ba0;
    stim[56] = 127'h510a66ed3161ac7c7bb7450328d17eac;
    stim[57] = 127'h434a19d6753d6a692b8d9f62498f15e9;
    stim[58] = 127'h4d472956bfbd900117bca398145044fb;
    stim[59] = 127'h75f3e46a0ae6297f223799517cced026;
    stim[60] = 127'h6e2c8bde29f567438f40223dc3c5e9ef;
    stim[61] = 127'h7e496ee390f2b6f4753425fc647d5964;
    stim[62] = 127'h6e38c5af179be54f4bda59fdf88365bf;
    stim[63] = 127'h72e3cb9f2c946f07e4b52a85aeed694b;
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
      expv[0] = 101'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 101'h0xxxxxxxxx815ec00000003e18;
      expv[2] = 101'h0xxxxxxxxx8fc6800000001fdf;
      expv[3] = 101'h0xxxxxxxxx8578000000003ae7;
      expv[4] = 101'h0xxxxxxxxx82f90000000037cb;
      expv[5] = 101'h0xxxxxxxxx8af8800000003b47;
      expv[6] = 101'h0xxxxxxxxx83fe400000000adb;
      expv[7] = 101'h0xxxxxxxxx84d7400000000803;
      expv[8] = 101'h0xxxxxxxxx80a88000000029bf;
      expv[9] = 101'h0xxxxxxxxx8232400000000097;
      expv[10] = 101'h0xxxxxxxxx812f00000000172b;
      expv[11] = 101'h0e06f210088ea4c000000000ff;
      expv[12] = 101'h0606f21008825380000000182b;
      expv[13] = 101'h080000000084118000000000c7;
      expv[14] = 101'h0800000000891c4000000029a3;
      expv[15] = 101'h0800000000836f800000001843;
      expv[16] = 101'h00000000008b87c00000002c73;
      expv[17] = 101'h00000000008020000000003863;
      expv[18] = 101'h00000000008469800000002937;
      expv[19] = 101'h00000000008137c00000000437;
      expv[20] = 101'h000000000085aac00000003453;
      expv[21] = 101'h080000000082eb000000002b17;
      expv[22] = 101'h08508afdb08405800000003183;
      expv[23] = 101'h08508afdb08bf3000000002363;
      expv[24] = 101'h00508afdb081e880000000027b;
      expv[25] = 101'h00508afdb0835f00000000315b;
      expv[26] = 101'h00508afdb082b3400000001d77;
      expv[27] = 101'h00508afdb08373c0000000065b;
      expv[28] = 101'h0e06f210088054c00000001927;
      expv[29] = 101'h0606f2100889f9400000001fef;
      expv[30] = 101'h0606f21008896e80000000129b;
      expv[31] = 101'h0606f210088655800000002253;
      expv[32] = 101'h0606f2100881f800000000067b;
      expv[33] = 101'h0606f2100880f3000000003283;
      expv[34] = 101'h0606f2100882b88000000004a7;
      expv[35] = 101'h0606f21008838d80000000221b;
      expv[36] = 101'h0606f210088ad7c00000003577;
      expv[37] = 101'h0606f2100888cb8000000010d7;
      expv[38] = 101'h0606f210088efe000000001887;
      expv[39] = 101'h08508afdb0844c400000001503;
      expv[40] = 101'h00508afdb08971400000000c97;
      expv[41] = 101'h00508afdb088c10000000035d7;
      expv[42] = 101'h00508afdb08af8c00000000aa3;
      expv[43] = 101'h00508afdb08e73800000001e47;
      expv[44] = 101'h00508afdb08c12c00000001a97;
      expv[45] = 101'h00508afdb0877bc00000001c53;
      expv[46] = 101'h00508afdb084b8000000003337;
      expv[47] = 101'h00508afdb080ab0000000020c3;
      expv[48] = 101'h00508afdb08b5c400000000beb;
      expv[49] = 101'h08508afdb08971c00000002aaf;
      expv[50] = 101'h00508afdb08f8dc00000002b1f;
      expv[51] = 101'h00508afdb089394000000037b3;
      expv[52] = 101'h00508afdb08d93c00000001f2b;
      expv[53] = 101'h08508afdb086bd000000002ba3;
      expv[54] = 101'h00508afdb0843f8000000029ab;
      expv[55] = 101'h08508afdb08a5c800000003787;
      expv[56] = 101'h09f7fe4aa08b0e4000000015d3;
      expv[57] = 101'h0e06f210088ddb800000003f57;
      expv[58] = 101'h0606f2100885c6c00000000af7;
      expv[59] = 101'h0e06f210088bde40000000227f;
      expv[60] = 101'h0606f21008811bc00000002813;
      expv[61] = 101'h0606f2100887a00000000034f7;
      expv[62] = 101'h0606f210088a9a000000002cb3;
      expv[63] = 101'h0606f2100885ed0000000032df;
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
