// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  aud_mix_top dut (
    .clk(clk),
    .ce(in_vec[55:55]),
    .att(in_vec[54:50]),
    .mix(in_vec[49:48]),
    .core_audio(in_vec[47:32]),
    .linux_audio(in_vec[31:16]),
    .pre_in(in_vec[15:0]),
    .pre_out(out_vec[31:16]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h910c9925673e2d;
    stim[1] = 56'hc6026a7b1e21f4;
    stim[2] = 56'hdee43ed03001ee;
    stim[3] = 56'h1f3c8f1f9a7197;
    stim[4] = 56'h6b9e1197a8cd4a;
    stim[5] = 56'h76d15ea21e899f;
    stim[6] = 56'h05a494e2df0b6f;
    stim[7] = 56'hd94d9cf9e47ad2;
    stim[8] = 56'h6bbb6fa1f6f70e;
    stim[9] = 56'hc2a4a15fd1fcff;
    stim[10] = 56'hd4d6548d699728;
    stim[11] = 56'h03749c46243e31;
    stim[12] = 56'h973e83b6b1e327;
    stim[13] = 56'h4fa39b04eb7cd2;
    stim[14] = 56'h171a883bc80451;
    stim[15] = 56'h8d6a975bcc05bb;
    stim[16] = 56'h1d9d6b6699ecb4;
    stim[17] = 56'h0c0ff18d28c449;
    stim[18] = 56'h966017b5e1a912;
    stim[19] = 56'h108cfcc90f0b27;
    stim[20] = 56'h811a4439cfee84;
    stim[21] = 56'h4d586304b601b3;
    stim[22] = 56'h0ce53c33059b97;
    stim[23] = 56'h458f72b3056b35;
    stim[24] = 56'h175b431637965f;
    stim[25] = 56'hb2eabc76a9f401;
    stim[26] = 56'h3af6afb1018ebe;
    stim[27] = 56'hba04404748b27e;
    stim[28] = 56'h7bbe9aa5afcb42;
    stim[29] = 56'hde88ef432a9205;
    stim[30] = 56'hdb0b784dac71a7;
    stim[31] = 56'h1b6ecf3032be14;
    stim[32] = 56'h4321c3d8d61492;
    stim[33] = 56'h2365736f31c503;
    stim[34] = 56'h032880e35d84a6;
    stim[35] = 56'hbbdfea58cca619;
    stim[36] = 56'h1d4a4340de51a3;
    stim[37] = 56'hc6d91ad251349f;
    stim[38] = 56'h794255f3f72772;
    stim[39] = 56'h23ef97d6231b3c;
    stim[40] = 56'h5149dc99073a35;
    stim[41] = 56'h54db0ceee760d8;
    stim[42] = 56'h96ef11f91ac31f;
    stim[43] = 56'h1a767b16a8264a;
    stim[44] = 56'hf599f120b6322f;
    stim[45] = 56'h04df80d55a4314;
    stim[46] = 56'h5759cf58b66d25;
    stim[47] = 56'h20bbcc983abf57;
    stim[48] = 56'hf5406541be3384;
    stim[49] = 56'ha0168a8849cd47;
    stim[50] = 56'h4067ec3b5439b9;
    stim[51] = 56'ha2bf4440df3ad1;
    stim[52] = 56'h7023130d2711d2;
    stim[53] = 56'hbe31c69b28ab43;
    stim[54] = 56'h93e5ae370110c1;
    stim[55] = 56'hb09eb91ca5b5b8;
    stim[56] = 56'hc1d3784895f6ea;
    stim[57] = 56'ha967a7b0f5c824;
    stim[58] = 56'h24d62c1d378447;
    stim[59] = 56'he93285fb2eb4f5;
    stim[60] = 56'h9df70669c3f13c;
    stim[61] = 56'h36790b5fcb303e;
    stim[62] = 56'h23c835eedc7938;
    stim[63] = 56'hdb2fe0fe2d9c6c;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h43db0000;
      expv[4] = 32'h43db0000;
      expv[5] = 32'h43db0000;
      expv[6] = 32'h43db0000;
      expv[7] = 32'h43db0000;
      expv[8] = 32'he94d0000;
      expv[9] = 32'he94d0000;
      expv[10] = 32'hef110000;
      expv[11] = 32'h56b60000;
      expv[12] = 32'h56b60000;
      expv[13] = 32'h99050000;
      expv[14] = 32'h99050000;
      expv[15] = 32'h99050000;
      expv[16] = 32'hc682056b;
      expv[17] = 32'hc682056b;
      expv[18] = 32'hc682056b;
      expv[19] = 32'h4d27ef85;
      expv[20] = 32'h4d27ef85;
      expv[21] = 32'h103cfce6;
      expv[22] = 32'h103cfce6;
      expv[23] = 32'h103cfce6;
      expv[24] = 32'h103cfce6;
      expv[25] = 32'h103cfce6;
      expv[26] = 32'h4cf34845;
      expv[27] = 32'h4cf34845;
      expv[28] = 32'h48760001;
      expv[29] = 32'h48760001;
      expv[30] = 32'h19020001;
      expv[31] = 32'h23b50000;
      expv[32] = 32'h23b50000;
      expv[33] = 32'h23b50000;
      expv[34] = 32'h23b50000;
      expv[35] = 32'h23b50000;
      expv[36] = 32'heb4d0000;
      expv[37] = 32'heb4d0000;
      expv[38] = 32'h32220002;
      expv[39] = 32'h32220002;
      expv[40] = 32'h32220002;
      expv[41] = 32'h32220002;
      expv[42] = 32'h32220002;
      expv[43] = 32'hd91d0000;
      expv[44] = 32'hd91d0000;
      expv[45] = 32'he91a032c;
      expv[46] = 32'he91a032c;
      expv[47] = 32'he91a032c;
      expv[48] = 32'he91a032c;
      expv[49] = 32'h07e30000;
      expv[50] = 32'hedd70000;
      expv[51] = 32'hedd70000;
      expv[52] = 32'he457001a;
      expv[53] = 32'he457001a;
      expv[54] = 32'h2bb4ffdb;
      expv[55] = 32'had36ffff;
      expv[56] = 32'h34630173;
      expv[57] = 32'h0129fffb;
      expv[58] = 32'hf3a70000;
      expv[59] = 32'hf3a70000;
      expv[60] = 32'hc236ffff;
      expv[61] = 32'h316a0000;
      expv[62] = 32'h316a0000;
      expv[63] = 32'h316a0000;
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
