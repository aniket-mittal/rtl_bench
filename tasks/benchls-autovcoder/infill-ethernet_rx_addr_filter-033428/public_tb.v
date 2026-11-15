// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 143;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_033428 dut (
    .MRxClk(clk),
    .Reset(in_vec[142:142]),
    .RxData(in_vec[141:134]),
    .Broadcast(in_vec[133:133]),
    .r_Bro(in_vec[132:132]),
    .r_Pro(in_vec[131:131]),
    .ByteCntEq2(in_vec[130:130]),
    .ByteCntEq3(in_vec[129:129]),
    .ByteCntEq4(in_vec[128:128]),
    .ByteCntEq5(in_vec[127:127]),
    .ByteCntEq6(in_vec[126:126]),
    .ByteCntEq7(in_vec[125:125]),
    .HASH0(in_vec[124:93]),
    .HASH1(in_vec[92:61]),
    .CrcHash(in_vec[60:55]),
    .CrcHashGood(in_vec[54:54]),
    .StateData(in_vec[53:52]),
    .RxEndFrm(in_vec[51:51]),
    .Multicast(in_vec[50:50]),
    .MAC(in_vec[49:2]),
    .PassAll(in_vec[1:1]),
    .ControlFrmAddressOK(in_vec[0:0]),
    .RxAbort(out_vec[1:1]),
    .AddressMiss(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 143'h54988391fcd2e1c86a2171b8e5a170d65755;
    stim[1] = 143'h549685344641ec625cc92b5d32b1f4a74b4d;
    stim[2] = 143'h30f42fbf4341643a50e5d26643edcb3b38eb;
    stim[3] = 143'h16bc9b2523781ef4219bcb6a264a5f469944;
    stim[4] = 143'h1dcdcfb9c2dfa7732b9675c9f1e2c93d5957;
    stim[5] = 143'h3c1356be53f40fb3f22c4744c75f783f2273;
    stim[6] = 143'h04465a57baaa6e7f8e18ca2f1c861b04aa04;
    stim[7] = 143'h198c104020ecd4162019a427c92db8d98dcd;
    stim[8] = 143'h2985aef660c560995b5d8b670b397b64d57f;
    stim[9] = 143'h24b3cdbffd9080862f3858ae7b64ab206e09;
    stim[10] = 143'h32091a29cb1d915e1a51c1a9fdd740e890ec;
    stim[11] = 143'h2daafcc1ddf6c533a762a956391b33bde40b;
    stim[12] = 143'h2953be143ab06d74db08949f5c1b5996de2d;
    stim[13] = 143'h3c8539b66295d85997c80caf847f3f00edcf;
    stim[14] = 143'h31d918c9e6cd1e83953112cde666a7686765;
    stim[15] = 143'h0af8ac9e6c04595a010d41627bf5b42f4a2a;
    stim[16] = 143'h3991643912291d943e7a2e5ce2bf7866ba72;
    stim[17] = 143'h347e90c43702b7b61a038363bc3bbc923699;
    stim[18] = 143'h2f1a0d6107a924328b692a039f9dac80aab0;
    stim[19] = 143'h31417137aad40c6b9501300b4300db4be255;
    stim[20] = 143'h182a286f1880799fd9c455460bb2dee249f6;
    stim[21] = 143'h3f9c6f15d14453ee1fb879acbd4ceb681e30;
    stim[22] = 143'h3760d36e6c0e3bca4c52fef92884a68b28d9;
    stim[23] = 143'h2e01b816eab0849ec21eb74af8a6ac8057c3;
    stim[24] = 143'h377a932b9598d20cf95264fcd95d23749943;
    stim[25] = 143'h012f0c5f178e3908bd6af6b3990a198c9650;
    stim[26] = 143'h04e9897dc3f40a166dd6353b6ef8c6947d8d;
    stim[27] = 143'h3da70db11cd298f3432f1940a40f536d6a8b;
    stim[28] = 143'h2f3e3a6098f42cbeba3f21d2b7022ec4327c;
    stim[29] = 143'h0453a6725dbd5fff8476060c9107c88f5a7d;
    stim[30] = 143'h175040ba67919d649962dadf2fd8654140b9;
    stim[31] = 143'h355f0fec1cbd8437fe4c8f3aab1c2b3b082e;
    stim[32] = 143'h1f3b9048ea2201a1097237799f742d7cc6a7;
    stim[33] = 143'h207bc8d224cae00c234b6df5841b7bff0b3d;
    stim[34] = 143'h1339f2315d135b6b792a97a1962a59bb8874;
    stim[35] = 143'h3752e57806f04ca2def7a84b8f986815f204;
    stim[36] = 143'h177b38970a3e5fafda8f4f6b4554a1252b32;
    stim[37] = 143'h3db4decf1536ec137e2956176e98d488343d;
    stim[38] = 143'h3ea55660d9bda0f4556c7caa579767b92616;
    stim[39] = 143'h0e2376f17678f1cd71592002ce8f3115e544;
    stim[40] = 143'h3310c680092587a1e9da874c5a21b7f4c109;
    stim[41] = 143'h213fd1561baf1e7a6759f99c27120182b244;
    stim[42] = 143'h1888d02f6c2eca33b4481b67c8522f14a3d3;
    stim[43] = 143'h0be65d13a263604606d3262b7e36b78b02f7;
    stim[44] = 143'h169901922b27bd8d7d7cfa2bdc563c883b31;
    stim[45] = 143'h36edc6ce3470262d84c515477c72edf8bd15;
    stim[46] = 143'h01d667e2e0bf279e1c2d9227f5711527d475;
    stim[47] = 143'h04db78d251346eb3e9d0c5614efcc3337310;
    stim[48] = 143'h30384460c8c4e1c387d16ce96fd5bb02fbd2;
    stim[49] = 143'h0beaf8ee1f07633a7f3cde569c1098cdc4dc;
    stim[50] = 143'h3a9a7c37dca7fc7a0c96747e94c325579e57;
    stim[51] = 143'h047ca09f317706c82479dc056dffe3bfe600;
    stim[52] = 143'h1d6e3ad37ccbafd6c4f521057fb3fa5aeab6;
    stim[53] = 143'h2df8981932e1622f9d965aec4ed1983c68e1;
    stim[54] = 143'h1a9dfe550fb6571d2e4315d5d20d1167dbe0;
    stim[55] = 143'h23e93e2009f72eb4bf031a574ab43199182d;
    stim[56] = 143'h05e42d47d8780d3badf35fcfce0e705af36d;
    stim[57] = 143'h322b2df8649eb54303b8ffbc83035f985ea5;
    stim[58] = 143'h2aef8fdc225e8ad0ef62b3e7f4fd7d8d9b6d;
    stim[59] = 143'h0ccf0619fea1edb1e8ba17a2e66fffcb692c;
    stim[60] = 143'h324f59a92a48cb824ff11981de2c7add1c29;
    stim[61] = 143'h220d28e52c245915a071acd8dd097ac39a90;
    stim[62] = 143'h0e5d11af5899c3702fa6c4e143f9f472e793;
    stim[63] = 143'h2581ed280756fb0db84c77997a0d55c5d1d4;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h2;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h2;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h3;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h1;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
