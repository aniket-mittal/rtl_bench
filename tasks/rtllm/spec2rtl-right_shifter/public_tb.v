// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  right_shifter dut (
    .clk(clk),
    .d(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h0;
    stim[6] = 1'h1;
    stim[7] = 1'h0;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h1;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h1;
    stim[17] = 1'h0;
    stim[18] = 1'h1;
    stim[19] = 1'h0;
    stim[20] = 1'h1;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h1;
    stim[24] = 1'h0;
    stim[25] = 1'h1;
    stim[26] = 1'h0;
    stim[27] = 1'h1;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h1;
    stim[34] = 1'h0;
    stim[35] = 1'h1;
    stim[36] = 1'h0;
    stim[37] = 1'h1;
    stim[38] = 1'h0;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h0;
    stim[43] = 1'h1;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h0;
    stim[53] = 1'h1;
    stim[54] = 1'h0;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h1;
    stim[60] = 1'h0;
    stim[61] = 1'h1;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h80;
      expv[3] = 8'h40;
      expv[4] = 8'ha0;
      expv[5] = 8'hd0;
      expv[6] = 8'h68;
      expv[7] = 8'hb4;
      expv[8] = 8'h5a;
      expv[9] = 8'had;
      expv[10] = 8'hd6;
      expv[11] = 8'h6b;
      expv[12] = 8'h35;
      expv[13] = 8'h1a;
      expv[14] = 8'h8d;
      expv[15] = 8'h46;
      expv[16] = 8'h23;
      expv[17] = 8'h91;
      expv[18] = 8'h48;
      expv[19] = 8'ha4;
      expv[20] = 8'h52;
      expv[21] = 8'ha9;
      expv[22] = 8'h54;
      expv[23] = 8'h2a;
      expv[24] = 8'h95;
      expv[25] = 8'h4a;
      expv[26] = 8'ha5;
      expv[27] = 8'h52;
      expv[28] = 8'ha9;
      expv[29] = 8'h54;
      expv[30] = 8'h2a;
      expv[31] = 8'h15;
      expv[32] = 8'h0a;
      expv[33] = 8'h05;
      expv[34] = 8'h82;
      expv[35] = 8'h41;
      expv[36] = 8'ha0;
      expv[37] = 8'h50;
      expv[38] = 8'ha8;
      expv[39] = 8'h54;
      expv[40] = 8'haa;
      expv[41] = 8'hd5;
      expv[42] = 8'hea;
      expv[43] = 8'h75;
      expv[44] = 8'hba;
      expv[45] = 8'h5d;
      expv[46] = 8'h2e;
      expv[47] = 8'h17;
      expv[48] = 8'h8b;
      expv[49] = 8'hc5;
      expv[50] = 8'he2;
      expv[51] = 8'hf1;
      expv[52] = 8'hf8;
      expv[53] = 8'h7c;
      expv[54] = 8'hbe;
      expv[55] = 8'h5f;
      expv[56] = 8'haf;
      expv[57] = 8'hd7;
      expv[58] = 8'h6b;
      expv[59] = 8'h35;
      expv[60] = 8'h9a;
      expv[61] = 8'h4d;
      expv[62] = 8'ha6;
      expv[63] = 8'h53;
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
