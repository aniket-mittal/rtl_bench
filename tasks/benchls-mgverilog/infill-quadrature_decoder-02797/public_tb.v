// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02797 dut (
    .clk(clk),
    .en_in(in_vec[15:15]),
    .process(in_vec[14:14]),
    .pre_first(in_vec[13:13]),
    .cycle_div(in_vec[12:9]),
    .deglitch_cur(in_vec[8:4]),
    .encoder(in_vec[3:2]),
    .encoder_used(in_vec[1:0]),
    .deglitch_new(out_vec[10:6]),
    .encoder_new(out_vec[5:4]),
    .pre_incdec(out_vec[3:3]),
    .inc(out_vec[2:2]),
    .dec(out_vec[1:1]),
    .inc_dec(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'heb47;
    stim[1] = 16'hb57a;
    stim[2] = 16'h4fff;
    stim[3] = 16'h454c;
    stim[4] = 16'h85c7;
    stim[5] = 16'h0a3f;
    stim[6] = 16'h1b82;
    stim[7] = 16'h1969;
    stim[8] = 16'hd430;
    stim[9] = 16'hcfea;
    stim[10] = 16'h0e23;
    stim[11] = 16'h4703;
    stim[12] = 16'hd511;
    stim[13] = 16'h829f;
    stim[14] = 16'h451c;
    stim[15] = 16'h48c8;
    stim[16] = 16'h10e1;
    stim[17] = 16'h1d27;
    stim[18] = 16'h11fd;
    stim[19] = 16'h4dcc;
    stim[20] = 16'h462e;
    stim[21] = 16'h1e6d;
    stim[22] = 16'h122f;
    stim[23] = 16'h8640;
    stim[24] = 16'h0d80;
    stim[25] = 16'hcbf7;
    stim[26] = 16'hd361;
    stim[27] = 16'h58f6;
    stim[28] = 16'h9728;
    stim[29] = 16'h12f7;
    stim[30] = 16'h1b76;
    stim[31] = 16'h54c9;
    stim[32] = 16'h570d;
    stim[33] = 16'hd4ee;
    stim[34] = 16'hcfef;
    stim[35] = 16'h16d1;
    stim[36] = 16'hc4f1;
    stim[37] = 16'h8b36;
    stim[38] = 16'h9fd6;
    stim[39] = 16'h86e3;
    stim[40] = 16'h5b93;
    stim[41] = 16'h82c5;
    stim[42] = 16'h4d99;
    stim[43] = 16'h8c3a;
    stim[44] = 16'hcc0f;
    stim[45] = 16'h93b9;
    stim[46] = 16'hd830;
    stim[47] = 16'hdd54;
    stim[48] = 16'hf554;
    stim[49] = 16'h0f40;
    stim[50] = 16'h818b;
    stim[51] = 16'h925a;
    stim[52] = 16'h56da;
    stim[53] = 16'h12c6;
    stim[54] = 16'h9ed1;
    stim[55] = 16'h532f;
    stim[56] = 16'h9620;
    stim[57] = 16'h5676;
    stim[58] = 16'h0c76;
    stim[59] = 16'hf43b;
    stim[60] = 16'hda94;
    stim[61] = 16'h1de9;
    stim[62] = 16'h5ecc;
    stim[63] = 16'h0bb3;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h020;
      expv[2] = 11'h030;
      expv[3] = 11'hxx0;
      expv[4] = 11'hxx0;
      expv[5] = 11'h030;
      expv[6] = 11'hxx0;
      expv[7] = 11'hxx0;
      expv[8] = 11'h000;
      expv[9] = 11'h020;
      expv[10] = 11'hxx0;
      expv[11] = 11'hxx0;
      expv[12] = 11'hxx0;
      expv[13] = 11'h030;
      expv[14] = 11'hxx0;
      expv[15] = 11'hxx0;
      expv[16] = 11'hxx0;
      expv[17] = 11'hxx0;
      expv[18] = 11'h7f8;
      expv[19] = 11'hxx0;
      expv[20] = 11'hxx0;
      expv[21] = 11'hxx0;
      expv[22] = 11'h030;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h7d8;
      expv[26] = 11'hxx3;
      expv[27] = 11'hxx0;
      expv[28] = 11'hxx0;
      expv[29] = 11'hxx0;
      expv[30] = 11'hxx0;
      expv[31] = 11'hxx0;
      expv[32] = 11'hxx0;
      expv[33] = 11'hxx0;
      expv[34] = 11'h030;
      expv[35] = 11'hxx0;
      expv[36] = 11'hxx0;
      expv[37] = 11'hxx0;
      expv[38] = 11'hxx0;
      expv[39] = 11'hxx0;
      expv[40] = 11'hxx0;
      expv[41] = 11'h010;
      expv[42] = 11'hxx0;
      expv[43] = 11'h020;
      expv[44] = 11'h030;
      expv[45] = 11'hxx0;
      expv[46] = 11'h000;
      expv[47] = 11'hxx0;
      expv[48] = 11'hxx0;
      expv[49] = 11'h000;
      expv[50] = 11'hxx0;
      expv[51] = 11'h020;
      expv[52] = 11'h020;
      expv[53] = 11'hxx0;
      expv[54] = 11'hxx0;
      expv[55] = 11'h030;
      expv[56] = 11'h000;
      expv[57] = 11'hxx0;
      expv[58] = 11'hxx0;
      expv[59] = 11'hxx0;
      expv[60] = 11'hxx0;
      expv[61] = 11'hxx0;
      expv[62] = 11'hxx0;
      expv[63] = 11'hxx0;
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
