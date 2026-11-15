// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103479 dut (
    .clk(clk),
    .trigger(in_vec[4:4]),
    .rst(in_vec[3:3]),
    .BTN(in_vec[2:2]),
    .BTN_pos(in_vec[1:1]),
    .BTN_neg(in_vec[0:0]),
    .trigger_out(out_vec[8:8]),
    .output_counter(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h19;
    stim[1] = 5'h0c;
    stim[2] = 5'h06;
    stim[3] = 5'h13;
    stim[4] = 5'h07;
    stim[5] = 5'h04;
    stim[6] = 5'h01;
    stim[7] = 5'h04;
    stim[8] = 5'h10;
    stim[9] = 5'h12;
    stim[10] = 5'h1f;
    stim[11] = 5'h14;
    stim[12] = 5'h13;
    stim[13] = 5'h13;
    stim[14] = 5'h01;
    stim[15] = 5'h00;
    stim[16] = 5'h05;
    stim[17] = 5'h05;
    stim[18] = 5'h00;
    stim[19] = 5'h10;
    stim[20] = 5'h17;
    stim[21] = 5'h03;
    stim[22] = 5'h06;
    stim[23] = 5'h03;
    stim[24] = 5'h11;
    stim[25] = 5'h16;
    stim[26] = 5'h02;
    stim[27] = 5'h04;
    stim[28] = 5'h14;
    stim[29] = 5'h04;
    stim[30] = 5'h11;
    stim[31] = 5'h10;
    stim[32] = 5'h06;
    stim[33] = 5'h13;
    stim[34] = 5'h06;
    stim[35] = 5'h05;
    stim[36] = 5'h05;
    stim[37] = 5'h07;
    stim[38] = 5'h06;
    stim[39] = 5'h15;
    stim[40] = 5'h02;
    stim[41] = 5'h10;
    stim[42] = 5'h10;
    stim[43] = 5'h14;
    stim[44] = 5'h05;
    stim[45] = 5'h15;
    stim[46] = 5'h01;
    stim[47] = 5'h02;
    stim[48] = 5'h17;
    stim[49] = 5'h12;
    stim[50] = 5'h03;
    stim[51] = 5'h14;
    stim[52] = 5'h13;
    stim[53] = 5'h01;
    stim[54] = 5'h01;
    stim[55] = 5'h12;
    stim[56] = 5'h14;
    stim[57] = 5'h01;
    stim[58] = 5'h02;
    stim[59] = 5'h12;
    stim[60] = 5'h12;
    stim[61] = 5'h05;
    stim[62] = 5'h17;
    stim[63] = 5'h12;
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
      expv[3] = 9'h001;
      expv[4] = 9'h001;
      expv[5] = 9'h002;
      expv[6] = 9'h002;
      expv[7] = 9'h002;
      expv[8] = 9'h002;
      expv[9] = 9'h003;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h001;
      expv[13] = 9'h002;
      expv[14] = 9'h002;
      expv[15] = 9'h002;
      expv[16] = 9'h002;
      expv[17] = 9'h002;
      expv[18] = 9'h002;
      expv[19] = 9'h002;
      expv[20] = 9'h003;
      expv[21] = 9'h004;
      expv[22] = 9'h004;
      expv[23] = 9'h005;
      expv[24] = 9'h005;
      expv[25] = 9'h006;
      expv[26] = 9'h007;
      expv[27] = 9'h007;
      expv[28] = 9'h007;
      expv[29] = 9'h007;
      expv[30] = 9'h007;
      expv[31] = 9'h007;
      expv[32] = 9'h008;
      expv[33] = 9'h009;
      expv[34] = 9'h009;
      expv[35] = 9'h00a;
      expv[36] = 9'h00a;
      expv[37] = 9'h00a;
      expv[38] = 9'h00b;
      expv[39] = 9'h00b;
      expv[40] = 9'h00b;
      expv[41] = 9'h00c;
      expv[42] = 9'h00c;
      expv[43] = 9'h00c;
      expv[44] = 9'h00c;
      expv[45] = 9'h00c;
      expv[46] = 9'h00d;
      expv[47] = 9'h00d;
      expv[48] = 9'h00e;
      expv[49] = 9'h00e;
      expv[50] = 9'h00f;
      expv[51] = 9'h00f;
      expv[52] = 9'h010;
      expv[53] = 9'h011;
      expv[54] = 9'h011;
      expv[55] = 9'h011;
      expv[56] = 9'h012;
      expv[57] = 9'h012;
      expv[58] = 9'h012;
      expv[59] = 9'h013;
      expv[60] = 9'h013;
      expv[61] = 9'h013;
      expv[62] = 9'h013;
      expv[63] = 9'h014;
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
