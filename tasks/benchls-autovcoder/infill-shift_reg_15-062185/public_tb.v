// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062185 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h5889;
    stim[1] = 15'h7de6;
    stim[2] = 15'h1264;
    stim[3] = 15'h09e5;
    stim[4] = 15'h1b1c;
    stim[5] = 15'h42f0;
    stim[6] = 15'h5361;
    stim[7] = 15'h2fe3;
    stim[8] = 15'h4eb7;
    stim[9] = 15'h390d;
    stim[10] = 15'h1dbc;
    stim[11] = 15'h151b;
    stim[12] = 15'h33a5;
    stim[13] = 15'h57c4;
    stim[14] = 15'h6894;
    stim[15] = 15'h745b;
    stim[16] = 15'h5625;
    stim[17] = 15'h4418;
    stim[18] = 15'h2670;
    stim[19] = 15'h36b5;
    stim[20] = 15'h1887;
    stim[21] = 15'h19b6;
    stim[22] = 15'h1302;
    stim[23] = 15'h12a5;
    stim[24] = 15'h0f0e;
    stim[25] = 15'h4fbc;
    stim[26] = 15'h3525;
    stim[27] = 15'h557d;
    stim[28] = 15'h08b9;
    stim[29] = 15'h3fc9;
    stim[30] = 15'h48d1;
    stim[31] = 15'h34dc;
    stim[32] = 15'h11b0;
    stim[33] = 15'h02a2;
    stim[34] = 15'h7a02;
    stim[35] = 15'h5058;
    stim[36] = 15'h0128;
    stim[37] = 15'h7fa0;
    stim[38] = 15'h7e02;
    stim[39] = 15'h0dd7;
    stim[40] = 15'h29e1;
    stim[41] = 15'h001b;
    stim[42] = 15'h7c4f;
    stim[43] = 15'h11a1;
    stim[44] = 15'h236b;
    stim[45] = 15'h378a;
    stim[46] = 15'h2f99;
    stim[47] = 15'h099d;
    stim[48] = 15'h2cbf;
    stim[49] = 15'h4ff0;
    stim[50] = 15'h1587;
    stim[51] = 15'h17d3;
    stim[52] = 15'h6457;
    stim[53] = 15'h240f;
    stim[54] = 15'h6066;
    stim[55] = 15'h010b;
    stim[56] = 15'h48db;
    stim[57] = 15'h1bbe;
    stim[58] = 15'h52af;
    stim[59] = 15'h463b;
    stim[60] = 15'h1b35;
    stim[61] = 15'h40a0;
    stim[62] = 15'h6d76;
    stim[63] = 15'h09ae;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h5889;
      expv[2] = 15'h7de6;
      expv[3] = 15'h1264;
      expv[4] = 15'h09e5;
      expv[5] = 15'h1b1c;
      expv[6] = 15'h42f0;
      expv[7] = 15'h5361;
      expv[8] = 15'h2fe3;
      expv[9] = 15'h4eb7;
      expv[10] = 15'h390d;
      expv[11] = 15'h1dbc;
      expv[12] = 15'h151b;
      expv[13] = 15'h33a5;
      expv[14] = 15'h57c4;
      expv[15] = 15'h6894;
      expv[16] = 15'h745b;
      expv[17] = 15'h5625;
      expv[18] = 15'h4418;
      expv[19] = 15'h2670;
      expv[20] = 15'h36b5;
      expv[21] = 15'h1887;
      expv[22] = 15'h19b6;
      expv[23] = 15'h1302;
      expv[24] = 15'h12a5;
      expv[25] = 15'h0f0e;
      expv[26] = 15'h4fbc;
      expv[27] = 15'h3525;
      expv[28] = 15'h557d;
      expv[29] = 15'h08b9;
      expv[30] = 15'h3fc9;
      expv[31] = 15'h48d1;
      expv[32] = 15'h34dc;
      expv[33] = 15'h11b0;
      expv[34] = 15'h02a2;
      expv[35] = 15'h7a02;
      expv[36] = 15'h5058;
      expv[37] = 15'h0128;
      expv[38] = 15'h7fa0;
      expv[39] = 15'h7e02;
      expv[40] = 15'h0dd7;
      expv[41] = 15'h29e1;
      expv[42] = 15'h001b;
      expv[43] = 15'h7c4f;
      expv[44] = 15'h11a1;
      expv[45] = 15'h236b;
      expv[46] = 15'h378a;
      expv[47] = 15'h2f99;
      expv[48] = 15'h099d;
      expv[49] = 15'h2cbf;
      expv[50] = 15'h4ff0;
      expv[51] = 15'h1587;
      expv[52] = 15'h17d3;
      expv[53] = 15'h6457;
      expv[54] = 15'h240f;
      expv[55] = 15'h6066;
      expv[56] = 15'h010b;
      expv[57] = 15'h48db;
      expv[58] = 15'h1bbe;
      expv[59] = 15'h52af;
      expv[60] = 15'h463b;
      expv[61] = 15'h1b35;
      expv[62] = 15'h40a0;
      expv[63] = 15'h6d76;
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
