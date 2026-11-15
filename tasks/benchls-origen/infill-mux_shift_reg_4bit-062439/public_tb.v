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

  origen_062439 dut (
    .clk(clk),
    .in(in_vec[8:5]),
    .sel(in_vec[4:3]),
    .rst(in_vec[2:2]),
    .sinr(in_vec[1:1]),
    .sinl(in_vec[0:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h066;
    stim[1] = 9'h00c;
    stim[2] = 9'h038;
    stim[3] = 9'h1a9;
    stim[4] = 9'h11b;
    stim[5] = 9'h0fb;
    stim[6] = 9'h010;
    stim[7] = 9'h152;
    stim[8] = 9'h0db;
    stim[9] = 9'h0ba;
    stim[10] = 9'h1f3;
    stim[11] = 9'h1cb;
    stim[12] = 9'h1c9;
    stim[13] = 9'h1b2;
    stim[14] = 9'h158;
    stim[15] = 9'h063;
    stim[16] = 9'h1f0;
    stim[17] = 9'h132;
    stim[18] = 9'h11a;
    stim[19] = 9'h0b3;
    stim[20] = 9'h1c0;
    stim[21] = 9'h040;
    stim[22] = 9'h1dd;
    stim[23] = 9'h171;
    stim[24] = 9'h009;
    stim[25] = 9'h1e2;
    stim[26] = 9'h002;
    stim[27] = 9'h08a;
    stim[28] = 9'h140;
    stim[29] = 9'h039;
    stim[30] = 9'h0b9;
    stim[31] = 9'h14b;
    stim[32] = 9'h002;
    stim[33] = 9'h161;
    stim[34] = 9'h002;
    stim[35] = 9'h1fa;
    stim[36] = 9'h0ea;
    stim[37] = 9'h0da;
    stim[38] = 9'h068;
    stim[39] = 9'h02b;
    stim[40] = 9'h063;
    stim[41] = 9'h033;
    stim[42] = 9'h070;
    stim[43] = 9'h019;
    stim[44] = 9'h128;
    stim[45] = 9'h07a;
    stim[46] = 9'h0ca;
    stim[47] = 9'h179;
    stim[48] = 9'h113;
    stim[49] = 9'h1fa;
    stim[50] = 9'h1ab;
    stim[51] = 9'h192;
    stim[52] = 9'h112;
    stim[53] = 9'h10a;
    stim[54] = 9'h051;
    stim[55] = 9'h0db;
    stim[56] = 9'h109;
    stim[57] = 9'h029;
    stim[58] = 9'h05b;
    stim[59] = 9'h089;
    stim[60] = 9'h0f8;
    stim[61] = 9'h120;
    stim[62] = 9'h129;
    stim[63] = 9'h0e3;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h8;
      expv[5] = 4'h1;
      expv[6] = 4'h2;
      expv[7] = 4'h4;
      expv[8] = 4'h9;
      expv[9] = 4'h3;
      expv[10] = 4'h6;
      expv[11] = 4'hd;
      expv[12] = 4'he;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'h3;
      expv[17] = 4'h6;
      expv[18] = 4'hd;
      expv[19] = 4'hb;
      expv[20] = 4'h7;
      expv[21] = 4'he;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h8;
      expv[26] = 4'hf;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'ha;
      expv[30] = 4'h5;
      expv[31] = 4'ha;
      expv[32] = 4'hd;
      expv[33] = 4'h0;
      expv[34] = 4'hb;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h8;
      expv[41] = 4'h3;
      expv[42] = 4'h7;
      expv[43] = 4'he;
      expv[44] = 4'hd;
      expv[45] = 4'h6;
      expv[46] = 4'hc;
      expv[47] = 4'h6;
      expv[48] = 4'hc;
      expv[49] = 4'h9;
      expv[50] = 4'h3;
      expv[51] = 4'h9;
      expv[52] = 4'h3;
      expv[53] = 4'h7;
      expv[54] = 4'h3;
      expv[55] = 4'h6;
      expv[56] = 4'hc;
      expv[57] = 4'he;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'h9;
      expv[63] = 4'hc;
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
