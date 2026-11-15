// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08207 dut (
    .clk(clk),
    .rst_n(in_vec[14:14]),
    .seg(in_vec[13:6]),
    .sel(in_vec[5:0]),
    .shcp(out_vec[3:3]),
    .stcp(out_vec[2:2]),
    .ds(out_vec[1:1]),
    .oe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h1c4c;
    stim[1] = 15'h1ad0;
    stim[2] = 15'h4a42;
    stim[3] = 15'h6362;
    stim[4] = 15'h50f8;
    stim[5] = 15'h5b38;
    stim[6] = 15'h41a2;
    stim[7] = 15'h67c6;
    stim[8] = 15'h6275;
    stim[9] = 15'h754d;
    stim[10] = 15'h7eaa;
    stim[11] = 15'h7b65;
    stim[12] = 15'h6faf;
    stim[13] = 15'h6f2a;
    stim[14] = 15'h7d92;
    stim[15] = 15'h5986;
    stim[16] = 15'h5ab4;
    stim[17] = 15'h61b7;
    stim[18] = 15'h4281;
    stim[19] = 15'h72c4;
    stim[20] = 15'h72eb;
    stim[21] = 15'h4b7d;
    stim[22] = 15'h7c0a;
    stim[23] = 15'h576e;
    stim[24] = 15'h7a3a;
    stim[25] = 15'h6a7e;
    stim[26] = 15'h7c8d;
    stim[27] = 15'h548f;
    stim[28] = 15'h67af;
    stim[29] = 15'h41f0;
    stim[30] = 15'h4b11;
    stim[31] = 15'h6507;
    stim[32] = 15'h6084;
    stim[33] = 15'h6592;
    stim[34] = 15'h4689;
    stim[35] = 15'h5eb2;
    stim[36] = 15'h5188;
    stim[37] = 15'h429b;
    stim[38] = 15'h5d8c;
    stim[39] = 15'h7e3b;
    stim[40] = 15'h64e1;
    stim[41] = 15'h703b;
    stim[42] = 15'h718f;
    stim[43] = 15'h61db;
    stim[44] = 15'h6a09;
    stim[45] = 15'h714e;
    stim[46] = 15'h3a48;
    stim[47] = 15'h7af6;
    stim[48] = 15'h5199;
    stim[49] = 15'h4a21;
    stim[50] = 15'h4740;
    stim[51] = 15'h4c61;
    stim[52] = 15'h7e5e;
    stim[53] = 15'h43ec;
    stim[54] = 15'h7991;
    stim[55] = 15'h55d7;
    stim[56] = 15'h7db0;
    stim[57] = 15'h5e64;
    stim[58] = 15'h7710;
    stim[59] = 15'h5776;
    stim[60] = 15'h5609;
    stim[61] = 15'h4829;
    stim[62] = 15'h6476;
    stim[63] = 15'h7465;
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
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h4;
      expv[4] = 4'h4;
      expv[5] = 4'h8;
      expv[6] = 4'h8;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'ha;
      expv[10] = 4'ha;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h8;
      expv[14] = 4'h8;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h8;
      expv[18] = 4'h8;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h8;
      expv[22] = 4'h8;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h8;
      expv[26] = 4'h8;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h8;
      expv[30] = 4'h8;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h8;
      expv[34] = 4'h8;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h8;
      expv[38] = 4'h8;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h8;
      expv[42] = 4'h8;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h8;
      expv[46] = 4'h8;
      expv[47] = 4'h0;
      expv[48] = 4'h4;
      expv[49] = 4'h4;
      expv[50] = 4'h8;
      expv[51] = 4'h8;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h8;
      expv[55] = 4'h8;
      expv[56] = 4'h2;
      expv[57] = 4'h2;
      expv[58] = 4'ha;
      expv[59] = 4'ha;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h8;
      expv[63] = 4'h8;
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
