// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019106 dut (
    .RTin(in_vec[98:67]),
    .alu_out(in_vec[66:35]),
    .LdStCtrl(in_vec[34:32]),
    .PCout_Y(in_vec[31:0]),
    .mem_adr(out_vec[55:44]),
    .we_i(out_vec[43:40]),
    .we_d(out_vec[39:36]),
    .we_isr(out_vec[35:32]),
    .RTout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h39b690723f30aa91918eb3018;
    stim[1] = 99'h0ccf2f4e0a53c8b4e1d11a018;
    stim[2] = 99'h35e6caa88cb521f59dc60df63;
    stim[3] = 99'h3ad1b75146003e2a2f332bb37;
    stim[4] = 99'h548dab0e37cf24e60af462d34;
    stim[5] = 99'h0f75fd2202d185ba9521cbfd8;
    stim[6] = 99'h2fd34dca620b88447f82c9feb;
    stim[7] = 99'h1cf7cbb457d5d5776ae17907c;
    stim[8] = 99'h1a22f7b11b2236fa45b7a497f;
    stim[9] = 99'h4d35e96054e9738b3442b653a;
    stim[10] = 99'h2e259585e8fe7b86ff6a4c2f8;
    stim[11] = 99'h79d0b82f0dedfefa288dd2396;
    stim[12] = 99'h58f96b5976c611d2883c2d6c0;
    stim[13] = 99'h104d4f3c26b2a80fdf70d9cd8;
    stim[14] = 99'h13e27558159503a9ba48e7a5f;
    stim[15] = 99'h355bcfa7059db96143cdbcd7a;
    stim[16] = 99'h72e6c74462b088620a01a3d37;
    stim[17] = 99'h2a8c1c7462af24a05ed24f824;
    stim[18] = 99'h1855a8972d41216d802117b25;
    stim[19] = 99'h52d6486cc1a7cda8286d4baf4;
    stim[20] = 99'h0b41649d74235b727ce2a3316;
    stim[21] = 99'h2d214f497e9cdb48160cfe86e;
    stim[22] = 99'h5edbc0094d8e1b7537a816cc4;
    stim[23] = 99'h7b863125cfb5d8e5d6c4da31c;
    stim[24] = 99'h7a62c79e953d32b0f0e878d13;
    stim[25] = 99'h5fba5503f6dc1a065613788a8;
    stim[26] = 99'h119b6ce5d5d16e463beec4798;
    stim[27] = 99'h5f6b47b6a7db8ff1567e5171b;
    stim[28] = 99'h54b2b585c1f382b3b92ae99ed;
    stim[29] = 99'h3220a3992c3ba473927f098fc;
    stim[30] = 99'h433cc6139aa77fdca6315ed7d;
    stim[31] = 99'h662acaeb24c7152df90986fda;
    stim[32] = 99'h693dacdcfd7a80d2c0b476d88;
    stim[33] = 99'h775b1e867fc72638047241b6a;
    stim[34] = 99'h7b7fa1859306887dd013676bc;
    stim[35] = 99'h2e895b424e97e2f50a897f101;
    stim[36] = 99'h1a6d545694d602d81a5c5a9d5;
    stim[37] = 99'h457a42d3c66fb3930cbdda6c2;
    stim[38] = 99'h2fb0187fe3f3cecb7c299c0c1;
    stim[39] = 99'h02fc57ac169d454c868967ad1;
    stim[40] = 99'h108f9d018f3b25fec21648f5b;
    stim[41] = 99'h07c79cfedabc7f546b3ed2f6b;
    stim[42] = 99'h336a468df3a4277e22e5f6b29;
    stim[43] = 99'h7798b3719832d5ec62f01b3f2;
    stim[44] = 99'h0f97fb3ee766799c77a61ab13;
    stim[45] = 99'h3d9934cf6aab535d095e1d0c3;
    stim[46] = 99'h46ed20b3409ba8c757ea86c19;
    stim[47] = 99'h7c6d1159fc2a8c854ecf268e2;
    stim[48] = 99'h66ea68f4c7337bd6da11f0a4d;
    stim[49] = 99'h2e3446a6fb16955768e9d45d3;
    stim[50] = 99'h49ad20cbce943aa0548a4e0cf;
    stim[51] = 99'h4de72867ef850f7866547e1e4;
    stim[52] = 99'h74ca7f8ae7940d979a5f3b6ab;
    stim[53] = 99'h5495c40b1686e279dd7c5794d;
    stim[54] = 99'h45006667dbe983a3837b6bbea;
    stim[55] = 99'h7bfc1626ccdae66cd0ea1258c;
    stim[56] = 99'h5c87c33d1dd6bc9c6dbddc478;
    stim[57] = 99'h6833e8a8646b53ef6cacaf909;
    stim[58] = 99'h7ca8c139f86e5b40058c10480;
    stim[59] = 99'h72f4d97d2663e507a4d3502da;
    stim[60] = 99'h413ad01da1d1b4e226a88e620;
    stim[61] = 99'h275a6c8028b4230dcfed2be63;
    stim[62] = 99'h626a7138ec97229cae83eda65;
    stim[63] = 99'h170ac1c00853ae1064dcd3c1c;
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
      expv[0] = 56'h548000000000e4;
      expv[1] = 56'h45a000199e5e9c;
      expv[2] = 56'h0fa00000000051;
      expv[3] = 56'hf1500000006ea2;
      expv[4] = 56'h273000a91b561c;
      expv[5] = 56'h2dd00000000044;
      expv[6] = 56'h4220005fa69b94;
      expv[7] = 56'habb00039ef9768;
      expv[8] = 56'hb7d0003445ef62;
      expv[9] = 56'h9c50009a6bd2c0;
      expv[10] = 56'hdc30005c4b2b0b;
      expv[11] = 56'hf7d0000000705e;
      expv[12] = 56'h8e9000b1f2d6b2;
      expv[13] = 56'h407000209a9e78;
      expv[14] = 56'h1d400027c4eab0;
      expv[15] = 56'hcb00006ab79f4e;
      expv[16] = 56'h431000e5cd8e88;
      expv[17] = 56'h250000551838e8;
      expv[18] = 56'h0b600030ab512e;
      expv[19] = 56'h6d4000000090d9;
      expv[20] = 56'hdb90001682c93a;
      expv[21] = 56'hda400000000092;
      expv[22] = 56'hdba000bdb78012;
      expv[23] = 56'hc72000f70c624b;
      expv[24] = 56'h958000f4c58f3d;
      expv[25] = 56'hd03000bf74aa07;
      expv[26] = 56'h7230002336d9cb;
      expv[27] = 56'h7f8000bed68f6d;
      expv[28] = 56'h159000a9656b0b;
      expv[29] = 56'h23908000000032;
      expv[30] = 56'hfee00000008c27;
      expv[31] = 56'ha96000cc5595d6;
      expv[32] = 56'h069000d27b59b9;
      expv[33] = 56'h31c000eeb63d0c;
      expv[34] = 56'h43e000f6ff430b;
      expv[35] = 56'h17a0005d12b684;
      expv[36] = 56'h16c000000000ad;
      expv[37] = 56'h9c90008af485a7;
      expv[38] = 56'h7650005f6030ff;
      expv[39] = 56'h2a600005f8af58;
      expv[40] = 56'h2ff000211f3a03;
      expv[41] = 56'hfaa0000f8f39fd;
      expv[42] = 56'h3bf00000008d1b;
      expv[43] = 56'haf6000ef3166e3;
      expv[44] = 56'hcce0001f2ff67d;
      expv[45] = 56'h9ae0007b32699e;
      expv[46] = 56'h4630008dda4166;
      expv[47] = 56'h642000f8da22b3;
      expv[48] = 56'hdeb000cdd4d1e9;
      expv[49] = 56'haab0005c688d4d;
      expv[50] = 56'hd50000935a4197;
      expv[51] = 56'h7bc0009bce50cf;
      expv[52] = 56'h6cb00000000015;
      expv[53] = 56'h13c000a92b8816;
      expv[54] = 56'h1d10008a00cccf;
      expv[55] = 56'h336000f7f82c4d;
      expv[56] = 56'he4e000b90f867a;
      expv[57] = 56'h9f7000d067d150;
      expv[58] = 56'hda0000f9518273;
      expv[59] = 56'h283c000000b2fa;
      expv[60] = 56'ha710000000a03b;
      expv[61] = 56'h1860004eb4d900;
      expv[62] = 56'h14e0000000e271;
      expv[63] = 56'h7080002e158380;
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
