// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06676 dut (
    .clk_i(clk),
    .rst_i(in_vec[23:23]),
    .bufout(in_vec[22:2]),
    .trigger(in_vec[1:1]),
    .d1626(in_vec[0:0]),
    .bufin(out_vec[25:5]),
    .done(out_vec[4:4]),
    .rst1626(out_vec[3:3]),
    .clk1626(out_vec[2:2]),
    .q1626(out_vec[1:1]),
    .en1626(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hf0c4f4;
    stim[1] = 24'h9615a9;
    stim[2] = 24'h47fe26;
    stim[3] = 24'h49c710;
    stim[4] = 24'h42f883;
    stim[5] = 24'h341f7c;
    stim[6] = 24'h78b107;
    stim[7] = 24'h094ea3;
    stim[8] = 24'h0c5ba2;
    stim[9] = 24'h0bcf39;
    stim[10] = 24'h15b454;
    stim[11] = 24'h3350ff;
    stim[12] = 24'h16aa83;
    stim[13] = 24'h4f1663;
    stim[14] = 24'h6d8991;
    stim[15] = 24'h53e72b;
    stim[16] = 24'h6c3b3a;
    stim[17] = 24'h0f3200;
    stim[18] = 24'h1c2e81;
    stim[19] = 24'h612186;
    stim[20] = 24'h14187b;
    stim[21] = 24'h613811;
    stim[22] = 24'ha21167;
    stim[23] = 24'h494ed0;
    stim[24] = 24'h5564e1;
    stim[25] = 24'hf4c127;
    stim[26] = 24'h6a98cc;
    stim[27] = 24'h65232d;
    stim[28] = 24'h2cde27;
    stim[29] = 24'h7439fc;
    stim[30] = 24'h5a8d6a;
    stim[31] = 24'h5cc8c4;
    stim[32] = 24'h1bbb53;
    stim[33] = 24'h747ada;
    stim[34] = 24'h42d5ce;
    stim[35] = 24'h2c4056;
    stim[36] = 24'h1ad059;
    stim[37] = 24'h0add38;
    stim[38] = 24'h1fe113;
    stim[39] = 24'h1d6271;
    stim[40] = 24'h2ff3e8;
    stim[41] = 24'h3dc41c;
    stim[42] = 24'h065732;
    stim[43] = 24'h71f18d;
    stim[44] = 24'ha90d73;
    stim[45] = 24'h3a8811;
    stim[46] = 24'h281adf;
    stim[47] = 24'h0629a2;
    stim[48] = 24'h08420d;
    stim[49] = 24'h56efa3;
    stim[50] = 24'h84f6f2;
    stim[51] = 24'h792932;
    stim[52] = 24'h554716;
    stim[53] = 24'h300e93;
    stim[54] = 24'h38209c;
    stim[55] = 24'h633d69;
    stim[56] = 24'h35123a;
    stim[57] = 24'h5f3806;
    stim[58] = 24'h17091f;
    stim[59] = 24'h030524;
    stim[60] = 24'h671aa9;
    stim[61] = 24'h4dcc01;
    stim[62] = 24'h4ba549;
    stim[63] = 24'h312b3e;
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
      expv[0] = 26'hxxxxxx4;
      expv[1] = 26'hxxxxxx6;
      expv[2] = 26'hxxxxxx4;
      expv[3] = 26'hxxxxxxd;
      expv[4] = 26'hxxxxxxd;
      expv[5] = 26'hxxxxxxf;
      expv[6] = 26'hxxxxxxd;
      expv[7] = 26'hxxxxxxd;
      expv[8] = 26'hxxxxxxd;
      expv[9] = 26'hxxxxxxf;
      expv[10] = 26'hxxxxxxd;
      expv[11] = 26'hxxxxxxf;
      expv[12] = 26'hxxxxxx9;
      expv[13] = 26'hxxxxxx9;
      expv[14] = 26'hxxxxxx9;
      expv[15] = 26'hxxxxxxb;
      expv[16] = 26'hxxxxxxb;
      expv[17] = 26'hxxxxxx9;
      expv[18] = 26'hxxxxxx9;
      expv[19] = 26'hxxxxxx9;
      expv[20] = 26'hxxxxxxb;
      expv[21] = 26'hxxxxxx9;
      expv[22] = 26'hxxxxxx4;
      expv[23] = 26'hxxxxxx4;
      expv[24] = 26'hxxxxxx4;
      expv[25] = 26'hxxxxxx4;
      expv[26] = 26'hxxxxxx6;
      expv[27] = 26'hxxxxxx6;
      expv[28] = 26'hxxxxxx4;
      expv[29] = 26'hxxxxxxf;
      expv[30] = 26'hxxxxxxf;
      expv[31] = 26'hxxxxxxd;
      expv[32] = 26'hxxxxxxd;
      expv[33] = 26'hxxxxxxf;
      expv[34] = 26'hxxxxxxf;
      expv[35] = 26'hxxxxxxd;
      expv[36] = 26'hxxxxxxf;
      expv[37] = 26'hxxxxxxf;
      expv[38] = 26'hxxxxxx9;
      expv[39] = 26'hxxxxxx9;
      expv[40] = 26'hxxxxxxb;
      expv[41] = 26'hxxxxxxb;
      expv[42] = 26'hxxxxxx9;
      expv[43] = 26'hxxxxxxb;
      expv[44] = 26'hxxxxxx4;
      expv[45] = 26'hxxxxxx4;
      expv[46] = 26'hxxxxxx6;
      expv[47] = 26'hxxxxxxd;
      expv[48] = 26'hxxxxxxf;
      expv[49] = 26'hxxxxxxd;
      expv[50] = 26'hxxxxxx4;
      expv[51] = 26'hxxxxxx4;
      expv[52] = 26'hxxxxxxd;
      expv[53] = 26'hxxxxxxd;
      expv[54] = 26'hxxxxxxf;
      expv[55] = 26'hxxxxxxf;
      expv[56] = 26'hxxxxxxf;
      expv[57] = 26'hxxxxxxd;
      expv[58] = 26'hxxxxxxf;
      expv[59] = 26'hxxxxxxd;
      expv[60] = 26'hxxxxxxf;
      expv[61] = 26'hxxxxxx9;
      expv[62] = 26'hxxxxxxb;
      expv[63] = 26'hxxxxxxb;
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
