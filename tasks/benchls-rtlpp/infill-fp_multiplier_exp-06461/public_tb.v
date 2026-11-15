// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06461 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[57:48]),
    .fracta_24_o(out_vec[47:24]),
    .fractb_24_o(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1bf7e3e1d312b52f9;
    stim[1] = 65'h12c81c42be8a88eb4;
    stim[2] = 65'h09a5429d59fe358ef;
    stim[3] = 65'h0cb4c758bace2e282;
    stim[4] = 65'h0068f3db5e3ca91ad;
    stim[5] = 65'h03a1b7c150944543a;
    stim[6] = 65'h02e49ec11c1d36ef3;
    stim[7] = 65'h0e26659972e2408e7;
    stim[8] = 65'h07709edb1c0048629;
    stim[9] = 65'h0450a4f9fb5d8f14c;
    stim[10] = 65'h0f34c19e6eee62a02;
    stim[11] = 65'h04950b1a44141ae24;
    stim[12] = 65'h0e6a459a84c821673;
    stim[13] = 65'h0a4c296102aa40ddb;
    stim[14] = 65'h0745c23f6e22df792;
    stim[15] = 65'h093b65897e4df1d23;
    stim[16] = 65'h058311f20d73f22b1;
    stim[17] = 65'h05b4d681bc4fc8bdb;
    stim[18] = 65'h08fb4be40e34a8031;
    stim[19] = 65'h0b4fac84ea5ee0b23;
    stim[20] = 65'h0cf51fac9a1ddee93;
    stim[21] = 65'h014d64b460a81ca74;
    stim[22] = 65'h0211225a8186264d7;
    stim[23] = 65'h0b22dbcf367c50d80;
    stim[24] = 65'h0fdfc17b7ed81652a;
    stim[25] = 65'h00dd45a57a1fa3888;
    stim[26] = 65'h0eb48cec022774ddf;
    stim[27] = 65'h0d067dd42abb7683e;
    stim[28] = 65'h0d520d379904e9c3a;
    stim[29] = 65'h08535a9fc00b2d248;
    stim[30] = 65'h022e7b00e2e811c6c;
    stim[31] = 65'h079480c2b68330d58;
    stim[32] = 65'h1c9c595c46e0c7672;
    stim[33] = 65'h08cd8bdc45d4d3c7c;
    stim[34] = 65'h03d7d06cfe73720e6;
    stim[35] = 65'h014d05bd269ca19bf;
    stim[36] = 65'h099dc344b5c7c4d5f;
    stim[37] = 65'h035068921de5427a3;
    stim[38] = 65'h0dd8af381dc41cee5;
    stim[39] = 65'h09b0e153dfa0b1513;
    stim[40] = 65'h0ca7e11a4426741ce;
    stim[41] = 65'h0ab18d209e8bd3d0e;
    stim[42] = 65'h057c36a037f966581;
    stim[43] = 65'h0f402a5946cffb273;
    stim[44] = 65'h0433442a08298e0df;
    stim[45] = 65'h0c1a8bfb536214f71;
    stim[46] = 65'h0d8931b308879d2f1;
    stim[47] = 65'h0a00edd35b2e1baa1;
    stim[48] = 65'h02c1a50add1018423;
    stim[49] = 65'h01b0b1b016fd3207c;
    stim[50] = 65'h09d7bb65ab5b93ac4;
    stim[51] = 65'h014e65bcadbda9a00;
    stim[52] = 65'h0bd74f5a4bad162c6;
    stim[53] = 65'h0c2a8820c06fe8f89;
    stim[54] = 65'h0a828adf165caeef9;
    stim[55] = 65'h006ec3e5a16941a36;
    stim[56] = 65'h05edd8681be5505ed;
    stim[57] = 65'h0f271a10743de1242;
    stim[58] = 65'h0f55e428a4caf5113;
    stim[59] = 65'h04d29201c3dc7e237;
    stim[60] = 65'h03c97abc1bb56ef51;
    stim[61] = 65'h032f4b0a85fb9c697;
    stim[62] = 65'h0439637d56db115ed;
    stim[63] = 65'h0940297b7181016a3;
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
      expv[0] = 58'h000fe3e1dab52f9;
      expv[1] = 58'h00081c42ba88eb4;
      expv[2] = 58'h000d429d5e358ef;
      expv[3] = 58'h3f4cc758be2e282;
      expv[4] = 58'h0708f3db5ca91ad;
      expv[5] = 58'h0559b7c15c4543a;
      expv[6] = 58'h007c9ec11d36ef3;
      expv[7] = 58'h060e65997a408e7;
      expv[8] = 58'h0a189edb1848629;
      expv[9] = 58'h0ef8a4f9fd8f14c;
      expv[10] = 58'h076cc19e6e62a02;
      expv[11] = 58'h144d0b1a4c1ae24;
      expv[12] = 58'h095a459a8821673;
      expv[13] = 58'h0e7c29610a40ddb;
      expv[14] = 58'h01fdc23f6adf792;
      expv[15] = 58'h12db65897df1d23;
      expv[16] = 58'h071b11f20bf22b1;
      expv[17] = 58'h0dfcd681bfc8bdb;
      expv[18] = 58'h0c0b4be40ca8031;
      expv[19] = 58'h066fac84eee0b23;
      expv[20] = 58'h035d1fac9ddee93;
      expv[21] = 58'h062d64b4681ca74;
      expv[22] = 58'h3bf9225a8e264d7;
      expv[23] = 58'h3f3adbcf3c50d80;
      expv[24] = 58'h0b4fc17b781652a;
      expv[25] = 58'h157d45a57fa3888;
      expv[26] = 58'h3dfc8cec0f74ddf;
      expv[27] = 58'h09be7dd42b7683e;
      expv[28] = 58'h078a0d379ce9c3a;
      expv[29] = 58'h04bb5a9fcb2d248;
      expv[30] = 58'h38ce7b00e811c6c;
      expv[31] = 58'h023c80c2bb30d58;
      expv[32] = 58'h000c595c48c7672;
      expv[33] = 58'h000d8bdc4cd3c7c;
      expv[34] = 58'h054fd06cfb720e6;
      expv[35] = 58'h0c9d05bd2ca19bf;
      expv[36] = 58'h07ddc344bfc4d5f;
      expv[37] = 58'h06c868921d427a3;
      expv[38] = 58'h0a78af381c1cee5;
      expv[39] = 58'h0f48e153d8b1513;
      expv[40] = 58'h0abfe11a4e741ce;
      expv[41] = 58'h09998d209bd3d0e;
      expv[42] = 58'h0a8c36a03966581;
      expv[43] = 58'h12f82a594ffb273;
      expv[44] = 58'h142b442a098e0df;
      expv[45] = 58'h00ca8bfb5a14f71;
      expv[46] = 58'h070931b30f9d2f1;
      expv[47] = 58'h0428edd35e1baa1;
      expv[48] = 58'h0269a50ad818423;
      expv[49] = 58'h07b8b1b01d3207c;
      expv[50] = 58'h096fbb65ab93ac4;
      expv[51] = 58'h026e65bcada9a00;
      expv[52] = 58'h061f4f5a4d162c6;
      expv[53] = 58'h070a8820cfe8f89;
      expv[54] = 58'h013a8adf1caeef9;
      expv[55] = 58'h09cec3e5a941a36;
      expv[56] = 58'h3bbdd8681d505ed;
      expv[57] = 58'h0baf1a107de1242;
      expv[58] = 58'h0ecde428aaf5113;
      expv[59] = 58'h104a9201cc7e237;
      expv[60] = 58'h09697abc1d6ef51;
      expv[61] = 58'h070f4b0a8b9c697;
      expv[62] = 58'h0a59637d5b115ed;
      expv[63] = 58'h0e38297b79016a3;
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
