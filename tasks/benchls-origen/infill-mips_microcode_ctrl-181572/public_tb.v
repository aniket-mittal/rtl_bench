// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_181572 dut (
    .I(in_vec[38:7]),
    .state(in_vec[6:5]),
    .status(in_vec[4:0]),
    .cw_IW(out_vec[96:64]),
    .K(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h15afe51d14;
    stim[1] = 39'h5f6641519f;
    stim[2] = 39'h7f83127b02;
    stim[3] = 39'h3f4393f756;
    stim[4] = 39'h360361677a;
    stim[5] = 39'h72d3aee19b;
    stim[6] = 39'h0c69128136;
    stim[7] = 39'h6ba74c2478;
    stim[8] = 39'h1375f3afd0;
    stim[9] = 39'h46160f66fa;
    stim[10] = 39'h05540c6f7a;
    stim[11] = 39'h3ee132dae0;
    stim[12] = 39'h36052586ff;
    stim[13] = 39'h15f4a99660;
    stim[14] = 39'h15f1005cae;
    stim[15] = 39'h3669546537;
    stim[16] = 39'h408dfdf323;
    stim[17] = 39'h1f58a6de7c;
    stim[18] = 39'h30ff705cd3;
    stim[19] = 39'h366755ef11;
    stim[20] = 39'h3d0abf67a5;
    stim[21] = 39'h6c3969200d;
    stim[22] = 39'h4cd0c0dd94;
    stim[23] = 39'h15d6828617;
    stim[24] = 39'h158d6a8647;
    stim[25] = 39'h20f8504b1a;
    stim[26] = 39'h102bd954db;
    stim[27] = 39'h2950a9a15d;
    stim[28] = 39'h334146ee5f;
    stim[29] = 39'h2264d2b48d;
    stim[30] = 39'h609e45812a;
    stim[31] = 39'h558ca9baff;
    stim[32] = 39'h27b2477af4;
    stim[33] = 39'h5bada630db;
    stim[34] = 39'h758910507e;
    stim[35] = 39'h3f9b65d7a4;
    stim[36] = 39'h581f4a2913;
    stim[37] = 39'h776683d614;
    stim[38] = 39'h373d74fae4;
    stim[39] = 39'h0f43329450;
    stim[40] = 39'h484f2a2d22;
    stim[41] = 39'h6f29a19515;
    stim[42] = 39'h332847b36d;
    stim[43] = 39'h4b1decdfd7;
    stim[44] = 39'h1d3ac3e168;
    stim[45] = 39'h2298437961;
    stim[46] = 39'h1ef4ef7cb0;
    stim[47] = 39'h44e9f0e9cf;
    stim[48] = 39'h1ac948b25f;
    stim[49] = 39'h455b4c1a83;
    stim[50] = 39'h620884162d;
    stim[51] = 39'h061967c36a;
    stim[52] = 39'h38b3d96a45;
    stim[53] = 39'h0eb3918523;
    stim[54] = 39'h4f709acbba;
    stim[55] = 39'h144a97cafd;
    stim[56] = 39'h6d8219be7c;
    stim[57] = 39'h414b8c60c5;
    stim[58] = 39'h4fca578af1;
    stim[59] = 39'h6e9b64a7cd;
    stim[60] = 39'h09bc96d1c4;
    stim[61] = 39'h1aeef0c3aa;
    stim[62] = 39'h4784d5df67;
    stim[63] = 39'h549e390d9e;
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
      expv[0] = 97'h000000003ffffffffff5fca3a;
      expv[1] = 97'h000000003fffffffffecc82a3;
      expv[2] = 97'h000000003ffffffffff0624f6;
      expv[3] = 97'h000000003fffffffffe8727ee;
      expv[4] = 97'h000000003000000000006c2ce;
      expv[5] = 97'h0000000030000000001a75dc3;
      expv[6] = 97'h0000000030000000000d22502;
      expv[7] = 97'h000000003ffffffffff4e9848;
      expv[8] = 97'h000000003fffffffffeebe75f;
      expv[9] = 97'h102160f5100000000002c1ecd;
      expv[10] = 97'h000000003fffffffffea818de;
      expv[11] = 97'h0000000030000000001c265b5;
      expv[12] = 97'h00000000300000000000a4b0d;
      expv[13] = 97'h000000003ffffffffffe9532c;
      expv[14] = 97'h000000003ffffffffffe200b9;
      expv[15] = 97'h0000000030000000000d2a8ca;
      expv[16] = 97'h00000000300000000011bfbe6;
      expv[17] = 97'h000000003fffffffffeb14dbc;
      expv[18] = 97'h0000000030000000001fee0b9;
      expv[19] = 97'h0000000030000000000ceabde;
      expv[20] = 97'h000000003fffffffffe157ecf;
      expv[21] = 97'h000000003000000000072d240;
      expv[22] = 97'h0000000030000000001a181bb;
      expv[23] = 97'h000000003ffffffffffad050c;
      expv[24] = 97'h000000003ffffffffff1ad50c;
      expv[25] = 97'h0000000030000000001f0a096;
      expv[26] = 97'h000000003000000000057b2a9;
      expv[27] = 97'h000000003fffffffffea15342;
      expv[28] = 97'h000000003fffffffffe828ddc;
      expv[29] = 97'h0000000030000000000c9a569;
      expv[30] = 97'h00000000300000000013c8b02;
      expv[31] = 97'h000000003ffffffffff195375;
      expv[32] = 97'h000000003ffffffffff648ef5;
      expv[33] = 97'h000000003ffffffffff5b4c61;
      expv[34] = 97'h000000003ffffffffff1220a0;
      expv[35] = 97'h000000003ffffffffff36cbaf;
      expv[36] = 97'h00000000300000000003e9452;
      expv[37] = 97'h000000003fffffffffecd07ac;
      expv[38] = 97'h000000003fffffffffe7ae9f5;
      expv[39] = 97'h000000003fffffffffe866528;
      expv[40] = 97'h00000000300000000009e545a;
      expv[41] = 97'h000000003fffffffffe53432a;
      expv[42] = 97'h000000003fffffffffe508f66;
      expv[43] = 97'h000000003fffffffffe3bd9bf;
      expv[44] = 97'h000000003fffffffffe7587c2;
      expv[45] = 97'h00000000300000000013086f2;
      expv[46] = 97'h0000000030000000001e9def9;
      expv[47] = 97'h0000000030000000001d3e1d3;
      expv[48] = 97'h0000000030000000001929164;
      expv[49] = 97'h000000003fffffffffeb69835;
      expv[50] = 97'h000000003000000000011082c;
      expv[51] = 97'h000000003000000000032cf86;
      expv[52] = 97'h000000003000000000167b2d4;
      expv[53] = 97'h000000003000000000167230a;
      expv[54] = 97'h000000003fffffffffee13597;
      expv[55] = 97'h0000000030000000000952f95;
      expv[56] = 97'h000000003ffffffffff04337c;
      expv[57] = 97'h000000003fffffffffe9718c1;
      expv[58] = 97'h000000003ffffffffff94af15;
      expv[59] = 97'h000000003000000000136c94f;
      expv[60] = 97'h183bc806effffffffff792da3;
      expv[61] = 97'h0000000030000000001dde187;
      expv[62] = 97'h10384d751ffffffffff09abbe;
      expv[63] = 97'h00000000300000000013c721b;
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
