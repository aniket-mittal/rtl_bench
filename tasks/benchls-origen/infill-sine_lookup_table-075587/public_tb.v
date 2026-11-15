// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_075587 dut (
    .clk_i(clk),
    .addr_i(in_vec[4:0]),
    .value_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1b;
    stim[1] = 5'h13;
    stim[2] = 5'h0e;
    stim[3] = 5'h02;
    stim[4] = 5'h0a;
    stim[5] = 5'h17;
    stim[6] = 5'h03;
    stim[7] = 5'h16;
    stim[8] = 5'h13;
    stim[9] = 5'h1f;
    stim[10] = 5'h0c;
    stim[11] = 5'h17;
    stim[12] = 5'h10;
    stim[13] = 5'h0e;
    stim[14] = 5'h0a;
    stim[15] = 5'h1f;
    stim[16] = 5'h05;
    stim[17] = 5'h02;
    stim[18] = 5'h05;
    stim[19] = 5'h0f;
    stim[20] = 5'h10;
    stim[21] = 5'h1e;
    stim[22] = 5'h03;
    stim[23] = 5'h1a;
    stim[24] = 5'h14;
    stim[25] = 5'h13;
    stim[26] = 5'h03;
    stim[27] = 5'h0d;
    stim[28] = 5'h1c;
    stim[29] = 5'h19;
    stim[30] = 5'h12;
    stim[31] = 5'h0a;
    stim[32] = 5'h00;
    stim[33] = 5'h17;
    stim[34] = 5'h07;
    stim[35] = 5'h18;
    stim[36] = 5'h08;
    stim[37] = 5'h16;
    stim[38] = 5'h06;
    stim[39] = 5'h0f;
    stim[40] = 5'h02;
    stim[41] = 5'h1d;
    stim[42] = 5'h15;
    stim[43] = 5'h0e;
    stim[44] = 5'h04;
    stim[45] = 5'h06;
    stim[46] = 5'h10;
    stim[47] = 5'h15;
    stim[48] = 5'h05;
    stim[49] = 5'h00;
    stim[50] = 5'h0f;
    stim[51] = 5'h16;
    stim[52] = 5'h05;
    stim[53] = 5'h12;
    stim[54] = 5'h0f;
    stim[55] = 5'h01;
    stim[56] = 5'h0a;
    stim[57] = 5'h1c;
    stim[58] = 5'h05;
    stim[59] = 5'h0e;
    stim[60] = 5'h04;
    stim[61] = 5'h07;
    stim[62] = 5'h12;
    stim[63] = 5'h04;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hbc;
      expv[2] = 8'hf3;
      expv[3] = 8'hf5;
      expv[4] = 8'h98;
      expv[5] = 8'he7;
      expv[6] = 8'he0;
      expv[7] = 8'ha5;
      expv[8] = 8'he7;
      expv[9] = 8'hf3;
      expv[10] = 8'hf3;
      expv[11] = 8'hf0;
      expv[12] = 8'he0;
      expv[13] = 8'hf7;
      expv[14] = 8'hf5;
      expv[15] = 8'he7;
      expv[16] = 8'he7;
      expv[17] = 8'hbc;
      expv[18] = 8'h98;
      expv[19] = 8'hbc;
      expv[20] = 8'hf6;
      expv[21] = 8'hf7;
      expv[22] = 8'hf7;
      expv[23] = 8'ha5;
      expv[24] = 8'hc6;
      expv[25] = 8'hf0;
      expv[26] = 8'hf3;
      expv[27] = 8'ha5;
      expv[28] = 8'hf3;
      expv[29] = 8'hb0;
      expv[30] = 8'hd0;
      expv[31] = 8'hf5;
      expv[32] = 8'he7;
      expv[33] = 8'h80;
      expv[34] = 8'he0;
      expv[35] = 8'hd0;
      expv[36] = 8'hd9;
      expv[37] = 8'hd9;
      expv[38] = 8'he7;
      expv[39] = 8'hc6;
      expv[40] = 8'hf6;
      expv[41] = 8'h98;
      expv[42] = 8'ha5;
      expv[43] = 8'hec;
      expv[44] = 8'hf5;
      expv[45] = 8'hb0;
      expv[46] = 8'hc6;
      expv[47] = 8'hf7;
      expv[48] = 8'hec;
      expv[49] = 8'hbc;
      expv[50] = 8'h80;
      expv[51] = 8'hf6;
      expv[52] = 8'he7;
      expv[53] = 8'hbc;
      expv[54] = 8'hf5;
      expv[55] = 8'hf6;
      expv[56] = 8'h8c;
      expv[57] = 8'he7;
      expv[58] = 8'hb0;
      expv[59] = 8'hbc;
      expv[60] = 8'hf5;
      expv[61] = 8'hb0;
      expv[62] = 8'hd0;
      expv[63] = 8'hf5;
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
