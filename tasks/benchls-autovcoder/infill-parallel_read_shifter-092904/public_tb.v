// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_092904 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .enable(in_vec[8:8]),
    .din(in_vec[7:0]),
    .dout(out_vec[33:2]),
    .done(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3aa;
    stim[1] = 10'h277;
    stim[2] = 10'h1e8;
    stim[3] = 10'h037;
    stim[4] = 10'h18e;
    stim[5] = 10'h1cc;
    stim[6] = 10'h124;
    stim[7] = 10'h1bf;
    stim[8] = 10'h1ae;
    stim[9] = 10'h1ad;
    stim[10] = 10'h009;
    stim[11] = 10'h14a;
    stim[12] = 10'h0c2;
    stim[13] = 10'h126;
    stim[14] = 10'h167;
    stim[15] = 10'h1a4;
    stim[16] = 10'h0f2;
    stim[17] = 10'h10e;
    stim[18] = 10'h074;
    stim[19] = 10'h1ec;
    stim[20] = 10'h00a;
    stim[21] = 10'h0a9;
    stim[22] = 10'h11e;
    stim[23] = 10'h0d4;
    stim[24] = 10'h0ec;
    stim[25] = 10'h075;
    stim[26] = 10'h091;
    stim[27] = 10'h1ee;
    stim[28] = 10'h11b;
    stim[29] = 10'h14d;
    stim[30] = 10'h07c;
    stim[31] = 10'h106;
    stim[32] = 10'h17a;
    stim[33] = 10'h0bc;
    stim[34] = 10'h003;
    stim[35] = 10'h0cb;
    stim[36] = 10'h0e7;
    stim[37] = 10'h1cb;
    stim[38] = 10'h17c;
    stim[39] = 10'h176;
    stim[40] = 10'h07a;
    stim[41] = 10'h0f8;
    stim[42] = 10'h09f;
    stim[43] = 10'h04e;
    stim[44] = 10'h084;
    stim[45] = 10'h0e8;
    stim[46] = 10'h03b;
    stim[47] = 10'h189;
    stim[48] = 10'h02f;
    stim[49] = 10'h0c4;
    stim[50] = 10'h0e8;
    stim[51] = 10'h0b9;
    stim[52] = 10'h199;
    stim[53] = 10'h0d0;
    stim[54] = 10'h024;
    stim[55] = 10'h115;
    stim[56] = 10'h109;
    stim[57] = 10'h04a;
    stim[58] = 10'h1c0;
    stim[59] = 10'h00d;
    stim[60] = 10'h14d;
    stim[61] = 10'h1cc;
    stim[62] = 10'h14c;
    stim[63] = 10'h181;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000001;
      expv[4] = 34'h000000001;
      expv[5] = 34'h000000001;
      expv[6] = 34'h000000001;
      expv[7] = 34'h3a0de3b32;
      expv[8] = 34'h3a0de3b33;
      expv[9] = 34'h3a0de3b33;
      expv[10] = 34'h3a0de3b33;
      expv[11] = 34'h3a0de3b33;
      expv[12] = 34'h2febab426;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000001;
      expv[15] = 34'h000000001;
      expv[16] = 34'h000000001;
      expv[17] = 34'h000000001;
      expv[18] = 34'h0999e93ca;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000001;
      expv[21] = 34'h000000001;
      expv[22] = 34'h000000001;
      expv[23] = 34'h000000001;
      expv[24] = 34'h3b02aa47a;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000001;
      expv[29] = 34'h000000001;
      expv[30] = 34'h000000001;
      expv[31] = 34'h000000001;
      expv[32] = 34'h3b86d35f2;
      expv[33] = 34'h3b86d35f3;
      expv[34] = 34'h3b86d35f3;
      expv[35] = 34'h3b86d35f3;
      expv[36] = 34'h3b86d35f3;
      expv[37] = 34'h1eaf00f2e;
      expv[38] = 34'h1eaf00f2f;
      expv[39] = 34'h1eaf00f2f;
      expv[40] = 34'h1eaf00f2f;
      expv[41] = 34'h1eaf00f2f;
      expv[42] = 34'h32df1d9ea;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000001;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000001;
      expv[52] = 34'h224bf13a2;
      expv[53] = 34'h224bf13a3;
      expv[54] = 34'h224bf13a3;
      expv[55] = 34'h224bf13a3;
      expv[56] = 34'h224bf13a3;
      expv[57] = 34'h267409056;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000001;
      expv[60] = 34'h000000001;
      expv[61] = 34'h000000001;
      expv[62] = 34'h000000001;
      expv[63] = 34'h300353732;
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
