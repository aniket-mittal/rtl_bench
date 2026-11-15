// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00483 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[47:16]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'he16ef;
    stim[1] = 20'h1e787;
    stim[2] = 20'h83f5c;
    stim[3] = 20'h3b106;
    stim[4] = 20'he9594;
    stim[5] = 20'hc8a04;
    stim[6] = 20'hcfec2;
    stim[7] = 20'ha9dec;
    stim[8] = 20'h943b6;
    stim[9] = 20'hb491c;
    stim[10] = 20'h91236;
    stim[11] = 20'he7626;
    stim[12] = 20'h3de26;
    stim[13] = 20'hb1844;
    stim[14] = 20'h7e500;
    stim[15] = 20'h0b148;
    stim[16] = 20'h6d610;
    stim[17] = 20'h29f14;
    stim[18] = 20'h55390;
    stim[19] = 20'ha2618;
    stim[20] = 20'hc92db;
    stim[21] = 20'hcee60;
    stim[22] = 20'h0695e;
    stim[23] = 20'h37d8e;
    stim[24] = 20'h4db24;
    stim[25] = 20'h25542;
    stim[26] = 20'h1b188;
    stim[27] = 20'hbcf32;
    stim[28] = 20'h924c4;
    stim[29] = 20'h6f6ea;
    stim[30] = 20'h5f00c;
    stim[31] = 20'h47948;
    stim[32] = 20'h5cbfc;
    stim[33] = 20'hfc402;
    stim[34] = 20'h0065c;
    stim[35] = 20'had284;
    stim[36] = 20'he9188;
    stim[37] = 20'h00f56;
    stim[38] = 20'hf2956;
    stim[39] = 20'ha02dc;
    stim[40] = 20'h0c9f0;
    stim[41] = 20'hd453a;
    stim[42] = 20'head76;
    stim[43] = 20'haaaf6;
    stim[44] = 20'hed636;
    stim[45] = 20'h16736;
    stim[46] = 20'h19e7c;
    stim[47] = 20'h54442;
    stim[48] = 20'h70788;
    stim[49] = 20'h63554;
    stim[50] = 20'h37e32;
    stim[51] = 20'h83374;
    stim[52] = 20'hb922e;
    stim[53] = 20'h6f05e;
    stim[54] = 20'h75eb0;
    stim[55] = 20'h55f08;
    stim[56] = 20'ha8be6;
    stim[57] = 20'h0ddee;
    stim[58] = 20'hd8c4c;
    stim[59] = 20'h1a258;
    stim[60] = 20'hccc2a;
    stim[61] = 20'h0cfdc;
    stim[62] = 20'he28ea;
    stim[63] = 20'h39f3c;
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
      expv[0] = 48'hffffffffffff;
      expv[1] = 48'hffffffffffff;
      expv[2] = 48'hffffffffffff;
      expv[3] = 48'hffffffffffff;
      expv[4] = 48'hffffffffffff;
      expv[5] = 48'hffffffffffff;
      expv[6] = 48'hffffffffffff;
      expv[7] = 48'hffffffff0000;
      expv[8] = 48'hffffffffffff;
      expv[9] = 48'hffffffffffff;
      expv[10] = 48'hffffffffffff;
      expv[11] = 48'hffffffffffff;
      expv[12] = 48'hffffffffffff;
      expv[13] = 48'hffffffffffff;
      expv[14] = 48'hffffffffffff;
      expv[15] = 48'hffffffffffff;
      expv[16] = 48'hffffffffffff;
      expv[17] = 48'hffffffffffff;
      expv[18] = 48'hffffffffffff;
      expv[19] = 48'hffffffffffff;
      expv[20] = 48'hffffffffffff;
      expv[21] = 48'hffffffffffff;
      expv[22] = 48'hffffffffffff;
      expv[23] = 48'hffffffffffff;
      expv[24] = 48'hffffffffffff;
      expv[25] = 48'hffffffffffff;
      expv[26] = 48'hffffffff0000;
      expv[27] = 48'hffffffff0000;
      expv[28] = 48'hffffffff0000;
      expv[29] = 48'hffffffffffff;
      expv[30] = 48'h07ebaa19281f;
      expv[31] = 48'hffffffffffff;
      expv[32] = 48'hffffffffffff;
      expv[33] = 48'hffffffffffff;
      expv[34] = 48'hffffffff0000;
      expv[35] = 48'hffffffffffff;
      expv[36] = 48'hffffffffffff;
      expv[37] = 48'hffffffffffff;
      expv[38] = 48'hffffffffffff;
      expv[39] = 48'hffffffffffff;
      expv[40] = 48'hffffffffffff;
      expv[41] = 48'hffffffffffff;
      expv[42] = 48'h5aaf70750aa5;
      expv[43] = 48'hffffffffffff;
      expv[44] = 48'hffffffffffff;
      expv[45] = 48'hffffffffffff;
      expv[46] = 48'hffffffffffff;
      expv[47] = 48'hffffffffffff;
      expv[48] = 48'hffffffff0000;
      expv[49] = 48'hffffffff0000;
      expv[50] = 48'hffffffffffff;
      expv[51] = 48'hffffffff0000;
      expv[52] = 48'hffffffffffff;
      expv[53] = 48'hffffffffffff;
      expv[54] = 48'hffffffffffff;
      expv[55] = 48'hffffffffffff;
      expv[56] = 48'hffffffffffff;
      expv[57] = 48'hffffffffffff;
      expv[58] = 48'hffffffffffff;
      expv[59] = 48'hffffffffffff;
      expv[60] = 48'hffffffffffff;
      expv[61] = 48'hea6b1cab29a8;
      expv[62] = 48'hffffffffffff;
      expv[63] = 48'h89db44aa246e;
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
