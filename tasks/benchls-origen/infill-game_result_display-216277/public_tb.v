// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_216277 dut (
    .clk(clk),
    .state(in_vec[3:2]),
    .game_status(in_vec[1:0]),
    .a(out_vec[51:45]),
    .b(out_vec[44:38]),
    .c(out_vec[37:31]),
    .d(out_vec[30:24]),
    .e(out_vec[23:17]),
    .f(out_vec[16:10]),
    .g(out_vec[9:3]),
    .e1(out_vec[2:2]),
    .e2(out_vec[1:1]),
    .e3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hd;
    stim[1] = 4'hc;
    stim[2] = 4'hb;
    stim[3] = 4'h6;
    stim[4] = 4'h2;
    stim[5] = 4'h5;
    stim[6] = 4'h9;
    stim[7] = 4'hc;
    stim[8] = 4'he;
    stim[9] = 4'h7;
    stim[10] = 4'ha;
    stim[11] = 4'h8;
    stim[12] = 4'h4;
    stim[13] = 4'hf;
    stim[14] = 4'h0;
    stim[15] = 4'h1;
    stim[16] = 4'ha;
    stim[17] = 4'hd;
    stim[18] = 4'he;
    stim[19] = 4'h7;
    stim[20] = 4'h2;
    stim[21] = 4'h8;
    stim[22] = 4'h2;
    stim[23] = 4'h5;
    stim[24] = 4'h8;
    stim[25] = 4'h8;
    stim[26] = 4'h8;
    stim[27] = 4'h9;
    stim[28] = 4'he;
    stim[29] = 4'h1;
    stim[30] = 4'h7;
    stim[31] = 4'ha;
    stim[32] = 4'h8;
    stim[33] = 4'h6;
    stim[34] = 4'h3;
    stim[35] = 4'ha;
    stim[36] = 4'h7;
    stim[37] = 4'h4;
    stim[38] = 4'he;
    stim[39] = 4'hc;
    stim[40] = 4'hd;
    stim[41] = 4'hd;
    stim[42] = 4'he;
    stim[43] = 4'h1;
    stim[44] = 4'h7;
    stim[45] = 4'h0;
    stim[46] = 4'hb;
    stim[47] = 4'h9;
    stim[48] = 4'hc;
    stim[49] = 4'ha;
    stim[50] = 4'h7;
    stim[51] = 4'h2;
    stim[52] = 4'h6;
    stim[53] = 4'h5;
    stim[54] = 4'h3;
    stim[55] = 4'ha;
    stim[56] = 4'hd;
    stim[57] = 4'h3;
    stim[58] = 4'h4;
    stim[59] = 4'h9;
    stim[60] = 4'h4;
    stim[61] = 4'h3;
    stim[62] = 4'ha;
    stim[63] = 4'ha;
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
      expv[0] = 52'hxxxxxxxxxxxxx;
      expv[1] = 52'h81e5200100810;
      expv[2] = 52'h0000000000000;
      expv[3] = 52'h7e0003f000000;
      expv[4] = 52'h81e6100100810;
      expv[5] = 52'h81e6100100810;
      expv[6] = 52'h81e5200100810;
      expv[7] = 52'h81e5200100810;
      expv[8] = 52'h0000000000000;
      expv[9] = 52'h81e6100100810;
      expv[10] = 52'h7e0003f000000;
      expv[11] = 52'h81e6100100810;
      expv[12] = 52'h81e6100100812;
      expv[13] = 52'h81e5200100814;
      expv[14] = 52'h7e0003f000000;
      expv[15] = 52'h0000000000000;
      expv[16] = 52'h81e5200100810;
      expv[17] = 52'h81e6100100810;
      expv[18] = 52'h81e5200100810;
      expv[19] = 52'h81e6100100810;
      expv[20] = 52'h7e0003f000000;
      expv[21] = 52'h81e6100100810;
      expv[22] = 52'h81e6100100812;
      expv[23] = 52'h81e6100100810;
      expv[24] = 52'h81e5200100810;
      expv[25] = 52'h81e6100100812;
      expv[26] = 52'h81e6100100812;
      expv[27] = 52'h81e6100100812;
      expv[28] = 52'h81e5200100810;
      expv[29] = 52'h81e6100100810;
      expv[30] = 52'h81e5200100810;
      expv[31] = 52'h7e0003f000000;
      expv[32] = 52'h81e6100100810;
      expv[33] = 52'h81e6100100812;
      expv[34] = 52'h81e6100100810;
      expv[35] = 52'h7e0003f000000;
      expv[36] = 52'h81e6100100810;
      expv[37] = 52'h7e0003f000000;
      expv[38] = 52'h81e5200100814;
      expv[39] = 52'h81e6100100810;
      expv[40] = 52'h0000000000000;
      expv[41] = 52'h81e5200100810;
      expv[42] = 52'h81e5200100810;
      expv[43] = 52'h81e6100100810;
      expv[44] = 52'h81e5200100810;
      expv[45] = 52'h7e0003f000000;
      expv[46] = 52'h0000000000000;
      expv[47] = 52'h7e0003f000000;
      expv[48] = 52'h81e5200100810;
      expv[49] = 52'h0000000000000;
      expv[50] = 52'h81e6100100810;
      expv[51] = 52'h7e0003f000000;
      expv[52] = 52'h81e6100100810;
      expv[53] = 52'h81e6100100810;
      expv[54] = 52'h81e5200100810;
      expv[55] = 52'h7e0003f000000;
      expv[56] = 52'h81e6100100810;
      expv[57] = 52'h81e5200100810;
      expv[58] = 52'h7e0003f000000;
      expv[59] = 52'h81e5200100814;
      expv[60] = 52'h81e5200100810;
      expv[61] = 52'h81e5200100814;
      expv[62] = 52'h7e0003f000000;
      expv[63] = 52'h81e6100100810;
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
