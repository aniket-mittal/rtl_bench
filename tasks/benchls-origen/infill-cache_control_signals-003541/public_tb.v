// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_003541 dut (
    .clk(clk),
    .imiss(in_vec[6:6]),
    .dmiss(in_vec[5:5]),
    .ifill(in_vec[4:4]),
    .dfill(in_vec[3:3]),
    .jump(in_vec[2:2]),
    .remaining_stores(in_vec[1:0]),
    .we1(out_vec[8:8]),
    .we2(out_vec[7:7]),
    .we3(out_vec[6:6]),
    .we4(out_vec[5:5]),
    .we5(out_vec[4:4]),
    .reset2(out_vec[3:3]),
    .reset3(out_vec[2:2]),
    .reset4(out_vec[1:1]),
    .reset5(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h15;
    stim[1] = 7'h77;
    stim[2] = 7'h72;
    stim[3] = 7'h43;
    stim[4] = 7'h2e;
    stim[5] = 7'h5e;
    stim[6] = 7'h1e;
    stim[7] = 7'h26;
    stim[8] = 7'h19;
    stim[9] = 7'h42;
    stim[10] = 7'h19;
    stim[11] = 7'h78;
    stim[12] = 7'h35;
    stim[13] = 7'h48;
    stim[14] = 7'h7a;
    stim[15] = 7'h34;
    stim[16] = 7'h28;
    stim[17] = 7'h37;
    stim[18] = 7'h33;
    stim[19] = 7'h7d;
    stim[20] = 7'h7c;
    stim[21] = 7'h00;
    stim[22] = 7'h76;
    stim[23] = 7'h3b;
    stim[24] = 7'h6a;
    stim[25] = 7'h4b;
    stim[26] = 7'h56;
    stim[27] = 7'h18;
    stim[28] = 7'h66;
    stim[29] = 7'h2a;
    stim[30] = 7'h5c;
    stim[31] = 7'h6a;
    stim[32] = 7'h54;
    stim[33] = 7'h65;
    stim[34] = 7'h43;
    stim[35] = 7'h3a;
    stim[36] = 7'h37;
    stim[37] = 7'h11;
    stim[38] = 7'h48;
    stim[39] = 7'h1a;
    stim[40] = 7'h51;
    stim[41] = 7'h10;
    stim[42] = 7'h60;
    stim[43] = 7'h03;
    stim[44] = 7'h24;
    stim[45] = 7'h0b;
    stim[46] = 7'h38;
    stim[47] = 7'h2e;
    stim[48] = 7'h2a;
    stim[49] = 7'h62;
    stim[50] = 7'h55;
    stim[51] = 7'h17;
    stim[52] = 7'h50;
    stim[53] = 7'h3f;
    stim[54] = 7'h1e;
    stim[55] = 7'h1e;
    stim[56] = 7'h4d;
    stim[57] = 7'h56;
    stim[58] = 7'h67;
    stim[59] = 7'h42;
    stim[60] = 7'h4e;
    stim[61] = 7'h2b;
    stim[62] = 7'h0d;
    stim[63] = 7'h1d;
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
      expv[0] = 9'h1ef;
      expv[1] = 9'h00f;
      expv[2] = 9'h00f;
      expv[3] = 9'h00f;
      expv[4] = 9'h10f;
      expv[5] = 9'h00f;
      expv[6] = 9'h1ef;
      expv[7] = 9'h10f;
      expv[8] = 9'h1e0;
      expv[9] = 9'h00f;
      expv[10] = 9'h1e0;
      expv[11] = 9'h00f;
      expv[12] = 9'h10f;
      expv[13] = 9'h00f;
      expv[14] = 9'h007;
      expv[15] = 9'h10f;
      expv[16] = 9'h10f;
      expv[17] = 9'h10f;
      expv[18] = 9'h10f;
      expv[19] = 9'h00f;
      expv[20] = 9'h00f;
      expv[21] = 9'h1ff;
      expv[22] = 9'h00f;
      expv[23] = 9'h10f;
      expv[24] = 9'h00f;
      expv[25] = 9'h007;
      expv[26] = 9'h00f;
      expv[27] = 9'h1ff;
      expv[28] = 9'h00f;
      expv[29] = 9'h100;
      expv[30] = 9'h00f;
      expv[31] = 9'h00f;
      expv[32] = 9'h00f;
      expv[33] = 9'h00f;
      expv[34] = 9'h000;
      expv[35] = 9'h100;
      expv[36] = 9'h10f;
      expv[37] = 9'h1ef;
      expv[38] = 9'h00f;
      expv[39] = 9'h1e7;
      expv[40] = 9'h00f;
      expv[41] = 9'h1ff;
      expv[42] = 9'h00f;
      expv[43] = 9'h1e0;
      expv[44] = 9'h10f;
      expv[45] = 9'h1e0;
      expv[46] = 9'h107;
      expv[47] = 9'h10f;
      expv[48] = 9'h107;
      expv[49] = 9'h007;
      expv[50] = 9'h00f;
      expv[51] = 9'h1ef;
      expv[52] = 9'h00f;
      expv[53] = 9'h10f;
      expv[54] = 9'h1ef;
      expv[55] = 9'h1ef;
      expv[56] = 9'h00f;
      expv[57] = 9'h00f;
      expv[58] = 9'h00f;
      expv[59] = 9'h000;
      expv[60] = 9'h00f;
      expv[61] = 9'h107;
      expv[62] = 9'h1ef;
      expv[63] = 9'h1ef;
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
