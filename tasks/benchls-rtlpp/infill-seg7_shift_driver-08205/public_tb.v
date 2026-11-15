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

  rtlpp_08205 dut (
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
    stim[0] = 15'h095e;
    stim[1] = 15'h0509;
    stim[2] = 15'h524e;
    stim[3] = 15'h4f12;
    stim[4] = 15'h67a4;
    stim[5] = 15'h7487;
    stim[6] = 15'h7b43;
    stim[7] = 15'h7234;
    stim[8] = 15'h68ef;
    stim[9] = 15'h5d4a;
    stim[10] = 15'h618d;
    stim[11] = 15'h5c23;
    stim[12] = 15'h5c3b;
    stim[13] = 15'h50ae;
    stim[14] = 15'h54d0;
    stim[15] = 15'h53f3;
    stim[16] = 15'h4a1b;
    stim[17] = 15'h6ce9;
    stim[18] = 15'h78e7;
    stim[19] = 15'h54e4;
    stim[20] = 15'h6d66;
    stim[21] = 15'h6d60;
    stim[22] = 15'h5d71;
    stim[23] = 15'h5736;
    stim[24] = 15'h4d51;
    stim[25] = 15'h768a;
    stim[26] = 15'h54b1;
    stim[27] = 15'h5a05;
    stim[28] = 15'h41d9;
    stim[29] = 15'h6bc9;
    stim[30] = 15'h7df9;
    stim[31] = 15'h5c40;
    stim[32] = 15'h51a5;
    stim[33] = 15'h70ec;
    stim[34] = 15'h4e9f;
    stim[35] = 15'h772c;
    stim[36] = 15'h4cef;
    stim[37] = 15'h517a;
    stim[38] = 15'h4fe1;
    stim[39] = 15'h4226;
    stim[40] = 15'h7153;
    stim[41] = 15'h4b16;
    stim[42] = 15'h5411;
    stim[43] = 15'h45d5;
    stim[44] = 15'h6de4;
    stim[45] = 15'h624a;
    stim[46] = 15'h4a1b;
    stim[47] = 15'h6f74;
    stim[48] = 15'h5680;
    stim[49] = 15'h74b6;
    stim[50] = 15'h6f0e;
    stim[51] = 15'h661d;
    stim[52] = 15'h7b69;
    stim[53] = 15'h7bc6;
    stim[54] = 15'h582e;
    stim[55] = 15'h7f7e;
    stim[56] = 15'h5b87;
    stim[57] = 15'h75f5;
    stim[58] = 15'h6310;
    stim[59] = 15'h4fd1;
    stim[60] = 15'h4fbb;
    stim[61] = 15'h6516;
    stim[62] = 15'h4793;
    stim[63] = 15'h5fc0;
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
      expv[3] = 4'h4;
      expv[4] = 4'h4;
      expv[5] = 4'h8;
      expv[6] = 4'h8;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'ha;
      expv[10] = 4'ha;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'ha;
      expv[14] = 4'ha;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h8;
      expv[18] = 4'h8;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h8;
      expv[22] = 4'h8;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'ha;
      expv[26] = 4'ha;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h8;
      expv[30] = 4'h8;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'ha;
      expv[34] = 4'ha;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h8;
      expv[38] = 4'h8;
      expv[39] = 4'h2;
      expv[40] = 4'h2;
      expv[41] = 4'ha;
      expv[42] = 4'ha;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'ha;
      expv[46] = 4'ha;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'ha;
      expv[50] = 4'ha;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h8;
      expv[54] = 4'h8;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h8;
      expv[58] = 4'h8;
      expv[59] = 4'h4;
      expv[60] = 4'h4;
      expv[61] = 4'h8;
      expv[62] = 4'h8;
      expv[63] = 4'h2;
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
