// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_040036 dut (
    .NADV(clk),
    .A18(in_vec[18:18]),
    .A17(in_vec[17:17]),
    .A16(in_vec[16:16]),
    .AD_IN(in_vec[15:0]),
    .ADDR(out_vec[18:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5678a;
    stim[1] = 19'h58886;
    stim[2] = 19'h07758;
    stim[3] = 19'h3e2b9;
    stim[4] = 19'h1d77c;
    stim[5] = 19'h0f770;
    stim[6] = 19'h43ddb;
    stim[7] = 19'h0f0f3;
    stim[8] = 19'h77e34;
    stim[9] = 19'h03eb5;
    stim[10] = 19'h36ae1;
    stim[11] = 19'h57c85;
    stim[12] = 19'h41a26;
    stim[13] = 19'h4c23f;
    stim[14] = 19'h2bad0;
    stim[15] = 19'h12168;
    stim[16] = 19'h42e3e;
    stim[17] = 19'h0718a;
    stim[18] = 19'h6c9c8;
    stim[19] = 19'h2a030;
    stim[20] = 19'h5d95e;
    stim[21] = 19'h63098;
    stim[22] = 19'h7fd07;
    stim[23] = 19'h30aea;
    stim[24] = 19'h42f92;
    stim[25] = 19'h0ae3b;
    stim[26] = 19'h29af6;
    stim[27] = 19'h61779;
    stim[28] = 19'h03e1e;
    stim[29] = 19'h3ad53;
    stim[30] = 19'h48e83;
    stim[31] = 19'h2193c;
    stim[32] = 19'h1c938;
    stim[33] = 19'h6f0c3;
    stim[34] = 19'h0a74e;
    stim[35] = 19'h50897;
    stim[36] = 19'h2deba;
    stim[37] = 19'h2a460;
    stim[38] = 19'h33e9f;
    stim[39] = 19'h77c72;
    stim[40] = 19'h10b80;
    stim[41] = 19'h43687;
    stim[42] = 19'h392fc;
    stim[43] = 19'h5f899;
    stim[44] = 19'h0d2e7;
    stim[45] = 19'h62d5b;
    stim[46] = 19'h2d7e4;
    stim[47] = 19'h40b93;
    stim[48] = 19'h24196;
    stim[49] = 19'h1a37b;
    stim[50] = 19'h354f1;
    stim[51] = 19'h1c95e;
    stim[52] = 19'h0fd56;
    stim[53] = 19'h773af;
    stim[54] = 19'h64944;
    stim[55] = 19'h0cb77;
    stim[56] = 19'h63a21;
    stim[57] = 19'h4d30d;
    stim[58] = 19'h06be7;
    stim[59] = 19'h5c54d;
    stim[60] = 19'h256c9;
    stim[61] = 19'h5c67b;
    stim[62] = 19'h6a532;
    stim[63] = 19'h581be;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'h5678a;
      expv[2] = 19'h58886;
      expv[3] = 19'h07758;
      expv[4] = 19'h3e2b9;
      expv[5] = 19'h1d77c;
      expv[6] = 19'h0f770;
      expv[7] = 19'h43ddb;
      expv[8] = 19'h0f0f3;
      expv[9] = 19'h77e34;
      expv[10] = 19'h03eb5;
      expv[11] = 19'h36ae1;
      expv[12] = 19'h57c85;
      expv[13] = 19'h41a26;
      expv[14] = 19'h4c23f;
      expv[15] = 19'h2bad0;
      expv[16] = 19'h12168;
      expv[17] = 19'h42e3e;
      expv[18] = 19'h0718a;
      expv[19] = 19'h6c9c8;
      expv[20] = 19'h2a030;
      expv[21] = 19'h5d95e;
      expv[22] = 19'h63098;
      expv[23] = 19'h7fd07;
      expv[24] = 19'h30aea;
      expv[25] = 19'h42f92;
      expv[26] = 19'h0ae3b;
      expv[27] = 19'h29af6;
      expv[28] = 19'h61779;
      expv[29] = 19'h03e1e;
      expv[30] = 19'h3ad53;
      expv[31] = 19'h48e83;
      expv[32] = 19'h2193c;
      expv[33] = 19'h1c938;
      expv[34] = 19'h6f0c3;
      expv[35] = 19'h0a74e;
      expv[36] = 19'h50897;
      expv[37] = 19'h2deba;
      expv[38] = 19'h2a460;
      expv[39] = 19'h33e9f;
      expv[40] = 19'h77c72;
      expv[41] = 19'h10b80;
      expv[42] = 19'h43687;
      expv[43] = 19'h392fc;
      expv[44] = 19'h5f899;
      expv[45] = 19'h0d2e7;
      expv[46] = 19'h62d5b;
      expv[47] = 19'h2d7e4;
      expv[48] = 19'h40b93;
      expv[49] = 19'h24196;
      expv[50] = 19'h1a37b;
      expv[51] = 19'h354f1;
      expv[52] = 19'h1c95e;
      expv[53] = 19'h0fd56;
      expv[54] = 19'h773af;
      expv[55] = 19'h64944;
      expv[56] = 19'h0cb77;
      expv[57] = 19'h63a21;
      expv[58] = 19'h4d30d;
      expv[59] = 19'h06be7;
      expv[60] = 19'h5c54d;
      expv[61] = 19'h256c9;
      expv[62] = 19'h5c67b;
      expv[63] = 19'h6a532;
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
