// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 63;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024521 dut (
    .clk(clk),
    .data(in_vec[62:47]),
    .displayX(in_vec[46:37]),
    .displayY(in_vec[36:27]),
    .hsync(in_vec[26:26]),
    .vsync(in_vec[25:25]),
    .blank(in_vec[24:24]),
    .previousPixel(in_vec[23:0]),
    .pixel(out_vec[56:33]),
    .addr(out_vec[32:23]),
    .displayXOut(out_vec[22:13]),
    .displayYOut(out_vec[12:3]),
    .hsyncOut(out_vec[2:2]),
    .vsyncOut(out_vec[1:1]),
    .blankOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 63'h58d96d06d3754100;
    stim[1] = 63'h121bbd7087eebd38;
    stim[2] = 63'h16e8361bdf9ac69f;
    stim[3] = 63'h108528f221989711;
    stim[4] = 63'h7d0e7f82a0b9616f;
    stim[5] = 63'h177c4c2248860907;
    stim[6] = 63'h60bf0207aecc6bce;
    stim[7] = 63'h5e5452c2a893c538;
    stim[8] = 63'h1ea7bdcca848ab93;
    stim[9] = 63'h251a9624f88f6ff2;
    stim[10] = 63'h3afee3974cc4d5db;
    stim[11] = 63'h6b466cded2534a24;
    stim[12] = 63'h2a3bdb6ff410e4b7;
    stim[13] = 63'h6c16a6764891fdf6;
    stim[14] = 63'h3fda42b0fda1b522;
    stim[15] = 63'h72b258fbc090bf1f;
    stim[16] = 63'h143f1a035247a21f;
    stim[17] = 63'h502fca840a09c019;
    stim[18] = 63'h79fe0fe196430910;
    stim[19] = 63'h1cac563d066a2617;
    stim[20] = 63'h7ded7964e279d623;
    stim[21] = 63'h4003bfcca2c3c503;
    stim[22] = 63'h4a82b46e453387ee;
    stim[23] = 63'h71842d5df57a5c21;
    stim[24] = 63'h69c8dfad75bd811c;
    stim[25] = 63'h22e8a56bbda4bff8;
    stim[26] = 63'h6f6abd8b84d6b090;
    stim[27] = 63'h7bbdb75bccf50ba8;
    stim[28] = 63'h1017d9dc14d5b82c;
    stim[29] = 63'h16f0ea06ff338c1b;
    stim[30] = 63'h0470ddac8835e44d;
    stim[31] = 63'h2169a345cfcaa210;
    stim[32] = 63'h173c38d92be466f7;
    stim[33] = 63'h7ffdd3877872a034;
    stim[34] = 63'h6be1e7e04773ca48;
    stim[35] = 63'h54d76d4a29a5da39;
    stim[36] = 63'h7831611799cc4692;
    stim[37] = 63'h4184d83ecee714fd;
    stim[38] = 63'h0c83b467df73ec6a;
    stim[39] = 63'h601713f909083a08;
    stim[40] = 63'h587844ba2570e9ad;
    stim[41] = 63'h057d3d5187d4a609;
    stim[42] = 63'h77b6bc262f28a1f8;
    stim[43] = 63'h06f1a296fbc5d4f2;
    stim[44] = 63'h2259694dfef98434;
    stim[45] = 63'h453fa626e4526a62;
    stim[46] = 63'h014921b6fb5a5623;
    stim[47] = 63'h6bb12670b078110a;
    stim[48] = 63'h13cd6fa4df4ac03a;
    stim[49] = 63'h29f7ed45a62e98fe;
    stim[50] = 63'h6788ab7865bb98bc;
    stim[51] = 63'h43d393d9d3853b68;
    stim[52] = 63'h4ff87e2060fb9af5;
    stim[53] = 63'h235f547270fba452;
    stim[54] = 63'h67cc9b1c7d3173f0;
    stim[55] = 63'h176c294c2ec1e980;
    stim[56] = 63'h400e6ab72ac1754e;
    stim[57] = 63'h4c01f611834415b2;
    stim[58] = 63'h3963f8667ad80e75;
    stim[59] = 63'h43b83d997491fc58;
    stim[60] = 63'h55094c36126a836b;
    stim[61] = 63'h111b18f4c5689020;
    stim[62] = 63'h527b63ec74605c99;
    stim[63] = 63'h096268de492753d7;
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
      expv[0] = 57'hxxxxxxxxxxxxxxx;
      expv[1] = 57'hxxxxx0xxxxd06d3;
      expv[2] = 57'h1xxxxxxxxxd7087;
      expv[3] = 57'h1fe000xxxx61bdf;
      expv[4] = 57'h1fe000xxxx8f221;
      expv[5] = 57'h1fe000xxxxf82a0;
      expv[6] = 57'h1fe000xxxxc2248;
      expv[7] = 57'h1fe000xxxx207ae;
      expv[8] = 57'h1fe000xxxx2c2a8;
      expv[9] = 57'h1fe000xxxxdcca8;
      expv[10] = 57'h1fe000xxxx624f8;
      expv[11] = 57'h1fe000xxxx3974c;
      expv[12] = 57'h0a6944xxxxcded2;
      expv[13] = 57'h021c96xxxxb6ff4;
      expv[14] = 57'h123fbexxxx67648;
      expv[15] = 57'h1436a4xxxx2b0fd;
      expv[16] = 57'h1217e3xxxx8fbc0;
      expv[17] = 57'h08f443xxxxa0352;
      expv[18] = 57'h1fe000xxxxa840a;
      expv[19] = 57'h1fe000xxxxfe196;
      expv[20] = 57'h1fe000xxxx63d06;
      expv[21] = 57'h0f3ac4xxxx964e2;
      expv[22] = 57'h1fe000xxxxfcca2;
      expv[23] = 57'h1fe000xxxx46e45;
      expv[24] = 57'h1fe000xxxxd5df5;
      expv[25] = 57'h17b023xxxxfad75;
      expv[26] = 57'h1fe000xxxx56bbd;
      expv[27] = 57'h1ad612xxxxd8b84;
      expv[28] = 57'h1fe000xxxx75bcc;
      expv[29] = 57'h1fe000xxxx9dc14;
      expv[30] = 57'h067183xxxxa06ff;
      expv[31] = 57'h1fe000xxxxdac88;
      expv[32] = 57'h1fe000xxxx345cf;
      expv[33] = 57'h1fe000xxxx8d92b;
      expv[34] = 57'h0e5406xxxx38778;
      expv[35] = 57'h1fe000xxxx7e047;
      expv[36] = 57'h1fe000xxxxd4a29;
      expv[37] = 57'h1988d2xxxx11799;
      expv[38] = 57'h1fe000xxxx83ece;
      expv[39] = 57'h0e7d8dxxxx467df;
      expv[40] = 57'h1fe000xxxx3f909;
      expv[41] = 57'h0e1d35xxxx4ba25;
      expv[42] = 57'h1a94c1xxxxd5187;
      expv[43] = 57'h1fe000xxxxc262f;
      expv[44] = 57'h1fe000xxxx296fb;
      expv[45] = 57'h1fe000xxxx94dfe;
      expv[46] = 57'h0a4d4cxxxx626e4;
      expv[47] = 57'h1fe000xxxx1b6fb;
      expv[48] = 57'h0f0221xxxx670b0;
      expv[49] = 57'h095807xxxxfa4df;
      expv[50] = 57'h05d31fxxxxd45a6;
      expv[51] = 57'h1fe000xxxxb7865;
      expv[52] = 57'h10a76dxxxx3d9d3;
      expv[53] = 57'h1f735exxxxe2060;
      expv[54] = 57'h1fe000xxxx47270;
      expv[55] = 57'h1fe000xxxxb1c7d;
      expv[56] = 57'h183d30xxxx94c2e;
      expv[57] = 57'h182ea9xxxxab72a;
      expv[58] = 57'h1fe000xxxx61183;
      expv[59] = 57'h1b01cexxxx8667a;
      expv[60] = 57'h123f8bxxxxd9974;
      expv[61] = 57'h0d506dxxxxc3612;
      expv[62] = 57'h0d1204xxxx8f4c5;
      expv[63] = 57'h1fe000xxxx3ec74;
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
