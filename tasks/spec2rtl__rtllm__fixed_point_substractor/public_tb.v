// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fixed_point_subtractor dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .c(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h5753d45a741836ad;
    stim[1] = 64'h508e519f959825c7;
    stim[2] = 64'h066ad726b740d06d;
    stim[3] = 64'h5ef219f8ec9e8e51;
    stim[4] = 64'h009ead4b09a2b9e7;
    stim[5] = 64'h8f52aa92d3676a72;
    stim[6] = 64'h4aa39468f84c88e7;
    stim[7] = 64'hbbfbc058e25c7d83;
    stim[8] = 64'h0b9d1b0a582289bd;
    stim[9] = 64'h3857f8f4cbcd6f17;
    stim[10] = 64'h0965c0df7b8ee032;
    stim[11] = 64'h2b3f69dc00f7a959;
    stim[12] = 64'hfcc6a090d22617e8;
    stim[13] = 64'hdb2f74bdac82629b;
    stim[14] = 64'hae1caea391cdb9b8;
    stim[15] = 64'hb4c1fa83b57a33fe;
    stim[16] = 64'h8abe0eb92010ea2b;
    stim[17] = 64'h629d4db40540dd9d;
    stim[18] = 64'h6f38f356048df254;
    stim[19] = 64'h5e48bf3980c377a5;
    stim[20] = 64'h6ad5372108b68a9d;
    stim[21] = 64'hb7a2e9da7761a869;
    stim[22] = 64'h1cea110124206734;
    stim[23] = 64'h5099036f570beabf;
    stim[24] = 64'h185b3d9ddbd92339;
    stim[25] = 64'hf3134f970c2c7efd;
    stim[26] = 64'h0a3ec27b470309b6;
    stim[27] = 64'h399002483303ca06;
    stim[28] = 64'h4f53d8aba2c64e86;
    stim[29] = 64'h747056e305e11d25;
    stim[30] = 64'h7a17542314b053bc;
    stim[31] = 64'h564a3dc9dc3161f0;
    stim[32] = 64'h4f9045195ce406f7;
    stim[33] = 64'h909fa3aa3299c3bf;
    stim[34] = 64'h8935904ab3293408;
    stim[35] = 64'h655c4d4d7955011a;
    stim[36] = 64'h54b017b78b5127eb;
    stim[37] = 64'he70f4dc62ed85298;
    stim[38] = 64'h58139ab72e5f1289;
    stim[39] = 64'he690fca6b24ecb69;
    stim[40] = 64'h887ad82ed8d7e7b0;
    stim[41] = 64'h7990cd979671b0ff;
    stim[42] = 64'he16557b8efb339ce;
    stim[43] = 64'h28e5dfc9b507c6fc;
    stim[44] = 64'h67b3b8ebaffd84c0;
    stim[45] = 64'hdacb749063311908;
    stim[46] = 64'h287603537971f202;
    stim[47] = 64'hb2b894f4867d83fe;
    stim[48] = 64'h39ca2cd9138022d4;
    stim[49] = 64'h21fad7cdd57e2dd1;
    stim[50] = 64'hf6b57a5381ab5150;
    stim[51] = 64'h18d9a214967443e4;
    stim[52] = 64'h697ef2ae7c33787f;
    stim[53] = 64'hb4279f492575e718;
    stim[54] = 64'h06fff130bdeaaa72;
    stim[55] = 64'h76f84cdf121caca6;
    stim[56] = 64'h179a7eeda3d9cec3;
    stim[57] = 64'h45d434bde9d456c0;
    stim[58] = 64'he1f676ec1b215f58;
    stim[59] = 64'h4b34a14a9bdad62b;
    stim[60] = 64'h3f6199440676d7ff;
    stim[61] = 64'he6dc6eee5472124b;
    stim[62] = 64'hfd315d6397b0acff;
    stim[63] = 64'h44e346a8fc7c1a7c;
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
      expv[0] = 32'h633b9dad;
      expv[1] = 32'h66267766;
      expv[2] = 32'hbdaba793;
      expv[3] = 32'hcb90a849;
      expv[4] = 32'h76fbf364;
      expv[5] = 32'hbbeb4020;
      expv[6] = 32'hc2f01d4f;
      expv[7] = 32'hd99f42d5;
      expv[8] = 32'h337a914d;
      expv[9] = 32'h8425680b;
      expv[10] = 32'h0dd6e0ad;
      expv[11] = 32'h2a47c083;
      expv[12] = 32'haaa088a8;
      expv[13] = 32'haead1222;
      expv[14] = 32'h9c4ef4eb;
      expv[15] = 32'hff47c685;
      expv[16] = 32'h2acef8e4;
      expv[17] = 32'h5d5c7017;
      expv[18] = 32'h6aab0102;
      expv[19] = 32'h5f0c36de;
      expv[20] = 32'h621eac84;
      expv[21] = 32'h2f049243;
      expv[22] = 32'h78c9a9cd;
      expv[23] = 32'h798d18b0;
      expv[24] = 32'hf43460d6;
      expv[25] = 32'hff3fce94;
      expv[26] = 32'h433bb8c5;
      expv[27] = 32'h068c3842;
      expv[28] = 32'h721a2731;
      expv[29] = 32'h6e8f39be;
      expv[30] = 32'h65670067;
      expv[31] = 32'hb27b9fb9;
      expv[32] = 32'h72ac3e22;
      expv[33] = 32'h43396769;
      expv[34] = 32'hd60c5c42;
      expv[35] = 32'h6c074c33;
      expv[36] = 32'h60013fa2;
      expv[37] = 32'h95e7a05e;
      expv[38] = 32'h29b4882e;
      expv[39] = 32'hb442313d;
      expv[40] = 32'hafa2f07e;
      expv[41] = 32'h10027e96;
      expv[42] = 32'hf1b21dea;
      expv[43] = 32'hddeda6c5;
      expv[44] = 32'h17b13dab;
      expv[45] = 32'h3dfc8d98;
      expv[46] = 32'h2f041151;
      expv[47] = 32'hac3b10f6;
      expv[48] = 32'h264a0a05;
      expv[49] = 32'hf779059e;
      expv[50] = 32'hf50a2903;
      expv[51] = 32'h2f4de5f8;
      expv[52] = 32'h6d4b7a2f;
      expv[53] = 32'hd99d8661;
      expv[54] = 32'hc4ea9ba2;
      expv[55] = 32'h64dba039;
      expv[56] = 32'hbb744db0;
      expv[57] = 32'hafa88b7d;
      expv[58] = 32'hfd17d644;
      expv[59] = 32'h670f7775;
      expv[60] = 32'h38eac145;
      expv[61] = 32'hbb4e8139;
      expv[62] = 32'he580b064;
      expv[63] = 32'hc15f6124;
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
