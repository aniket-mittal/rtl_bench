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

  rtlpp_00350 dut (
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
    stim[0] = 12'h851;
    stim[1] = 12'h0c7;
    stim[2] = 12'hcec;
    stim[3] = 12'h260;
    stim[4] = 12'h6dc;
    stim[5] = 12'h0a7;
    stim[6] = 12'hf1c;
    stim[7] = 12'hd02;
    stim[8] = 12'hbde;
    stim[9] = 12'h9e0;
    stim[10] = 12'hb90;
    stim[11] = 12'he04;
    stim[12] = 12'hb4c;
    stim[13] = 12'h8d2;
    stim[14] = 12'h644;
    stim[15] = 12'h836;
    stim[16] = 12'h5b6;
    stim[17] = 12'hda4;
    stim[18] = 12'h25e;
    stim[19] = 12'hd2c;
    stim[20] = 12'h442;
    stim[21] = 12'h602;
    stim[22] = 12'h8dc;
    stim[23] = 12'heb0;
    stim[24] = 12'hbb0;
    stim[25] = 12'hd16;
    stim[26] = 12'h714;
    stim[27] = 12'h8dc;
    stim[28] = 12'h5da;
    stim[29] = 12'h9de;
    stim[30] = 12'he88;
    stim[31] = 12'h392;
    stim[32] = 12'hcc2;
    stim[33] = 12'h5d4;
    stim[34] = 12'hb2e;
    stim[35] = 12'h768;
    stim[36] = 12'h7f4;
    stim[37] = 12'h594;
    stim[38] = 12'h3fa;
    stim[39] = 12'hb54;
    stim[40] = 12'h852;
    stim[41] = 12'h00a;
    stim[42] = 12'h0c2;
    stim[43] = 12'h6ea;
    stim[44] = 12'hc2e;
    stim[45] = 12'hb08;
    stim[46] = 12'h102;
    stim[47] = 12'h34a;
    stim[48] = 12'heba;
    stim[49] = 12'h7b6;
    stim[50] = 12'hcd8;
    stim[51] = 12'hfd8;
    stim[52] = 12'heec;
    stim[53] = 12'h9f2;
    stim[54] = 12'h232;
    stim[55] = 12'hf36;
    stim[56] = 12'h9d4;
    stim[57] = 12'h592;
    stim[58] = 12'h71c;
    stim[59] = 12'ha8e;
    stim[60] = 12'hffc;
    stim[61] = 12'hb76;
    stim[62] = 12'h720;
    stim[63] = 12'hc20;
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
      expv[3] = 40'hffffffffff;
      expv[4] = 40'hffffffffff;
      expv[5] = 40'hffffffffff;
      expv[6] = 40'hffffffffff;
      expv[7] = 40'hffffffffff;
      expv[8] = 40'hffffffff00;
      expv[9] = 40'hffffffffff;
      expv[10] = 40'hffffffffff;
      expv[11] = 40'hffffffffff;
      expv[12] = 40'hffffffffff;
      expv[13] = 40'hffffffffff;
      expv[14] = 40'hffffffff00;
      expv[15] = 40'hffffffffff;
      expv[16] = 40'hffffffffff;
      expv[17] = 40'hffffffffff;
      expv[18] = 40'hffffffffff;
      expv[19] = 40'hffffffffff;
      expv[20] = 40'hffffffffff;
      expv[21] = 40'hffffffff00;
      expv[22] = 40'hffffffff00;
      expv[23] = 40'hffffffffff;
      expv[24] = 40'hffffffffff;
      expv[25] = 40'hffffffffff;
      expv[26] = 40'hffffffffff;
      expv[27] = 40'hffffffffff;
      expv[28] = 40'hffffffffff;
      expv[29] = 40'hdcbce41cc4;
      expv[30] = 40'hffffffffff;
      expv[31] = 40'hffffffffff;
      expv[32] = 40'hffffffff00;
      expv[33] = 40'hffffffff00;
      expv[34] = 40'hffffffffff;
      expv[35] = 40'hffffffffff;
      expv[36] = 40'hffffffffff;
      expv[37] = 40'hffffffffff;
      expv[38] = 40'hffffffffff;
      expv[39] = 40'hf2bcd9d9b0;
      expv[40] = 40'hffffffffff;
      expv[41] = 40'hffffffff00;
      expv[42] = 40'h4e08bfb48d;
      expv[43] = 40'h08bfb4ffef;
      expv[44] = 40'h638e42ed39;
      expv[45] = 40'hffffffffff;
      expv[46] = 40'hffffffffff;
      expv[47] = 40'hffffffff00;
      expv[48] = 40'he327923038;
      expv[49] = 40'he0a42b4cf8;
      expv[50] = 40'hffffffffff;
      expv[51] = 40'hffffffffff;
      expv[52] = 40'hffffffffff;
      expv[53] = 40'hffffffffff;
      expv[54] = 40'hffffffff00;
      expv[55] = 40'hffffffff00;
      expv[56] = 40'hffffffffff;
      expv[57] = 40'hffffffffff;
      expv[58] = 40'hffffffff00;
      expv[59] = 40'hffffffffff;
      expv[60] = 40'hffffffffff;
      expv[61] = 40'hffffffffff;
      expv[62] = 40'hffffffffff;
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
