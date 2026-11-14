// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ycbcr_to_rgb dut (
    .clk(clk),
    .y(in_vec[23:16]),
    .cb(in_vec[15:8]),
    .cr(in_vec[7:0]),
    .red(out_vec[23:16]),
    .green(out_vec[15:8]),
    .blue(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h801aa1;
    stim[1] = 24'ha6a320;
    stim[2] = 24'h5bc82a;
    stim[3] = 24'h41741c;
    stim[4] = 24'ha5fca5;
    stim[5] = 24'h42b6a0;
    stim[6] = 24'h311183;
    stim[7] = 24'hba5233;
    stim[8] = 24'had99fb;
    stim[9] = 24'hf133fe;
    stim[10] = 24'h595ca1;
    stim[11] = 24'h6bcbf2;
    stim[12] = 24'h2c42cd;
    stim[13] = 24'h88af66;
    stim[14] = 24'h758215;
    stim[15] = 24'h92701a;
    stim[16] = 24'h3b73cb;
    stim[17] = 24'h6a8ed8;
    stim[18] = 24'h56ecc0;
    stim[19] = 24'hbe2ffd;
    stim[20] = 24'h319035;
    stim[21] = 24'hd70ce6;
    stim[22] = 24'h28c059;
    stim[23] = 24'h20b995;
    stim[24] = 24'h0d3072;
    stim[25] = 24'ha38265;
    stim[26] = 24'h3ab77a;
    stim[27] = 24'hd5f17c;
    stim[28] = 24'haf5b54;
    stim[29] = 24'hd03375;
    stim[30] = 24'hb83064;
    stim[31] = 24'hbc2fbb;
    stim[32] = 24'h03938b;
    stim[33] = 24'hfb6244;
    stim[34] = 24'ha13e8a;
    stim[35] = 24'h23da53;
    stim[36] = 24'haeb04b;
    stim[37] = 24'h476fc2;
    stim[38] = 24'h628078;
    stim[39] = 24'h60b6d7;
    stim[40] = 24'hab16b2;
    stim[41] = 24'hd1542b;
    stim[42] = 24'he758ca;
    stim[43] = 24'h0b069c;
    stim[44] = 24'hbdfa3e;
    stim[45] = 24'h3ea482;
    stim[46] = 24'hdffb33;
    stim[47] = 24'h9f2ce8;
    stim[48] = 24'h809f53;
    stim[49] = 24'haaf328;
    stim[50] = 24'hfde92e;
    stim[51] = 24'h1a5c7b;
    stim[52] = 24'h29cb00;
    stim[53] = 24'he7efe8;
    stim[54] = 24'h906a94;
    stim[55] = 24'h6ad771;
    stim[56] = 24'h833d3c;
    stim[57] = 24'h82c69a;
    stim[58] = 24'h70dab3;
    stim[59] = 24'h67a746;
    stim[60] = 24'hc1b32a;
    stim[61] = 24'hf79c9c;
    stim[62] = 24'hcf3685;
    stim[63] = 24'he980d9;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'hb68f00;
      expv[5] = 24'h15eef5;
      expv[6] = 24'h0081e8;
      expv[7] = 24'h008e20;
      expv[8] = 24'he85eff;
      expv[9] = 24'h6d0ba7;
      expv[10] = 24'h2b4f00;
      expv[11] = 24'h4bff69;
      expv[12] = 24'hff49e9;
      expv[13] = 24'hffbd6a;
      expv[14] = 24'h89480c;
      expv[15] = 24'hff00ff;
      expv[16] = 24'h9b0000;
      expv[17] = 24'h628eea;
      expv[18] = 24'h00cb79;
      expv[19] = 24'h00f077;
      expv[20] = 24'ha90017;
      expv[21] = 24'hf51b84;
      expv[22] = 24'hb700ff;
      expv[23] = 24'hff8427;
      expv[24] = 24'h005d46;
      expv[25] = 24'hffc200;
      expv[26] = 24'h00229c;
      expv[27] = 24'h340085;
      expv[28] = 24'h002700;
      expv[29] = 24'h80c0af;
      expv[30] = 24'h27209f;
      expv[31] = 24'hdebcff;
      expv[32] = 24'h72eb6e;
      expv[33] = 24'hcdff44;
      expv[34] = 24'h96f922;
      expv[35] = 24'hffb724;
      expv[36] = 24'h020017;
      expv[37] = 24'hb1ffd5;
      expv[38] = 24'hb8ba23;
      expv[39] = 24'h0017cb;
      expv[40] = 24'h63d0ff;
      expv[41] = 24'ha9111d;
      expv[42] = 24'h52655f;
      expv[43] = 24'he701c9;
      expv[44] = 24'hffb500;
      expv[45] = 24'h59ff87;
      expv[46] = 24'hffcda9;
      expv[47] = 24'h261300;
      expv[48] = 24'h60cfff;
      expv[49] = 24'h38257e;
      expv[50] = 24'h76ffff;
      expv[51] = 24'hff7200;
      expv[52] = 24'h3a9ac0;
      expv[53] = 24'h27cdff;
      expv[54] = 24'h91ffff;
      expv[55] = 24'h031d00;
      expv[56] = 24'h0067b4;
      expv[57] = 24'hff7aff;
      expv[58] = 24'hb48d68;
      expv[59] = 24'h5052ff;
      expv[60] = 24'h19d700;
      expv[61] = 24'hae54ff;
      expv[62] = 24'hc123ff;
      expv[63] = 24'h0885b3;
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
