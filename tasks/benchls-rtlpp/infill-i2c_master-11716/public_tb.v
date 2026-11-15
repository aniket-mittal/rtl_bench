// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11716 dut (
    .clk(clk),
    .sdaIn(in_vec[11:11]),
    .enable(in_vec[10:10]),
    .instruction(in_vec[9:8]),
    .dataIn(in_vec[7:0]),
    .sdaOut(out_vec[19:19]),
    .scl(out_vec[18:18]),
    .isSending(out_vec[17:17]),
    .byteToSend(out_vec[16:9]),
    .byteReceived(out_vec[8:1]),
    .complete(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf0f;
    stim[1] = 12'hed6;
    stim[2] = 12'hd49;
    stim[3] = 12'he4f;
    stim[4] = 12'h30d;
    stim[5] = 12'h61e;
    stim[6] = 12'h0ab;
    stim[7] = 12'h3ba;
    stim[8] = 12'h87b;
    stim[9] = 12'h0b7;
    stim[10] = 12'h6d0;
    stim[11] = 12'h11f;
    stim[12] = 12'hefc;
    stim[13] = 12'hb48;
    stim[14] = 12'h563;
    stim[15] = 12'hfb0;
    stim[16] = 12'h6a7;
    stim[17] = 12'h126;
    stim[18] = 12'hd0e;
    stim[19] = 12'h97b;
    stim[20] = 12'ha29;
    stim[21] = 12'hdde;
    stim[22] = 12'h593;
    stim[23] = 12'h0e8;
    stim[24] = 12'h43f;
    stim[25] = 12'hcc8;
    stim[26] = 12'h199;
    stim[27] = 12'h847;
    stim[28] = 12'h0ff;
    stim[29] = 12'h781;
    stim[30] = 12'h572;
    stim[31] = 12'h867;
    stim[32] = 12'h98c;
    stim[33] = 12'h6aa;
    stim[34] = 12'h852;
    stim[35] = 12'h8c9;
    stim[36] = 12'ha0b;
    stim[37] = 12'ha27;
    stim[38] = 12'hc18;
    stim[39] = 12'h271;
    stim[40] = 12'h293;
    stim[41] = 12'he01;
    stim[42] = 12'hec7;
    stim[43] = 12'ha49;
    stim[44] = 12'ha4e;
    stim[45] = 12'h4a0;
    stim[46] = 12'hd00;
    stim[47] = 12'h109;
    stim[48] = 12'h892;
    stim[49] = 12'hc4c;
    stim[50] = 12'h451;
    stim[51] = 12'h5c6;
    stim[52] = 12'h63c;
    stim[53] = 12'h51f;
    stim[54] = 12'h28c;
    stim[55] = 12'h0c3;
    stim[56] = 12'hf2e;
    stim[57] = 12'h42a;
    stim[58] = 12'haa4;
    stim[59] = 12'h2f1;
    stim[60] = 12'haad;
    stim[61] = 12'had8;
    stim[62] = 12'h708;
    stim[63] = 12'h4b5;
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
      expv[0] = 20'hxxx0x;
      expv[1] = 20'hxxx00;
      expv[2] = 20'hxxx00;
      expv[3] = 20'hxxx00;
      expv[4] = 20'hxxx00;
      expv[5] = 20'hxxx00;
      expv[6] = 20'hxxx00;
      expv[7] = 20'hxxx00;
      expv[8] = 20'hxxx00;
      expv[9] = 20'hxxx00;
      expv[10] = 20'hxxx00;
      expv[11] = 20'hxxx00;
      expv[12] = 20'hxxx00;
      expv[13] = 20'hxxx00;
      expv[14] = 20'hxxx00;
      expv[15] = 20'hxxx00;
      expv[16] = 20'hxxx00;
      expv[17] = 20'hxxx00;
      expv[18] = 20'hxxx00;
      expv[19] = 20'hxxx00;
      expv[20] = 20'hxxx00;
      expv[21] = 20'hxxx00;
      expv[22] = 20'hxxx00;
      expv[23] = 20'hxxx00;
      expv[24] = 20'hxxx00;
      expv[25] = 20'hxxx00;
      expv[26] = 20'hxxx00;
      expv[27] = 20'hxxx00;
      expv[28] = 20'hxxx00;
      expv[29] = 20'hxxx00;
      expv[30] = 20'hxxx00;
      expv[31] = 20'hxxx00;
      expv[32] = 20'hxxx00;
      expv[33] = 20'hxxx00;
      expv[34] = 20'hxxx00;
      expv[35] = 20'hxxx00;
      expv[36] = 20'hxxx00;
      expv[37] = 20'hxxx00;
      expv[38] = 20'hxxx00;
      expv[39] = 20'hxxx00;
      expv[40] = 20'hxxx00;
      expv[41] = 20'hxxx00;
      expv[42] = 20'hxxx00;
      expv[43] = 20'hxxx00;
      expv[44] = 20'hxxx00;
      expv[45] = 20'hxxx00;
      expv[46] = 20'hxxx00;
      expv[47] = 20'hxxx00;
      expv[48] = 20'hxxx00;
      expv[49] = 20'hxxx00;
      expv[50] = 20'hxxx00;
      expv[51] = 20'hxxx00;
      expv[52] = 20'hxxx00;
      expv[53] = 20'hxxx00;
      expv[54] = 20'hxxx00;
      expv[55] = 20'hxxx00;
      expv[56] = 20'hxxx00;
      expv[57] = 20'hxxx00;
      expv[58] = 20'hxxx00;
      expv[59] = 20'hxxx00;
      expv[60] = 20'hxxx00;
      expv[61] = 20'hxxx00;
      expv[62] = 20'hxxx00;
      expv[63] = 20'hxxx00;
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
