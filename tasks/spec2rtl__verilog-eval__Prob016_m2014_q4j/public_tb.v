// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .x(in_vec[7:4]),
    .y(in_vec[3:0]),
    .sum(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hfa;
    stim[1] = 8'he3;
    stim[2] = 8'h55;
    stim[3] = 8'h2d;
    stim[4] = 8'h14;
    stim[5] = 8'ha4;
    stim[6] = 8'ha7;
    stim[7] = 8'h39;
    stim[8] = 8'h18;
    stim[9] = 8'h0a;
    stim[10] = 8'h8a;
    stim[11] = 8'h68;
    stim[12] = 8'hf9;
    stim[13] = 8'hc1;
    stim[14] = 8'h43;
    stim[15] = 8'hbe;
    stim[16] = 8'hab;
    stim[17] = 8'h4d;
    stim[18] = 8'h79;
    stim[19] = 8'haa;
    stim[20] = 8'h90;
    stim[21] = 8'h73;
    stim[22] = 8'h28;
    stim[23] = 8'hfa;
    stim[24] = 8'h2f;
    stim[25] = 8'hbb;
    stim[26] = 8'h9e;
    stim[27] = 8'h32;
    stim[28] = 8'h8a;
    stim[29] = 8'h10;
    stim[30] = 8'h39;
    stim[31] = 8'h90;
    stim[32] = 8'h5f;
    stim[33] = 8'ha7;
    stim[34] = 8'hd7;
    stim[35] = 8'hc5;
    stim[36] = 8'h2d;
    stim[37] = 8'hdb;
    stim[38] = 8'ha3;
    stim[39] = 8'hb7;
    stim[40] = 8'h86;
    stim[41] = 8'hcb;
    stim[42] = 8'h4b;
    stim[43] = 8'h30;
    stim[44] = 8'h57;
    stim[45] = 8'h5b;
    stim[46] = 8'hc2;
    stim[47] = 8'hcf;
    stim[48] = 8'ha0;
    stim[49] = 8'h23;
    stim[50] = 8'h6e;
    stim[51] = 8'h58;
    stim[52] = 8'h0e;
    stim[53] = 8'hbf;
    stim[54] = 8'h6c;
    stim[55] = 8'hdc;
    stim[56] = 8'h5c;
    stim[57] = 8'h74;
    stim[58] = 8'hfb;
    stim[59] = 8'he7;
    stim[60] = 8'h8d;
    stim[61] = 8'hfb;
    stim[62] = 8'h36;
    stim[63] = 8'h20;
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
      expv[0] = 5'h19;
      expv[1] = 5'h11;
      expv[2] = 5'h0a;
      expv[3] = 5'h0f;
      expv[4] = 5'h05;
      expv[5] = 5'h0e;
      expv[6] = 5'h11;
      expv[7] = 5'h0c;
      expv[8] = 5'h09;
      expv[9] = 5'h0a;
      expv[10] = 5'h12;
      expv[11] = 5'h0e;
      expv[12] = 5'h18;
      expv[13] = 5'h0d;
      expv[14] = 5'h07;
      expv[15] = 5'h19;
      expv[16] = 5'h15;
      expv[17] = 5'h11;
      expv[18] = 5'h10;
      expv[19] = 5'h14;
      expv[20] = 5'h09;
      expv[21] = 5'h0a;
      expv[22] = 5'h0a;
      expv[23] = 5'h19;
      expv[24] = 5'h11;
      expv[25] = 5'h16;
      expv[26] = 5'h17;
      expv[27] = 5'h05;
      expv[28] = 5'h12;
      expv[29] = 5'h01;
      expv[30] = 5'h0c;
      expv[31] = 5'h09;
      expv[32] = 5'h14;
      expv[33] = 5'h11;
      expv[34] = 5'h14;
      expv[35] = 5'h11;
      expv[36] = 5'h0f;
      expv[37] = 5'h18;
      expv[38] = 5'h0d;
      expv[39] = 5'h12;
      expv[40] = 5'h0e;
      expv[41] = 5'h17;
      expv[42] = 5'h0f;
      expv[43] = 5'h03;
      expv[44] = 5'h0c;
      expv[45] = 5'h10;
      expv[46] = 5'h0e;
      expv[47] = 5'h1b;
      expv[48] = 5'h0a;
      expv[49] = 5'h05;
      expv[50] = 5'h14;
      expv[51] = 5'h0d;
      expv[52] = 5'h0e;
      expv[53] = 5'h1a;
      expv[54] = 5'h12;
      expv[55] = 5'h19;
      expv[56] = 5'h11;
      expv[57] = 5'h0b;
      expv[58] = 5'h1a;
      expv[59] = 5'h15;
      expv[60] = 5'h15;
      expv[61] = 5'h1a;
      expv[62] = 5'h09;
      expv[63] = 5'h02;
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
