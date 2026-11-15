// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058880 dut (
    .clk_out_seg(clk),
    .reset(in_vec[8:8]),
    .BCD1(in_vec[7:4]),
    .BCD2(in_vec[3:0]),
    .An(out_vec[14:7]),
    .Seg(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1c6;
    stim[1] = 9'h1e5;
    stim[2] = 9'h092;
    stim[3] = 9'h086;
    stim[4] = 9'h0d3;
    stim[5] = 9'h0ef;
    stim[6] = 9'h0ca;
    stim[7] = 9'h020;
    stim[8] = 9'h024;
    stim[9] = 9'h036;
    stim[10] = 9'h0b5;
    stim[11] = 9'h0bc;
    stim[12] = 9'h05a;
    stim[13] = 9'h097;
    stim[14] = 9'h070;
    stim[15] = 9'h02e;
    stim[16] = 9'h006;
    stim[17] = 9'h0b8;
    stim[18] = 9'h01e;
    stim[19] = 9'h061;
    stim[20] = 9'h07f;
    stim[21] = 9'h071;
    stim[22] = 9'h0f1;
    stim[23] = 9'h087;
    stim[24] = 9'h055;
    stim[25] = 9'h0c1;
    stim[26] = 9'h06a;
    stim[27] = 9'h08c;
    stim[28] = 9'h0e3;
    stim[29] = 9'h058;
    stim[30] = 9'h053;
    stim[31] = 9'h06c;
    stim[32] = 9'h04e;
    stim[33] = 9'h023;
    stim[34] = 9'h068;
    stim[35] = 9'h003;
    stim[36] = 9'h012;
    stim[37] = 9'h09b;
    stim[38] = 9'h02e;
    stim[39] = 9'h053;
    stim[40] = 9'h02f;
    stim[41] = 9'h08d;
    stim[42] = 9'h093;
    stim[43] = 9'h019;
    stim[44] = 9'h0f1;
    stim[45] = 9'h082;
    stim[46] = 9'h050;
    stim[47] = 9'h01d;
    stim[48] = 9'h0f9;
    stim[49] = 9'h10e;
    stim[50] = 9'h0c6;
    stim[51] = 9'h0bb;
    stim[52] = 9'h023;
    stim[53] = 9'h0ac;
    stim[54] = 9'h083;
    stim[55] = 9'h008;
    stim[56] = 9'h095;
    stim[57] = 9'h040;
    stim[58] = 9'h0d6;
    stim[59] = 9'h0f4;
    stim[60] = 9'h052;
    stim[61] = 9'h0f8;
    stim[62] = 9'h073;
    stim[63] = 9'h0a9;
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
      expv[1] = 15'h7fc0;
      expv[2] = 15'h7d92;
      expv[3] = 15'h7d92;
      expv[4] = 15'h7d92;
      expv[5] = 15'h7d92;
      expv[6] = 15'h7d92;
      expv[7] = 15'h7d92;
      expv[8] = 15'h7d92;
      expv[9] = 15'h7d92;
      expv[10] = 15'h7d92;
      expv[11] = 15'h7d92;
      expv[12] = 15'h7d92;
      expv[13] = 15'h7d92;
      expv[14] = 15'h7d92;
      expv[15] = 15'h7d92;
      expv[16] = 15'h7d92;
      expv[17] = 15'h7d92;
      expv[18] = 15'h7d92;
      expv[19] = 15'h7d92;
      expv[20] = 15'h7d92;
      expv[21] = 15'h7d92;
      expv[22] = 15'h7d92;
      expv[23] = 15'h7d92;
      expv[24] = 15'h7d92;
      expv[25] = 15'h7d92;
      expv[26] = 15'h7d92;
      expv[27] = 15'h7d92;
      expv[28] = 15'h7d92;
      expv[29] = 15'h7d92;
      expv[30] = 15'h7d92;
      expv[31] = 15'h7d92;
      expv[32] = 15'h7d92;
      expv[33] = 15'h7d92;
      expv[34] = 15'h7d92;
      expv[35] = 15'h7d92;
      expv[36] = 15'h7d92;
      expv[37] = 15'h7d92;
      expv[38] = 15'h7d92;
      expv[39] = 15'h7d92;
      expv[40] = 15'h7d92;
      expv[41] = 15'h7d92;
      expv[42] = 15'h7d92;
      expv[43] = 15'h7d92;
      expv[44] = 15'h7d92;
      expv[45] = 15'h7d92;
      expv[46] = 15'h7d92;
      expv[47] = 15'h7d92;
      expv[48] = 15'h7d92;
      expv[49] = 15'h7d92;
      expv[50] = 15'h7fc0;
      expv[51] = 15'h7fc0;
      expv[52] = 15'h7fc0;
      expv[53] = 15'h7fc0;
      expv[54] = 15'h7fc0;
      expv[55] = 15'h7fc0;
      expv[56] = 15'h7fc0;
      expv[57] = 15'h7fc0;
      expv[58] = 15'h7fc0;
      expv[59] = 15'h7fc0;
      expv[60] = 15'h7fc0;
      expv[61] = 15'h7fc0;
      expv[62] = 15'h7fc0;
      expv[63] = 15'h7fc0;
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
