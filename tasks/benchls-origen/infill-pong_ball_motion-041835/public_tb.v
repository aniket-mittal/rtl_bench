// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041835 dut (
    .game_clk(clk),
    .rst(in_vec[40:40]),
    .p1_x(in_vec[39:30]),
    .p1_y(in_vec[29:20]),
    .p2_x(in_vec[19:10]),
    .p2_y(in_vec[9:0]),
    .x(out_vec[21:12]),
    .y(out_vec[11:2]),
    .point_p1(out_vec[1:1]),
    .point_p2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h14044057408;
    stim[1] = 41'h1ddbdcbb0b8;
    stim[2] = 41'h0f2f8535310;
    stim[3] = 41'h02563fa080d;
    stim[4] = 41'h0e603ff99d3;
    stim[5] = 41'h0e0f2d6c524;
    stim[6] = 41'h0c122a084c2;
    stim[7] = 41'h08100fc6884;
    stim[8] = 41'h07452768139;
    stim[9] = 41'h07ed0652447;
    stim[10] = 41'h0e5cfc5c94b;
    stim[11] = 41'h087c0fec3c6;
    stim[12] = 41'h088bd314300;
    stim[13] = 41'h0934d0e81d5;
    stim[14] = 41'h0e6469e59b8;
    stim[15] = 41'h019d2b380d5;
    stim[16] = 41'h163dfa27f80;
    stim[17] = 41'h0b5b46ff681;
    stim[18] = 41'h0a2d6f4067e;
    stim[19] = 41'h0b8cadeaf61;
    stim[20] = 41'h0ed2d9bd032;
    stim[21] = 41'h01da63fd837;
    stim[22] = 41'h1f1d1b6cdb6;
    stim[23] = 41'h04986b3d6d4;
    stim[24] = 41'h0c4e564454f;
    stim[25] = 41'h04dc11da74b;
    stim[26] = 41'h0b813b33c0c;
    stim[27] = 41'h1a569069cba;
    stim[28] = 41'h00ad7b5f33b;
    stim[29] = 41'h08e35f0959e;
    stim[30] = 41'h010d299c69f;
    stim[31] = 41'h0ee9c686031;
    stim[32] = 41'h0e93d35d8c0;
    stim[33] = 41'h0eaa55b12bd;
    stim[34] = 41'h0b75deeeb56;
    stim[35] = 41'h0379fdc001c;
    stim[36] = 41'h0edc209dd6c;
    stim[37] = 41'h0741edc0366;
    stim[38] = 41'h03992fd103f;
    stim[39] = 41'h0af3095bb79;
    stim[40] = 41'h085e7ff0cc2;
    stim[41] = 41'h0f5fd77b029;
    stim[42] = 41'h06ddaaa64ec;
    stim[43] = 41'h091ad095054;
    stim[44] = 41'h0df491f31f1;
    stim[45] = 41'h097c5384628;
    stim[46] = 41'h002fee8a3b3;
    stim[47] = 41'h00525a00012;
    stim[48] = 41'h07efbc17550;
    stim[49] = 41'h017e85ad63c;
    stim[50] = 41'h0fe9cb48cda;
    stim[51] = 41'h00d962d2b1a;
    stim[52] = 41'h0d94bc46502;
    stim[53] = 41'h0c1dc879837;
    stim[54] = 41'h0b6a264f9c4;
    stim[55] = 41'h07ba678c312;
    stim[56] = 41'h0bd17f9c74b;
    stim[57] = 41'h083dc8ac72a;
    stim[58] = 41'h0dd991547e9;
    stim[59] = 41'h049d1f3f54e;
    stim[60] = 41'h05b8fc078f2;
    stim[61] = 41'h0084bb628a7;
    stim[62] = 41'h02ae0a40500;
    stim[63] = 41'h0d3087a6315;
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
      expv[0] = 22'h136424;
      expv[1] = 22'h136424;
      expv[2] = 22'h136424;
      expv[3] = 22'h137428;
      expv[4] = 22'h13842c;
      expv[5] = 22'h139430;
      expv[6] = 22'h13a434;
      expv[7] = 22'h13b438;
      expv[8] = 22'h13c43c;
      expv[9] = 22'h13d440;
      expv[10] = 22'h13e444;
      expv[11] = 22'h13f448;
      expv[12] = 22'h14044c;
      expv[13] = 22'h141450;
      expv[14] = 22'h142454;
      expv[15] = 22'h143458;
      expv[16] = 22'h136424;
      expv[17] = 22'h136424;
      expv[18] = 22'h137428;
      expv[19] = 22'h13842c;
      expv[20] = 22'h139430;
      expv[21] = 22'h13a434;
      expv[22] = 22'h136424;
      expv[23] = 22'h136424;
      expv[24] = 22'h137428;
      expv[25] = 22'h13842c;
      expv[26] = 22'h139430;
      expv[27] = 22'h136424;
      expv[28] = 22'h136424;
      expv[29] = 22'h137428;
      expv[30] = 22'h13842c;
      expv[31] = 22'h139430;
      expv[32] = 22'h13a434;
      expv[33] = 22'h13b438;
      expv[34] = 22'h13c43c;
      expv[35] = 22'h13d440;
      expv[36] = 22'h13e444;
      expv[37] = 22'h13f448;
      expv[38] = 22'h14044c;
      expv[39] = 22'h141450;
      expv[40] = 22'h142454;
      expv[41] = 22'h143458;
      expv[42] = 22'h14445c;
      expv[43] = 22'h145460;
      expv[44] = 22'h146464;
      expv[45] = 22'h147468;
      expv[46] = 22'h14846c;
      expv[47] = 22'h149470;
      expv[48] = 22'h14a474;
      expv[49] = 22'h14b478;
      expv[50] = 22'h14c47c;
      expv[51] = 22'h14d480;
      expv[52] = 22'h14e484;
      expv[53] = 22'h14f488;
      expv[54] = 22'h15048c;
      expv[55] = 22'h151490;
      expv[56] = 22'h152494;
      expv[57] = 22'h153498;
      expv[58] = 22'h15449c;
      expv[59] = 22'h1554a0;
      expv[60] = 22'h1564a4;
      expv[61] = 22'h1574a8;
      expv[62] = 22'h1584ac;
      expv[63] = 22'h1594b0;
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
