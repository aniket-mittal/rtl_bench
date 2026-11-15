// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  register dut (
    .clock(clk),
    .resetn(in_vec[8:8]),
    .d(in_vec[7:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0f7;
    stim[1] = 9'h06b;
    stim[2] = 9'h182;
    stim[3] = 9'h18d;
    stim[4] = 9'h1d5;
    stim[5] = 9'h158;
    stim[6] = 9'h1b9;
    stim[7] = 9'h1c3;
    stim[8] = 9'h10c;
    stim[9] = 9'h136;
    stim[10] = 9'h124;
    stim[11] = 9'h14b;
    stim[12] = 9'h1a0;
    stim[13] = 9'h148;
    stim[14] = 9'h135;
    stim[15] = 9'h1f8;
    stim[16] = 9'h19e;
    stim[17] = 9'h0d5;
    stim[18] = 9'h1a0;
    stim[19] = 9'h1cb;
    stim[20] = 9'h1c8;
    stim[21] = 9'h11f;
    stim[22] = 9'h121;
    stim[23] = 9'h148;
    stim[24] = 9'h19a;
    stim[25] = 9'h1b9;
    stim[26] = 9'h19f;
    stim[27] = 9'h10b;
    stim[28] = 9'h10c;
    stim[29] = 9'h1da;
    stim[30] = 9'h17b;
    stim[31] = 9'h17b;
    stim[32] = 9'h152;
    stim[33] = 9'h1f7;
    stim[34] = 9'h1be;
    stim[35] = 9'h162;
    stim[36] = 9'h114;
    stim[37] = 9'h12d;
    stim[38] = 9'h155;
    stim[39] = 9'h196;
    stim[40] = 9'h142;
    stim[41] = 9'h12c;
    stim[42] = 9'h0db;
    stim[43] = 9'h165;
    stim[44] = 9'h1a6;
    stim[45] = 9'h10b;
    stim[46] = 9'h122;
    stim[47] = 9'h135;
    stim[48] = 9'h122;
    stim[49] = 9'h109;
    stim[50] = 9'h1be;
    stim[51] = 9'h182;
    stim[52] = 9'h1ad;
    stim[53] = 9'h102;
    stim[54] = 9'h151;
    stim[55] = 9'h1c1;
    stim[56] = 9'h131;
    stim[57] = 9'h12a;
    stim[58] = 9'h14e;
    stim[59] = 9'h141;
    stim[60] = 9'h103;
    stim[61] = 9'h154;
    stim[62] = 9'h19b;
    stim[63] = 9'h104;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h82;
      expv[4] = 8'h8d;
      expv[5] = 8'hd5;
      expv[6] = 8'h58;
      expv[7] = 8'hb9;
      expv[8] = 8'hc3;
      expv[9] = 8'h0c;
      expv[10] = 8'h36;
      expv[11] = 8'h24;
      expv[12] = 8'h4b;
      expv[13] = 8'ha0;
      expv[14] = 8'h48;
      expv[15] = 8'h35;
      expv[16] = 8'hf8;
      expv[17] = 8'h9e;
      expv[18] = 8'h00;
      expv[19] = 8'ha0;
      expv[20] = 8'hcb;
      expv[21] = 8'hc8;
      expv[22] = 8'h1f;
      expv[23] = 8'h21;
      expv[24] = 8'h48;
      expv[25] = 8'h9a;
      expv[26] = 8'hb9;
      expv[27] = 8'h9f;
      expv[28] = 8'h0b;
      expv[29] = 8'h0c;
      expv[30] = 8'hda;
      expv[31] = 8'h7b;
      expv[32] = 8'h7b;
      expv[33] = 8'h52;
      expv[34] = 8'hf7;
      expv[35] = 8'hbe;
      expv[36] = 8'h62;
      expv[37] = 8'h14;
      expv[38] = 8'h2d;
      expv[39] = 8'h55;
      expv[40] = 8'h96;
      expv[41] = 8'h42;
      expv[42] = 8'h2c;
      expv[43] = 8'h00;
      expv[44] = 8'h65;
      expv[45] = 8'ha6;
      expv[46] = 8'h0b;
      expv[47] = 8'h22;
      expv[48] = 8'h35;
      expv[49] = 8'h22;
      expv[50] = 8'h09;
      expv[51] = 8'hbe;
      expv[52] = 8'h82;
      expv[53] = 8'had;
      expv[54] = 8'h02;
      expv[55] = 8'h51;
      expv[56] = 8'hc1;
      expv[57] = 8'h31;
      expv[58] = 8'h2a;
      expv[59] = 8'h4e;
      expv[60] = 8'h41;
      expv[61] = 8'h03;
      expv[62] = 8'h54;
      expv[63] = 8'h9b;
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
