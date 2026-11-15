// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04310 dut (
    .iCLK(clk),
    .SWITCH(in_vec[57:26]),
    .iY(in_vec[25:18]),
    .iCb(in_vec[17:10]),
    .iCr(in_vec[9:2]),
    .iDVAL(in_vec[1:1]),
    .iRESET(in_vec[0:0]),
    .Red(out_vec[30:21]),
    .Green(out_vec[20:11]),
    .Blue(out_vec[10:1]),
    .oDVAL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h3b3484c627da537;
    stim[1] = 58'h12b62e0ab3e9edb;
    stim[2] = 58'h17a2f03b687d5d8;
    stim[3] = 58'h11a2848fbad5522;
    stim[4] = 58'h39cd66cd247d7f4;
    stim[5] = 58'h32b3c0eca20cce6;
    stim[6] = 58'h2dc8e9cf832e950;
    stim[7] = 58'h3927ac8613f6fd6;
    stim[8] = 58'h1747345e7d7cb60;
    stim[9] = 58'h225ef69779a08fc;
    stim[10] = 58'h29a587934e1427e;
    stim[11] = 58'h137ca760caf8c0a;
    stim[12] = 58'h04cdbb8043a9af0;
    stim[13] = 58'h3c5f449d51bf21e;
    stim[14] = 58'h104bfd361f93b92;
    stim[15] = 58'h1262805751418be;
    stim[16] = 58'h3ca5de69f1b408a;
    stim[17] = 58'h3662797a07fe500;
    stim[18] = 58'h3836a81d4eb5af6;
    stim[19] = 58'h3ed255ebc9c1698;
    stim[20] = 58'h0b21d754ecfd9fa;
    stim[21] = 58'h030df09281c7e94;
    stim[22] = 58'h124bc52dd093872;
    stim[23] = 58'h3d82200601775f0;
    stim[24] = 58'h335836bb0719eee;
    stim[25] = 58'h0cd009e6df80406;
    stim[26] = 58'h246278dcfa7b966;
    stim[27] = 58'h35ef9ae4562d671;
    stim[28] = 58'h094585f5d5af44e;
    stim[29] = 58'h0b100f61e195448;
    stim[30] = 58'h23cc3e210dc40ba;
    stim[31] = 58'h045967ffd15baa6;
    stim[32] = 58'h0299bf0fc1dcab0;
    stim[33] = 58'h12f326288b8bf08;
    stim[34] = 58'h018c8acb091b8b2;
    stim[35] = 58'h0c0f5366a15e84e;
    stim[36] = 58'h09cce7c81365002;
    stim[37] = 58'h115f728ba4a0e80;
    stim[38] = 58'h069b64dd38f0832;
    stim[39] = 58'h3db7419d3f69844;
    stim[40] = 58'h00fd97a7e9e8765;
    stim[41] = 58'h287e7137794c3c4;
    stim[42] = 58'h3e153b918b98d78;
    stim[43] = 58'h376e912e5e66ba8;
    stim[44] = 58'h21e7de3528a5de4;
    stim[45] = 58'h1f12ec831774e28;
    stim[46] = 58'h212eb8b0a4be61a;
    stim[47] = 58'h02c1054d8bd4bb0;
    stim[48] = 58'h0ae98f47867429a;
    stim[49] = 58'h1a30a87fc38782a;
    stim[50] = 58'h0f0c4cf57b53ad4;
    stim[51] = 58'h1eb018450d0af82;
    stim[52] = 58'h0432af4d24257b0;
    stim[53] = 58'h3364dbdac56f65e;
    stim[54] = 58'h1a86d0cd015a8ac;
    stim[55] = 58'h02cf78ec7658632;
    stim[56] = 58'h3b7ecbf11527348;
    stim[57] = 58'h121046c781cf31e;
    stim[58] = 58'h26450b9d17b1807;
    stim[59] = 58'h1ae2e301d7707e4;
    stim[60] = 58'h155d0c1ca428a0c;
    stim[61] = 58'h1476f9b9f121898;
    stim[62] = 58'h2639cc8e2130416;
    stim[63] = 58'h3fdde528e7f6afa;
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
      expv[0] = 31'hxxxxxxxx;
      expv[1] = 31'h00000000;
      expv[2] = 31'h00000000;
      expv[3] = 31'h00000000;
      expv[4] = 31'h0010e800;
      expv[5] = 31'h001ff800;
      expv[6] = 31'h539ffd34;
      expv[7] = 31'h7ebfffe6;
      expv[8] = 31'h4a5ffca1;
      expv[9] = 31'h451ffc4c;
      expv[10] = 31'h001ff801;
      expv[11] = 31'h23dffa3a;
      expv[12] = 31'h7fffffff;
      expv[13] = 31'h7bbfffb8;
      expv[14] = 31'h167ff962;
      expv[15] = 31'h0efff8eb;
      expv[16] = 31'h001ff801;
      expv[17] = 31'h1e9ff9e6;
      expv[18] = 31'h3f3ffbef;
      expv[19] = 31'h1e1ff9dd;
      expv[20] = 31'h691ffe8f;
      expv[21] = 31'h07fff87b;
      expv[22] = 31'h17bff976;
      expv[23] = 31'h0c9ff8c5;
      expv[24] = 31'h5e1ffddc;
      expv[25] = 31'h001ff801;
      expv[26] = 31'h1c5ff9c0;
      expv[27] = 31'h001ff801;
      expv[28] = 31'h00000000;
      expv[29] = 31'h00000000;
      expv[30] = 31'h0010e800;
      expv[31] = 31'h001ff800;
      expv[32] = 31'h27fffa7a;
      expv[33] = 31'h43dffc3b;
      expv[34] = 31'h15fff95a;
      expv[35] = 31'h1e1ff9dd;
      expv[36] = 31'h001ff801;
      expv[37] = 31'h10bff906;
      expv[38] = 31'h0adff8a8;
      expv[39] = 31'h435ffc31;
      expv[40] = 31'h22bffa27;
      expv[41] = 31'h00000000;
      expv[42] = 31'h00000000;
      expv[43] = 31'h0010e800;
      expv[44] = 31'h001ff800;
      expv[45] = 31'h7b3fffae;
      expv[46] = 31'h10bff906;
      expv[47] = 31'h3c5ffbc0;
      expv[48] = 31'h543ffd3e;
      expv[49] = 31'h2c1ffabc;
      expv[50] = 31'h4adffcaa;
      expv[51] = 31'h113ff911;
      expv[52] = 31'h047ff842;
      expv[53] = 31'h001ff801;
      expv[54] = 31'h7fdffff9;
      expv[55] = 31'h143ff93e;
      expv[56] = 31'h49bffc97;
      expv[57] = 31'h021ff81e;
      expv[58] = 31'h001ff801;
      expv[59] = 31'h00000000;
      expv[60] = 31'h00000000;
      expv[61] = 31'h0010e800;
      expv[62] = 31'h001ff800;
      expv[63] = 31'h2c1ffabc;
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
