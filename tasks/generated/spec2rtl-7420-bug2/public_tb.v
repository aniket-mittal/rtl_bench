// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .p1a(in_vec[7:7]),
    .p1b(in_vec[6:6]),
    .p1c(in_vec[5:5]),
    .p1d(in_vec[4:4]),
    .p2a(in_vec[3:3]),
    .p2b(in_vec[2:2]),
    .p2c(in_vec[1:1]),
    .p2d(in_vec[0:0]),
    .p1y(out_vec[1:1]),
    .p2y(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc0;
    stim[1] = 8'h99;
    stim[2] = 8'ha9;
    stim[3] = 8'hb3;
    stim[4] = 8'h4d;
    stim[5] = 8'h36;
    stim[6] = 8'h4a;
    stim[7] = 8'h60;
    stim[8] = 8'h2d;
    stim[9] = 8'h48;
    stim[10] = 8'h0f;
    stim[11] = 8'h32;
    stim[12] = 8'he0;
    stim[13] = 8'hf9;
    stim[14] = 8'hb4;
    stim[15] = 8'hbf;
    stim[16] = 8'h2b;
    stim[17] = 8'h79;
    stim[18] = 8'hf1;
    stim[19] = 8'hd8;
    stim[20] = 8'h98;
    stim[21] = 8'h55;
    stim[22] = 8'h8b;
    stim[23] = 8'hf4;
    stim[24] = 8'hd7;
    stim[25] = 8'h8d;
    stim[26] = 8'h43;
    stim[27] = 8'hfa;
    stim[28] = 8'h1a;
    stim[29] = 8'h38;
    stim[30] = 8'haf;
    stim[31] = 8'h29;
    stim[32] = 8'h07;
    stim[33] = 8'hc3;
    stim[34] = 8'h6f;
    stim[35] = 8'h32;
    stim[36] = 8'hf2;
    stim[37] = 8'h5a;
    stim[38] = 8'h87;
    stim[39] = 8'hed;
    stim[40] = 8'hff;
    stim[41] = 8'hb2;
    stim[42] = 8'hfa;
    stim[43] = 8'h15;
    stim[44] = 8'h32;
    stim[45] = 8'h18;
    stim[46] = 8'h3d;
    stim[47] = 8'hf1;
    stim[48] = 8'hc1;
    stim[49] = 8'h55;
    stim[50] = 8'hb9;
    stim[51] = 8'h56;
    stim[52] = 8'h91;
    stim[53] = 8'h31;
    stim[54] = 8'hdd;
    stim[55] = 8'h76;
    stim[56] = 8'h2a;
    stim[57] = 8'hc7;
    stim[58] = 8'h69;
    stim[59] = 8'h42;
    stim[60] = 8'hfe;
    stim[61] = 8'hd3;
    stim[62] = 8'h23;
    stim[63] = 8'h74;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h3;
      expv[3] = 2'h3;
      expv[4] = 2'h3;
      expv[5] = 2'h3;
      expv[6] = 2'h3;
      expv[7] = 2'h3;
      expv[8] = 2'h3;
      expv[9] = 2'h3;
      expv[10] = 2'h2;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h1;
      expv[14] = 2'h3;
      expv[15] = 2'h2;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h3;
      expv[21] = 2'h3;
      expv[22] = 2'h3;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h1;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h2;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h3;
      expv[34] = 2'h2;
      expv[35] = 2'h3;
      expv[36] = 2'h1;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h0;
      expv[41] = 2'h3;
      expv[42] = 2'h1;
      expv[43] = 2'h3;
      expv[44] = 2'h3;
      expv[45] = 2'h3;
      expv[46] = 2'h3;
      expv[47] = 2'h1;
      expv[48] = 2'h3;
      expv[49] = 2'h3;
      expv[50] = 2'h3;
      expv[51] = 2'h3;
      expv[52] = 2'h3;
      expv[53] = 2'h3;
      expv[54] = 2'h1;
      expv[55] = 2'h3;
      expv[56] = 2'h3;
      expv[57] = 2'h3;
      expv[58] = 2'h3;
      expv[59] = 2'h3;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h3;
      expv[63] = 2'h3;
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
