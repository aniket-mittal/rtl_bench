// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01499 dut (
    .clk(clk),
    .ym_so(in_vec[3:3]),
    .ym_sh1(in_vec[2:2]),
    .ym_sh2(in_vec[1:1]),
    .ym_p1(in_vec[0:0]),
    .left(out_vec[65:50]),
    .right(out_vec[49:34]),
    .left_exp(out_vec[33:18]),
    .right_exp(out_vec[17:2]),
    .update_left(out_vec[1:1]),
    .update_right(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h2;
    stim[1] = 4'h4;
    stim[2] = 4'h4;
    stim[3] = 4'h6;
    stim[4] = 4'h0;
    stim[5] = 4'hc;
    stim[6] = 4'h6;
    stim[7] = 4'h7;
    stim[8] = 4'h5;
    stim[9] = 4'h1;
    stim[10] = 4'h4;
    stim[11] = 4'h3;
    stim[12] = 4'hb;
    stim[13] = 4'h8;
    stim[14] = 4'hf;
    stim[15] = 4'hd;
    stim[16] = 4'h9;
    stim[17] = 4'hb;
    stim[18] = 4'h9;
    stim[19] = 4'h8;
    stim[20] = 4'h9;
    stim[21] = 4'hc;
    stim[22] = 4'h8;
    stim[23] = 4'h9;
    stim[24] = 4'h5;
    stim[25] = 4'hd;
    stim[26] = 4'h4;
    stim[27] = 4'h9;
    stim[28] = 4'h6;
    stim[29] = 4'h0;
    stim[30] = 4'h6;
    stim[31] = 4'h8;
    stim[32] = 4'hf;
    stim[33] = 4'h3;
    stim[34] = 4'h3;
    stim[35] = 4'hd;
    stim[36] = 4'h9;
    stim[37] = 4'h1;
    stim[38] = 4'h8;
    stim[39] = 4'hb;
    stim[40] = 4'he;
    stim[41] = 4'h0;
    stim[42] = 4'h5;
    stim[43] = 4'h7;
    stim[44] = 4'hd;
    stim[45] = 4'ha;
    stim[46] = 4'h3;
    stim[47] = 4'h4;
    stim[48] = 4'h1;
    stim[49] = 4'hc;
    stim[50] = 4'h5;
    stim[51] = 4'he;
    stim[52] = 4'h1;
    stim[53] = 4'hf;
    stim[54] = 4'h7;
    stim[55] = 4'hd;
    stim[56] = 4'hc;
    stim[57] = 4'hb;
    stim[58] = 4'hf;
    stim[59] = 4'h5;
    stim[60] = 4'he;
    stim[61] = 4'h3;
    stim[62] = 4'hf;
    stim[63] = 4'h6;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'hxxxxxxxxxxxxxxxxx;
      expv[7] = 66'hxxxxxxxxxxxxxxxxx;
      expv[8] = 66'hxxxxxxxxxxxxxxxxx;
      expv[9] = 66'hxxxxxxxxxxxxxxxxx;
      expv[10] = 66'hxxxxxxxxxxxxxxxxx;
      expv[11] = 66'hxxxxxxxxxxxxxxxxx;
      expv[12] = 66'hxxxxxxxxxxxxxxxxx;
      expv[13] = 66'hxxxxxxxxxxxxxxxxx;
      expv[14] = 66'hxxxxxxxxxxxxxxxxx;
      expv[15] = 66'hxxxxxxxxxxxxxxxxx;
      expv[16] = 66'hxxxxxxxxxxxxxxxxx;
      expv[17] = 66'hxxxxxxxxxxxxxxxxx;
      expv[18] = 66'hxxxxxxxxxxxxxxxxx;
      expv[19] = 66'hxxxxxxxxxxxxxxxxx;
      expv[20] = 66'hxxxxxxxxxxxxxxxxx;
      expv[21] = 66'hxxxxxxxxxxxxxxxxx;
      expv[22] = 66'hxxxxxxx004xxx4xxx;
      expv[23] = 66'hxxxxxxx004xxx4xxx;
      expv[24] = 66'hxxxxxxx004xxx4xxx;
      expv[25] = 66'hxxxxxxx004xxx4xxx;
      expv[26] = 66'hxxxxxxx004xxx4xxx;
      expv[27] = 66'hxxxxxxx004xxx4xxx;
      expv[28] = 66'hxxxxxxx004xxx4xxx;
      expv[29] = 66'hxxxxxxx004xxx4xxx;
      expv[30] = 66'hxxxxxxx004xxx4xxx;
      expv[31] = 66'hxxxxxxx004xxx4xxx;
      expv[32] = 66'hxxxxxxx004xxx4xxx;
      expv[33] = 66'hxxxxxxx004xxx4xxx;
      expv[34] = 66'hxxxxxxx004xxx4xxx;
      expv[35] = 66'hxxxxxxx004xxx4xxx;
      expv[36] = 66'hxxxxxxx004xxx4xxx;
      expv[37] = 66'hxxxxxxx004xxx4xxx;
      expv[38] = 66'hxxxxxxx004xxx4xxx;
      expv[39] = 66'hxxxxxxx004xxx4xxx;
      expv[40] = 66'hxxxxxxx004xxx4xxx;
      expv[41] = 66'hxxxxxxxx04xxx7cxx;
      expv[42] = 66'hxxxxxxxx04xxx7cxx;
      expv[43] = 66'hxxxxxxxx04xxx7cxx;
      expv[44] = 66'hxxxxxxxx07exx7cxx;
      expv[45] = 66'hxxxxxxxx07exx7cxx;
      expv[46] = 66'hxxxxxxxx07exx7cxx;
      expv[47] = 66'hxxxxxxxx07exx7cxx;
      expv[48] = 66'hxxxx1xx007exx3fxx;
      expv[49] = 66'hxxxx1xx007exx3fxx;
      expv[50] = 66'h1xx01xx001fxx3fxx;
      expv[51] = 66'h1xx01xx001fxx3fxx;
      expv[52] = 66'h1xx01xx001fxx3fxx;
      expv[53] = 66'h1xx01xx001fxx3fxx;
      expv[54] = 66'h1xx007xx01fxx07ex;
      expv[55] = 66'h1xx007xx01fxx07ex;
      expv[56] = 66'h1xx007xx01fxx07ex;
      expv[57] = 66'h1xx007xx01fxx07ex;
      expv[58] = 66'h1xx007xx01fxx07ex;
      expv[59] = 66'h1xx007xx01fxx07ex;
      expv[60] = 66'h1xx007xx01fxx07ex;
      expv[61] = 66'h1xx007xx01fxx07ex;
      expv[62] = 66'h1xx007xx01fxx07ex;
      expv[63] = 66'h1xx007xx01fxx07ex;
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
