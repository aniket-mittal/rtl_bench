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

  rtlpp_01819 dut (
    .clk(clk),
    .Load_x(in_vec[18:18]),
    .x_in(in_vec[17:9]),
    .c_in(in_vec[8:0]),
    .y_out(out_vec[18:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h2a3d3;
    stim[1] = 19'h0b357;
    stim[2] = 19'h469d2;
    stim[3] = 19'h06ed7;
    stim[4] = 19'h7839b;
    stim[5] = 19'h626e4;
    stim[6] = 19'h54c72;
    stim[7] = 19'h23934;
    stim[8] = 19'h2de89;
    stim[9] = 19'h3355f;
    stim[10] = 19'h5fda6;
    stim[11] = 19'h2b90d;
    stim[12] = 19'h57c26;
    stim[13] = 19'h27d62;
    stim[14] = 19'h25300;
    stim[15] = 19'h4d9ef;
    stim[16] = 19'h54c7b;
    stim[17] = 19'h51fce;
    stim[18] = 19'h6fe1c;
    stim[19] = 19'h6e006;
    stim[20] = 19'h568ae;
    stim[21] = 19'h08716;
    stim[22] = 19'h15f60;
    stim[23] = 19'h67b29;
    stim[24] = 19'h5a154;
    stim[25] = 19'h26e98;
    stim[26] = 19'h56adc;
    stim[27] = 19'h6e2e3;
    stim[28] = 19'h263e5;
    stim[29] = 19'h5aebe;
    stim[30] = 19'h651b9;
    stim[31] = 19'h3aa31;
    stim[32] = 19'h34f36;
    stim[33] = 19'h25fda;
    stim[34] = 19'h2ad5f;
    stim[35] = 19'h4682d;
    stim[36] = 19'h364e5;
    stim[37] = 19'h35af8;
    stim[38] = 19'h2e56e;
    stim[39] = 19'h223cc;
    stim[40] = 19'h1ddee;
    stim[41] = 19'h587d7;
    stim[42] = 19'h6491c;
    stim[43] = 19'h0862e;
    stim[44] = 19'h39546;
    stim[45] = 19'h752c6;
    stim[46] = 19'h01286;
    stim[47] = 19'h74cd3;
    stim[48] = 19'h24631;
    stim[49] = 19'h62dfb;
    stim[50] = 19'h68922;
    stim[51] = 19'h27020;
    stim[52] = 19'h0dfa9;
    stim[53] = 19'h23b29;
    stim[54] = 19'h60bf4;
    stim[55] = 19'h47f86;
    stim[56] = 19'h43feb;
    stim[57] = 19'h40c2e;
    stim[58] = 19'h2a7aa;
    stim[59] = 19'h0b3fd;
    stim[60] = 19'h139ec;
    stim[61] = 19'h37a5f;
    stim[62] = 19'h6d85b;
    stim[63] = 19'h24f7a;
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
      expv[0] = 19'h00xxx;
      expv[1] = 19'h00xxx;
      expv[2] = 19'h00xxx;
      expv[3] = 19'h00xxx;
      expv[4] = 19'h00xxx;
      expv[5] = 19'h00xxx;
      expv[6] = 19'h00xxx;
      expv[7] = 19'h00xxx;
      expv[8] = 19'h00xxx;
      expv[9] = 19'h00xxx;
      expv[10] = 19'h0002d;
      expv[11] = 19'h005f0;
      expv[12] = 19'h0022d;
      expv[13] = 19'h00748;
      expv[14] = 19'h0071c;
      expv[15] = 19'h00010;
      expv[16] = 19'h0078b;
      expv[17] = 19'h005a8;
      expv[18] = 19'h0059f;
      expv[19] = 19'h00646;
      expv[20] = 19'h00607;
      expv[21] = 19'h006f6;
      expv[22] = 19'h007d6;
      expv[23] = 19'h007d8;
      expv[24] = 19'h00784;
      expv[25] = 19'h00742;
      expv[26] = 19'h0065c;
      expv[27] = 19'h006f9;
      expv[28] = 19'h006a1;
      expv[29] = 19'h00648;
      expv[30] = 19'h006e5;
      expv[31] = 19'h0010f;
      expv[32] = 19'h00059;
      expv[33] = 19'h00795;
      expv[34] = 19'h0019c;
      expv[35] = 19'h00668;
      expv[36] = 19'h0005b;
      expv[37] = 19'h0075a;
      expv[38] = 19'h00209;
      expv[39] = 19'h007ee;
      expv[40] = 19'h00070;
      expv[41] = 19'h0077d;
      expv[42] = 19'h000ba;
      expv[43] = 19'h000c9;
      expv[44] = 19'h00063;
      expv[45] = 19'h006a6;
      expv[46] = 19'h000cf;
      expv[47] = 19'h00078;
      expv[48] = 19'h00040;
      expv[49] = 19'h007bd;
      expv[50] = 19'h00086;
      expv[51] = 19'h0005e;
      expv[52] = 19'h0002b;
      expv[53] = 19'h0002a;
      expv[54] = 19'h00085;
      expv[55] = 19'h006ab;
      expv[56] = 19'h00770;
      expv[57] = 19'h00789;
      expv[58] = 19'h0006c;
      expv[59] = 19'h00101;
      expv[60] = 19'h000c2;
      expv[61] = 19'h007c2;
      expv[62] = 19'h007df;
      expv[63] = 19'h007eb;
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
