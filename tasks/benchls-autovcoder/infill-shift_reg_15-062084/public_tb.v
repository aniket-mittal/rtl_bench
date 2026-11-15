// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062084 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h1f9f;
    stim[1] = 15'h5bd0;
    stim[2] = 15'h32ff;
    stim[3] = 15'h7aeb;
    stim[4] = 15'h27a1;
    stim[5] = 15'h31ff;
    stim[6] = 15'h5ebe;
    stim[7] = 15'h4f1e;
    stim[8] = 15'h4387;
    stim[9] = 15'h51a1;
    stim[10] = 15'h666e;
    stim[11] = 15'h10ab;
    stim[12] = 15'h2cc5;
    stim[13] = 15'h2599;
    stim[14] = 15'h303e;
    stim[15] = 15'h4228;
    stim[16] = 15'h14d8;
    stim[17] = 15'h5efc;
    stim[18] = 15'h4f7a;
    stim[19] = 15'h5b51;
    stim[20] = 15'h0ce6;
    stim[21] = 15'h5525;
    stim[22] = 15'h47ef;
    stim[23] = 15'h2ffa;
    stim[24] = 15'h6c4c;
    stim[25] = 15'h4daf;
    stim[26] = 15'h0770;
    stim[27] = 15'h6654;
    stim[28] = 15'h5019;
    stim[29] = 15'h4e8c;
    stim[30] = 15'h0994;
    stim[31] = 15'h2508;
    stim[32] = 15'h09c2;
    stim[33] = 15'h5ecd;
    stim[34] = 15'h65ac;
    stim[35] = 15'h3bbd;
    stim[36] = 15'h0af3;
    stim[37] = 15'h39c6;
    stim[38] = 15'h2839;
    stim[39] = 15'h4982;
    stim[40] = 15'h326f;
    stim[41] = 15'h49c7;
    stim[42] = 15'h5cda;
    stim[43] = 15'h06ad;
    stim[44] = 15'h5903;
    stim[45] = 15'h0b5c;
    stim[46] = 15'h4515;
    stim[47] = 15'h5067;
    stim[48] = 15'h0a02;
    stim[49] = 15'h1b5c;
    stim[50] = 15'h3fa7;
    stim[51] = 15'h17d0;
    stim[52] = 15'h689c;
    stim[53] = 15'h0484;
    stim[54] = 15'h24ff;
    stim[55] = 15'h64da;
    stim[56] = 15'h564e;
    stim[57] = 15'h6708;
    stim[58] = 15'h5fc1;
    stim[59] = 15'h4c47;
    stim[60] = 15'h571e;
    stim[61] = 15'h46e1;
    stim[62] = 15'h648c;
    stim[63] = 15'h32e2;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h1f9f;
      expv[2] = 15'h5bd0;
      expv[3] = 15'h32ff;
      expv[4] = 15'h7aeb;
      expv[5] = 15'h27a1;
      expv[6] = 15'h31ff;
      expv[7] = 15'h5ebe;
      expv[8] = 15'h4f1e;
      expv[9] = 15'h4387;
      expv[10] = 15'h51a1;
      expv[11] = 15'h666e;
      expv[12] = 15'h10ab;
      expv[13] = 15'h2cc5;
      expv[14] = 15'h2599;
      expv[15] = 15'h303e;
      expv[16] = 15'h4228;
      expv[17] = 15'h14d8;
      expv[18] = 15'h5efc;
      expv[19] = 15'h4f7a;
      expv[20] = 15'h5b51;
      expv[21] = 15'h0ce6;
      expv[22] = 15'h5525;
      expv[23] = 15'h47ef;
      expv[24] = 15'h2ffa;
      expv[25] = 15'h6c4c;
      expv[26] = 15'h4daf;
      expv[27] = 15'h0770;
      expv[28] = 15'h6654;
      expv[29] = 15'h5019;
      expv[30] = 15'h4e8c;
      expv[31] = 15'h0994;
      expv[32] = 15'h2508;
      expv[33] = 15'h09c2;
      expv[34] = 15'h5ecd;
      expv[35] = 15'h65ac;
      expv[36] = 15'h3bbd;
      expv[37] = 15'h0af3;
      expv[38] = 15'h39c6;
      expv[39] = 15'h2839;
      expv[40] = 15'h4982;
      expv[41] = 15'h326f;
      expv[42] = 15'h49c7;
      expv[43] = 15'h5cda;
      expv[44] = 15'h06ad;
      expv[45] = 15'h5903;
      expv[46] = 15'h0b5c;
      expv[47] = 15'h4515;
      expv[48] = 15'h5067;
      expv[49] = 15'h0a02;
      expv[50] = 15'h1b5c;
      expv[51] = 15'h3fa7;
      expv[52] = 15'h17d0;
      expv[53] = 15'h689c;
      expv[54] = 15'h0484;
      expv[55] = 15'h24ff;
      expv[56] = 15'h64da;
      expv[57] = 15'h564e;
      expv[58] = 15'h6708;
      expv[59] = 15'h5fc1;
      expv[60] = 15'h4c47;
      expv[61] = 15'h571e;
      expv[62] = 15'h46e1;
      expv[63] = 15'h648c;
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
