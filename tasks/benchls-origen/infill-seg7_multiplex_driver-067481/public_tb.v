// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067481 dut (
    .CLK_clk_i(clk),
    .RST_rst_i(in_vec[14:14]),
    .in0_i(in_vec[13:7]),
    .in3_i(in_vec[6:0]),
    .a_o(out_vec[11:11]),
    .b_o(out_vec[10:10]),
    .c_o(out_vec[9:9]),
    .d_o(out_vec[8:8]),
    .e_o(out_vec[7:7]),
    .f_o(out_vec[6:6]),
    .g_o(out_vec[5:5]),
    .dp_o(out_vec[4:4]),
    .an_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h697c;
    stim[1] = 15'h4b3c;
    stim[2] = 15'h288e;
    stim[3] = 15'h0bdc;
    stim[4] = 15'h377d;
    stim[5] = 15'h25d5;
    stim[6] = 15'h26d7;
    stim[7] = 15'h1928;
    stim[8] = 15'h1c10;
    stim[9] = 15'h351b;
    stim[10] = 15'h3220;
    stim[11] = 15'h0315;
    stim[12] = 15'h2dd2;
    stim[13] = 15'h3abc;
    stim[14] = 15'h24bd;
    stim[15] = 15'h3241;
    stim[16] = 15'h2383;
    stim[17] = 15'h390b;
    stim[18] = 15'h310a;
    stim[19] = 15'h1e59;
    stim[20] = 15'h3abd;
    stim[21] = 15'h352d;
    stim[22] = 15'h39b7;
    stim[23] = 15'h316a;
    stim[24] = 15'h2664;
    stim[25] = 15'h2094;
    stim[26] = 15'h29b8;
    stim[27] = 15'h294c;
    stim[28] = 15'h0cc0;
    stim[29] = 15'h0798;
    stim[30] = 15'h3a77;
    stim[31] = 15'h2722;
    stim[32] = 15'h247c;
    stim[33] = 15'h18a0;
    stim[34] = 15'h1337;
    stim[35] = 15'h10cf;
    stim[36] = 15'h0dcf;
    stim[37] = 15'h09b6;
    stim[38] = 15'h1e57;
    stim[39] = 15'h04c9;
    stim[40] = 15'h04e4;
    stim[41] = 15'h34a1;
    stim[42] = 15'h2d3d;
    stim[43] = 15'h2cd1;
    stim[44] = 15'h2101;
    stim[45] = 15'h034c;
    stim[46] = 15'h01af;
    stim[47] = 15'h1612;
    stim[48] = 15'h6552;
    stim[49] = 15'h3af4;
    stim[50] = 15'h0586;
    stim[51] = 15'h06a1;
    stim[52] = 15'h1fbe;
    stim[53] = 15'h2169;
    stim[54] = 15'h0770;
    stim[55] = 15'h3876;
    stim[56] = 15'h0e60;
    stim[57] = 15'h0312;
    stim[58] = 15'h32a7;
    stim[59] = 15'h2073;
    stim[60] = 15'h2d0d;
    stim[61] = 15'h37da;
    stim[62] = 15'h24d4;
    stim[63] = 15'h0051;
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
      expv[0] = 12'ha5e;
      expv[1] = 12'h2de;
      expv[2] = 12'ha3e;
      expv[3] = 12'h2fe;
      expv[4] = 12'hdde;
      expv[5] = 12'h97e;
      expv[6] = 12'h9be;
      expv[7] = 12'h65e;
      expv[8] = 12'h71e;
      expv[9] = 12'hd5e;
      expv[10] = 12'hc9e;
      expv[11] = 12'h0de;
      expv[12] = 12'hb7e;
      expv[13] = 12'hebe;
      expv[14] = 12'h93e;
      expv[15] = 12'hc9e;
      expv[16] = 12'h8fe;
      expv[17] = 12'he5e;
      expv[18] = 12'hc5e;
      expv[19] = 12'h79e;
      expv[20] = 12'hebe;
      expv[21] = 12'hd5e;
      expv[22] = 12'he7e;
      expv[23] = 12'hc5e;
      expv[24] = 12'h99e;
      expv[25] = 12'h83e;
      expv[26] = 12'ha7e;
      expv[27] = 12'ha5e;
      expv[28] = 12'h33e;
      expv[29] = 12'h1fe;
      expv[30] = 12'he9e;
      expv[31] = 12'h9de;
      expv[32] = 12'h91e;
      expv[33] = 12'h63e;
      expv[34] = 12'h4de;
      expv[35] = 12'h43e;
      expv[36] = 12'h37e;
      expv[37] = 12'h27e;
      expv[38] = 12'h79e;
      expv[39] = 12'h13e;
      expv[40] = 12'h13e;
      expv[41] = 12'hd3e;
      expv[42] = 12'hb5e;
      expv[43] = 12'hb3e;
      expv[44] = 12'h85e;
      expv[45] = 12'h0de;
      expv[46] = 12'h07e;
      expv[47] = 12'h59e;
      expv[48] = 12'h95e;
      expv[49] = 12'hebe;
      expv[50] = 12'h17e;
      expv[51] = 12'h1be;
      expv[52] = 12'h7fe;
      expv[53] = 12'h85e;
      expv[54] = 12'h1de;
      expv[55] = 12'he1e;
      expv[56] = 12'h39e;
      expv[57] = 12'h0de;
      expv[58] = 12'hcbe;
      expv[59] = 12'h81e;
      expv[60] = 12'hb5e;
      expv[61] = 12'hdfe;
      expv[62] = 12'h93e;
      expv[63] = 12'h01e;
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
