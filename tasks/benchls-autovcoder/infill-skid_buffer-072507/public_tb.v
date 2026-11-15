// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072507 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5e5;
    stim[1] = 11'h584;
    stim[2] = 11'h137;
    stim[3] = 11'h3cd;
    stim[4] = 11'h066;
    stim[5] = 11'h3ba;
    stim[6] = 11'h083;
    stim[7] = 11'h2d3;
    stim[8] = 11'h199;
    stim[9] = 11'h37f;
    stim[10] = 11'h7c3;
    stim[11] = 11'h051;
    stim[12] = 11'h1dd;
    stim[13] = 11'h356;
    stim[14] = 11'h066;
    stim[15] = 11'h39c;
    stim[16] = 11'h24b;
    stim[17] = 11'h1b9;
    stim[18] = 11'h24a;
    stim[19] = 11'h2b8;
    stim[20] = 11'h21a;
    stim[21] = 11'h1fd;
    stim[22] = 11'h15c;
    stim[23] = 11'h090;
    stim[24] = 11'h333;
    stim[25] = 11'h3d1;
    stim[26] = 11'h017;
    stim[27] = 11'h129;
    stim[28] = 11'h252;
    stim[29] = 11'h3ad;
    stim[30] = 11'h114;
    stim[31] = 11'h3e8;
    stim[32] = 11'h04c;
    stim[33] = 11'h040;
    stim[34] = 11'h08c;
    stim[35] = 11'h108;
    stim[36] = 11'h2b4;
    stim[37] = 11'h1cf;
    stim[38] = 11'h2cc;
    stim[39] = 11'h1b8;
    stim[40] = 11'h005;
    stim[41] = 11'h18b;
    stim[42] = 11'h23b;
    stim[43] = 11'h1e5;
    stim[44] = 11'h33b;
    stim[45] = 11'h07b;
    stim[46] = 11'h068;
    stim[47] = 11'h2b0;
    stim[48] = 11'h1ba;
    stim[49] = 11'h01b;
    stim[50] = 11'h0fe;
    stim[51] = 11'h0c9;
    stim[52] = 11'h2d4;
    stim[53] = 11'h133;
    stim[54] = 11'h230;
    stim[55] = 11'h140;
    stim[56] = 11'h362;
    stim[57] = 11'h23b;
    stim[58] = 11'h112;
    stim[59] = 11'h291;
    stim[60] = 11'h120;
    stim[61] = 11'h13c;
    stim[62] = 11'h20f;
    stim[63] = 11'h10f;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'ha68;
      expv[4] = 12'ha68;
      expv[5] = 12'h8cd;
      expv[6] = 12'h0ce;
      expv[7] = 12'hf75;
      expv[8] = 12'hda5;
      expv[9] = 12'hda0;
      expv[10] = 12'hefd;
      expv[11] = 12'h780;
      expv[12] = 12'hf80;
      expv[13] = 12'hf80;
      expv[14] = 12'head;
      expv[15] = 12'h6ae;
      expv[16] = 12'h6ae;
      expv[17] = 12'h8cd;
      expv[18] = 12'h8c8;
      expv[19] = 12'hc95;
      expv[20] = 12'hc95;
      expv[21] = 12'h496;
      expv[22] = 12'hc35;
      expv[23] = 12'hc35;
      expv[24] = 12'hc35;
      expv[25] = 12'he65;
      expv[26] = 12'he60;
      expv[27] = 12'h82d;
      expv[28] = 12'h828;
      expv[29] = 12'hca5;
      expv[30] = 12'hca0;
      expv[31] = 12'hca0;
      expv[32] = 12'hca0;
      expv[33] = 12'hca0;
      expv[34] = 12'hca0;
      expv[35] = 12'hca0;
      expv[36] = 12'hca0;
      expv[37] = 12'hca0;
      expv[38] = 12'hb9d;
      expv[39] = 12'hb9d;
      expv[40] = 12'hb9d;
      expv[41] = 12'hb98;
      expv[42] = 12'hb15;
      expv[43] = 12'hc75;
      expv[44] = 12'hc70;
      expv[45] = 12'he75;
      expv[46] = 12'h8f5;
      expv[47] = 12'h8f5;
      expv[48] = 12'h8f5;
      expv[49] = 12'h0f6;
      expv[50] = 12'hb75;
      expv[51] = 12'h376;
      expv[52] = 12'h9fd;
      expv[53] = 12'h9fd;
      expv[54] = 12'ha65;
      expv[55] = 12'ha65;
      expv[56] = 12'ha65;
      expv[57] = 12'h266;
      expv[58] = 12'hec5;
      expv[59] = 12'h6c6;
      expv[60] = 12'ha25;
      expv[61] = 12'ha25;
      expv[62] = 12'ha25;
      expv[63] = 12'hc1d;
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
