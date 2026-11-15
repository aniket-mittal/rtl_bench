// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06380 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .data_in(in_vec[8:2]),
    .data_in_sign(in_vec[1:1]),
    .data_valid(in_vec[0:0]),
    .data_out(out_vec[8:2]),
    .data_out_sign(out_vec[1:1]),
    .data_ok(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h002;
    stim[1] = 10'h052;
    stim[2] = 10'h358;
    stim[3] = 10'h2e8;
    stim[4] = 10'h29a;
    stim[5] = 10'h265;
    stim[6] = 10'h217;
    stim[7] = 10'h23f;
    stim[8] = 10'h3bd;
    stim[9] = 10'h2a8;
    stim[10] = 10'h21b;
    stim[11] = 10'h3ef;
    stim[12] = 10'h3db;
    stim[13] = 10'h3b2;
    stim[14] = 10'h2aa;
    stim[15] = 10'h38d;
    stim[16] = 10'h39b;
    stim[17] = 10'h3d6;
    stim[18] = 10'h26d;
    stim[19] = 10'h276;
    stim[20] = 10'h3e2;
    stim[21] = 10'h3b7;
    stim[22] = 10'h259;
    stim[23] = 10'h3a1;
    stim[24] = 10'h2f0;
    stim[25] = 10'h28f;
    stim[26] = 10'h26c;
    stim[27] = 10'h086;
    stim[28] = 10'h28d;
    stim[29] = 10'h2f5;
    stim[30] = 10'h3c5;
    stim[31] = 10'h271;
    stim[32] = 10'h3ef;
    stim[33] = 10'h289;
    stim[34] = 10'h294;
    stim[35] = 10'h28f;
    stim[36] = 10'h3f2;
    stim[37] = 10'h217;
    stim[38] = 10'h3d6;
    stim[39] = 10'h213;
    stim[40] = 10'h294;
    stim[41] = 10'h357;
    stim[42] = 10'h3b0;
    stim[43] = 10'h3a3;
    stim[44] = 10'h267;
    stim[45] = 10'h3f4;
    stim[46] = 10'h343;
    stim[47] = 10'h299;
    stim[48] = 10'h37a;
    stim[49] = 10'h25e;
    stim[50] = 10'h25f;
    stim[51] = 10'h2ce;
    stim[52] = 10'h2a7;
    stim[53] = 10'h3b3;
    stim[54] = 10'h2c7;
    stim[55] = 10'h363;
    stim[56] = 10'h3aa;
    stim[57] = 10'h24a;
    stim[58] = 10'h2b6;
    stim[59] = 10'h23e;
    stim[60] = 10'h330;
    stim[61] = 10'h2bc;
    stim[62] = 10'h3c2;
    stim[63] = 10'h3c5;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h006;
      expv[7] = 9'h004;
      expv[8] = 9'h00a;
      expv[9] = 9'h008;
      expv[10] = 9'h008;
      expv[11] = 9'h00e;
      expv[12] = 9'h00c;
      expv[13] = 9'h012;
      expv[14] = 9'h010;
      expv[15] = 9'h010;
      expv[16] = 9'h010;
      expv[17] = 9'h010;
      expv[18] = 9'h010;
      expv[19] = 9'h010;
      expv[20] = 9'h010;
      expv[21] = 9'h010;
      expv[22] = 9'h010;
      expv[23] = 9'h010;
      expv[24] = 9'h010;
      expv[25] = 9'h010;
      expv[26] = 9'h010;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h006;
      expv[30] = 9'h004;
      expv[31] = 9'h00a;
      expv[32] = 9'h008;
      expv[33] = 9'h00e;
      expv[34] = 9'h00c;
      expv[35] = 9'h00c;
      expv[36] = 9'h012;
      expv[37] = 9'h010;
      expv[38] = 9'h016;
      expv[39] = 9'h014;
      expv[40] = 9'h01a;
      expv[41] = 9'h018;
      expv[42] = 9'h01e;
      expv[43] = 9'h01e;
      expv[44] = 9'h01e;
      expv[45] = 9'h01e;
      expv[46] = 9'h01e;
      expv[47] = 9'h01e;
      expv[48] = 9'h01e;
      expv[49] = 9'h01e;
      expv[50] = 9'h01e;
      expv[51] = 9'h01e;
      expv[52] = 9'h01e;
      expv[53] = 9'h01e;
      expv[54] = 9'h01e;
      expv[55] = 9'h01e;
      expv[56] = 9'h01e;
      expv[57] = 9'h01e;
      expv[58] = 9'h01e;
      expv[59] = 9'h01e;
      expv[60] = 9'h01e;
      expv[61] = 9'h01e;
      expv[62] = 9'h01e;
      expv[63] = 9'h01e;
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
