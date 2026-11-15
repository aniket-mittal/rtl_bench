// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04235 dut (
    .a(in_vec[23:16]),
    .b(in_vec[15:8]),
    .c(in_vec[7:0]),
    .o(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h9161f7;
    stim[1] = 24'hc167a5;
    stim[2] = 24'ha3cf49;
    stim[3] = 24'h28b6df;
    stim[4] = 24'h7624ac;
    stim[5] = 24'h9a08a6;
    stim[6] = 24'h05a48f;
    stim[7] = 24'hd9b410;
    stim[8] = 24'h8257dc;
    stim[9] = 24'h7ccfa7;
    stim[10] = 24'h5ec8ef;
    stim[11] = 24'he81081;
    stim[12] = 24'h335130;
    stim[13] = 24'h0e9bee;
    stim[14] = 24'hd23e6e;
    stim[15] = 24'h2fe841;
    stim[16] = 24'h0fc702;
    stim[17] = 24'h65e59f;
    stim[18] = 24'hace4cc;
    stim[19] = 24'hdb6e20;
    stim[20] = 24'h3d0e1d;
    stim[21] = 24'h107433;
    stim[22] = 24'h121a6e;
    stim[23] = 24'h9554bb;
    stim[24] = 24'hf52204;
    stim[25] = 24'h82e073;
    stim[26] = 24'h2502e8;
    stim[27] = 24'h9e5154;
    stim[28] = 24'h277c12;
    stim[29] = 24'h460b5a;
    stim[30] = 24'h590ead;
    stim[31] = 24'hd87eff;
    stim[32] = 24'hdac820;
    stim[33] = 24'heb571e;
    stim[34] = 24'h3a54e2;
    stim[35] = 24'h09be04;
    stim[36] = 24'hd92152;
    stim[37] = 24'h1d45d6;
    stim[38] = 24'haaa52b;
    stim[39] = 24'ha97f0c;
    stim[40] = 24'h887764;
    stim[41] = 24'h3729f1;
    stim[42] = 24'h0081d0;
    stim[43] = 24'h31c28c;
    stim[44] = 24'haf7b3b;
    stim[45] = 24'hff82af;
    stim[46] = 24'hbc45fb;
    stim[47] = 24'h26f27c;
    stim[48] = 24'hcfd3b0;
    stim[49] = 24'h22e10b;
    stim[50] = 24'haef9f1;
    stim[51] = 24'h879d20;
    stim[52] = 24'hb1176f;
    stim[53] = 24'ha8d7a4;
    stim[54] = 24'hdd8500;
    stim[55] = 24'hbb7e06;
    stim[56] = 24'h9a567d;
    stim[57] = 24'h9bbb19;
    stim[58] = 24'hb6574e;
    stim[59] = 24'h3786fa;
    stim[60] = 24'hd8170d;
    stim[61] = 24'he1dda1;
    stim[62] = 24'h2c6015;
    stim[63] = 24'h326743;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'h1e9;
      expv[1] = 10'h1cd;
      expv[2] = 10'h1bb;
      expv[3] = 10'h1bd;
      expv[4] = 10'h146;
      expv[5] = 10'h148;
      expv[6] = 10'h138;
      expv[7] = 10'h19d;
      expv[8] = 10'h1b5;
      expv[9] = 10'h1f2;
      expv[10] = 10'h215;
      expv[11] = 10'h179;
      expv[12] = 10'h0b4;
      expv[13] = 10'h197;
      expv[14] = 10'h17e;
      expv[15] = 10'h158;
      expv[16] = 10'h0d8;
      expv[17] = 10'h1e9;
      expv[18] = 10'h25c;
      expv[19] = 10'h169;
      expv[20] = 10'h068;
      expv[21] = 10'h0b7;
      expv[22] = 10'h09a;
      expv[23] = 10'h1a4;
      expv[24] = 10'h11b;
      expv[25] = 10'h1d5;
      expv[26] = 10'h10f;
      expv[27] = 10'h143;
      expv[28] = 10'h0b5;
      expv[29] = 10'h0ab;
      expv[30] = 10'h114;
      expv[31] = 10'h255;
      expv[32] = 10'h1c2;
      expv[33] = 10'h160;
      expv[34] = 10'h170;
      expv[35] = 10'h0cb;
      expv[36] = 10'h14c;
      expv[37] = 10'h138;
      expv[38] = 10'h17a;
      expv[39] = 10'h134;
      expv[40] = 10'h163;
      expv[41] = 10'h151;
      expv[42] = 10'h151;
      expv[43] = 10'h17f;
      expv[44] = 10'h165;
      expv[45] = 10'h230;
      expv[46] = 10'h1fc;
      expv[47] = 10'h194;
      expv[48] = 10'h252;
      expv[49] = 10'h10e;
      expv[50] = 10'h298;
      expv[51] = 10'h144;
      expv[52] = 10'h137;
      expv[53] = 10'h223;
      expv[54] = 10'h162;
      expv[55] = 10'h13f;
      expv[56] = 10'h16d;
      expv[57] = 10'h16f;
      expv[58] = 10'h15b;
      expv[59] = 10'h1b7;
      expv[60] = 10'h0fc;
      expv[61] = 10'h25f;
      expv[62] = 10'h0a1;
      expv[63] = 10'h0dc;
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
