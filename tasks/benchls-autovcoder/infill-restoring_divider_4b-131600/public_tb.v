// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_131600 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .start(in_vec[8:8]),
    .dividend(in_vec[7:4]),
    .divisor(in_vec[3:0]),
    .quotient(out_vec[8:5]),
    .remainder(out_vec[4:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h24c;
    stim[1] = 10'h2a2;
    stim[2] = 10'h0e5;
    stim[3] = 10'h18b;
    stim[4] = 10'h0da;
    stim[5] = 10'h072;
    stim[6] = 10'h1ba;
    stim[7] = 10'h175;
    stim[8] = 10'h17a;
    stim[9] = 10'h0d5;
    stim[10] = 10'h0b1;
    stim[11] = 10'h078;
    stim[12] = 10'h0ac;
    stim[13] = 10'h09b;
    stim[14] = 10'h07e;
    stim[15] = 10'h1ce;
    stim[16] = 10'h108;
    stim[17] = 10'h131;
    stim[18] = 10'h15a;
    stim[19] = 10'h042;
    stim[20] = 10'h024;
    stim[21] = 10'h09b;
    stim[22] = 10'h1c7;
    stim[23] = 10'h105;
    stim[24] = 10'h110;
    stim[25] = 10'h00a;
    stim[26] = 10'h07d;
    stim[27] = 10'h08b;
    stim[28] = 10'h1c3;
    stim[29] = 10'h008;
    stim[30] = 10'h102;
    stim[31] = 10'h0c1;
    stim[32] = 10'h122;
    stim[33] = 10'h03b;
    stim[34] = 10'h05f;
    stim[35] = 10'h0dc;
    stim[36] = 10'h1cc;
    stim[37] = 10'h0b2;
    stim[38] = 10'h06d;
    stim[39] = 10'h0db;
    stim[40] = 10'h0bb;
    stim[41] = 10'h0db;
    stim[42] = 10'h0dc;
    stim[43] = 10'h1e2;
    stim[44] = 10'h06b;
    stim[45] = 10'h0b1;
    stim[46] = 10'h047;
    stim[47] = 10'h0bc;
    stim[48] = 10'h0a9;
    stim[49] = 10'h086;
    stim[50] = 10'h039;
    stim[51] = 10'h0ab;
    stim[52] = 10'h03b;
    stim[53] = 10'h106;
    stim[54] = 10'h1ff;
    stim[55] = 10'h006;
    stim[56] = 10'h156;
    stim[57] = 10'h079;
    stim[58] = 10'h0a5;
    stim[59] = 10'h007;
    stim[60] = 10'h3c5;
    stim[61] = 10'h035;
    stim[62] = 10'h1a1;
    stim[63] = 10'h031;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'hxxx;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'h14f;
      expv[15] = 9'h14f;
      expv[16] = 9'h14e;
      expv[17] = 9'h14e;
      expv[18] = 9'h14e;
      expv[19] = 9'h14e;
      expv[20] = 9'h14e;
      expv[21] = 9'h14e;
      expv[22] = 9'h14e;
      expv[23] = 9'h14e;
      expv[24] = 9'h14e;
      expv[25] = 9'h14e;
      expv[26] = 9'h14e;
      expv[27] = 9'h14e;
      expv[28] = 9'h14e;
      expv[29] = 9'h14e;
      expv[30] = 9'h14e;
      expv[31] = 9'h14e;
      expv[32] = 9'h14e;
      expv[33] = 9'h14e;
      expv[34] = 9'h14e;
      expv[35] = 9'h14e;
      expv[36] = 9'h14e;
      expv[37] = 9'h14e;
      expv[38] = 9'h14e;
      expv[39] = 9'h14e;
      expv[40] = 9'h14e;
      expv[41] = 9'h14e;
      expv[42] = 9'h049;
      expv[43] = 9'h049;
      expv[44] = 9'h048;
      expv[45] = 9'h048;
      expv[46] = 9'h048;
      expv[47] = 9'h048;
      expv[48] = 9'h048;
      expv[49] = 9'h0bd;
      expv[50] = 9'h0bd;
      expv[51] = 9'h0bd;
      expv[52] = 9'h0bd;
      expv[53] = 9'h0bd;
      expv[54] = 9'h0bc;
      expv[55] = 9'h0bc;
      expv[56] = 9'h0bc;
      expv[57] = 9'h0bc;
      expv[58] = 9'h0bc;
      expv[59] = 9'h0bc;
      expv[60] = 9'h0bc;
      expv[61] = 9'h0bc;
      expv[62] = 9'h0bc;
      expv[63] = 9'h0bc;
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
