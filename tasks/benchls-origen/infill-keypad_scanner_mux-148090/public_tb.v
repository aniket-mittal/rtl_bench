// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148090 dut (
    .clk(clk),
    .reset(in_vec[20:20]),
    .row(in_vec[19:16]),
    .A(in_vec[15:12]),
    .B(in_vec[11:8]),
    .C(in_vec[7:4]),
    .D(in_vec[3:0]),
    .col(out_vec[5:2]),
    .Y(out_vec[1:1]),
    .EN(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1d1d08;
    stim[1] = 21'h1322c6;
    stim[2] = 21'h032e98;
    stim[3] = 21'h0a4f47;
    stim[4] = 21'h078207;
    stim[5] = 21'h04d61a;
    stim[6] = 21'h08093e;
    stim[7] = 21'h014147;
    stim[8] = 21'h0b8477;
    stim[9] = 21'h087bec;
    stim[10] = 21'h01e4d7;
    stim[11] = 21'h0520b7;
    stim[12] = 21'h07dd28;
    stim[13] = 21'h018d21;
    stim[14] = 21'h09c2ee;
    stim[15] = 21'h01ea5e;
    stim[16] = 21'h1fba5d;
    stim[17] = 21'h08c015;
    stim[18] = 21'h072bf1;
    stim[19] = 21'h0548ec;
    stim[20] = 21'h032b02;
    stim[21] = 21'h0d0509;
    stim[22] = 21'h0ecf33;
    stim[23] = 21'h0ebda6;
    stim[24] = 21'h08037a;
    stim[25] = 21'h0e7e8c;
    stim[26] = 21'h09bf79;
    stim[27] = 21'h063bc5;
    stim[28] = 21'h0ea6df;
    stim[29] = 21'h0447aa;
    stim[30] = 21'h00615f;
    stim[31] = 21'h04934f;
    stim[32] = 21'h097e29;
    stim[33] = 21'h0e8552;
    stim[34] = 21'h0c66b9;
    stim[35] = 21'h088b2e;
    stim[36] = 21'h05f41c;
    stim[37] = 21'h0ac9bb;
    stim[38] = 21'h0dd1d8;
    stim[39] = 21'h0afd98;
    stim[40] = 21'h084fc2;
    stim[41] = 21'h09829c;
    stim[42] = 21'h0e4fbd;
    stim[43] = 21'h07021a;
    stim[44] = 21'h0cb237;
    stim[45] = 21'h04f251;
    stim[46] = 21'h067650;
    stim[47] = 21'h044f1a;
    stim[48] = 21'h0ab71c;
    stim[49] = 21'h0de0e7;
    stim[50] = 21'h0d44a2;
    stim[51] = 21'h0ae7f3;
    stim[52] = 21'h0bbaf3;
    stim[53] = 21'h07347d;
    stim[54] = 21'h01df99;
    stim[55] = 21'h038614;
    stim[56] = 21'h008539;
    stim[57] = 21'h00384b;
    stim[58] = 21'h193c54;
    stim[59] = 21'h0a03a2;
    stim[60] = 21'h005451;
    stim[61] = 21'h081672;
    stim[62] = 21'h07a423;
    stim[63] = 21'h0be91a;
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
      expv[0] = 6'h3b;
      expv[1] = 6'h39;
      expv[2] = 6'h39;
      expv[3] = 6'h39;
      expv[4] = 6'h39;
      expv[5] = 6'h39;
      expv[6] = 6'h38;
      expv[7] = 6'h39;
      expv[8] = 6'h39;
      expv[9] = 6'h39;
      expv[10] = 6'h39;
      expv[11] = 6'h38;
      expv[12] = 6'h3b;
      expv[13] = 6'h3b;
      expv[14] = 6'h39;
      expv[15] = 6'h39;
      expv[16] = 6'h3b;
      expv[17] = 6'h39;
      expv[18] = 6'h39;
      expv[19] = 6'h39;
      expv[20] = 6'h3b;
      expv[21] = 6'h38;
      expv[22] = 6'h3b;
      expv[23] = 6'h3b;
      expv[24] = 6'h38;
      expv[25] = 6'h3b;
      expv[26] = 6'h3b;
      expv[27] = 6'h3b;
      expv[28] = 6'h39;
      expv[29] = 6'h39;
      expv[30] = 6'h39;
      expv[31] = 6'h3b;
      expv[32] = 6'h3b;
      expv[33] = 6'h3b;
      expv[34] = 6'h39;
      expv[35] = 6'h39;
      expv[36] = 6'h3b;
      expv[37] = 6'h3b;
      expv[38] = 6'h3b;
      expv[39] = 6'h3b;
      expv[40] = 6'h39;
      expv[41] = 6'h39;
      expv[42] = 6'h3b;
      expv[43] = 6'h38;
      expv[44] = 6'h3b;
      expv[45] = 6'h3b;
      expv[46] = 6'h3b;
      expv[47] = 6'h39;
      expv[48] = 6'h3b;
      expv[49] = 6'h39;
      expv[50] = 6'h39;
      expv[51] = 6'h3b;
      expv[52] = 6'h3b;
      expv[53] = 6'h3b;
      expv[54] = 6'h3b;
      expv[55] = 6'h39;
      expv[56] = 6'h3b;
      expv[57] = 6'h3b;
      expv[58] = 6'h3b;
      expv[59] = 6'h38;
      expv[60] = 6'h3b;
      expv[61] = 6'h3b;
      expv[62] = 6'h39;
      expv[63] = 6'h39;
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
