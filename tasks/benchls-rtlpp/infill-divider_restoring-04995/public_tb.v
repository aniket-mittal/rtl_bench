// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04995 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[26:26]),
    .rst_i(in_vec[25:25]),
    .divide_i(in_vec[24:24]),
    .dividend_i(in_vec[23:8]),
    .divisor_i(in_vec[7:0]),
    .quotient_o(out_vec[16:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h6d23300;
    stim[1] = 27'h35670a6;
    stim[2] = 27'h0298319;
    stim[3] = 27'h552ecb3;
    stim[4] = 27'h177db17;
    stim[5] = 27'h0ca2c1d;
    stim[6] = 27'h0572b65;
    stim[7] = 27'h123b320;
    stim[8] = 27'h1b90428;
    stim[9] = 27'h0ddcc5f;
    stim[10] = 27'h0816422;
    stim[11] = 27'h40c7c62;
    stim[12] = 27'h044460c;
    stim[13] = 27'h1badf14;
    stim[14] = 27'h52332fe;
    stim[15] = 27'h52e9126;
    stim[16] = 27'h4da46aa;
    stim[17] = 27'h1deb6fb;
    stim[18] = 27'h07533ad;
    stim[19] = 27'h03b924f;
    stim[20] = 27'h0a07359;
    stim[21] = 27'h40ffd48;
    stim[22] = 27'h08bedea;
    stim[23] = 27'h4974c76;
    stim[24] = 27'h1df0b75;
    stim[25] = 27'h0f8a008;
    stim[26] = 27'h0c225fb;
    stim[27] = 27'h139054a;
    stim[28] = 27'h17e4fb8;
    stim[29] = 27'h1cc1c96;
    stim[30] = 27'h1313aeb;
    stim[31] = 27'h492683d;
    stim[32] = 27'h55affbe;
    stim[33] = 27'h0be2f03;
    stim[34] = 27'h40aec66;
    stim[35] = 27'h13a1a49;
    stim[36] = 27'h0298d13;
    stim[37] = 27'h29bf913;
    stim[38] = 27'h00a9116;
    stim[39] = 27'h58d1911;
    stim[40] = 27'h15dd31b;
    stim[41] = 27'h5baeaab;
    stim[42] = 27'h4700e54;
    stim[43] = 27'h48a7f05;
    stim[44] = 27'h5f5f847;
    stim[45] = 27'h526d386;
    stim[46] = 27'h113a7d6;
    stim[47] = 27'h0c83ba5;
    stim[48] = 27'h1016404;
    stim[49] = 27'h0764d59;
    stim[50] = 27'h130bdee;
    stim[51] = 27'h531d57f;
    stim[52] = 27'h01bc8ae;
    stim[53] = 27'h5ea930e;
    stim[54] = 27'h08d7d56;
    stim[55] = 27'h1dab73e;
    stim[56] = 27'h0557064;
    stim[57] = 27'h0c1da41;
    stim[58] = 27'h0208443;
    stim[59] = 27'h45ea810;
    stim[60] = 27'h0512eff;
    stim[61] = 27'h4b9fd8e;
    stim[62] = 27'h472744e;
    stim[63] = 27'h1e53977;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00002;
      expv[18] = 17'h00002;
      expv[19] = 17'h00002;
      expv[20] = 17'h00002;
      expv[21] = 17'h00002;
      expv[22] = 17'h00006;
      expv[23] = 17'h00006;
      expv[24] = 17'h0000e;
      expv[25] = 17'h0000e;
      expv[26] = 17'h0000e;
      expv[27] = 17'h0000e;
      expv[28] = 17'h0000e;
      expv[29] = 17'h0000e;
      expv[30] = 17'h0000e;
      expv[31] = 17'h0000e;
      expv[32] = 17'h0001e;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00002;
      expv[44] = 17'h00006;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00002;
      expv[61] = 17'h00002;
      expv[62] = 17'h00006;
      expv[63] = 17'h0000e;
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
