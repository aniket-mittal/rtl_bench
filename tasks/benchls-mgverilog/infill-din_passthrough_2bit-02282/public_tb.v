// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02282 dut (
    .Din(in_vec[17:0]),
    .Dout(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h0c4f5;
    stim[1] = 18'h25097;
    stim[2] = 18'h24bcd;
    stim[3] = 18'h2266a;
    stim[4] = 18'h0ad21;
    stim[5] = 18'h35a0e;
    stim[6] = 18'h1f3b0;
    stim[7] = 18'h1b801;
    stim[8] = 18'h0c4a5;
    stim[9] = 18'h30ff0;
    stim[10] = 18'h30592;
    stim[11] = 18'h014fd;
    stim[12] = 18'h1612d;
    stim[13] = 18'h1a336;
    stim[14] = 18'h14ece;
    stim[15] = 18'h13556;
    stim[16] = 18'h1455a;
    stim[17] = 18'h39755;
    stim[18] = 18'h38234;
    stim[19] = 18'h36a47;
    stim[20] = 18'h1a75d;
    stim[21] = 18'h20404;
    stim[22] = 18'h31f17;
    stim[23] = 18'h215f3;
    stim[24] = 18'h0d2a2;
    stim[25] = 18'h1a82b;
    stim[26] = 18'h3d508;
    stim[27] = 18'h0d366;
    stim[28] = 18'h23bae;
    stim[29] = 18'h11590;
    stim[30] = 18'h2a93e;
    stim[31] = 18'h2248f;
    stim[32] = 18'h2b48a;
    stim[33] = 18'h2b103;
    stim[34] = 18'h0c422;
    stim[35] = 18'h32553;
    stim[36] = 18'h1f3d7;
    stim[37] = 18'h3bab4;
    stim[38] = 18'h0a6f4;
    stim[39] = 18'h12608;
    stim[40] = 18'h00f56;
    stim[41] = 18'h01d4d;
    stim[42] = 18'h01df6;
    stim[43] = 18'h39d2e;
    stim[44] = 18'h1cf9d;
    stim[45] = 18'h0dc66;
    stim[46] = 18'h0f366;
    stim[47] = 18'h147f1;
    stim[48] = 18'h3012d;
    stim[49] = 18'h36368;
    stim[50] = 18'h13262;
    stim[51] = 18'h1bfb2;
    stim[52] = 18'h2c814;
    stim[53] = 18'h16c30;
    stim[54] = 18'h3cf4e;
    stim[55] = 18'h328c7;
    stim[56] = 18'h2fe86;
    stim[57] = 18'h2fe37;
    stim[58] = 18'h19a75;
    stim[59] = 18'h03531;
    stim[60] = 18'h29efe;
    stim[61] = 18'h22b95;
    stim[62] = 18'h122ad;
    stim[63] = 18'h1dd84;
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
      expv[0] = 2'h1;
      expv[1] = 2'h3;
      expv[2] = 2'h1;
      expv[3] = 2'h2;
      expv[4] = 2'h1;
      expv[5] = 2'h2;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h2;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h1;
      expv[18] = 2'h0;
      expv[19] = 2'h3;
      expv[20] = 2'h1;
      expv[21] = 2'h0;
      expv[22] = 2'h3;
      expv[23] = 2'h3;
      expv[24] = 2'h2;
      expv[25] = 2'h3;
      expv[26] = 2'h0;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h0;
      expv[30] = 2'h2;
      expv[31] = 2'h3;
      expv[32] = 2'h2;
      expv[33] = 2'h3;
      expv[34] = 2'h2;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h2;
      expv[41] = 2'h1;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h1;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h0;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h2;
      expv[55] = 2'h3;
      expv[56] = 2'h2;
      expv[57] = 2'h3;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h2;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h0;
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
