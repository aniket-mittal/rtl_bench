// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167885 dut (
    .rd_clk(clk),
    .rd_en(in_vec[9:9]),
    .rd_rst_n(in_vec[8:8]),
    .wr_addr_glay(in_vec[7:0]),
    .rd_addr_bin(out_vec[16:9]),
    .rd_addr_glay(out_vec[8:1]),
    .rd_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h088;
    stim[1] = 10'h0dc;
    stim[2] = 10'h3ca;
    stim[3] = 10'h33b;
    stim[4] = 10'h119;
    stim[5] = 10'h376;
    stim[6] = 10'h3b7;
    stim[7] = 10'h39a;
    stim[8] = 10'h34c;
    stim[9] = 10'h187;
    stim[10] = 10'h35d;
    stim[11] = 10'h183;
    stim[12] = 10'h17e;
    stim[13] = 10'h1be;
    stim[14] = 10'h123;
    stim[15] = 10'h3f6;
    stim[16] = 10'h3d3;
    stim[17] = 10'h314;
    stim[18] = 10'h31c;
    stim[19] = 10'h1aa;
    stim[20] = 10'h1cf;
    stim[21] = 10'h308;
    stim[22] = 10'h183;
    stim[23] = 10'h1d3;
    stim[24] = 10'h1ed;
    stim[25] = 10'h306;
    stim[26] = 10'h365;
    stim[27] = 10'h395;
    stim[28] = 10'h10c;
    stim[29] = 10'h373;
    stim[30] = 10'h3ce;
    stim[31] = 10'h118;
    stim[32] = 10'h103;
    stim[33] = 10'h3ac;
    stim[34] = 10'h155;
    stim[35] = 10'h0d9;
    stim[36] = 10'h330;
    stim[37] = 10'h1b9;
    stim[38] = 10'h387;
    stim[39] = 10'h33a;
    stim[40] = 10'h3f4;
    stim[41] = 10'h1a0;
    stim[42] = 10'h1b1;
    stim[43] = 10'h18c;
    stim[44] = 10'h380;
    stim[45] = 10'h1a6;
    stim[46] = 10'h1f9;
    stim[47] = 10'h11f;
    stim[48] = 10'h1c2;
    stim[49] = 10'h3b4;
    stim[50] = 10'h127;
    stim[51] = 10'h1f9;
    stim[52] = 10'h18f;
    stim[53] = 10'h100;
    stim[54] = 10'h3cd;
    stim[55] = 10'h3dd;
    stim[56] = 10'h185;
    stim[57] = 10'h39b;
    stim[58] = 10'h33a;
    stim[59] = 10'h3f8;
    stim[60] = 10'h150;
    stim[61] = 10'h15c;
    stim[62] = 10'h397;
    stim[63] = 10'h3ae;
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
      expv[0] = 17'h00001;
      expv[1] = 17'h00001;
      expv[2] = 17'h00001;
      expv[3] = 17'h00201;
      expv[4] = 17'h00403;
      expv[5] = 17'h00406;
      expv[6] = 17'h00606;
      expv[7] = 17'h00804;
      expv[8] = 17'h00a0c;
      expv[9] = 17'h00c0e;
      expv[10] = 17'h00c0a;
      expv[11] = 17'h00e0a;
      expv[12] = 17'h00e08;
      expv[13] = 17'h00e08;
      expv[14] = 17'h00e08;
      expv[15] = 17'h00e08;
      expv[16] = 17'h01008;
      expv[17] = 17'h01218;
      expv[18] = 17'h0141a;
      expv[19] = 17'h0161e;
      expv[20] = 17'h0161c;
      expv[21] = 17'h0161c;
      expv[22] = 17'h0181c;
      expv[23] = 17'h01814;
      expv[24] = 17'h01814;
      expv[25] = 17'h01814;
      expv[26] = 17'h01a14;
      expv[27] = 17'h01c16;
      expv[28] = 17'h01e12;
      expv[29] = 17'h01e10;
      expv[30] = 17'h02010;
      expv[31] = 17'h02230;
      expv[32] = 17'h02232;
      expv[33] = 17'h02232;
      expv[34] = 17'h02432;
      expv[35] = 17'h00001;
      expv[36] = 17'h00001;
      expv[37] = 17'h00201;
      expv[38] = 17'h00203;
      expv[39] = 17'h00402;
      expv[40] = 17'h00606;
      expv[41] = 17'h00804;
      expv[42] = 17'h0080c;
      expv[43] = 17'h0080c;
      expv[44] = 17'h0080c;
      expv[45] = 17'h00a0c;
      expv[46] = 17'h00a0e;
      expv[47] = 17'h00a0e;
      expv[48] = 17'h00a0e;
      expv[49] = 17'h00a0e;
      expv[50] = 17'h00c0e;
      expv[51] = 17'h00c0a;
      expv[52] = 17'h00c0a;
      expv[53] = 17'h00c0a;
      expv[54] = 17'h00c0a;
      expv[55] = 17'h00e0a;
      expv[56] = 17'h01008;
      expv[57] = 17'h01018;
      expv[58] = 17'h01218;
      expv[59] = 17'h0141a;
      expv[60] = 17'h0161e;
      expv[61] = 17'h0161c;
      expv[62] = 17'h0161c;
      expv[63] = 17'h0181c;
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
