// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109496 dut (
    .clock(clk),
    .q(in_vec[5:1]),
    .seconds2(in_vec[0:0]),
    .memoryselect_clip_1(out_vec[5:4]),
    .timer(out_vec[3:3]),
    .seriena(out_vec[2:2]),
    .creset(out_vec[1:1]),
    .deseriena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h16;
    stim[1] = 6'h29;
    stim[2] = 6'h38;
    stim[3] = 6'h29;
    stim[4] = 6'h1e;
    stim[5] = 6'h25;
    stim[6] = 6'h16;
    stim[7] = 6'h33;
    stim[8] = 6'h0f;
    stim[9] = 6'h18;
    stim[10] = 6'h02;
    stim[11] = 6'h17;
    stim[12] = 6'h23;
    stim[13] = 6'h37;
    stim[14] = 6'h2b;
    stim[15] = 6'h1d;
    stim[16] = 6'h01;
    stim[17] = 6'h26;
    stim[18] = 6'h0a;
    stim[19] = 6'h16;
    stim[20] = 6'h3d;
    stim[21] = 6'h26;
    stim[22] = 6'h3c;
    stim[23] = 6'h23;
    stim[24] = 6'h01;
    stim[25] = 6'h3f;
    stim[26] = 6'h18;
    stim[27] = 6'h1c;
    stim[28] = 6'h2a;
    stim[29] = 6'h24;
    stim[30] = 6'h3e;
    stim[31] = 6'h38;
    stim[32] = 6'h1f;
    stim[33] = 6'h22;
    stim[34] = 6'h10;
    stim[35] = 6'h16;
    stim[36] = 6'h19;
    stim[37] = 6'h2f;
    stim[38] = 6'h11;
    stim[39] = 6'h35;
    stim[40] = 6'h1b;
    stim[41] = 6'h00;
    stim[42] = 6'h26;
    stim[43] = 6'h05;
    stim[44] = 6'h06;
    stim[45] = 6'h1c;
    stim[46] = 6'h20;
    stim[47] = 6'h25;
    stim[48] = 6'h31;
    stim[49] = 6'h34;
    stim[50] = 6'h1f;
    stim[51] = 6'h0e;
    stim[52] = 6'h0a;
    stim[53] = 6'h22;
    stim[54] = 6'h19;
    stim[55] = 6'h0c;
    stim[56] = 6'h26;
    stim[57] = 6'h27;
    stim[58] = 6'h2b;
    stim[59] = 6'h03;
    stim[60] = 6'h21;
    stim[61] = 6'h01;
    stim[62] = 6'h00;
    stim[63] = 6'h1d;
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
      expv[0] = 6'hxx;
      expv[1] = 6'h02;
      expv[2] = 6'h02;
      expv[3] = 6'h39;
      expv[4] = 6'h02;
      expv[5] = 6'h19;
      expv[6] = 6'h02;
      expv[7] = 6'h19;
      expv[8] = 6'h02;
      expv[9] = 6'h0c;
      expv[10] = 6'h0c;
      expv[11] = 6'h0c;
      expv[12] = 6'h02;
      expv[13] = 6'h02;
      expv[14] = 6'h19;
      expv[15] = 6'h02;
      expv[16] = 6'h19;
      expv[17] = 6'h02;
      expv[18] = 6'h0c;
      expv[19] = 6'h0c;
      expv[20] = 6'h0c;
      expv[21] = 6'h02;
      expv[22] = 6'h0c;
      expv[23] = 6'h0c;
      expv[24] = 6'h02;
      expv[25] = 6'h02;
      expv[26] = 6'h19;
      expv[27] = 6'h19;
      expv[28] = 6'h19;
      expv[29] = 6'h19;
      expv[30] = 6'h19;
      expv[31] = 6'h19;
      expv[32] = 6'h19;
      expv[33] = 6'h02;
      expv[34] = 6'h02;
      expv[35] = 6'h02;
      expv[36] = 6'h19;
      expv[37] = 6'h02;
      expv[38] = 6'h0c;
      expv[39] = 6'h02;
      expv[40] = 6'h19;
      expv[41] = 6'h02;
      expv[42] = 6'h02;
      expv[43] = 6'h0c;
      expv[44] = 6'h02;
      expv[45] = 6'h0c;
      expv[46] = 6'h0c;
      expv[47] = 6'h0c;
      expv[48] = 6'h02;
      expv[49] = 6'h02;
      expv[50] = 6'h19;
      expv[51] = 6'h02;
      expv[52] = 6'h0c;
      expv[53] = 6'h0c;
      expv[54] = 6'h0c;
      expv[55] = 6'h02;
      expv[56] = 6'h02;
      expv[57] = 6'h0c;
      expv[58] = 6'h02;
      expv[59] = 6'h2c;
      expv[60] = 6'h02;
      expv[61] = 6'h02;
      expv[62] = 6'h02;
      expv[63] = 6'h02;
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
