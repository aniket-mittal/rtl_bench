// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140144 dut (
    .i_axi_clk(clk),
    .rst(in_vec[66:66]),
    .i_ppfifo_rdy(in_vec[65:65]),
    .i_ppfifo_size(in_vec[64:33]),
    .i_ppfifo_data(in_vec[32:1]),
    .i_axi_ready(in_vec[0:0]),
    .o_ppfifo_act(out_vec[68:68]),
    .o_ppfifo_stb(out_vec[67:67]),
    .o_axi_user(out_vec[66:66]),
    .o_axi_data(out_vec[65:34]),
    .o_axi_last(out_vec[33:33]),
    .o_axi_valid(out_vec[32:32]),
    .o_debug(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4974f68acb8976745;
    stim[1] = 67'h6b3d7b9ace01f9f7b;
    stim[2] = 67'h2abf942a17edd3799;
    stim[3] = 67'h429f216fa948b7398;
    stim[4] = 67'h21b0464357807dbe3;
    stim[5] = 67'h144b0567842f6a292;
    stim[6] = 67'h3746d627869feff88;
    stim[7] = 67'h2a4cae6ec944b3d0d;
    stim[8] = 67'h0b77875783c08203d;
    stim[9] = 67'h3c66d7f4074648fbc;
    stim[10] = 67'h0cfb255a22d1aa26e;
    stim[11] = 67'h3f27e6a95c0288fed;
    stim[12] = 67'h0264a35362e619683;
    stim[13] = 67'h21180c32303a78994;
    stim[14] = 67'h3586f02ce3a2d2363;
    stim[15] = 67'h3d1e4f377cd961af2;
    stim[16] = 67'h0aff87e488783575f;
    stim[17] = 67'h2aaf6b1f9f0b9103e;
    stim[18] = 67'h1c662169634e1b3a1;
    stim[19] = 67'h140b71d1a25ebc78c;
    stim[20] = 67'h118c32f06bfac4dbb;
    stim[21] = 67'h3c6559afc455fc81f;
    stim[22] = 67'h29706344bc9bd7d97;
    stim[23] = 67'h25bf45dd84784b109;
    stim[24] = 67'h2e2800e8f64815812;
    stim[25] = 67'h1c3d5b6816485fe0a;
    stim[26] = 67'h21c153ff55a621a5b;
    stim[27] = 67'h0cce8bfe8e94c0c4a;
    stim[28] = 67'h01e898567a8d88214;
    stim[29] = 67'h175d3b8b469062c41;
    stim[30] = 67'h28c33f4e867c72aaf;
    stim[31] = 67'h1263d0698753d8bce;
    stim[32] = 67'h1ea234d47c461d46b;
    stim[33] = 67'h3b33484937f83c4fc;
    stim[34] = 67'h3e2439209717463cd;
    stim[35] = 67'h0deb741bfd1eae722;
    stim[36] = 67'h09e315120da221739;
    stim[37] = 67'h23e8cd82a160742c5;
    stim[38] = 67'h22fbf9fa9f99c806b;
    stim[39] = 67'h23ddc655a3a5f0d40;
    stim[40] = 67'h0dfc94a319fba2c71;
    stim[41] = 67'h181ca57c731b17d8e;
    stim[42] = 67'h1b73699f1051a8597;
    stim[43] = 67'h237b2b1037ef0527a;
    stim[44] = 67'h34c40f9498d9649e8;
    stim[45] = 67'h1a1684b19777c9a0f;
    stim[46] = 67'h3aa51b62b771bb3bd;
    stim[47] = 67'h3717be4408ca7e771;
    stim[48] = 67'h1b0279bf438e9ed88;
    stim[49] = 67'h23b267e521e50b39b;
    stim[50] = 67'h08de92dcff50b5722;
    stim[51] = 67'h0ac368557afb90df8;
    stim[52] = 67'h30d8ff368c5b0f5da;
    stim[53] = 67'h2a950a70f086b9354;
    stim[54] = 67'h052247129054def8c;
    stim[55] = 67'h1e28235478a92f8a8;
    stim[56] = 67'h2c49cdcbe60d8886b;
    stim[57] = 67'h2ebb3a232408151ea;
    stim[58] = 67'h21370c9f1001ad293;
    stim[59] = 67'h2e00101d8b2c6b88b;
    stim[60] = 67'h35375815928e299f1;
    stim[61] = 67'h10cc9a39ec590a3b4;
    stim[62] = 67'h2a97f6ec2c3a695a9;
    stim[63] = 67'h2ca2a741f9520463e;
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
      expv[0] = 69'h000000000000000000;
      expv[1] = 69'h000000000000000000;
      expv[2] = 69'h000000000000000000;
      expv[3] = 69'h000000000000000000;
      expv[4] = 69'h000000000000000000;
      expv[5] = 69'h100000000000000000;
      expv[6] = 69'h10000000004d82321a;
      expv[7] = 69'h10000000004d82321a;
      expv[8] = 69'h1928967a194d82321a;
      expv[9] = 69'h1128967a184d823219;
      expv[10] = 69'h1128967a184d823219;
      expv[11] = 69'h1128967a184d823219;
      expv[12] = 69'h1b80511fd94d823219;
      expv[13] = 69'h1380511fd84d823218;
      expv[14] = 69'h1380511fd84d823218;
      expv[15] = 69'h18745a46c54d823218;
      expv[16] = 69'h10745a46c44d823217;
      expv[17] = 69'h10745a46c44d823217;
      expv[18] = 69'h10745a46c44d823217;
      expv[19] = 69'h10745a46c44d823217;
      expv[20] = 69'h10745a46c44d823217;
      expv[21] = 69'h10745a46c44d823217;
      expv[22] = 69'h188abf903d4d823217;
      expv[23] = 69'h1b937afb2d4d823216;
      expv[24] = 69'h188f0962114d823215;
      expv[25] = 69'h108f0962104d823214;
      expv[26] = 69'h108f0962104d823214;
      expv[27] = 69'h1ab4c434b54d823214;
      expv[28] = 69'h12b4c434b44d823213;
      expv[29] = 69'h12b4c434b44d823213;
      expv[30] = 69'h12b4c434b44d823213;
      expv[31] = 69'h18cf8e555d4d823213;
      expv[32] = 69'h10cf8e555c4d823212;
      expv[33] = 69'h10cf8e555c4d823212;
      expv[34] = 69'h10cf8e555c4d823212;
      expv[35] = 69'h1ae2e8c7994d823212;
      expv[36] = 69'h12e2e8c7984d823211;
      expv[37] = 69'h12e2e8c7984d823211;
      expv[38] = 69'h182c0e85894d823211;
      expv[39] = 69'h1bf33900d54d823210;
      expv[40] = 69'h13f33900d44d82320f;
      expv[41] = 69'h13f33900d44d82320f;
      expv[42] = 69'h13f33900d44d82320f;
      expv[43] = 69'h13f33900d44d82320f;
      expv[44] = 69'h13f33900d44d82320f;
      expv[45] = 69'h13f33900d44d82320f;
      expv[46] = 69'h13f33900d44d82320f;
      expv[47] = 69'h1aee3767794d82320f;
      expv[48] = 69'h19194fcee14d82320e;
      expv[49] = 69'h11194fcee04d82320d;
      expv[50] = 69'h183ca167354d82320d;
      expv[51] = 69'h103ca167344d82320c;
      expv[52] = 69'h103ca167344d82320c;
      expv[53] = 69'h103ca167344d82320c;
      expv[54] = 69'h103ca167344d82320c;
      expv[55] = 69'h103ca167344d82320c;
      expv[56] = 69'h103ca167344d82320c;
      expv[57] = 69'h18c1b110d54d82320c;
      expv[58] = 69'h10c1b110d44d82320b;
      expv[59] = 69'h1a0035a5254d82320b;
      expv[60] = 69'h19658d71154d82320a;
      expv[61] = 69'h1a51c533e14d823209;
      expv[62] = 69'h1251c533e04d823208;
      expv[63] = 69'h19874d2b514d823208;
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
