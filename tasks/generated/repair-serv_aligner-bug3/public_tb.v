// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .i_ibus_adr(in_vec[65:34]),
    .i_ibus_cyc(in_vec[33:33]),
    .i_wb_ibus_rdt(in_vec[32:1]),
    .i_wb_ibus_ack(in_vec[0:0]),
    .o_ibus_rdt(out_vec[65:34]),
    .o_ibus_ack(out_vec[33:33]),
    .o_wb_ibus_adr(out_vec[32:1]),
    .o_wb_ibus_cyc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h51d5b7364ee353a70;
    stim[1] = 67'h5d7dc1e7fe81e1ed8;
    stim[2] = 67'h2513869ac38c0e3bc;
    stim[3] = 67'h34e3b1e19b52f2e7f;
    stim[4] = 67'h27d89da540b236309;
    stim[5] = 67'h2d6d8f27e05b856a0;
    stim[6] = 67'h2db66d56c7ca96cea;
    stim[7] = 67'h1faf052844db8b8a5;
    stim[8] = 67'h15f19c1466c840b6b;
    stim[9] = 67'h221134d40c5acd839;
    stim[10] = 67'h317db73cad08b955e;
    stim[11] = 67'h08bbb63639490fdb7;
    stim[12] = 67'h263a5396a5cf0ebe0;
    stim[13] = 67'h0714bf71d1e18317f;
    stim[14] = 67'h11aa7eed521e674c2;
    stim[15] = 67'h1fe44e0dc54af29a5;
    stim[16] = 67'h12c4ad3897b0684fd;
    stim[17] = 67'h2b659ed93c62ceec1;
    stim[18] = 67'h248c6c0c92032fd63;
    stim[19] = 67'h0e0168cd85a4e36e2;
    stim[20] = 67'h38a981341790b974e;
    stim[21] = 67'h2d44a791d97f5e903;
    stim[22] = 67'h1d36a92dcddadc76e;
    stim[23] = 67'h13f24650d7429258b;
    stim[24] = 67'h2440839fe378e39a2;
    stim[25] = 67'h173da15bb9a7d88a5;
    stim[26] = 67'h2baac860bb00b2609;
    stim[27] = 67'h35b970e556eccf06a;
    stim[28] = 67'h1d6bbb1fd3045f60c;
    stim[29] = 67'h2b7f27f80ff4cc17c;
    stim[30] = 67'h3cba4f6c972672e85;
    stim[31] = 67'h2a27656818d452cd1;
    stim[32] = 67'h1845d3ed0fdc6869e;
    stim[33] = 67'h0421603f94f750e7f;
    stim[34] = 67'h13701881612e97873;
    stim[35] = 67'h3bc242bae5589e2a1;
    stim[36] = 67'h0d3c1190cb44682a8;
    stim[37] = 67'h19033e4a197e41d27;
    stim[38] = 67'h26be003bf0b7a3782;
    stim[39] = 67'h0a2df8f902a901e2a;
    stim[40] = 67'h183efdab3604debc5;
    stim[41] = 67'h1342d7f7a7dc0d514;
    stim[42] = 67'h2a31a614d56c96790;
    stim[43] = 67'h053f5738d3df98664;
    stim[44] = 67'h2ad2e6883c3033755;
    stim[45] = 67'h0f263c529f9c53d46;
    stim[46] = 67'h0ec032ccc31e62524;
    stim[47] = 67'h0ef632ce3ced1c495;
    stim[48] = 67'h185ab06de889a998d;
    stim[49] = 67'h214fb69dacd5a9592;
    stim[50] = 67'h2beb0494c09ca268d;
    stim[51] = 67'h26608afffd990b6fa;
    stim[52] = 67'h2fd8c9783c6ed968c;
    stim[53] = 67'h15c470ff72f678450;
    stim[54] = 67'h15c54296922bff2b9;
    stim[55] = 67'h364e8865eb6b08370;
    stim[56] = 67'h16aad105932f6dde8;
    stim[57] = 67'h0bae955fa362b7a3b;
    stim[58] = 67'h037674de87566f0b6;
    stim[59] = 67'h1816cc2c3e8754a03;
    stim[60] = 67'h2a99cb7588aae82b0;
    stim[61] = 67'h066d122cb1b4cb161;
    stim[62] = 67'h146ca302b5e9702e8;
    stim[63] = 67'h0342bf3de0532c70e;
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
      expv[0] = 66'hxxxxxxxxx8eadb9bx;
      expv[1] = 66'h3d03c3db0ebee0f3f;
      expv[2] = 66'h07181c779289c34d6;
      expv[3] = 66'h36a5e5cffa71d8f0c;
      expv[4] = 66'h2c6136a5d3ec4ed32;
      expv[5] = 66'h0ad4016456b6c7947;
      expv[6] = 66'h2d9d416456db36abe;
      expv[7] = 66'h171481644fd78294a;
      expv[8] = 66'h016d49b70af8ce0ab;
      expv[9] = 66'h1b070d9091089a6a8;
      expv[10] = 66'h32abd8b598bedb9ed;
      expv[11] = 66'h1fb6d8b5845ddb1b9;
      expv[12] = 66'h1d7c3292131d29cbd;
      expv[13] = 66'h062ff292038a5fb96;
      expv[14] = 66'h243cce9848d53f76a;
      expv[15] = 66'h0a95e534aff22706e;
      expv[16] = 66'h109f8a95c962569cc;
      expv[17] = 66'h38c59dd815b2cf6c9;
      expv[18] = 66'h24065fac724636064;
      expv[19] = 66'h06dc64064700b4674;
      expv[20] = 66'h32e9e4065c54c09a8;
      expv[21] = 66'h3d20640656a253c96;
      expv[22] = 66'h1bb5b8edce9b5496e;
      expv[23] = 66'h2e8524b169f923286;
      expv[24] = 66'h07346e85122041d07;
      expv[25] = 66'h3114ae850b9ed0ae5;
      expv[26] = 66'h360164c135d564305;
      expv[27] = 66'h1e0d76015adcb8732;
      expv[28] = 66'h3ec1b6014eb5dd906;
      expv[29] = 66'h182fb60155bf93fc8;
      expv[30] = 66'h25d0b6015e5d27b6c;
      expv[31] = 66'h31a8a59a1513b2b40;
      expv[32] = 66'h1fb8d0d3cc22e9f68;
      expv[33] = 66'h29eea1cfe210b01fc;
      expv[34] = 66'h2f0e69ee89b80c413;
      expv[35] = 66'h3c54025d1de1215df;
      expv[36] = 66'h1688d055069e08c86;
      expv[37] = 66'h32fc83a4cc819f250;
      expv[38] = 66'h216f46f0535f001df;
      expv[39] = 66'h055203c54516fc7c8;
      expv[40] = 66'h2c09bd788c1f7ed59;
      expv[41] = 66'h0fb81aa289a16bfbd;
      expv[42] = 66'h2ad92cf21518d30a6;
      expv[43] = 66'h27bf30cc829fab9c6;
      expv[44] = 66'h386066ea956973441;
      expv[45] = 66'h3f38a7a8c7931e294;
      expv[46] = 66'h063cc4a4876019666;
      expv[47] = 66'h39da3892877b19671;
      expv[48] = 66'h11135331ac2d5836f;
      expv[49] = 66'h12b2511350a7db4f5;
      expv[50] = 66'h04d1911355f5824ae;
      expv[51] = 66'h3b3216df5330457ff;
      expv[52] = 66'h38ddb2d197ec64bc1;
      expv[53] = 66'h25ecf08a0ae2387fb;
      expv[54] = 66'h2457fe572ae2a14b4;
      expv[55] = 66'h106e2457db2744337;
      expv[56] = 66'h1bbd2457cb5568834;
      expv[57] = 66'h2f476457c5d74ab05;
      expv[58] = 66'h0eacde16c1bb3a6f4;
      expv[59] = 66'h3d0ea9404c0b66161;
      expv[60] = 66'h1155d056154ce5bac;
      expv[61] = 66'h2369962c233689165;
      expv[62] = 66'h205d23698a365181d;
      expv[63] = 66'h18e1e36981a15f9f7;
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
