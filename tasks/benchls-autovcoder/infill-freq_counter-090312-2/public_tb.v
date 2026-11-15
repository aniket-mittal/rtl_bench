// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_090312 dut (
    .ref_clk_i(clk),
    .rst_i(in_vec[17:17]),
    .test_term_cnt_i(in_vec[16:1]),
    .test_clk_i(in_vec[0:0]),
    .freq_cnt_o(out_vec[18:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h35091;
    stim[1] = 18'h26d10;
    stim[2] = 18'h13062;
    stim[3] = 18'h17a98;
    stim[4] = 18'h1ec2e;
    stim[5] = 18'h19542;
    stim[6] = 18'h158fe;
    stim[7] = 18'h07fcc;
    stim[8] = 18'h09ea1;
    stim[9] = 18'h00b9f;
    stim[10] = 18'h19abd;
    stim[11] = 18'h1aadc;
    stim[12] = 18'h171df;
    stim[13] = 18'h11996;
    stim[14] = 18'h3218e;
    stim[15] = 18'h0c3a6;
    stim[16] = 18'h3ae84;
    stim[17] = 18'h07681;
    stim[18] = 18'h092cc;
    stim[19] = 18'h12159;
    stim[20] = 18'h074cf;
    stim[21] = 18'h0a435;
    stim[22] = 18'h30189;
    stim[23] = 18'h05497;
    stim[24] = 18'h04c40;
    stim[25] = 18'h0df94;
    stim[26] = 18'h0c684;
    stim[27] = 18'h1ace5;
    stim[28] = 18'h171c9;
    stim[29] = 18'h11521;
    stim[30] = 18'h1edb6;
    stim[31] = 18'h06472;
    stim[32] = 18'h0f922;
    stim[33] = 18'h170bf;
    stim[34] = 18'h023a2;
    stim[35] = 18'h09713;
    stim[36] = 18'h1f5bd;
    stim[37] = 18'h1a0fb;
    stim[38] = 18'h1dbd7;
    stim[39] = 18'h145ec;
    stim[40] = 18'h063c1;
    stim[41] = 18'h0a18b;
    stim[42] = 18'h10a6c;
    stim[43] = 18'h0381d;
    stim[44] = 18'h07434;
    stim[45] = 18'h0f1f6;
    stim[46] = 18'h14aff;
    stim[47] = 18'h1b164;
    stim[48] = 18'h0aca5;
    stim[49] = 18'h18294;
    stim[50] = 18'h15654;
    stim[51] = 18'h02eb6;
    stim[52] = 18'h10b22;
    stim[53] = 18'h1223d;
    stim[54] = 18'h15e7f;
    stim[55] = 18'h12961;
    stim[56] = 18'h091ef;
    stim[57] = 18'h1f118;
    stim[58] = 18'h1267d;
    stim[59] = 18'h1d599;
    stim[60] = 18'h01079;
    stim[61] = 18'h1dbad;
    stim[62] = 18'h039ba;
    stim[63] = 18'h0b69e;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h00000;
      expv[55] = 19'h00000;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
