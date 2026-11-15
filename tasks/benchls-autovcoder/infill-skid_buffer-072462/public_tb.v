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

  autovcoder_072462 dut (
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
    stim[0] = 11'h6b9;
    stim[1] = 11'h6b7;
    stim[2] = 11'h0ac;
    stim[3] = 11'h1f4;
    stim[4] = 11'h2d1;
    stim[5] = 11'h339;
    stim[6] = 11'h205;
    stim[7] = 11'h201;
    stim[8] = 11'h29c;
    stim[9] = 11'h173;
    stim[10] = 11'h3da;
    stim[11] = 11'h0b1;
    stim[12] = 11'h15d;
    stim[13] = 11'h3ea;
    stim[14] = 11'h1bc;
    stim[15] = 11'h177;
    stim[16] = 11'h02d;
    stim[17] = 11'h26b;
    stim[18] = 11'h236;
    stim[19] = 11'h526;
    stim[20] = 11'h154;
    stim[21] = 11'h3f9;
    stim[22] = 11'h2c0;
    stim[23] = 11'h39c;
    stim[24] = 11'h21d;
    stim[25] = 11'h24e;
    stim[26] = 11'h185;
    stim[27] = 11'h200;
    stim[28] = 11'h27e;
    stim[29] = 11'h161;
    stim[30] = 11'h38b;
    stim[31] = 11'h176;
    stim[32] = 11'h081;
    stim[33] = 11'h0ef;
    stim[34] = 11'h2a0;
    stim[35] = 11'h219;
    stim[36] = 11'h02c;
    stim[37] = 11'h0f1;
    stim[38] = 11'h1c3;
    stim[39] = 11'h1be;
    stim[40] = 11'h314;
    stim[41] = 11'h39c;
    stim[42] = 11'h28d;
    stim[43] = 11'h0e6;
    stim[44] = 11'h126;
    stim[45] = 11'h138;
    stim[46] = 11'h3a1;
    stim[47] = 11'h37b;
    stim[48] = 11'h2f4;
    stim[49] = 11'h066;
    stim[50] = 11'h362;
    stim[51] = 11'h394;
    stim[52] = 11'h11f;
    stim[53] = 11'h101;
    stim[54] = 11'h1bf;
    stim[55] = 11'h23b;
    stim[56] = 11'h394;
    stim[57] = 11'h311;
    stim[58] = 11'h269;
    stim[59] = 11'h0f5;
    stim[60] = 11'h02c;
    stim[61] = 11'h07b;
    stim[62] = 11'h0a5;
    stim[63] = 11'h237;
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
      expv[2] = 12'h568;
      expv[3] = 12'hd68;
      expv[4] = 12'hd68;
      expv[5] = 12'hd68;
      expv[6] = 12'hd68;
      expv[7] = 12'hd68;
      expv[8] = 12'hd68;
      expv[9] = 12'hd68;
      expv[10] = 12'hae5;
      expv[11] = 12'h2e6;
      expv[12] = 12'hfb5;
      expv[13] = 12'hfb0;
      expv[14] = 12'hfd5;
      expv[15] = 12'hfd5;
      expv[16] = 12'haed;
      expv[17] = 12'hae8;
      expv[18] = 12'hcd5;
      expv[19] = 12'h4d6;
      expv[20] = 12'h4d0;
      expv[21] = 12'hcd0;
      expv[22] = 12'hcd0;
      expv[23] = 12'hcd0;
      expv[24] = 12'hcd0;
      expv[25] = 12'hcd0;
      expv[26] = 12'hc9d;
      expv[27] = 12'hc98;
      expv[28] = 12'hc98;
      expv[29] = 12'hcfd;
      expv[30] = 12'hcf8;
      expv[31] = 12'hf15;
      expv[32] = 12'h716;
      expv[33] = 12'haed;
      expv[34] = 12'h9dd;
      expv[35] = 12'h9dd;
      expv[36] = 12'h9d8;
      expv[37] = 12'h9d8;
      expv[38] = 12'h9d8;
      expv[39] = 12'hb85;
      expv[40] = 12'h386;
      expv[41] = 12'h386;
      expv[42] = 12'h386;
      expv[43] = 12'hb7d;
      expv[44] = 12'h37e;
      expv[45] = 12'h37e;
      expv[46] = 12'h37e;
      expv[47] = 12'h9cd;
      expv[48] = 12'hef5;
      expv[49] = 12'hef5;
      expv[50] = 12'h6f6;
      expv[51] = 12'h6f6;
      expv[52] = 12'h6f6;
      expv[53] = 12'h8cd;
      expv[54] = 12'h8c8;
      expv[55] = 12'hb7d;
      expv[56] = 12'hc75;
      expv[57] = 12'hc75;
      expv[58] = 12'hc70;
      expv[59] = 12'hc70;
      expv[60] = 12'hc70;
      expv[61] = 12'hc70;
      expv[62] = 12'h8f5;
      expv[63] = 12'h8f0;
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
