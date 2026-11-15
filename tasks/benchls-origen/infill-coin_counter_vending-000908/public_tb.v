// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000908 dut (
    .clock(clk),
    .reset(in_vec[6:6]),
    .enable(in_vec[5:5]),
    .coin_in(in_vec[4:3]),
    .subNickel(in_vec[2:2]),
    .subDime(in_vec[1:1]),
    .dispenseReady(in_vec[0:0]),
    .nickelCount(out_vec[23:16]),
    .dimeCount(out_vec[15:8]),
    .quarterCount(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h6e;
    stim[1] = 7'h67;
    stim[2] = 7'h1a;
    stim[3] = 7'h22;
    stim[4] = 7'h17;
    stim[5] = 7'h12;
    stim[6] = 7'h10;
    stim[7] = 7'h3d;
    stim[8] = 7'h06;
    stim[9] = 7'h3c;
    stim[10] = 7'h39;
    stim[11] = 7'h26;
    stim[12] = 7'h33;
    stim[13] = 7'h27;
    stim[14] = 7'h38;
    stim[15] = 7'h35;
    stim[16] = 7'h1c;
    stim[17] = 7'h12;
    stim[18] = 7'h1f;
    stim[19] = 7'h26;
    stim[20] = 7'h3c;
    stim[21] = 7'h1c;
    stim[22] = 7'h15;
    stim[23] = 7'h2e;
    stim[24] = 7'h39;
    stim[25] = 7'h03;
    stim[26] = 7'h00;
    stim[27] = 7'h32;
    stim[28] = 7'h30;
    stim[29] = 7'h18;
    stim[30] = 7'h2c;
    stim[31] = 7'h30;
    stim[32] = 7'h0e;
    stim[33] = 7'h3f;
    stim[34] = 7'h07;
    stim[35] = 7'h14;
    stim[36] = 7'h0a;
    stim[37] = 7'h01;
    stim[38] = 7'h15;
    stim[39] = 7'h2b;
    stim[40] = 7'h16;
    stim[41] = 7'h08;
    stim[42] = 7'h32;
    stim[43] = 7'h19;
    stim[44] = 7'h18;
    stim[45] = 7'h00;
    stim[46] = 7'h26;
    stim[47] = 7'h39;
    stim[48] = 7'h2b;
    stim[49] = 7'h3c;
    stim[50] = 7'h03;
    stim[51] = 7'h13;
    stim[52] = 7'h20;
    stim[53] = 7'h15;
    stim[54] = 7'h3a;
    stim[55] = 7'h33;
    stim[56] = 7'h44;
    stim[57] = 7'h07;
    stim[58] = 7'h20;
    stim[59] = 7'h01;
    stim[60] = 7'h0c;
    stim[61] = 7'h7f;
    stim[62] = 7'h09;
    stim[63] = 7'h23;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h010000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
