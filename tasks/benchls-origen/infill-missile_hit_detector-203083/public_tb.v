// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_203083 dut (
    .pclk(clk),
    .rst(in_vec[61:61]),
    .xpos_missile_1(in_vec[60:51]),
    .ypos_missile_1(in_vec[50:41]),
    .xpos_missile_2(in_vec[40:31]),
    .ypos_missile_2(in_vec[30:21]),
    .level_change(in_vec[20:20]),
    .xpos_enemy(in_vec[19:10]),
    .ypos_enemy(in_vec[9:0]),
    .on_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h2d325bc980410bfd;
    stim[1] = 62'h3797d66c075b3ec8;
    stim[2] = 62'h1485d3b235c1f843;
    stim[3] = 62'h1697611260cd7a18;
    stim[4] = 62'h0675deed202d5466;
    stim[5] = 62'h04a99aba347b0ad5;
    stim[6] = 62'h1241ee515be2ac7e;
    stim[7] = 62'h0ff8e9d2012bdcdc;
    stim[8] = 62'h05fea3834cf4a7b3;
    stim[9] = 62'h08ce9864eca6144f;
    stim[10] = 62'h1d2f8f01c9614beb;
    stim[11] = 62'h041fea3fd54ad342;
    stim[12] = 62'h06468007ba28c497;
    stim[13] = 62'h1bb2a2e8f12bb9b4;
    stim[14] = 62'h08adb02260b8bd68;
    stim[15] = 62'h06d6e46e5a5830eb;
    stim[16] = 62'h0bb5e99e1e75dbf6;
    stim[17] = 62'h11529aea78a12e68;
    stim[18] = 62'h094c40aea2fab104;
    stim[19] = 62'h06449cd412d90d26;
    stim[20] = 62'h07de5dc90072a8a8;
    stim[21] = 62'h1a9132190152983b;
    stim[22] = 62'h107c7db58f15c6bd;
    stim[23] = 62'h00b3b2f3faa01119;
    stim[24] = 62'h0427a5e838603ea6;
    stim[25] = 62'h0e91d89022b4f202;
    stim[26] = 62'h19e283739b728227;
    stim[27] = 62'h11716baa9b7bfde9;
    stim[28] = 62'h16179d6d5ef48852;
    stim[29] = 62'h0a740bf5d8b1742f;
    stim[30] = 62'h1d712b1c900c7174;
    stim[31] = 62'h0ba646b8457aaa6a;
    stim[32] = 62'h1c3224d2e33e54d3;
    stim[33] = 62'h0d3e40915487e103;
    stim[34] = 62'h15ca659b957a71ef;
    stim[35] = 62'h1c8ad8f34eaa3997;
    stim[36] = 62'h1acfcffb94384621;
    stim[37] = 62'h1a8f6242e493208e;
    stim[38] = 62'h1e529f5c63c9b64a;
    stim[39] = 62'h1bdaf61563d7db7d;
    stim[40] = 62'h19dee9a24deb30a2;
    stim[41] = 62'h090afc4acb145114;
    stim[42] = 62'h09055131f5a0196a;
    stim[43] = 62'h1b4f89aae2fe25e0;
    stim[44] = 62'h02e2421a2db56d58;
    stim[45] = 62'h03323126027388c4;
    stim[46] = 62'h042d76e0ee1420ce;
    stim[47] = 62'h17525efbe9110633;
    stim[48] = 62'h1967552613886da6;
    stim[49] = 62'h1c6171698f96f0a4;
    stim[50] = 62'h11e791abf5ab5a08;
    stim[51] = 62'h1b831ce308819277;
    stim[52] = 62'h0240c238c3c8437c;
    stim[53] = 62'h1faa92bb0c030c43;
    stim[54] = 62'h05e057c65fd4403c;
    stim[55] = 62'h1a1bbf663ca9a41a;
    stim[56] = 62'h1ffebf8ab02f130b;
    stim[57] = 62'h136efbd32b0e217b;
    stim[58] = 62'h0a1b5859779e15f3;
    stim[59] = 62'h10ce58d54e1228ed;
    stim[60] = 62'h03919537b1ab8954;
    stim[61] = 62'h10bcd8352cec9418;
    stim[62] = 62'h038baf0b2f522d40;
    stim[63] = 62'h2dde0a7901f74679;
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
      expv[0] = 1'hx;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
