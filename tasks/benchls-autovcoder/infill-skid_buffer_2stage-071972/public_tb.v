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

  autovcoder_071972 dut (
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
    stim[0] = 11'h795;
    stim[1] = 11'h4b6;
    stim[2] = 11'h340;
    stim[3] = 11'h00b;
    stim[4] = 11'h24c;
    stim[5] = 11'h0f3;
    stim[6] = 11'h100;
    stim[7] = 11'h334;
    stim[8] = 11'h3b8;
    stim[9] = 11'h1cb;
    stim[10] = 11'h221;
    stim[11] = 11'h130;
    stim[12] = 11'h319;
    stim[13] = 11'h3a8;
    stim[14] = 11'h208;
    stim[15] = 11'h23d;
    stim[16] = 11'h198;
    stim[17] = 11'h065;
    stim[18] = 11'h028;
    stim[19] = 11'h164;
    stim[20] = 11'h26b;
    stim[21] = 11'h24d;
    stim[22] = 11'h339;
    stim[23] = 11'h324;
    stim[24] = 11'h00f;
    stim[25] = 11'h2f2;
    stim[26] = 11'h76e;
    stim[27] = 11'h165;
    stim[28] = 11'h3c0;
    stim[29] = 11'h322;
    stim[30] = 11'h2bd;
    stim[31] = 11'h199;
    stim[32] = 11'h090;
    stim[33] = 11'h1db;
    stim[34] = 11'h3fd;
    stim[35] = 11'h08c;
    stim[36] = 11'h30c;
    stim[37] = 11'h1a1;
    stim[38] = 11'h244;
    stim[39] = 11'h191;
    stim[40] = 11'h1bc;
    stim[41] = 11'h1f9;
    stim[42] = 11'h3eb;
    stim[43] = 11'h1cc;
    stim[44] = 11'h232;
    stim[45] = 11'h269;
    stim[46] = 11'h2f0;
    stim[47] = 11'h3fd;
    stim[48] = 11'h301;
    stim[49] = 11'h2c3;
    stim[50] = 11'h2a3;
    stim[51] = 11'h58d;
    stim[52] = 11'h37c;
    stim[53] = 11'h02e;
    stim[54] = 11'h170;
    stim[55] = 11'h04b;
    stim[56] = 11'h03e;
    stim[57] = 11'h085;
    stim[58] = 11'h0fd;
    stim[59] = 11'h7d6;
    stim[60] = 11'h2cd;
    stim[61] = 11'h2e5;
    stim[62] = 11'h1f0;
    stim[63] = 11'h2da;
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
      expv[2] = 12'h168;
      expv[3] = 12'h968;
      expv[4] = 12'h815;
      expv[5] = 12'h815;
      expv[6] = 12'h9e5;
      expv[7] = 12'h9e5;
      expv[8] = 12'h9e5;
      expv[9] = 12'h9e5;
      expv[10] = 12'hb95;
      expv[11] = 12'hb90;
      expv[12] = 12'hb90;
      expv[13] = 12'hb90;
      expv[14] = 12'hb90;
      expv[15] = 12'hb90;
      expv[16] = 12'hb90;
      expv[17] = 12'hb90;
      expv[18] = 12'hb90;
      expv[19] = 12'hb90;
      expv[20] = 12'hb90;
      expv[21] = 12'hcd5;
      expv[22] = 12'hcd0;
      expv[23] = 12'hcd0;
      expv[24] = 12'hcd0;
      expv[25] = 12'h81d;
      expv[26] = 12'h01e;
      expv[27] = 12'h018;
      expv[28] = 12'h818;
      expv[29] = 12'h818;
      expv[30] = 12'he45;
      expv[31] = 12'he40;
      expv[32] = 12'he40;
      expv[33] = 12'he40;
      expv[34] = 12'hbb5;
      expv[35] = 12'hbb0;
      expv[36] = 12'hbb0;
      expv[37] = 12'hbb0;
      expv[38] = 12'hbb0;
      expv[39] = 12'hbb0;
      expv[40] = 12'hbb0;
      expv[41] = 12'hbb0;
      expv[42] = 12'hbb0;
      expv[43] = 12'hfd5;
      expv[44] = 12'hfd5;
      expv[45] = 12'h7d6;
      expv[46] = 12'hc65;
      expv[47] = 12'hc65;
      expv[48] = 12'hc60;
      expv[49] = 12'hc60;
      expv[50] = 12'hd85;
      expv[51] = 12'hd45;
      expv[52] = 12'h540;
      expv[53] = 12'hd40;
      expv[54] = 12'h85d;
      expv[55] = 12'h85d;
      expv[56] = 12'h895;
      expv[57] = 12'h096;
      expv[58] = 12'h87d;
      expv[59] = 12'h878;
      expv[60] = 12'h7a8;
      expv[61] = 12'hfa8;
      expv[62] = 12'hfa8;
      expv[63] = 12'hfa8;
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
