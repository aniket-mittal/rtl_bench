// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10504 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h636f1a934dc3e;
    stim[1] = 52'h468243c2d0ddd;
    stim[2] = 52'hc582341677852;
    stim[3] = 52'h04c1406eb18cb;
    stim[4] = 52'h5b7a86b7a2fe3;
    stim[5] = 52'h24f37eb0d3fd6;
    stim[6] = 52'he39ef318d0b08;
    stim[7] = 52'h37e6c26a96528;
    stim[8] = 52'ha69a900c8d908;
    stim[9] = 52'h69a3e9c39ca52;
    stim[10] = 52'h364f2efc3feea;
    stim[11] = 52'h39d843f625580;
    stim[12] = 52'hce2790cec0353;
    stim[13] = 52'h92f415e3c77ee;
    stim[14] = 52'h934c5bfa7443a;
    stim[15] = 52'hef47312dab069;
    stim[16] = 52'hd3949edd3cb60;
    stim[17] = 52'ha00a94712dd08;
    stim[18] = 52'h4fd8aaa8b5f58;
    stim[19] = 52'he771028ff94f2;
    stim[20] = 52'hb9a8bddd4b6e3;
    stim[21] = 52'h43c789c382cfc;
    stim[22] = 52'h6f1a1de364f38;
    stim[23] = 52'h8f9bcf8827401;
    stim[24] = 52'h534e7e0e25e71;
    stim[25] = 52'he6e717703c7f9;
    stim[26] = 52'hea71ec20bcd69;
    stim[27] = 52'h56991fc738b41;
    stim[28] = 52'hd81dff1738f20;
    stim[29] = 52'hc37ae84171341;
    stim[30] = 52'h541478af4abe8;
    stim[31] = 52'hc1a14a5489469;
    stim[32] = 52'hedac71f8ac282;
    stim[33] = 52'hda210586426c0;
    stim[34] = 52'h472965e49e043;
    stim[35] = 52'heca887517188b;
    stim[36] = 52'h29466458b0c3b;
    stim[37] = 52'hce522b0d5a11b;
    stim[38] = 52'he9fce1abd4ed9;
    stim[39] = 52'hbdfeeb0e90079;
    stim[40] = 52'h751db12dfe860;
    stim[41] = 52'h6fbc1a3a34000;
    stim[42] = 52'ha718d77f25ac8;
    stim[43] = 52'h827a052449621;
    stim[44] = 52'h690ee2443aecb;
    stim[45] = 52'he6903d5790128;
    stim[46] = 52'ha06e7490be49a;
    stim[47] = 52'hf79e1310c5ce9;
    stim[48] = 52'h6130758cab882;
    stim[49] = 52'ha6bbcb8827b31;
    stim[50] = 52'hf548c0c7baa82;
    stim[51] = 52'h9c3eabe220831;
    stim[52] = 52'hf74f5c7f630f9;
    stim[53] = 52'hd36097d6ddbca;
    stim[54] = 52'h42d03997d60a2;
    stim[55] = 52'hdbc17e85f8ce0;
    stim[56] = 52'hf610b59b0efdb;
    stim[57] = 52'h79590e68feb41;
    stim[58] = 52'h0984a60077270;
    stim[59] = 52'hbd3f2c3de6451;
    stim[60] = 52'h97b66cfc32849;
    stim[61] = 52'hf4c09579d1350;
    stim[62] = 52'h9144ae4ef4412;
    stim[63] = 52'h061300de6b581;
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
      expv[0] = 4'h2;
      expv[1] = 4'h0;
      expv[2] = 4'h6;
      expv[3] = 4'h7;
      expv[4] = 4'h7;
      expv[5] = 4'h2;
      expv[6] = 4'h4;
      expv[7] = 4'h4;
      expv[8] = 4'h4;
      expv[9] = 4'h6;
      expv[10] = 4'h7;
      expv[11] = 4'h5;
      expv[12] = 4'h6;
      expv[13] = 4'h2;
      expv[14] = 4'h6;
      expv[15] = 4'h5;
      expv[16] = 4'h4;
      expv[17] = 4'h5;
      expv[18] = 4'h4;
      expv[19] = 4'h6;
      expv[20] = 4'h7;
      expv[21] = 4'h0;
      expv[22] = 4'h4;
      expv[23] = 4'h4;
      expv[24] = 4'h4;
      expv[25] = 4'h4;
      expv[26] = 4'h4;
      expv[27] = 4'h4;
      expv[28] = 4'h4;
      expv[29] = 4'h4;
      expv[30] = 4'h4;
      expv[31] = 4'h4;
      expv[32] = 4'h6;
      expv[33] = 4'h5;
      expv[34] = 4'h6;
      expv[35] = 4'h7;
      expv[36] = 4'h7;
      expv[37] = 4'h7;
      expv[38] = 4'h5;
      expv[39] = 4'h5;
      expv[40] = 4'h5;
      expv[41] = 4'h5;
      expv[42] = 4'h5;
      expv[43] = 4'h5;
      expv[44] = 4'h7;
      expv[45] = 4'h5;
      expv[46] = 4'h6;
      expv[47] = 4'h5;
      expv[48] = 4'h6;
      expv[49] = 4'h5;
      expv[50] = 4'h7;
      expv[51] = 4'h5;
      expv[52] = 4'h4;
      expv[53] = 4'h6;
      expv[54] = 4'h7;
      expv[55] = 4'h5;
      expv[56] = 4'h6;
      expv[57] = 4'h5;
      expv[58] = 4'h5;
      expv[59] = 4'h5;
      expv[60] = 4'h5;
      expv[61] = 4'h5;
      expv[62] = 4'h7;
      expv[63] = 4'h5;
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
