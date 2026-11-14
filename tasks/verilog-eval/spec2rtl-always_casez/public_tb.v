// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[7:0]),
    .pos(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hd8;
    stim[1] = 8'he7;
    stim[2] = 8'hc8;
    stim[3] = 8'hfe;
    stim[4] = 8'he3;
    stim[5] = 8'h8f;
    stim[6] = 8'h05;
    stim[7] = 8'h86;
    stim[8] = 8'h55;
    stim[9] = 8'hcc;
    stim[10] = 8'h70;
    stim[11] = 8'hd8;
    stim[12] = 8'h2a;
    stim[13] = 8'hc5;
    stim[14] = 8'h3a;
    stim[15] = 8'hb7;
    stim[16] = 8'hea;
    stim[17] = 8'hd6;
    stim[18] = 8'h49;
    stim[19] = 8'h69;
    stim[20] = 8'h7e;
    stim[21] = 8'h30;
    stim[22] = 8'h15;
    stim[23] = 8'h72;
    stim[24] = 8'h5c;
    stim[25] = 8'h72;
    stim[26] = 8'h9d;
    stim[27] = 8'h83;
    stim[28] = 8'hcc;
    stim[29] = 8'h88;
    stim[30] = 8'h1c;
    stim[31] = 8'h42;
    stim[32] = 8'h2a;
    stim[33] = 8'hb7;
    stim[34] = 8'h01;
    stim[35] = 8'h5f;
    stim[36] = 8'h2a;
    stim[37] = 8'h46;
    stim[38] = 8'hfa;
    stim[39] = 8'hec;
    stim[40] = 8'h09;
    stim[41] = 8'h56;
    stim[42] = 8'h47;
    stim[43] = 8'h6a;
    stim[44] = 8'he2;
    stim[45] = 8'hae;
    stim[46] = 8'heb;
    stim[47] = 8'h11;
    stim[48] = 8'h66;
    stim[49] = 8'h73;
    stim[50] = 8'he1;
    stim[51] = 8'h0a;
    stim[52] = 8'hb0;
    stim[53] = 8'h52;
    stim[54] = 8'h6b;
    stim[55] = 8'h50;
    stim[56] = 8'h60;
    stim[57] = 8'h77;
    stim[58] = 8'hf4;
    stim[59] = 8'hd5;
    stim[60] = 8'hc8;
    stim[61] = 8'had;
    stim[62] = 8'h27;
    stim[63] = 8'h3e;
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
      expv[0] = 3'h3;
      expv[1] = 3'h0;
      expv[2] = 3'h3;
      expv[3] = 3'h1;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h1;
      expv[8] = 3'h0;
      expv[9] = 3'h2;
      expv[10] = 3'h4;
      expv[11] = 3'h3;
      expv[12] = 3'h1;
      expv[13] = 3'h0;
      expv[14] = 3'h1;
      expv[15] = 3'h0;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h1;
      expv[21] = 3'h4;
      expv[22] = 3'h0;
      expv[23] = 3'h1;
      expv[24] = 3'h2;
      expv[25] = 3'h1;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h2;
      expv[29] = 3'h3;
      expv[30] = 3'h2;
      expv[31] = 3'h1;
      expv[32] = 3'h1;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h1;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h2;
      expv[40] = 3'h0;
      expv[41] = 3'h1;
      expv[42] = 3'h0;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h1;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h1;
      expv[52] = 3'h4;
      expv[53] = 3'h1;
      expv[54] = 3'h0;
      expv[55] = 3'h4;
      expv[56] = 3'h5;
      expv[57] = 3'h0;
      expv[58] = 3'h2;
      expv[59] = 3'h0;
      expv[60] = 3'h3;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h1;
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
