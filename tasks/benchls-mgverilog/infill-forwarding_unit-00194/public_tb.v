// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00194 dut (
    .rs(in_vec[23:19]),
    .rt(in_vec[18:14]),
    .five_bit_mux_out(in_vec[13:9]),
    .ex_mem_wb(in_vec[8:7]),
    .mem_Write_reg(in_vec[6:2]),
    .mem_wb_wb(in_vec[1:0]),
    .forward_a_sel(out_vec[3:2]),
    .forward_b_sel(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h0832c5;
    stim[1] = 24'h08462f;
    stim[2] = 24'h3a0d3c;
    stim[3] = 24'ha0d55e;
    stim[4] = 24'hcdb05f;
    stim[5] = 24'hf2a593;
    stim[6] = 24'hf483c2;
    stim[7] = 24'h27bc64;
    stim[8] = 24'hf3042e;
    stim[9] = 24'h0f77a2;
    stim[10] = 24'h238bfd;
    stim[11] = 24'hf1b843;
    stim[12] = 24'hb94c51;
    stim[13] = 24'h540c39;
    stim[14] = 24'hbfd38e;
    stim[15] = 24'h106719;
    stim[16] = 24'h353521;
    stim[17] = 24'he528f5;
    stim[18] = 24'ha4ebd3;
    stim[19] = 24'h007398;
    stim[20] = 24'hbf7e9f;
    stim[21] = 24'h9508b2;
    stim[22] = 24'h3d25b8;
    stim[23] = 24'h34c866;
    stim[24] = 24'h4517b9;
    stim[25] = 24'h80d58f;
    stim[26] = 24'hd73990;
    stim[27] = 24'h5349e0;
    stim[28] = 24'hb3b465;
    stim[29] = 24'h5c0e22;
    stim[30] = 24'hd34e3f;
    stim[31] = 24'h66f802;
    stim[32] = 24'h6598af;
    stim[33] = 24'hc44cdb;
    stim[34] = 24'h896237;
    stim[35] = 24'he62c59;
    stim[36] = 24'h738254;
    stim[37] = 24'hafb536;
    stim[38] = 24'h79a793;
    stim[39] = 24'h0254f5;
    stim[40] = 24'h5c2bc9;
    stim[41] = 24'hd38b1d;
    stim[42] = 24'h8996fd;
    stim[43] = 24'he3b19c;
    stim[44] = 24'h11460d;
    stim[45] = 24'hebd9ce;
    stim[46] = 24'h979cd7;
    stim[47] = 24'h87e205;
    stim[48] = 24'h2e9f80;
    stim[49] = 24'ha0c3a7;
    stim[50] = 24'hf7e0b8;
    stim[51] = 24'h080f7d;
    stim[52] = 24'h6a4588;
    stim[53] = 24'h24cad8;
    stim[54] = 24'h1bb2aa;
    stim[55] = 24'ha474e8;
    stim[56] = 24'h1ce6e1;
    stim[57] = 24'h2f156c;
    stim[58] = 24'h91dbbc;
    stim[59] = 24'h8a2f5e;
    stim[60] = 24'hfaa009;
    stim[61] = 24'hb7be8f;
    stim[62] = 24'h798ca4;
    stim[63] = 24'h6693a3;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h2;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
