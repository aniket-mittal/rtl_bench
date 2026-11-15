// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_038659 dut (
    .clock(clk),
    .CMD(in_vec[39:34]),
    .send_CMD(in_vec[33:33]),
    .address(in_vec[32:1]),
    .reset(in_vec[0:0]),
    .CMD_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'ha6a3e527a5;
    stim[1] = 40'h8311e6d35f;
    stim[2] = 40'he420aca36a;
    stim[3] = 40'ha8b11fae82;
    stim[4] = 40'h2eacec52ee;
    stim[5] = 40'h6cbf2b408e;
    stim[6] = 40'h9d38ffbca2;
    stim[7] = 40'hf47456889a;
    stim[8] = 40'h2b2340f516;
    stim[9] = 40'hd40b104388;
    stim[10] = 40'h9e21b9ae9a;
    stim[11] = 40'h6fd4008a6a;
    stim[12] = 40'h65d41c3118;
    stim[13] = 40'h4782bbb186;
    stim[14] = 40'h515b70b156;
    stim[15] = 40'hafa825c8c8;
    stim[16] = 40'h3008dd60ae;
    stim[17] = 40'h68dd41c8fc;
    stim[18] = 40'h5df9803048;
    stim[19] = 40'h1a733926fe;
    stim[20] = 40'h9b8d8d7676;
    stim[21] = 40'hbcea496a62;
    stim[22] = 40'h8adc229f0c;
    stim[23] = 40'h0a565057f9;
    stim[24] = 40'haa814b3a86;
    stim[25] = 40'h1a86ae6010;
    stim[26] = 40'h9b6c0c8c36;
    stim[27] = 40'h58b08e6d0e;
    stim[28] = 40'h86e546973a;
    stim[29] = 40'h485e0252c8;
    stim[30] = 40'haf4b86d972;
    stim[31] = 40'hd938828748;
    stim[32] = 40'ha9198d3188;
    stim[33] = 40'h9a8b5c3104;
    stim[34] = 40'h5d37258b50;
    stim[35] = 40'hfa46f38a78;
    stim[36] = 40'hde98b2c9e8;
    stim[37] = 40'hddd0873ea6;
    stim[38] = 40'h3164a6a50e;
    stim[39] = 40'hf2fb4b1192;
    stim[40] = 40'h3231fabb9c;
    stim[41] = 40'h3e327a3eb0;
    stim[42] = 40'h63fca614e4;
    stim[43] = 40'hced473bf96;
    stim[44] = 40'h884ccc1490;
    stim[45] = 40'he3d5307fda;
    stim[46] = 40'h72784507fc;
    stim[47] = 40'he2b0002cd0;
    stim[48] = 40'hfb35ba2ad4;
    stim[49] = 40'h91c5d9d6b3;
    stim[50] = 40'h4adea7a04e;
    stim[51] = 40'h7243984fdc;
    stim[52] = 40'hd4976908b2;
    stim[53] = 40'h607b0ca968;
    stim[54] = 40'h224ae70252;
    stim[55] = 40'hc18bac2372;
    stim[56] = 40'h78f1cee454;
    stim[57] = 40'h3fde0db2c2;
    stim[58] = 40'he3bc4344ba;
    stim[59] = 40'h24c7f20d32;
    stim[60] = 40'h5674ca344c;
    stim[61] = 40'h1ffb325cf8;
    stim[62] = 40'h0f59c64b61;
    stim[63] = 40'h9664c797a8;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
