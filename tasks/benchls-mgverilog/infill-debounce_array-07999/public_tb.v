// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07999 dut (
    .clk(clk),
    .reset_n(in_vec[32:32]),
    .data_in(in_vec[31:0]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0dde9cad6;
    stim[1] = 33'h0a1f0649c;
    stim[2] = 33'h1a486923b;
    stim[3] = 33'h1b3977a5c;
    stim[4] = 33'h16df93e8c;
    stim[5] = 33'h1c99038a6;
    stim[6] = 33'h1519b437f;
    stim[7] = 33'h1b26d3123;
    stim[8] = 33'h122db4bb9;
    stim[9] = 33'h180927c45;
    stim[10] = 33'h1902289d3;
    stim[11] = 33'h10439d43a;
    stim[12] = 33'h163e6b580;
    stim[13] = 33'h1ae37ce1d;
    stim[14] = 33'h173d881c5;
    stim[15] = 33'h16100b9e8;
    stim[16] = 33'h131d3b7de;
    stim[17] = 33'h1599b5b08;
    stim[18] = 33'h148d78f05;
    stim[19] = 33'h1991ddf80;
    stim[20] = 33'h1db238f67;
    stim[21] = 33'h17f13c910;
    stim[22] = 33'h1c8295742;
    stim[23] = 33'h1f6c26a8c;
    stim[24] = 33'h1439725e1;
    stim[25] = 33'h12e871251;
    stim[26] = 33'h1a20c2e7d;
    stim[27] = 33'h1dfadb044;
    stim[28] = 33'h196c3cfe3;
    stim[29] = 33'h1dd1e7b78;
    stim[30] = 33'h0f3fc45e1;
    stim[31] = 33'h13452ef35;
    stim[32] = 33'h1ddec4717;
    stim[33] = 33'h130f417fb;
    stim[34] = 33'h1899d06f2;
    stim[35] = 33'h19fd1f4f2;
    stim[36] = 33'h1dea43671;
    stim[37] = 33'h116d57077;
    stim[38] = 33'h1aefbbc4e;
    stim[39] = 33'h1f7081489;
    stim[40] = 33'h13e4beb11;
    stim[41] = 33'h1acd346b3;
    stim[42] = 33'h168771c25;
    stim[43] = 33'h18b94db0d;
    stim[44] = 33'h1319a8177;
    stim[45] = 33'h1299e0def;
    stim[46] = 33'h19db17730;
    stim[47] = 33'h1a0abadcb;
    stim[48] = 33'h155eb32ac;
    stim[49] = 33'h1ca1f6ad9;
    stim[50] = 33'h13f0230d1;
    stim[51] = 33'h1531811a9;
    stim[52] = 33'h14defbed7;
    stim[53] = 33'h112b95f9a;
    stim[54] = 33'h1cc4a419c;
    stim[55] = 33'h1e03dc5fd;
    stim[56] = 33'h187d7e287;
    stim[57] = 33'h12021ddf7;
    stim[58] = 33'h1a5515b5b;
    stim[59] = 33'h1dcf59f1f;
    stim[60] = 33'h1677542bc;
    stim[61] = 33'h167dd24d8;
    stim[62] = 33'h1fb52373f;
    stim[63] = 33'h130d067e7;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
