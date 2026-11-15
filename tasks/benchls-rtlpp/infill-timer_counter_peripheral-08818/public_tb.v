// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08818 dut (
    .clk_i(clk),
    .res_i(in_vec[18:18]),
    .en_clk_i(in_vec[17:17]),
    .t1_i(in_vec[16:16]),
    .clk_mstate_i(in_vec[15:13]),
    .data_i(in_vec[12:5]),
    .read_timer_i(in_vec[4:4]),
    .write_timer_i(in_vec[3:3]),
    .start_t_i(in_vec[2:2]),
    .start_cnt_i(in_vec[1:1]),
    .stop_tcnt_i(in_vec[0:0]),
    .data_o(out_vec[8:1]),
    .overflow_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h00fdd;
    stim[1] = 19'h1972e;
    stim[2] = 19'h55f04;
    stim[3] = 19'h447c3;
    stim[4] = 19'h50a6a;
    stim[5] = 19'h60d2b;
    stim[6] = 19'h7edc4;
    stim[7] = 19'h63b47;
    stim[8] = 19'h72abd;
    stim[9] = 19'h786c1;
    stim[10] = 19'h5ed9e;
    stim[11] = 19'h47dce;
    stim[12] = 19'h5d2ab;
    stim[13] = 19'h7e40d;
    stim[14] = 19'h477b8;
    stim[15] = 19'h77fec;
    stim[16] = 19'h472df;
    stim[17] = 19'h4175b;
    stim[18] = 19'h76216;
    stim[19] = 19'h57f3a;
    stim[20] = 19'h41380;
    stim[21] = 19'h6e0dd;
    stim[22] = 19'h4e8ac;
    stim[23] = 19'h5da16;
    stim[24] = 19'h487bb;
    stim[25] = 19'h44aea;
    stim[26] = 19'h7acce;
    stim[27] = 19'h52ea4;
    stim[28] = 19'h795f7;
    stim[29] = 19'h1a4b7;
    stim[30] = 19'h4b087;
    stim[31] = 19'h76440;
    stim[32] = 19'h6ad8b;
    stim[33] = 19'h6fb02;
    stim[34] = 19'h70add;
    stim[35] = 19'h42e61;
    stim[36] = 19'h41fbd;
    stim[37] = 19'h4fb67;
    stim[38] = 19'h55df6;
    stim[39] = 19'h47920;
    stim[40] = 19'h6d070;
    stim[41] = 19'h7a245;
    stim[42] = 19'h7e006;
    stim[43] = 19'h45655;
    stim[44] = 19'h6f8e4;
    stim[45] = 19'h6df0d;
    stim[46] = 19'h498b1;
    stim[47] = 19'h79ab0;
    stim[48] = 19'h4c587;
    stim[49] = 19'h467f4;
    stim[50] = 19'h580f7;
    stim[51] = 19'h5a0fa;
    stim[52] = 19'h76c60;
    stim[53] = 19'h44101;
    stim[54] = 19'h59f39;
    stim[55] = 19'h7070e;
    stim[56] = 19'h763d3;
    stim[57] = 19'h5c54e;
    stim[58] = 19'h15e10;
    stim[59] = 19'h4f529;
    stim[60] = 19'h79d32;
    stim[61] = 19'h5cbcf;
    stim[62] = 19'h754ab;
    stim[63] = 19'h52f2a;
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
      expv[0] = 9'h000;
      expv[1] = 9'h1fe;
      expv[2] = 9'h1fe;
      expv[3] = 9'h1fe;
      expv[4] = 9'h1fe;
      expv[5] = 9'h1fe;
      expv[6] = 9'h1fe;
      expv[7] = 9'h1fe;
      expv[8] = 9'h0d2;
      expv[9] = 9'h1fe;
      expv[10] = 9'h0aa;
      expv[11] = 9'h1fe;
      expv[12] = 9'h1fe;
      expv[13] = 9'h1fe;
      expv[14] = 9'h040;
      expv[15] = 9'h1fe;
      expv[16] = 9'h1fe;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1fe;
      expv[19] = 9'h1fe;
      expv[20] = 9'h1fe;
      expv[21] = 9'h1fe;
      expv[22] = 9'h1fe;
      expv[23] = 9'h00c;
      expv[24] = 9'h00c;
      expv[25] = 9'h1fe;
      expv[26] = 9'h1fe;
      expv[27] = 9'h1fe;
      expv[28] = 9'h0cc;
      expv[29] = 9'h000;
      expv[30] = 9'h1fe;
      expv[31] = 9'h1fe;
      expv[32] = 9'h1fe;
      expv[33] = 9'h1fe;
      expv[34] = 9'h0d8;
      expv[35] = 9'h1fe;
      expv[36] = 9'h0ac;
      expv[37] = 9'h1fe;
      expv[38] = 9'h0ac;
      expv[39] = 9'h1fe;
      expv[40] = 9'h0ac;
      expv[41] = 9'h1fe;
      expv[42] = 9'h1fe;
      expv[43] = 9'h0ac;
      expv[44] = 9'h1fe;
      expv[45] = 9'h1fe;
      expv[46] = 9'h1f0;
      expv[47] = 9'h1f0;
      expv[48] = 9'h1fe;
      expv[49] = 9'h1f0;
      expv[50] = 9'h1f0;
      expv[51] = 9'h1f0;
      expv[52] = 9'h1fe;
      expv[53] = 9'h1fe;
      expv[54] = 9'h1f0;
      expv[55] = 9'h1fe;
      expv[56] = 9'h070;
      expv[57] = 9'h1fe;
      expv[58] = 9'h000;
      expv[59] = 9'h1fe;
      expv[60] = 9'h000;
      expv[61] = 9'h1fe;
      expv[62] = 9'h1fe;
      expv[63] = 9'h1fe;
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
