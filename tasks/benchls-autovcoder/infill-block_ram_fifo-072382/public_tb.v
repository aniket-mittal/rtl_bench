// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072382 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h303f72663d;
    stim[1] = 38'h2d3734e377;
    stim[2] = 38'h05ab994723;
    stim[3] = 38'h056c540da3;
    stim[4] = 38'h029b78c598;
    stim[5] = 38'h0c592438b2;
    stim[6] = 38'h1436b02c97;
    stim[7] = 38'h1b3ebe2872;
    stim[8] = 38'h1c97510959;
    stim[9] = 38'h0041c83e19;
    stim[10] = 38'h1e0fa62eb5;
    stim[11] = 38'h1c9e577f46;
    stim[12] = 38'h048df8906d;
    stim[13] = 38'h086172ad52;
    stim[14] = 38'h1447f9814b;
    stim[15] = 38'h1c826e3f64;
    stim[16] = 38'h11bbb07078;
    stim[17] = 38'h012cb15e4f;
    stim[18] = 38'h1ee9e7ef4d;
    stim[19] = 38'h0fc39fa21c;
    stim[20] = 38'h1e4a236b29;
    stim[21] = 38'h09d3b21ce8;
    stim[22] = 38'h0bc0f105f4;
    stim[23] = 38'h0f0d0498f7;
    stim[24] = 38'h149348b20a;
    stim[25] = 38'h17314fce8e;
    stim[26] = 38'h1654297dc8;
    stim[27] = 38'h1e3c23ad97;
    stim[28] = 38'h037a01369b;
    stim[29] = 38'h166df2ccf8;
    stim[30] = 38'h13822a78b6;
    stim[31] = 38'h1ed5cacdd8;
    stim[32] = 38'h02e47a0a1a;
    stim[33] = 38'h08d4da83fd;
    stim[34] = 38'h1584626dc9;
    stim[35] = 38'h1b4c1febcb;
    stim[36] = 38'h1559cee750;
    stim[37] = 38'h0f97e6eced;
    stim[38] = 38'h0dc56ac4e1;
    stim[39] = 38'h1449fa93f8;
    stim[40] = 38'h1d9a800f85;
    stim[41] = 38'h0d0d4b0ab8;
    stim[42] = 38'h0987b13fae;
    stim[43] = 38'h0a32192a1e;
    stim[44] = 38'h14cfd50420;
    stim[45] = 38'h107a135d54;
    stim[46] = 38'h005e05b4f3;
    stim[47] = 38'h1052bf783c;
    stim[48] = 38'h15f02938c9;
    stim[49] = 38'h1413fd71ca;
    stim[50] = 38'h0541bb8bb2;
    stim[51] = 38'h1ee4b90b22;
    stim[52] = 38'h0aa638564f;
    stim[53] = 38'h1c7fd62dd5;
    stim[54] = 38'h0041898515;
    stim[55] = 38'h0e67acb8c5;
    stim[56] = 38'h1462ee857b;
    stim[57] = 38'h1491f38660;
    stim[58] = 38'h115f9febfb;
    stim[59] = 38'h06c4f5a372;
    stim[60] = 38'h090de65da5;
    stim[61] = 38'h2ae336e27f;
    stim[62] = 38'h0a28f4c9b8;
    stim[63] = 38'h286dd51b31;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h325d44256;
      expv[13] = 34'h325d44256;
      expv[14] = 34'h325d44256;
      expv[15] = 34'h383e98bad;
      expv[16] = 34'h383e98bad;
      expv[17] = 34'h383e98bad;
      expv[18] = 34'h383e98bad;
      expv[19] = 34'h383e98bad;
      expv[20] = 34'h383e98bad;
      expv[21] = 34'h383e98bad;
      expv[22] = 34'h383e98bad;
      expv[23] = 34'h383e98bad;
      expv[24] = 34'h383e98bad;
      expv[25] = 34'h383e98bad;
      expv[26] = 34'h383e98bad;
      expv[27] = 34'h383e98bad;
      expv[28] = 34'h32795dfd1;
      expv[29] = 34'h32795dfd1;
      expv[30] = 34'h32795dfd1;
      expv[31] = 34'h32795dfd1;
      expv[32] = 34'h32795dfd1;
      expv[33] = 34'h32795dfd1;
      expv[34] = 34'h32795dfd1;
      expv[35] = 34'h32795dfd1;
      expv[36] = 34'h3209b8fd9;
      expv[37] = 34'h3209b8fd9;
      expv[38] = 34'h3209b8fd9;
      expv[39] = 34'h3209b8fd9;
      expv[40] = 34'h3209b8fd9;
      expv[41] = 34'h3209b8fd9;
      expv[42] = 34'h3209b8fd9;
      expv[43] = 34'h3209b8fd9;
      expv[44] = 34'h3209b8fd9;
      expv[45] = 34'h3209b8fd9;
      expv[46] = 34'h3209b8fd9;
      expv[47] = 34'h3209b8fd9;
      expv[48] = 34'h3209b8fd9;
      expv[49] = 34'h3209b8fd9;
      expv[50] = 34'h3209b8fd9;
      expv[51] = 34'h3209b8fd9;
      expv[52] = 34'h3209b8fd9;
      expv[53] = 34'h3209b8fd9;
      expv[54] = 34'h3209b8fd9;
      expv[55] = 34'h3209b8fd9;
      expv[56] = 34'h3209b8fd9;
      expv[57] = 34'h3ba79fbd3;
      expv[58] = 34'h3ba79fbd3;
      expv[59] = 34'h39288daca;
      expv[60] = 34'h39288daca;
      expv[61] = 34'h39288daca;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
