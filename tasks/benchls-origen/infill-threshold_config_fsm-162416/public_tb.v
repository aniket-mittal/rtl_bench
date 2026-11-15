// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162416 dut (
    .clk(clk),
    .reset(in_vec[6:6]),
    .umbralMF(in_vec[5:5]),
    .umbralVC(in_vec[4:4]),
    .umbralD(in_vec[3:3]),
    .Fifo_empties(in_vec[2:2]),
    .Fifo_errors(in_vec[1:1]),
    .init(in_vec[0:0]),
    .init_out(out_vec[33:33]),
    .idle_out(out_vec[32:32]),
    .active_out(out_vec[31:31]),
    .error_out(out_vec[30:30]),
    .umbralMF_out(out_vec[29:22]),
    .umbralVC_out(out_vec[21:14]),
    .umbralD_out(out_vec[13:6]),
    .state(out_vec[5:3]),
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
    stim[0] = 7'h53;
    stim[1] = 7'h40;
    stim[2] = 7'h3a;
    stim[3] = 7'h25;
    stim[4] = 7'h0d;
    stim[5] = 7'h15;
    stim[6] = 7'h1f;
    stim[7] = 7'h3e;
    stim[8] = 7'h0c;
    stim[9] = 7'h0b;
    stim[10] = 7'h08;
    stim[11] = 7'h09;
    stim[12] = 7'h07;
    stim[13] = 7'h36;
    stim[14] = 7'h29;
    stim[15] = 7'h19;
    stim[16] = 7'h37;
    stim[17] = 7'h14;
    stim[18] = 7'h2d;
    stim[19] = 7'h06;
    stim[20] = 7'h1a;
    stim[21] = 7'h0c;
    stim[22] = 7'h37;
    stim[23] = 7'h09;
    stim[24] = 7'h1a;
    stim[25] = 7'h17;
    stim[26] = 7'h3c;
    stim[27] = 7'h34;
    stim[28] = 7'h26;
    stim[29] = 7'h16;
    stim[30] = 7'h06;
    stim[31] = 7'h1b;
    stim[32] = 7'h2c;
    stim[33] = 7'h17;
    stim[34] = 7'h35;
    stim[35] = 7'h17;
    stim[36] = 7'h3c;
    stim[37] = 7'h2d;
    stim[38] = 7'h3c;
    stim[39] = 7'h35;
    stim[40] = 7'h1b;
    stim[41] = 7'h18;
    stim[42] = 7'h19;
    stim[43] = 7'h0b;
    stim[44] = 7'h2e;
    stim[45] = 7'h03;
    stim[46] = 7'h25;
    stim[47] = 7'h0e;
    stim[48] = 7'h07;
    stim[49] = 7'h35;
    stim[50] = 7'h25;
    stim[51] = 7'h24;
    stim[52] = 7'h1c;
    stim[53] = 7'h1d;
    stim[54] = 7'h17;
    stim[55] = 7'h2b;
    stim[56] = 7'h14;
    stim[57] = 7'h41;
    stim[58] = 7'h0b;
    stim[59] = 7'h19;
    stim[60] = 7'h0a;
    stim[61] = 7'h35;
    stim[62] = 7'h00;
    stim[63] = 7'h31;
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
      expv[0] = 34'hxx000000x;
      expv[1] = 34'hxx000000x;
      expv[2] = 34'hxx000000x;
      expv[3] = 34'h0000000xx;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000001;
      expv[6] = 34'h000000009;
      expv[7] = 34'h20000404a;
      expv[8] = 34'h200404052;
      expv[9] = 34'h100404052;
      expv[10] = 34'h100404052;
      expv[11] = 34'h100404052;
      expv[12] = 34'h100404052;
      expv[13] = 34'h100404053;
      expv[14] = 34'h10040405b;
      expv[15] = 34'h08040405a;
      expv[16] = 34'h080404052;
      expv[17] = 34'h100404053;
      expv[18] = 34'h10040405a;
      expv[19] = 34'h080404054;
      expv[20] = 34'h100404063;
      expv[21] = 34'h04040405c;
      expv[22] = 34'h080404064;
      expv[23] = 34'h040404064;
      expv[24] = 34'h040404064;
      expv[25] = 34'h040404064;
      expv[26] = 34'h040404064;
      expv[27] = 34'h040404064;
      expv[28] = 34'h040404064;
      expv[29] = 34'h040404064;
      expv[30] = 34'h040404064;
      expv[31] = 34'h040404064;
      expv[32] = 34'h040404064;
      expv[33] = 34'h040404064;
      expv[34] = 34'h040404064;
      expv[35] = 34'h040404064;
      expv[36] = 34'h040404064;
      expv[37] = 34'h040404064;
      expv[38] = 34'h040404064;
      expv[39] = 34'h040404064;
      expv[40] = 34'h040404064;
      expv[41] = 34'h040404064;
      expv[42] = 34'h040404064;
      expv[43] = 34'h040404064;
      expv[44] = 34'h040404064;
      expv[45] = 34'h040404064;
      expv[46] = 34'h040404064;
      expv[47] = 34'h040404064;
      expv[48] = 34'h040404064;
      expv[49] = 34'h040404064;
      expv[50] = 34'h040404064;
      expv[51] = 34'h040404064;
      expv[52] = 34'h040404064;
      expv[53] = 34'h040404064;
      expv[54] = 34'h040404064;
      expv[55] = 34'h040404064;
      expv[56] = 34'h040404064;
      expv[57] = 34'h040000004;
      expv[58] = 34'h040000004;
      expv[59] = 34'h000000021;
      expv[60] = 34'h04000000c;
      expv[61] = 34'h200000062;
      expv[62] = 34'h040000054;
      expv[63] = 34'h100000062;
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
