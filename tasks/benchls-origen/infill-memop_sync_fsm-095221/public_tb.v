// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_095221 dut (
    .i_clk(clk),
    .i_reset_n(in_vec[8:8]),
    .i_load(in_vec[7:7]),
    .i_store(in_vec[6:6]),
    .i_ex_rtr(in_vec[5:5]),
    .i_id_ex_rts(in_vec[4:4]),
    .i_last_uop(in_vec[3:3]),
    .i_lq_empty(in_vec[2:2]),
    .i_mem_req(in_vec[1:1]),
    .i_memop_sync_end(in_vec[0:0]),
    .o_memop_sync_start(out_vec[3:3]),
    .o_completed_valid(out_vec[2:2]),
    .o_ovi_stall(out_vec[1:1]),
    .o_is_load(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h002;
    stim[1] = 9'h078;
    stim[2] = 9'h1fb;
    stim[3] = 9'h193;
    stim[4] = 9'h18d;
    stim[5] = 9'h184;
    stim[6] = 9'h1b4;
    stim[7] = 9'h15b;
    stim[8] = 9'h1e1;
    stim[9] = 9'h12b;
    stim[10] = 9'h124;
    stim[11] = 9'h1ff;
    stim[12] = 9'h1b6;
    stim[13] = 9'h148;
    stim[14] = 9'h18a;
    stim[15] = 9'h131;
    stim[16] = 9'h1ee;
    stim[17] = 9'h1e1;
    stim[18] = 9'h16a;
    stim[19] = 9'h136;
    stim[20] = 9'h159;
    stim[21] = 9'h188;
    stim[22] = 9'h17d;
    stim[23] = 9'h122;
    stim[24] = 9'h187;
    stim[25] = 9'h184;
    stim[26] = 9'h1f7;
    stim[27] = 9'h1b5;
    stim[28] = 9'h172;
    stim[29] = 9'h12b;
    stim[30] = 9'h198;
    stim[31] = 9'h117;
    stim[32] = 9'h1fd;
    stim[33] = 9'h176;
    stim[34] = 9'h192;
    stim[35] = 9'h15a;
    stim[36] = 9'h1f1;
    stim[37] = 9'h129;
    stim[38] = 9'h197;
    stim[39] = 9'h1d5;
    stim[40] = 9'h084;
    stim[41] = 9'h1cd;
    stim[42] = 9'h1b0;
    stim[43] = 9'h148;
    stim[44] = 9'h1ba;
    stim[45] = 9'h1d9;
    stim[46] = 9'h1a2;
    stim[47] = 9'h19d;
    stim[48] = 9'h17f;
    stim[49] = 9'h139;
    stim[50] = 9'h114;
    stim[51] = 9'h19a;
    stim[52] = 9'h148;
    stim[53] = 9'h196;
    stim[54] = 9'h058;
    stim[55] = 9'h194;
    stim[56] = 9'h1d9;
    stim[57] = 9'h12b;
    stim[58] = 9'h10c;
    stim[59] = 9'h1ee;
    stim[60] = 9'h177;
    stim[61] = 9'h101;
    stim[62] = 9'h1c4;
    stim[63] = 9'h19d;
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
      expv[0] = 4'h0;
      expv[1] = 4'h8;
      expv[2] = 4'h9;
      expv[3] = 4'h3;
      expv[4] = 4'h7;
      expv[5] = 4'h1;
      expv[6] = 4'h1;
      expv[7] = 4'h8;
      expv[8] = 4'h3;
      expv[9] = 4'h2;
      expv[10] = 4'h6;
      expv[11] = 4'h9;
      expv[12] = 4'h3;
      expv[13] = 4'h2;
      expv[14] = 4'h3;
      expv[15] = 4'h2;
      expv[16] = 4'h7;
      expv[17] = 4'h1;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h1;
      expv[22] = 4'h8;
      expv[23] = 4'h2;
      expv[24] = 4'h3;
      expv[25] = 4'h7;
      expv[26] = 4'h1;
      expv[27] = 4'h1;
      expv[28] = 4'h0;
      expv[29] = 4'h8;
      expv[30] = 4'h3;
      expv[31] = 4'h2;
      expv[32] = 4'h7;
      expv[33] = 4'h0;
      expv[34] = 4'h1;
      expv[35] = 4'h8;
      expv[36] = 4'h3;
      expv[37] = 4'h2;
      expv[38] = 4'h7;
      expv[39] = 4'h1;
      expv[40] = 4'h1;
      expv[41] = 4'h1;
      expv[42] = 4'h1;
      expv[43] = 4'h8;
      expv[44] = 4'h3;
      expv[45] = 4'h3;
      expv[46] = 4'h3;
      expv[47] = 4'h7;
      expv[48] = 4'h8;
      expv[49] = 4'h2;
      expv[50] = 4'h6;
      expv[51] = 4'h1;
      expv[52] = 4'h0;
      expv[53] = 4'h1;
      expv[54] = 4'h0;
      expv[55] = 4'h1;
      expv[56] = 4'h1;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h1;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h1;
      expv[63] = 4'h9;
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
