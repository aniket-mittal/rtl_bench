// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174222 dut (
    .op_clear(in_vec[9:9]),
    .wr_en(in_vec[8:8]),
    .rd_en(in_vec[7:7]),
    .state(in_vec[6:4]),
    .data_count(in_vec[3:0]),
    .next_state(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h297;
    stim[1] = 10'h025;
    stim[2] = 10'h0fa;
    stim[3] = 10'h067;
    stim[4] = 10'h00f;
    stim[5] = 10'h045;
    stim[6] = 10'h3f5;
    stim[7] = 10'h204;
    stim[8] = 10'h227;
    stim[9] = 10'h098;
    stim[10] = 10'h09f;
    stim[11] = 10'h3e3;
    stim[12] = 10'h1a7;
    stim[13] = 10'h182;
    stim[14] = 10'h000;
    stim[15] = 10'h0c0;
    stim[16] = 10'h0e8;
    stim[17] = 10'h26d;
    stim[18] = 10'h35d;
    stim[19] = 10'h0b2;
    stim[20] = 10'h2eb;
    stim[21] = 10'h107;
    stim[22] = 10'h1ed;
    stim[23] = 10'h21b;
    stim[24] = 10'h2ab;
    stim[25] = 10'h2a4;
    stim[26] = 10'h353;
    stim[27] = 10'h235;
    stim[28] = 10'h342;
    stim[29] = 10'h0d7;
    stim[30] = 10'h276;
    stim[31] = 10'h351;
    stim[32] = 10'h201;
    stim[33] = 10'h1fe;
    stim[34] = 10'h07e;
    stim[35] = 10'h17e;
    stim[36] = 10'h2eb;
    stim[37] = 10'h38c;
    stim[38] = 10'h1bd;
    stim[39] = 10'h1be;
    stim[40] = 10'h1af;
    stim[41] = 10'h327;
    stim[42] = 10'h3e2;
    stim[43] = 10'h2a7;
    stim[44] = 10'h30e;
    stim[45] = 10'h1ec;
    stim[46] = 10'h10d;
    stim[47] = 10'h3ef;
    stim[48] = 10'h3f3;
    stim[49] = 10'h252;
    stim[50] = 10'h33a;
    stim[51] = 10'h0be;
    stim[52] = 10'h1e8;
    stim[53] = 10'h329;
    stim[54] = 10'h21f;
    stim[55] = 10'h3b4;
    stim[56] = 10'h313;
    stim[57] = 10'h035;
    stim[58] = 10'h33b;
    stim[59] = 10'h3e8;
    stim[60] = 10'h16c;
    stim[61] = 10'h1f8;
    stim[62] = 10'h2ee;
    stim[63] = 10'h23e;
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
      expv[0] = 3'h0;
      expv[1] = 3'h1;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h1;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h0;
      expv[12] = 3'h1;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h5;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h4;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h5;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h1;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h4;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h1;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
