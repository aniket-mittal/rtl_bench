// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081994 dut (
    .dout_vld(clk),
    .dout(in_vec[7:0]),
    .blue_LR(out_vec[8:7]),
    .blue_key_left(out_vec[6:6]),
    .blue_key_down(out_vec[5:5]),
    .blue_key_right(out_vec[4:4]),
    .blue_key_up(out_vec[3:3]),
    .blue_key_unknown(out_vec[2:2]),
    .blue_wendu(out_vec[1:1]),
    .blue_Go(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h82;
    stim[1] = 8'h22;
    stim[2] = 8'hf7;
    stim[3] = 8'h11;
    stim[4] = 8'h1d;
    stim[5] = 8'h34;
    stim[6] = 8'h37;
    stim[7] = 8'h88;
    stim[8] = 8'h9a;
    stim[9] = 8'hd0;
    stim[10] = 8'h41;
    stim[11] = 8'h53;
    stim[12] = 8'h04;
    stim[13] = 8'h2b;
    stim[14] = 8'h7f;
    stim[15] = 8'h5d;
    stim[16] = 8'h4a;
    stim[17] = 8'ha3;
    stim[18] = 8'haa;
    stim[19] = 8'ha1;
    stim[20] = 8'h35;
    stim[21] = 8'he2;
    stim[22] = 8'h3b;
    stim[23] = 8'h08;
    stim[24] = 8'had;
    stim[25] = 8'h62;
    stim[26] = 8'h05;
    stim[27] = 8'ha5;
    stim[28] = 8'h49;
    stim[29] = 8'h15;
    stim[30] = 8'h3f;
    stim[31] = 8'h6c;
    stim[32] = 8'h35;
    stim[33] = 8'hc7;
    stim[34] = 8'h20;
    stim[35] = 8'h93;
    stim[36] = 8'he3;
    stim[37] = 8'h96;
    stim[38] = 8'h9c;
    stim[39] = 8'he8;
    stim[40] = 8'hed;
    stim[41] = 8'hba;
    stim[42] = 8'hbc;
    stim[43] = 8'h0f;
    stim[44] = 8'h5b;
    stim[45] = 8'h32;
    stim[46] = 8'h8f;
    stim[47] = 8'he0;
    stim[48] = 8'h6d;
    stim[49] = 8'h25;
    stim[50] = 8'h38;
    stim[51] = 8'h31;
    stim[52] = 8'h39;
    stim[53] = 8'hbe;
    stim[54] = 8'h17;
    stim[55] = 8'h6c;
    stim[56] = 8'hf3;
    stim[57] = 8'haf;
    stim[58] = 8'hdb;
    stim[59] = 8'h41;
    stim[60] = 8'h3f;
    stim[61] = 8'h28;
    stim[62] = 8'h41;
    stim[63] = 8'h41;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'h0xx;
      expv[14] = 9'h0xx;
      expv[15] = 9'h0xx;
      expv[16] = 9'h0xx;
      expv[17] = 9'h0xx;
      expv[18] = 9'h0xx;
      expv[19] = 9'h0xx;
      expv[20] = 9'h0xx;
      expv[21] = 9'h0xx;
      expv[22] = 9'h0xx;
      expv[23] = 9'h0xx;
      expv[24] = 9'h0xx;
      expv[25] = 9'h0xx;
      expv[26] = 9'h0xx;
      expv[27] = 9'h1xx;
      expv[28] = 9'h1xx;
      expv[29] = 9'h1xx;
      expv[30] = 9'h10x;
      expv[31] = 9'h10x;
      expv[32] = 9'h10x;
      expv[33] = 9'h10x;
      expv[34] = 9'h10x;
      expv[35] = 9'h10x;
      expv[36] = 9'h10x;
      expv[37] = 9'h10x;
      expv[38] = 9'h10x;
      expv[39] = 9'h10x;
      expv[40] = 9'h10x;
      expv[41] = 9'h10x;
      expv[42] = 9'h10x;
      expv[43] = 9'h10x;
      expv[44] = 9'h10x;
      expv[45] = 9'h10x;
      expv[46] = 9'h10x;
      expv[47] = 9'h10x;
      expv[48] = 9'h10x;
      expv[49] = 9'h10x;
      expv[50] = 9'h10x;
      expv[51] = 9'h10x;
      expv[52] = 9'h10x;
      expv[53] = 9'h10x;
      expv[54] = 9'h10x;
      expv[55] = 9'h10x;
      expv[56] = 9'h10x;
      expv[57] = 9'h10x;
      expv[58] = 9'h10x;
      expv[59] = 9'h10x;
      expv[60] = 9'h10x;
      expv[61] = 9'h10x;
      expv[62] = 9'h10x;
      expv[63] = 9'h10x;
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
