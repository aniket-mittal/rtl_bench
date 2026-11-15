// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  prim_clock_meas dut (
    .clk_i(clk),
    .rst_ni(in_vec[11:11]),
    .clk_ref_i(in_vec[10:10]),
    .rst_ref_ni(in_vec[9:9]),
    .en_i(in_vec[8:8]),
    .max_cnt(in_vec[7:4]),
    .min_cnt(in_vec[3:0]),
    .valid_o(out_vec[4:4]),
    .fast_o(out_vec[3:3]),
    .slow_o(out_vec[2:2]),
    .timeout_clk_ref_o(out_vec[1:1]),
    .ref_timeout_clk_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h165;
    stim[1] = 12'h7cd;
    stim[2] = 12'hc83;
    stim[3] = 12'hae5;
    stim[4] = 12'hccd;
    stim[5] = 12'hbc3;
    stim[6] = 12'hf18;
    stim[7] = 12'h8e1;
    stim[8] = 12'he3e;
    stim[9] = 12'h939;
    stim[10] = 12'hb7c;
    stim[11] = 12'ha31;
    stim[12] = 12'hf16;
    stim[13] = 12'hb75;
    stim[14] = 12'h8f4;
    stim[15] = 12'hdad;
    stim[16] = 12'h93a;
    stim[17] = 12'hb74;
    stim[18] = 12'hc59;
    stim[19] = 12'hec7;
    stim[20] = 12'h867;
    stim[21] = 12'hb37;
    stim[22] = 12'ha80;
    stim[23] = 12'haad;
    stim[24] = 12'h930;
    stim[25] = 12'h99e;
    stim[26] = 12'hef2;
    stim[27] = 12'h8b5;
    stim[28] = 12'h82b;
    stim[29] = 12'hf77;
    stim[30] = 12'hc40;
    stim[31] = 12'hccc;
    stim[32] = 12'h8c8;
    stim[33] = 12'hc5b;
    stim[34] = 12'habf;
    stim[35] = 12'h975;
    stim[36] = 12'hde3;
    stim[37] = 12'h9d2;
    stim[38] = 12'hb6f;
    stim[39] = 12'he95;
    stim[40] = 12'h95a;
    stim[41] = 12'hd2a;
    stim[42] = 12'h964;
    stim[43] = 12'h9b8;
    stim[44] = 12'he16;
    stim[45] = 12'hfa1;
    stim[46] = 12'h90e;
    stim[47] = 12'hce1;
    stim[48] = 12'h849;
    stim[49] = 12'hb82;
    stim[50] = 12'hf6e;
    stim[51] = 12'hdae;
    stim[52] = 12'hb7e;
    stim[53] = 12'hc4d;
    stim[54] = 12'hd67;
    stim[55] = 12'hc1a;
    stim[56] = 12'h873;
    stim[57] = 12'he09;
    stim[58] = 12'h9df;
    stim[59] = 12'h86c;
    stim[60] = 12'h87a;
    stim[61] = 12'h186;
    stim[62] = 12'heea;
    stim[63] = 12'hd9f;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
