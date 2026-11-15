// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00409 dut (
    .clk(clk),
    .d(in_vec[11:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[39:8]),
    .crc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf67;
    stim[1] = 12'h435;
    stim[2] = 12'h5ba;
    stim[3] = 12'h6d6;
    stim[4] = 12'h400;
    stim[5] = 12'he7c;
    stim[6] = 12'h2da;
    stim[7] = 12'hff6;
    stim[8] = 12'he7e;
    stim[9] = 12'h808;
    stim[10] = 12'h8c0;
    stim[11] = 12'hc88;
    stim[12] = 12'h93c;
    stim[13] = 12'he4a;
    stim[14] = 12'h850;
    stim[15] = 12'h4b0;
    stim[16] = 12'h6fe;
    stim[17] = 12'h072;
    stim[18] = 12'h520;
    stim[19] = 12'h0c6;
    stim[20] = 12'h848;
    stim[21] = 12'h8e0;
    stim[22] = 12'h51e;
    stim[23] = 12'h22c;
    stim[24] = 12'h928;
    stim[25] = 12'h8ac;
    stim[26] = 12'ha5c;
    stim[27] = 12'hb90;
    stim[28] = 12'h8a2;
    stim[29] = 12'h54c;
    stim[30] = 12'h31e;
    stim[31] = 12'hb60;
    stim[32] = 12'h68c;
    stim[33] = 12'ha5e;
    stim[34] = 12'h06c;
    stim[35] = 12'hccc;
    stim[36] = 12'h6a6;
    stim[37] = 12'hbc0;
    stim[38] = 12'h15e;
    stim[39] = 12'h5d4;
    stim[40] = 12'hb6c;
    stim[41] = 12'h552;
    stim[42] = 12'h3a6;
    stim[43] = 12'h290;
    stim[44] = 12'h506;
    stim[45] = 12'h3a0;
    stim[46] = 12'hb8a;
    stim[47] = 12'hfce;
    stim[48] = 12'h880;
    stim[49] = 12'h922;
    stim[50] = 12'heec;
    stim[51] = 12'ha56;
    stim[52] = 12'h1a2;
    stim[53] = 12'ha16;
    stim[54] = 12'he00;
    stim[55] = 12'h8cc;
    stim[56] = 12'h4dc;
    stim[57] = 12'hb36;
    stim[58] = 12'h5d6;
    stim[59] = 12'ha06;
    stim[60] = 12'h58a;
    stim[61] = 12'h420;
    stim[62] = 12'h92c;
    stim[63] = 12'hc18;
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
      expv[0] = 40'hffffffffff;
      expv[1] = 40'hffffffffff;
      expv[2] = 40'hffffffffff;
      expv[3] = 40'h7019228bf1;
      expv[4] = 40'hffffffffff;
      expv[5] = 40'hffffffffff;
      expv[6] = 40'hffffffffff;
      expv[7] = 40'he0324416f8;
      expv[8] = 40'hffffffffff;
      expv[9] = 40'hffffffffff;
      expv[10] = 40'hffffffffff;
      expv[11] = 40'hffffffffff;
      expv[12] = 40'hffffffffff;
      expv[13] = 40'hffffffffff;
      expv[14] = 40'hc86c5951ec;
      expv[15] = 40'hc86c5951ec;
      expv[16] = 40'hc86c5951ec;
      expv[17] = 40'hffffffffff;
      expv[18] = 40'hffffffff00;
      expv[19] = 40'hffffffff00;
      expv[20] = 40'hffffffffff;
      expv[21] = 40'hffffffffff;
      expv[22] = 40'hffffffffff;
      expv[23] = 40'hffffffffff;
      expv[24] = 40'hffffffffff;
      expv[25] = 40'hffffffffff;
      expv[26] = 40'hffffffffff;
      expv[27] = 40'hffffffffff;
      expv[28] = 40'hffffffffff;
      expv[29] = 40'hffffffff00;
      expv[30] = 40'hffffffffff;
      expv[31] = 40'hffffffffff;
      expv[32] = 40'hffffffffff;
      expv[33] = 40'hffffffffff;
      expv[34] = 40'hffffffffff;
      expv[35] = 40'hffffffffff;
      expv[36] = 40'hffffffffff;
      expv[37] = 40'hffffffffff;
      expv[38] = 40'hffffffffff;
      expv[39] = 40'hffffffffff;
      expv[40] = 40'hffffffffff;
      expv[41] = 40'hffffffffff;
      expv[42] = 40'hffffffff00;
      expv[43] = 40'hffffffffff;
      expv[44] = 40'hffffffffff;
      expv[45] = 40'hffffffffff;
      expv[46] = 40'hffffffffff;
      expv[47] = 40'h33d4e21733;
      expv[48] = 40'hffffffffff;
      expv[49] = 40'hffffffffff;
      expv[50] = 40'hffffffff00;
      expv[51] = 40'hffffffffff;
      expv[52] = 40'hffffffffff;
      expv[53] = 40'hffffffff00;
      expv[54] = 40'hffffffffff;
      expv[55] = 40'hffffffffff;
      expv[56] = 40'hffffffffff;
      expv[57] = 40'hffffffffff;
      expv[58] = 40'hffffffffff;
      expv[59] = 40'hffffffffff;
      expv[60] = 40'hffffffffff;
      expv[61] = 40'h2d93b2124b;
      expv[62] = 40'h2d93b2124b;
      expv[63] = 40'hffffffffff;
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
