// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087840 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .clk_bps(in_vec[9:9]),
    .rx_data(in_vec[8:1]),
    .rx_int(in_vec[0:0]),
    .rs232_tx(out_vec[1:1]),
    .bps_start(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h130;
    stim[1] = 11'h197;
    stim[2] = 11'h56d;
    stim[3] = 11'h675;
    stim[4] = 11'h57d;
    stim[5] = 11'h7d9;
    stim[6] = 11'h79a;
    stim[7] = 11'h44c;
    stim[8] = 11'h74c;
    stim[9] = 11'h72d;
    stim[10] = 11'h6ad;
    stim[11] = 11'h7bc;
    stim[12] = 11'h6ef;
    stim[13] = 11'h59d;
    stim[14] = 11'h4f2;
    stim[15] = 11'h4e5;
    stim[16] = 11'h441;
    stim[17] = 11'h6f3;
    stim[18] = 11'h4f5;
    stim[19] = 11'h7ea;
    stim[20] = 11'h360;
    stim[21] = 11'h4b4;
    stim[22] = 11'h4f6;
    stim[23] = 11'h4d4;
    stim[24] = 11'h7d4;
    stim[25] = 11'h657;
    stim[26] = 11'h722;
    stim[27] = 11'h617;
    stim[28] = 11'h760;
    stim[29] = 11'h72f;
    stim[30] = 11'h43d;
    stim[31] = 11'h552;
    stim[32] = 11'h4e1;
    stim[33] = 11'h521;
    stim[34] = 11'h788;
    stim[35] = 11'h597;
    stim[36] = 11'h684;
    stim[37] = 11'h453;
    stim[38] = 11'h4f7;
    stim[39] = 11'h6d3;
    stim[40] = 11'h7a5;
    stim[41] = 11'h5c1;
    stim[42] = 11'h52e;
    stim[43] = 11'h691;
    stim[44] = 11'h58d;
    stim[45] = 11'h6b2;
    stim[46] = 11'h4ea;
    stim[47] = 11'h41f;
    stim[48] = 11'h644;
    stim[49] = 11'h7f4;
    stim[50] = 11'h4b2;
    stim[51] = 11'h764;
    stim[52] = 11'h58f;
    stim[53] = 11'h76a;
    stim[54] = 11'h591;
    stim[55] = 11'h5d1;
    stim[56] = 11'h6c4;
    stim[57] = 11'h78a;
    stim[58] = 11'h6ac;
    stim[59] = 11'h532;
    stim[60] = 11'h736;
    stim[61] = 11'h61d;
    stim[62] = 11'h7f1;
    stim[63] = 11'h602;
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
      expv[0] = 2'h2;
      expv[1] = 2'h2;
      expv[2] = 2'h2;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h3;
      expv[10] = 2'h3;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h3;
      expv[19] = 2'h3;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h1;
      expv[30] = 2'h3;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h3;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h3;
      expv[49] = 2'h1;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h3;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h3;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h3;
      expv[60] = 2'h3;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
