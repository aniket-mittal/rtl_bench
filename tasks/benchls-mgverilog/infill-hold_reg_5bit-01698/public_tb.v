// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01698 dut (
    .clk_i(clk),
    .hold_i(in_vec[6:6]),
    .rst_i(in_vec[5:5]),
    .in(in_vec[4:0]),
    .out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h7d;
    stim[1] = 7'h31;
    stim[2] = 7'h5d;
    stim[3] = 7'h43;
    stim[4] = 7'h14;
    stim[5] = 7'h4f;
    stim[6] = 7'h0a;
    stim[7] = 7'h48;
    stim[8] = 7'h59;
    stim[9] = 7'h06;
    stim[10] = 7'h0e;
    stim[11] = 7'h00;
    stim[12] = 7'h0c;
    stim[13] = 7'h05;
    stim[14] = 7'h0e;
    stim[15] = 7'h1d;
    stim[16] = 7'h06;
    stim[17] = 7'h18;
    stim[18] = 7'h15;
    stim[19] = 7'h49;
    stim[20] = 7'h01;
    stim[21] = 7'h4c;
    stim[22] = 7'h56;
    stim[23] = 7'h58;
    stim[24] = 7'h01;
    stim[25] = 7'h60;
    stim[26] = 7'h10;
    stim[27] = 7'h41;
    stim[28] = 7'h16;
    stim[29] = 7'h55;
    stim[30] = 7'h6d;
    stim[31] = 7'h08;
    stim[32] = 7'h18;
    stim[33] = 7'h07;
    stim[34] = 7'h4d;
    stim[35] = 7'h17;
    stim[36] = 7'h5a;
    stim[37] = 7'h11;
    stim[38] = 7'h44;
    stim[39] = 7'h44;
    stim[40] = 7'h53;
    stim[41] = 7'h4a;
    stim[42] = 7'h17;
    stim[43] = 7'h1f;
    stim[44] = 7'h41;
    stim[45] = 7'h0f;
    stim[46] = 7'h45;
    stim[47] = 7'h42;
    stim[48] = 7'h0c;
    stim[49] = 7'h05;
    stim[50] = 7'h0c;
    stim[51] = 7'h0d;
    stim[52] = 7'h5a;
    stim[53] = 7'h5a;
    stim[54] = 7'h15;
    stim[55] = 7'h5f;
    stim[56] = 7'h4f;
    stim[57] = 7'h06;
    stim[58] = 7'h4b;
    stim[59] = 7'h50;
    stim[60] = 7'h5e;
    stim[61] = 7'h1c;
    stim[62] = 7'h08;
    stim[63] = 7'h4e;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h14;
      expv[6] = 5'h14;
      expv[7] = 5'h0a;
      expv[8] = 5'h0a;
      expv[9] = 5'h0a;
      expv[10] = 5'h06;
      expv[11] = 5'h0e;
      expv[12] = 5'h00;
      expv[13] = 5'h0c;
      expv[14] = 5'h05;
      expv[15] = 5'h0e;
      expv[16] = 5'h1d;
      expv[17] = 5'h06;
      expv[18] = 5'h18;
      expv[19] = 5'h15;
      expv[20] = 5'h15;
      expv[21] = 5'h01;
      expv[22] = 5'h01;
      expv[23] = 5'h01;
      expv[24] = 5'h01;
      expv[25] = 5'h01;
      expv[26] = 5'h00;
      expv[27] = 5'h10;
      expv[28] = 5'h10;
      expv[29] = 5'h16;
      expv[30] = 5'h16;
      expv[31] = 5'h00;
      expv[32] = 5'h08;
      expv[33] = 5'h18;
      expv[34] = 5'h07;
      expv[35] = 5'h07;
      expv[36] = 5'h17;
      expv[37] = 5'h17;
      expv[38] = 5'h11;
      expv[39] = 5'h11;
      expv[40] = 5'h11;
      expv[41] = 5'h11;
      expv[42] = 5'h11;
      expv[43] = 5'h17;
      expv[44] = 5'h1f;
      expv[45] = 5'h1f;
      expv[46] = 5'h0f;
      expv[47] = 5'h0f;
      expv[48] = 5'h0f;
      expv[49] = 5'h0c;
      expv[50] = 5'h05;
      expv[51] = 5'h0c;
      expv[52] = 5'h0d;
      expv[53] = 5'h0d;
      expv[54] = 5'h0d;
      expv[55] = 5'h15;
      expv[56] = 5'h15;
      expv[57] = 5'h15;
      expv[58] = 5'h06;
      expv[59] = 5'h06;
      expv[60] = 5'h06;
      expv[61] = 5'h06;
      expv[62] = 5'h1c;
      expv[63] = 5'h08;
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
