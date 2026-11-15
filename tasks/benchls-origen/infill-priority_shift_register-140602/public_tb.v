// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140602 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .enable(in_vec[9:9]),
    .load(in_vec[8:8]),
    .data_in(in_vec[7:4]),
    .priority_in(in_vec[3:0]),
    .final_output(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h0fd;
    stim[1] = 11'h0f7;
    stim[2] = 11'h496;
    stim[3] = 11'h5d0;
    stim[4] = 11'h5b1;
    stim[5] = 11'h721;
    stim[6] = 11'h492;
    stim[7] = 11'h778;
    stim[8] = 11'h6ea;
    stim[9] = 11'h469;
    stim[10] = 11'h6be;
    stim[11] = 11'h551;
    stim[12] = 11'h74e;
    stim[13] = 11'h726;
    stim[14] = 11'h43e;
    stim[15] = 11'h5a5;
    stim[16] = 11'h6fe;
    stim[17] = 11'h600;
    stim[18] = 11'h4fe;
    stim[19] = 11'h452;
    stim[20] = 11'h7bb;
    stim[21] = 11'h456;
    stim[22] = 11'h4a8;
    stim[23] = 11'h5ce;
    stim[24] = 11'h5f9;
    stim[25] = 11'h74c;
    stim[26] = 11'h4d9;
    stim[27] = 11'h7f4;
    stim[28] = 11'h62c;
    stim[29] = 11'h793;
    stim[30] = 11'h73f;
    stim[31] = 11'h68b;
    stim[32] = 11'h4c9;
    stim[33] = 11'h406;
    stim[34] = 11'h45b;
    stim[35] = 11'h4ec;
    stim[36] = 11'h703;
    stim[37] = 11'h7f8;
    stim[38] = 11'h65e;
    stim[39] = 11'h6b3;
    stim[40] = 11'h5cb;
    stim[41] = 11'h6d6;
    stim[42] = 11'h6d1;
    stim[43] = 11'h788;
    stim[44] = 11'h530;
    stim[45] = 11'h728;
    stim[46] = 11'h4e2;
    stim[47] = 11'h641;
    stim[48] = 11'h429;
    stim[49] = 11'h708;
    stim[50] = 11'h32a;
    stim[51] = 11'h4ce;
    stim[52] = 11'h52c;
    stim[53] = 11'h6db;
    stim[54] = 11'h580;
    stim[55] = 11'h53a;
    stim[56] = 11'h448;
    stim[57] = 11'h6b5;
    stim[58] = 11'h33c;
    stim[59] = 11'h501;
    stim[60] = 11'h562;
    stim[61] = 11'h554;
    stim[62] = 11'h66d;
    stim[63] = 11'h634;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h1;
      expv[4] = 4'h0;
      expv[5] = 4'h3;
      expv[6] = 4'h3;
      expv[7] = 4'h1;
      expv[8] = 4'h2;
      expv[9] = 4'h4;
      expv[10] = 4'h3;
      expv[11] = 4'h3;
      expv[12] = 4'h3;
      expv[13] = 4'h3;
      expv[14] = 4'h1;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'h2;
      expv[18] = 4'h1;
      expv[19] = 4'h1;
      expv[20] = 4'h2;
      expv[21] = 4'h1;
      expv[22] = 4'h4;
      expv[23] = 4'h3;
      expv[24] = 4'h3;
      expv[25] = 4'h2;
      expv[26] = 4'h4;
      expv[27] = 4'h2;
      expv[28] = 4'h1;
      expv[29] = 4'h4;
      expv[30] = 4'h3;
      expv[31] = 4'h2;
      expv[32] = 4'h3;
      expv[33] = 4'h3;
      expv[34] = 4'h2;
      expv[35] = 4'h3;
      expv[36] = 4'h3;
      expv[37] = 4'h2;
      expv[38] = 4'h1;
      expv[39] = 4'h4;
      expv[40] = 4'h3;
      expv[41] = 4'h2;
      expv[42] = 4'h2;
      expv[43] = 4'h2;
      expv[44] = 4'h1;
      expv[45] = 4'h1;
      expv[46] = 4'h3;
      expv[47] = 4'h1;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h1;
      expv[53] = 4'h1;
      expv[54] = 4'h2;
      expv[55] = 4'h1;
      expv[56] = 4'h1;
      expv[57] = 4'h3;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h1;
      expv[61] = 4'h1;
      expv[62] = 4'h2;
      expv[63] = 4'h3;
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
