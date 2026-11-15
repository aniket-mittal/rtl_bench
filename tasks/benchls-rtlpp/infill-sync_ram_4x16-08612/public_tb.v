// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08612 dut (
    .clock(clk),
    .address(in_vec[8:5]),
    .data(in_vec[4:1]),
    .wren(in_vec[0:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0ce;
    stim[1] = 9'h057;
    stim[2] = 9'h092;
    stim[3] = 9'h0c7;
    stim[4] = 9'h0aa;
    stim[5] = 9'h17e;
    stim[6] = 9'h156;
    stim[7] = 9'h150;
    stim[8] = 9'h071;
    stim[9] = 9'h16b;
    stim[10] = 9'h0a5;
    stim[11] = 9'h0b9;
    stim[12] = 9'h05d;
    stim[13] = 9'h1a6;
    stim[14] = 9'h1e2;
    stim[15] = 9'h087;
    stim[16] = 9'h01b;
    stim[17] = 9'h153;
    stim[18] = 9'h05d;
    stim[19] = 9'h0ba;
    stim[20] = 9'h114;
    stim[21] = 9'h1fd;
    stim[22] = 9'h063;
    stim[23] = 9'h0a7;
    stim[24] = 9'h17d;
    stim[25] = 9'h14c;
    stim[26] = 9'h119;
    stim[27] = 9'h083;
    stim[28] = 9'h02b;
    stim[29] = 9'h123;
    stim[30] = 9'h0a9;
    stim[31] = 9'h09f;
    stim[32] = 9'h069;
    stim[33] = 9'h188;
    stim[34] = 9'h04a;
    stim[35] = 9'h091;
    stim[36] = 9'h028;
    stim[37] = 9'h0f2;
    stim[38] = 9'h13b;
    stim[39] = 9'h14c;
    stim[40] = 9'h148;
    stim[41] = 9'h15b;
    stim[42] = 9'h0ad;
    stim[43] = 9'h0bd;
    stim[44] = 9'h049;
    stim[45] = 9'h04b;
    stim[46] = 9'h100;
    stim[47] = 9'h0ca;
    stim[48] = 9'h175;
    stim[49] = 9'h1a4;
    stim[50] = 9'h164;
    stim[51] = 9'h135;
    stim[52] = 9'h00f;
    stim[53] = 9'h015;
    stim[54] = 9'h111;
    stim[55] = 9'h041;
    stim[56] = 9'h14a;
    stim[57] = 9'h13a;
    stim[58] = 9'h0c4;
    stim[59] = 9'h0fb;
    stim[60] = 9'h0aa;
    stim[61] = 9'h15a;
    stim[62] = 9'h016;
    stim[63] = 9'h01f;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hx;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'hx;
      expv[10] = 4'hx;
      expv[11] = 4'hx;
      expv[12] = 4'h2;
      expv[13] = 4'hb;
      expv[14] = 4'hx;
      expv[15] = 4'hx;
      expv[16] = 4'hx;
      expv[17] = 4'hx;
      expv[18] = 4'hx;
      expv[19] = 4'he;
      expv[20] = 4'hc;
      expv[21] = 4'hx;
      expv[22] = 4'hx;
      expv[23] = 4'h8;
      expv[24] = 4'hc;
      expv[25] = 4'h5;
      expv[26] = 4'h9;
      expv[27] = 4'hx;
      expv[28] = 4'h3;
      expv[29] = 4'hx;
      expv[30] = 4'hx;
      expv[31] = 4'h3;
      expv[32] = 4'h1;
      expv[33] = 4'h1;
      expv[34] = 4'hx;
      expv[35] = 4'he;
      expv[36] = 4'hf;
      expv[37] = 4'h5;
      expv[38] = 4'hx;
      expv[39] = 4'h1;
      expv[40] = 4'h9;
      expv[41] = 4'h9;
      expv[42] = 4'h9;
      expv[43] = 4'h4;
      expv[44] = 4'h6;
      expv[45] = 4'he;
      expv[46] = 4'h4;
      expv[47] = 4'hc;
      expv[48] = 4'h3;
      expv[49] = 4'he;
      expv[50] = 4'hx;
      expv[51] = 4'ha;
      expv[52] = 4'hd;
      expv[53] = 4'hd;
      expv[54] = 4'h7;
      expv[55] = 4'hc;
      expv[56] = 4'h5;
      expv[57] = 4'hd;
      expv[58] = 4'ha;
      expv[59] = 4'h3;
      expv[60] = 4'hx;
      expv[61] = 4'he;
      expv[62] = 4'hd;
      expv[63] = 4'ha;
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
