// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08949 dut (
    .clk(clk),
    .swIn(in_vec[13:8]),
    .enable(in_vec[7:7]),
    .tuningCode(in_vec[6:0]),
    .boardOut(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2b7c;
    stim[1] = 14'h0da0;
    stim[2] = 14'h07d0;
    stim[3] = 14'h37aa;
    stim[4] = 14'h08f2;
    stim[5] = 14'h2bb0;
    stim[6] = 14'h0364;
    stim[7] = 14'h0378;
    stim[8] = 14'h192d;
    stim[9] = 14'h0b69;
    stim[10] = 14'h2042;
    stim[11] = 14'h1c30;
    stim[12] = 14'h176c;
    stim[13] = 14'h3764;
    stim[14] = 14'h206e;
    stim[15] = 14'h396d;
    stim[16] = 14'h06ca;
    stim[17] = 14'h26e7;
    stim[18] = 14'h2da1;
    stim[19] = 14'h327b;
    stim[20] = 14'h3500;
    stim[21] = 14'h15e7;
    stim[22] = 14'h0644;
    stim[23] = 14'h08bc;
    stim[24] = 14'h0389;
    stim[25] = 14'h255f;
    stim[26] = 14'h116b;
    stim[27] = 14'h1ea4;
    stim[28] = 14'h1824;
    stim[29] = 14'h0d1c;
    stim[30] = 14'h0825;
    stim[31] = 14'h04dd;
    stim[32] = 14'h0d68;
    stim[33] = 14'h18e3;
    stim[34] = 14'h09aa;
    stim[35] = 14'h0e0e;
    stim[36] = 14'h1d41;
    stim[37] = 14'h2d93;
    stim[38] = 14'h2ce3;
    stim[39] = 14'h0d58;
    stim[40] = 14'h1fb5;
    stim[41] = 14'h163f;
    stim[42] = 14'h0a61;
    stim[43] = 14'h1f36;
    stim[44] = 14'h102b;
    stim[45] = 14'h0e4c;
    stim[46] = 14'h1e49;
    stim[47] = 14'h002c;
    stim[48] = 14'h0fdb;
    stim[49] = 14'h3dad;
    stim[50] = 14'h0431;
    stim[51] = 14'h2e14;
    stim[52] = 14'h0de7;
    stim[53] = 14'h0482;
    stim[54] = 14'h1cef;
    stim[55] = 14'h067a;
    stim[56] = 14'h3983;
    stim[57] = 14'h1e97;
    stim[58] = 14'h1a37;
    stim[59] = 14'h198b;
    stim[60] = 14'h0070;
    stim[61] = 14'h1a4b;
    stim[62] = 14'h2518;
    stim[63] = 14'h325b;
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
      expv[4] = 4'h0;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'hx;
      expv[10] = 4'hx;
      expv[11] = 4'hx;
      expv[12] = 4'hx;
      expv[13] = 4'hx;
      expv[14] = 4'hx;
      expv[15] = 4'hx;
      expv[16] = 4'hx;
      expv[17] = 4'hx;
      expv[18] = 4'hx;
      expv[19] = 4'hx;
      expv[20] = 4'hx;
      expv[21] = 4'hx;
      expv[22] = 4'hx;
      expv[23] = 4'hx;
      expv[24] = 4'hx;
      expv[25] = 4'hx;
      expv[26] = 4'hx;
      expv[27] = 4'hx;
      expv[28] = 4'hx;
      expv[29] = 4'hx;
      expv[30] = 4'hx;
      expv[31] = 4'hx;
      expv[32] = 4'hx;
      expv[33] = 4'hx;
      expv[34] = 4'hx;
      expv[35] = 4'hx;
      expv[36] = 4'hx;
      expv[37] = 4'hx;
      expv[38] = 4'hx;
      expv[39] = 4'hx;
      expv[40] = 4'hx;
      expv[41] = 4'hx;
      expv[42] = 4'hx;
      expv[43] = 4'hx;
      expv[44] = 4'hx;
      expv[45] = 4'hx;
      expv[46] = 4'hx;
      expv[47] = 4'hx;
      expv[48] = 4'hx;
      expv[49] = 4'hx;
      expv[50] = 4'hx;
      expv[51] = 4'hx;
      expv[52] = 4'hx;
      expv[53] = 4'hx;
      expv[54] = 4'hx;
      expv[55] = 4'hx;
      expv[56] = 4'hx;
      expv[57] = 4'hx;
      expv[58] = 4'hx;
      expv[59] = 4'hx;
      expv[60] = 4'hx;
      expv[61] = 4'hx;
      expv[62] = 4'hx;
      expv[63] = 4'hx;
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
