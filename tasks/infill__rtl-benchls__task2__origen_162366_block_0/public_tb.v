// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162366 dut (
    .Input(in_vec[5:4]),
    .Present_State(in_vec[3:0]),
    .Next_State(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h33;
    stim[1] = 6'h19;
    stim[2] = 6'h2f;
    stim[3] = 6'h28;
    stim[4] = 6'h34;
    stim[5] = 6'h24;
    stim[6] = 6'h25;
    stim[7] = 6'h09;
    stim[8] = 6'h2e;
    stim[9] = 6'h0f;
    stim[10] = 6'h02;
    stim[11] = 6'h27;
    stim[12] = 6'h03;
    stim[13] = 6'h01;
    stim[14] = 6'h14;
    stim[15] = 6'h38;
    stim[16] = 6'h17;
    stim[17] = 6'h3f;
    stim[18] = 6'h2c;
    stim[19] = 6'h05;
    stim[20] = 6'h33;
    stim[21] = 6'h33;
    stim[22] = 6'h3f;
    stim[23] = 6'h3c;
    stim[24] = 6'h2b;
    stim[25] = 6'h36;
    stim[26] = 6'h00;
    stim[27] = 6'h09;
    stim[28] = 6'h0a;
    stim[29] = 6'h14;
    stim[30] = 6'h3e;
    stim[31] = 6'h08;
    stim[32] = 6'h3b;
    stim[33] = 6'h09;
    stim[34] = 6'h11;
    stim[35] = 6'h20;
    stim[36] = 6'h37;
    stim[37] = 6'h08;
    stim[38] = 6'h24;
    stim[39] = 6'h2f;
    stim[40] = 6'h33;
    stim[41] = 6'h1e;
    stim[42] = 6'h23;
    stim[43] = 6'h29;
    stim[44] = 6'h3b;
    stim[45] = 6'h1c;
    stim[46] = 6'h06;
    stim[47] = 6'h0d;
    stim[48] = 6'h25;
    stim[49] = 6'h21;
    stim[50] = 6'h07;
    stim[51] = 6'h25;
    stim[52] = 6'h25;
    stim[53] = 6'h19;
    stim[54] = 6'h31;
    stim[55] = 6'h36;
    stim[56] = 6'h16;
    stim[57] = 6'h1b;
    stim[58] = 6'h3a;
    stim[59] = 6'h39;
    stim[60] = 6'h1a;
    stim[61] = 6'h06;
    stim[62] = 6'h1d;
    stim[63] = 6'h3f;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'h4;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'h1;
      expv[6] = 4'h2;
      expv[7] = 4'hf;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'hf;
      expv[11] = 4'h7;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'h5;
      expv[15] = 4'hf;
      expv[16] = 4'h7;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'hf;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'hf;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'hf;
      expv[28] = 4'hf;
      expv[29] = 4'h5;
      expv[30] = 4'hf;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'hf;
      expv[34] = 4'h2;
      expv[35] = 4'h1;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'h1;
      expv[39] = 4'h4;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'h4;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'hf;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'hf;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'h3;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
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
