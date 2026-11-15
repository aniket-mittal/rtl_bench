// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01229 dut (
    .clk(clk),
    .nrst(in_vec[17:17]),
    .start(in_vec[16:16]),
    .n(in_vec[15:0]),
    .wraddr(out_vec[36:26]),
    .wren(out_vec[25:25]),
    .rdaddr(out_vec[24:14]),
    .vexaddr(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h381e8;
    stim[1] = 18'h24866;
    stim[2] = 18'h05274;
    stim[3] = 18'h1745c;
    stim[4] = 18'h04b34;
    stim[5] = 18'h068ef;
    stim[6] = 18'h1b002;
    stim[7] = 18'h111a8;
    stim[8] = 18'h0429d;
    stim[9] = 18'h14863;
    stim[10] = 18'h1de8b;
    stim[11] = 18'h19e87;
    stim[12] = 18'h1a4e4;
    stim[13] = 18'h0337a;
    stim[14] = 18'h0d204;
    stim[15] = 18'h0b896;
    stim[16] = 18'h17d99;
    stim[17] = 18'h1c1ed;
    stim[18] = 18'h12f8e;
    stim[19] = 18'h0f73a;
    stim[20] = 18'h0bb36;
    stim[21] = 18'h165a5;
    stim[22] = 18'h0a03e;
    stim[23] = 18'h1ff91;
    stim[24] = 18'h05673;
    stim[25] = 18'h0e37e;
    stim[26] = 18'h07c52;
    stim[27] = 18'h01aef;
    stim[28] = 18'h06ac6;
    stim[29] = 18'h1f845;
    stim[30] = 18'h133b5;
    stim[31] = 18'h14ccb;
    stim[32] = 18'h1d2a0;
    stim[33] = 18'h072b1;
    stim[34] = 18'h12b80;
    stim[35] = 18'h17995;
    stim[36] = 18'h14b29;
    stim[37] = 18'h1a324;
    stim[38] = 18'h0f64b;
    stim[39] = 18'h1bffc;
    stim[40] = 18'h1272b;
    stim[41] = 18'h11fdb;
    stim[42] = 18'h1bd5a;
    stim[43] = 18'h1c7b6;
    stim[44] = 18'h0b616;
    stim[45] = 18'h0e40d;
    stim[46] = 18'h05881;
    stim[47] = 18'h153de;
    stim[48] = 18'h0298d;
    stim[49] = 18'h013c4;
    stim[50] = 18'h17d72;
    stim[51] = 18'h12048;
    stim[52] = 18'h1cf91;
    stim[53] = 18'h13ef1;
    stim[54] = 18'h028e6;
    stim[55] = 18'h0fb02;
    stim[56] = 18'h04b68;
    stim[57] = 18'h05897;
    stim[58] = 18'h10bdb;
    stim[59] = 18'h11633;
    stim[60] = 18'h19cac;
    stim[61] = 18'h01d3f;
    stim[62] = 18'h0de4e;
    stim[63] = 18'h1e6de;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxx00xxxx;
      expv[2] = 37'hxxxx00xxxx;
      expv[3] = 37'h1fffffffff;
      expv[4] = 37'h1fffffffff;
      expv[5] = 37'h1fffffffff;
      expv[6] = 37'h1fffffffff;
      expv[7] = 37'h1fffffffff;
      expv[8] = 37'h1fffffffff;
      expv[9] = 37'h1fffffffff;
      expv[10] = 37'h1fffffffff;
      expv[11] = 37'h1fffffffff;
      expv[12] = 37'h1fffffffff;
      expv[13] = 37'h1fffffffff;
      expv[14] = 37'h1fffffffff;
      expv[15] = 37'h1fffffffff;
      expv[16] = 37'h1fffffffff;
      expv[17] = 37'h1fffffffff;
      expv[18] = 37'h1fffffffff;
      expv[19] = 37'h1fffffffff;
      expv[20] = 37'h1fffffffff;
      expv[21] = 37'h1fffffffff;
      expv[22] = 37'h1fffffffff;
      expv[23] = 37'h1fffffffff;
      expv[24] = 37'h1fffffffff;
      expv[25] = 37'h1fffffffff;
      expv[26] = 37'h1fffffffff;
      expv[27] = 37'h1fffffffff;
      expv[28] = 37'h1fffffffff;
      expv[29] = 37'h1fffffffff;
      expv[30] = 37'h1fffffffff;
      expv[31] = 37'h1fffffffff;
      expv[32] = 37'h1fffffffff;
      expv[33] = 37'h1fffffffff;
      expv[34] = 37'h1fffffffff;
      expv[35] = 37'h1fffffffff;
      expv[36] = 37'h1fffffffff;
      expv[37] = 37'h1fffffffff;
      expv[38] = 37'h1fffffffff;
      expv[39] = 37'h1fffffffff;
      expv[40] = 37'h1fffffffff;
      expv[41] = 37'h1fffffffff;
      expv[42] = 37'h1fffffffff;
      expv[43] = 37'h1fffffffff;
      expv[44] = 37'h1fffffffff;
      expv[45] = 37'h1fffffffff;
      expv[46] = 37'h1fffffffff;
      expv[47] = 37'h1fffffffff;
      expv[48] = 37'h1fffffffff;
      expv[49] = 37'h1fffffffff;
      expv[50] = 37'h1fffffffff;
      expv[51] = 37'h1fffffffff;
      expv[52] = 37'h1fffffffff;
      expv[53] = 37'h1fffffffff;
      expv[54] = 37'h1fffffffff;
      expv[55] = 37'h1fffffffff;
      expv[56] = 37'h1fffffffff;
      expv[57] = 37'h1fffffffff;
      expv[58] = 37'h1fffffffff;
      expv[59] = 37'h1fffffffff;
      expv[60] = 37'h1fffffffff;
      expv[61] = 37'h1fffffffff;
      expv[62] = 37'h1fffffffff;
      expv[63] = 37'h1fffffffff;
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
