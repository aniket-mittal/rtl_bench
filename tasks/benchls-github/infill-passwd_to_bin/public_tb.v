// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  passwd_to_bin dut (
    .in(in_vec[63:0]),
    .out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hb8087333b0259e68;
    stim[1] = 64'hfa4b0545fcb18322;
    stim[2] = 64'h713fd8345d98aded;
    stim[3] = 64'h2138b54dc35cbc8d;
    stim[4] = 64'h0473c896c688e5ab;
    stim[5] = 64'hf6161330658b7266;
    stim[6] = 64'h1d8617220a3181d8;
    stim[7] = 64'hb5c768ed3df45512;
    stim[8] = 64'h851559d25a8e76ad;
    stim[9] = 64'h0006ac786f743585;
    stim[10] = 64'h9cc0d552be75bca6;
    stim[11] = 64'he9f37e53f1d4d650;
    stim[12] = 64'h67265cd78d1ccd9c;
    stim[13] = 64'h32774eba56dc6d31;
    stim[14] = 64'h8ce94077cbe64401;
    stim[15] = 64'h42039920ba52e61b;
    stim[16] = 64'h2898515fda1549d2;
    stim[17] = 64'hce4727b4daad24b3;
    stim[18] = 64'h70f973dde3fd6449;
    stim[19] = 64'h06a81027c107b045;
    stim[20] = 64'hf92468c088f1fd32;
    stim[21] = 64'h33d3a6ff734a9695;
    stim[22] = 64'hc0542dd7c976dcf6;
    stim[23] = 64'ha136b2e89e3f604b;
    stim[24] = 64'h3813f8026a9e045d;
    stim[25] = 64'hfd2a3c1a5ad34e57;
    stim[26] = 64'h609e117ca5ae148a;
    stim[27] = 64'h462ad602173eebb9;
    stim[28] = 64'h558869232d72a667;
    stim[29] = 64'h7779e28e76bc678f;
    stim[30] = 64'hfdbfa5a6fc90d6ab;
    stim[31] = 64'h86b7f5bc907d880c;
    stim[32] = 64'hb505ca04976a0b6f;
    stim[33] = 64'h74c851a2a1e12f6d;
    stim[34] = 64'h7ccd472aba92de35;
    stim[35] = 64'h44232a7e7f3d61e6;
    stim[36] = 64'h509b2317c498f88e;
    stim[37] = 64'h5ca1c152b470c7eb;
    stim[38] = 64'hbc9483cfbcfac3a4;
    stim[39] = 64'h1d67e680a4fedbc4;
    stim[40] = 64'hf14ffb08323d0e4b;
    stim[41] = 64'h82fd91c45f64c745;
    stim[42] = 64'ha594764a4acee9c9;
    stim[43] = 64'he2a9067b18805285;
    stim[44] = 64'h2d16abb7fc5c8981;
    stim[45] = 64'h2b7dc0ab9ec41a10;
    stim[46] = 64'h69ffaac08d2c6eef;
    stim[47] = 64'h4a1f906180e1f2fe;
    stim[48] = 64'h42fd12614200294d;
    stim[49] = 64'hfde8912b8d493c97;
    stim[50] = 64'h17a66ca8bea5a272;
    stim[51] = 64'hecdeaff4401b9bf2;
    stim[52] = 64'h2eb3e9f06d33ba7f;
    stim[53] = 64'h768fc3dbc4d6a949;
    stim[54] = 64'h8a6109822ef5f7c3;
    stim[55] = 64'ha5d2f9633d6c28c3;
    stim[56] = 64'hf0f9b2428feaccc8;
    stim[57] = 64'h70642b17de27b8b1;
    stim[58] = 64'h7fde0fdb88fb99b4;
    stim[59] = 64'h0048d39b6c4952b3;
    stim[60] = 64'h0d0bf14d0faec42f;
    stim[61] = 64'hba8fbf6fee1c8076;
    stim[62] = 64'hfd555f213ac747bd;
    stim[63] = 64'hde5781390c56191b;
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
      expv[0] = 64'h7010e666604a3cd0;
      expv[1] = 64'hf4960a8af8620644;
      expv[2] = 64'he27eb068ba305ada;
      expv[3] = 64'h42706a9a86b8781a;
      expv[4] = 64'h08e6902c8c10ca56;
      expv[5] = 64'hec2c2660ca16e4cc;
      expv[6] = 64'h3a0c2e44146202b0;
      expv[7] = 64'h6a8ed0da7ae8aa24;
      expv[8] = 64'h0a2ab2a4b41cec5a;
      expv[9] = 64'h000c58f0dee86a0a;
      expv[10] = 64'h3880aaa47cea784c;
      expv[11] = 64'hd2e6fca6e2a8aca0;
      expv[12] = 64'hce4cb8ae1a389a38;
      expv[13] = 64'h64ee9c74acb8da62;
      expv[14] = 64'h18d280ee96cc8802;
      expv[15] = 64'h8406324074a4cc36;
      expv[16] = 64'h5030a2beb42a92a4;
      expv[17] = 64'h9c8e4e68b45a4866;
      expv[18] = 64'he0f2e6bac6fac892;
      expv[19] = 64'h0c50204e820e608a;
      expv[20] = 64'hf248d08010e2fa64;
      expv[21] = 64'h66a64cfee6942c2a;
      expv[22] = 64'h80a85aae92ecb8ec;
      expv[23] = 64'h426c64d03c7ec096;
      expv[24] = 64'h7026f004d43c08ba;
      expv[25] = 64'hfa547834b4a69cae;
      expv[26] = 64'hc03c22f84a5c2814;
      expv[27] = 64'h8c54ac042e7cd672;
      expv[28] = 64'haa10d2465ae44cce;
      expv[29] = 64'heef2c41cec78ce1e;
      expv[30] = 64'hfa7e4a4cf820ac56;
      expv[31] = 64'h0c6eea7820fa1018;
      expv[32] = 64'h6a0a94082ed416de;
      expv[33] = 64'he890a24442c25eda;
      expv[34] = 64'hf89a8e547424bc6a;
      expv[35] = 64'h884654fcfe7ac2cc;
      expv[36] = 64'ha036462e8830f01c;
      expv[37] = 64'hb84282a468e08ed6;
      expv[38] = 64'h7828069e78f48648;
      expv[39] = 64'h3acecc0048fcb688;
      expv[40] = 64'he29ef610647a1c96;
      expv[41] = 64'h04fa2288bec88e8a;
      expv[42] = 64'h4a28ec94949cd292;
      expv[43] = 64'hc4520cf63000a40a;
      expv[44] = 64'h5a2c566ef8b81202;
      expv[45] = 64'h56fa80563c883420;
      expv[46] = 64'hd2fe54801a58dcde;
      expv[47] = 64'h943e20c200c2e4fc;
      expv[48] = 64'h84fa24c28400529a;
      expv[49] = 64'hfad022561a92782e;
      expv[50] = 64'h2e4cd8507c4a44e4;
      expv[51] = 64'hd8bc5ee8803636e4;
      expv[52] = 64'h5c66d2e0da6674fe;
      expv[53] = 64'hec1e86b688ac5292;
      expv[54] = 64'h14c212045ceaee86;
      expv[55] = 64'h4aa4f2c67ad85086;
      expv[56] = 64'he0f264841ed49890;
      expv[57] = 64'he0c8562ebc4e7062;
      expv[58] = 64'hfebc1eb610f63268;
      expv[59] = 64'h0090a636d892a466;
      expv[60] = 64'h1a16e29a1e5c885e;
      expv[61] = 64'h741e7ededc3800ec;
      expv[62] = 64'hfaaabe42748e8e7a;
      expv[63] = 64'hbcae027218ac3236;
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
