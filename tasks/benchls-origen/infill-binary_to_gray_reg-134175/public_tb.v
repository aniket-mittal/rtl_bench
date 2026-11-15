// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134175 dut (
    .clk(clk),
    .reset(in_vec[4:4]),
    .binary_in(in_vec[3:0]),
    .gray_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h17;
    stim[1] = 5'h12;
    stim[2] = 5'h03;
    stim[3] = 5'h00;
    stim[4] = 5'h0a;
    stim[5] = 5'h01;
    stim[6] = 5'h0f;
    stim[7] = 5'h0a;
    stim[8] = 5'h0d;
    stim[9] = 5'h05;
    stim[10] = 5'h02;
    stim[11] = 5'h01;
    stim[12] = 5'h0a;
    stim[13] = 5'h00;
    stim[14] = 5'h03;
    stim[15] = 5'h02;
    stim[16] = 5'h04;
    stim[17] = 5'h08;
    stim[18] = 5'h01;
    stim[19] = 5'h0a;
    stim[20] = 5'h08;
    stim[21] = 5'h0b;
    stim[22] = 5'h01;
    stim[23] = 5'h0e;
    stim[24] = 5'h09;
    stim[25] = 5'h0b;
    stim[26] = 5'h09;
    stim[27] = 5'h0d;
    stim[28] = 5'h03;
    stim[29] = 5'h0a;
    stim[30] = 5'h0b;
    stim[31] = 5'h04;
    stim[32] = 5'h09;
    stim[33] = 5'h0a;
    stim[34] = 5'h05;
    stim[35] = 5'h08;
    stim[36] = 5'h0c;
    stim[37] = 5'h0c;
    stim[38] = 5'h02;
    stim[39] = 5'h00;
    stim[40] = 5'h05;
    stim[41] = 5'h10;
    stim[42] = 5'h0d;
    stim[43] = 5'h01;
    stim[44] = 5'h05;
    stim[45] = 5'h00;
    stim[46] = 5'h0d;
    stim[47] = 5'h11;
    stim[48] = 5'h02;
    stim[49] = 5'h01;
    stim[50] = 5'h0b;
    stim[51] = 5'h08;
    stim[52] = 5'h05;
    stim[53] = 5'h07;
    stim[54] = 5'h06;
    stim[55] = 5'h07;
    stim[56] = 5'h0e;
    stim[57] = 5'h0f;
    stim[58] = 5'h03;
    stim[59] = 5'h0b;
    stim[60] = 5'h01;
    stim[61] = 5'h0a;
    stim[62] = 5'h0a;
    stim[63] = 5'h0b;
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
      expv[0] = 4'h7;
      expv[1] = 4'h7;
      expv[2] = 4'h7;
      expv[3] = 4'h6;
      expv[4] = 4'h7;
      expv[5] = 4'hf;
      expv[6] = 4'h7;
      expv[7] = 4'h8;
      expv[8] = 4'hf;
      expv[9] = 4'hb;
      expv[10] = 4'h7;
      expv[11] = 4'h7;
      expv[12] = 4'h7;
      expv[13] = 4'hf;
      expv[14] = 4'h7;
      expv[15] = 4'h6;
      expv[16] = 4'h7;
      expv[17] = 4'h7;
      expv[18] = 4'hf;
      expv[19] = 4'h7;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'he;
      expv[23] = 4'h7;
      expv[24] = 4'h9;
      expv[25] = 4'hf;
      expv[26] = 4'he;
      expv[27] = 4'hf;
      expv[28] = 4'hb;
      expv[29] = 4'h6;
      expv[30] = 4'hf;
      expv[31] = 4'he;
      expv[32] = 4'h7;
      expv[33] = 4'hf;
      expv[34] = 4'hf;
      expv[35] = 4'h7;
      expv[36] = 4'hf;
      expv[37] = 4'hb;
      expv[38] = 4'hb;
      expv[39] = 4'h7;
      expv[40] = 4'h7;
      expv[41] = 4'h7;
      expv[42] = 4'h7;
      expv[43] = 4'hb;
      expv[44] = 4'h7;
      expv[45] = 4'h7;
      expv[46] = 4'h7;
      expv[47] = 4'h7;
      expv[48] = 4'h7;
      expv[49] = 4'h7;
      expv[50] = 4'h7;
      expv[51] = 4'he;
      expv[52] = 4'hf;
      expv[53] = 4'h7;
      expv[54] = 4'h4;
      expv[55] = 4'h5;
      expv[56] = 4'h4;
      expv[57] = 4'h9;
      expv[58] = 4'h8;
      expv[59] = 4'h6;
      expv[60] = 4'he;
      expv[61] = 4'h7;
      expv[62] = 4'hf;
      expv[63] = 4'hf;
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
