// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051230 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .ctrlsignals(in_vec[63:32]),
    .memoryin(in_vec[31:16]),
    .acc(in_vec[15:0]),
    .memoryout(out_vec[55:40]),
    .mbr(out_vec[39:24]),
    .ir(out_vec[23:16]),
    .mar(out_vec[15:8]),
    .pc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h15b8c7e0de4233902;
    stim[1] = 65'h1ad59e9c9a25b25bf;
    stim[2] = 65'h03a5558a179e114e1;
    stim[3] = 65'h18db1f1d7d6294c53;
    stim[4] = 65'h003f5694b829d3ebb;
    stim[5] = 65'h06f29420e404d306f;
    stim[6] = 65'h075d6c3dd6a35bd3f;
    stim[7] = 65'h09a8f63682c7797d6;
    stim[8] = 65'h0e2e68484353850ac;
    stim[9] = 65'h0ecd2955df41293bf;
    stim[10] = 65'h05e8025f74825b3cc;
    stim[11] = 65'h1a75a7344c334c2ab;
    stim[12] = 65'h0fe09ca175dbe6cee;
    stim[13] = 65'h011052c72faf005f2;
    stim[14] = 65'h010e4d9cb441079a6;
    stim[15] = 65'h0f17a6ea93637cd3a;
    stim[16] = 65'h0fb75d9fa42346c0a;
    stim[17] = 65'h00afd5f861084294c;
    stim[18] = 65'h0951cf5d04e1d7655;
    stim[19] = 65'h02a4c5fe7d654bb1f;
    stim[20] = 65'h1823a536c13998803;
    stim[21] = 65'h00de25e6d83b06cb1;
    stim[22] = 65'h013b304edda726049;
    stim[23] = 65'h01790d73e8e5563be;
    stim[24] = 65'h0eb7f8d654ef6be21;
    stim[25] = 65'h064571abf534704aa;
    stim[26] = 65'h02d8115434df51e23;
    stim[27] = 65'h00ef50129da99fc25;
    stim[28] = 65'h011457924d4976d19;
    stim[29] = 65'h011ede357bdaf32e4;
    stim[30] = 65'h09767c7ee11d6e1b8;
    stim[31] = 65'h0bf0de1d5318ba0ba;
    stim[32] = 65'h082b88d8541dab0ff;
    stim[33] = 65'h0a1a4a13d7492abd0;
    stim[34] = 65'h06fdc91235bf68ba1;
    stim[35] = 65'h0d3754b9c818513be;
    stim[36] = 65'h0d49a64c25fc7ac9b;
    stim[37] = 65'h0b93f3495f9d1d419;
    stim[38] = 65'h0b9c766b190ea8949;
    stim[39] = 65'h1abb90b2acdf368bc;
    stim[40] = 65'h008792ab33bfae01e;
    stim[41] = 65'h038b15ed3fe8fccec;
    stim[42] = 65'h0a34faeb41c3167ed;
    stim[43] = 65'h0a133a6d6a52bf77a;
    stim[44] = 65'h040aa5d681eb3f36d;
    stim[45] = 65'h057c5fa5bc72dea15;
    stim[46] = 65'h011adfba661f16539;
    stim[47] = 65'h0e2d06aad35d4770f;
    stim[48] = 65'h01b198e6f1c2990c5;
    stim[49] = 65'h08f7e30a0ae348a11;
    stim[50] = 65'h0f0a4dcd458783211;
    stim[51] = 65'h0eb6a799111e3bf8d;
    stim[52] = 65'h0f3881371cd0a50d0;
    stim[53] = 65'h062032f7e1d8f1bae;
    stim[54] = 65'h086f23e5a040ad946;
    stim[55] = 65'h02c0abccea189bc1d;
    stim[56] = 65'h0c1f6740112dc749d;
    stim[57] = 65'h0333f859dabfe4424;
    stim[58] = 65'h0a28ff5e88bdb20cf;
    stim[59] = 65'h02be6c43ebf20584a;
    stim[60] = 65'h000253ddeb03e804a;
    stim[61] = 65'h0a33f21a0c6d71cfa;
    stim[62] = 65'h05b103d5064168a67;
    stim[63] = 65'h0df71394957946017;
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
      expv[0] = 56'hxxxxxxxxxx0000;
      expv[1] = 56'hxxxxxxxxxx0000;
      expv[2] = 56'hxxxxxxxxxx0000;
      expv[3] = 56'hxxxx0000xx0000;
      expv[4] = 56'hxxxx0000xx0000;
      expv[5] = 56'hxxxx0000xx0001;
      expv[6] = 56'hxxxx0001xx0001;
      expv[7] = 56'hxxxxbd3f6a0001;
      expv[8] = 56'hxxxx00016a7702;
      expv[9] = 56'hxxxx00016a0201;
      expv[10] = 56'h0001f412f40101;
      expv[11] = 56'h0001f412480000;
      expv[12] = 56'h0001f412480000;
      expv[13] = 56'h000100005d0012;
      expv[14] = 56'h00010012fa1213;
      expv[15] = 56'h001279a6fa1212;
      expv[16] = 56'h0012cd3afa1212;
      expv[17] = 56'hcd3a001242343a;
      expv[18] = 56'h0012003a423a3a;
      expv[19] = 56'h003a76554e3a3a;
      expv[20] = 56'h7655bb1f4e0000;
      expv[21] = 56'h7655bb1f4e0000;
      expv[22] = 56'hbb1f6cb14e0001;
      expv[23] = 56'hbb1f00014e0102;
      expv[24] = 56'h000163be8e0201;
      expv[25] = 56'h000100018e01be;
      expv[26] = 56'h000100be5347be;
      expv[27] = 56'h00be00be53bebf;
      expv[28] = 56'h00be00bf5399bf;
      expv[29] = 56'h00bf00bf5397bf;
      expv[30] = 56'h00bf00bfbd97bf;
      expv[31] = 56'h00bf00bfbdbfbf;
      expv[32] = 56'h00bf00bf31bfbf;
      expv[33] = 56'h00bf00bf31bfbf;
      expv[34] = 56'h00bf74927492bf;
      expv[35] = 56'h7492749274f692;
      expv[36] = 56'h7492009281f692;
      expv[37] = 56'h7492ac9b819293;
      expv[38] = 56'hac9b0093f99393;
      expv[39] = 56'hac9b0093900000;
      expv[40] = 56'hac9b0093900000;
      expv[41] = 56'hac9b00003bfa00;
      expv[42] = 56'h00000000fe0001;
      expv[43] = 56'h000000011c0100;
      expv[44] = 56'h00000000a50001;
      expv[45] = 56'h0000f36da50102;
      expv[46] = 56'hf36d0002c7016d;
      expv[47] = 56'h0002006dc7f102;
      expv[48] = 56'h0002770fc7d402;
      expv[49] = 56'h00020002c7020f;
      expv[50] = 56'h00020002c7340f;
      expv[51] = 56'h00023211580f02;
      expv[52] = 56'h3211bf8d110f02;
      expv[53] = 56'hbf8dbf8dcd0a03;
      expv[54] = 56'hbf8d00031d0304;
      expv[55] = 56'h0003040a040405;
      expv[56] = 56'h040aa18904050a;
      expv[57] = 56'ha189749d040a0a;
      expv[58] = 56'ha189000aab0a9d;
      expv[59] = 56'h000a009dab9d0a;
      expv[60] = 56'h000a584abf0a9d;
      expv[61] = 56'h584a009db09d9e;
      expv[62] = 56'h584a009eb0d79e;
      expv[63] = 56'h009e009e649e9f;
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
