// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fiftyfivenm_io_obuf dut (
    .i(in_vec[18:18]),
    .oe(in_vec[17:17]),
    .seriesterminationcontrol(in_vec[16:1]),
    .devoe(in_vec[0:0]),
    .o(out_vec[1:1]),
    .obar(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4cfbb;
    stim[1] = 19'h7624d;
    stim[2] = 19'h47b29;
    stim[3] = 19'h27d97;
    stim[4] = 19'h05a43;
    stim[5] = 19'h43e0a;
    stim[6] = 19'h4c04a;
    stim[7] = 19'h67b19;
    stim[8] = 19'h75dfa;
    stim[9] = 19'h7417c;
    stim[10] = 19'h373ca;
    stim[11] = 19'h5c7ea;
    stim[12] = 19'h0ec49;
    stim[13] = 19'h41a0b;
    stim[14] = 19'h7f3ee;
    stim[15] = 19'h75021;
    stim[16] = 19'h21113;
    stim[17] = 19'h3d070;
    stim[18] = 19'h4c517;
    stim[19] = 19'h23de0;
    stim[20] = 19'h116bd;
    stim[21] = 19'h561ea;
    stim[22] = 19'h11a04;
    stim[23] = 19'h34773;
    stim[24] = 19'h51102;
    stim[25] = 19'h24389;
    stim[26] = 19'h33e4b;
    stim[27] = 19'h47fb5;
    stim[28] = 19'h73cdf;
    stim[29] = 19'h6aad3;
    stim[30] = 19'h1704b;
    stim[31] = 19'h34659;
    stim[32] = 19'h742ff;
    stim[33] = 19'h756d6;
    stim[34] = 19'h56abe;
    stim[35] = 19'h51383;
    stim[36] = 19'h7f823;
    stim[37] = 19'h2a86b;
    stim[38] = 19'h7963f;
    stim[39] = 19'h61997;
    stim[40] = 19'h737d3;
    stim[41] = 19'h66b24;
    stim[42] = 19'h6d55d;
    stim[43] = 19'h1c14d;
    stim[44] = 19'h79d23;
    stim[45] = 19'h01eb1;
    stim[46] = 19'h0c401;
    stim[47] = 19'h1e191;
    stim[48] = 19'h2e2cf;
    stim[49] = 19'h7c6c2;
    stim[50] = 19'h2618e;
    stim[51] = 19'h64aca;
    stim[52] = 19'h30707;
    stim[53] = 19'h52766;
    stim[54] = 19'h39eb2;
    stim[55] = 19'h536bc;
    stim[56] = 19'h67286;
    stim[57] = 19'h6795a;
    stim[58] = 19'h4a987;
    stim[59] = 19'h568b1;
    stim[60] = 19'h74fad;
    stim[61] = 19'h32e1a;
    stim[62] = 19'h7c83f;
    stim[63] = 19'h362c1;
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
      expv[0] = 2'hx;
      expv[1] = 2'h2;
      expv[2] = 2'hx;
      expv[3] = 2'h1;
      expv[4] = 2'hx;
      expv[5] = 2'hx;
      expv[6] = 2'hx;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h1;
      expv[11] = 2'hx;
      expv[12] = 2'hx;
      expv[13] = 2'hx;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'hx;
      expv[19] = 2'h1;
      expv[20] = 2'hx;
      expv[21] = 2'hx;
      expv[22] = 2'hx;
      expv[23] = 2'h1;
      expv[24] = 2'hx;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'hx;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'hx;
      expv[31] = 2'h1;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'hx;
      expv[35] = 2'hx;
      expv[36] = 2'h2;
      expv[37] = 2'h1;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'hx;
      expv[44] = 2'h2;
      expv[45] = 2'hx;
      expv[46] = 2'hx;
      expv[47] = 2'hx;
      expv[48] = 2'h1;
      expv[49] = 2'h2;
      expv[50] = 2'h1;
      expv[51] = 2'h2;
      expv[52] = 2'h1;
      expv[53] = 2'hx;
      expv[54] = 2'h1;
      expv[55] = 2'hx;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'hx;
      expv[59] = 2'hx;
      expv[60] = 2'h2;
      expv[61] = 2'h1;
      expv[62] = 2'h2;
      expv[63] = 2'h1;
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
