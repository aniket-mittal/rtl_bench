// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_085524 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .userin(in_vec[13:8]),
    .count(in_vec[7:0]),
    .userinOut(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h66ae;
    stim[1] = 15'h7f4b;
    stim[2] = 15'h0841;
    stim[3] = 15'h5c70;
    stim[4] = 15'h2e1c;
    stim[5] = 15'h313c;
    stim[6] = 15'h0696;
    stim[7] = 15'h3284;
    stim[8] = 15'h123b;
    stim[9] = 15'h3524;
    stim[10] = 15'h1708;
    stim[11] = 15'h324d;
    stim[12] = 15'h3f6d;
    stim[13] = 15'h28dc;
    stim[14] = 15'h029a;
    stim[15] = 15'h09cb;
    stim[16] = 15'h03b2;
    stim[17] = 15'h2cb5;
    stim[18] = 15'h381c;
    stim[19] = 15'h3b41;
    stim[20] = 15'h29a2;
    stim[21] = 15'h3915;
    stim[22] = 15'h3c26;
    stim[23] = 15'h1fc3;
    stim[24] = 15'h35e6;
    stim[25] = 15'h0606;
    stim[26] = 15'h3478;
    stim[27] = 15'h376a;
    stim[28] = 15'h2947;
    stim[29] = 15'h2b38;
    stim[30] = 15'h3f6b;
    stim[31] = 15'h112f;
    stim[32] = 15'h00ca;
    stim[33] = 15'h02fa;
    stim[34] = 15'h0232;
    stim[35] = 15'h13aa;
    stim[36] = 15'h3edc;
    stim[37] = 15'h1ed8;
    stim[38] = 15'h387a;
    stim[39] = 15'h2636;
    stim[40] = 15'h3c0e;
    stim[41] = 15'h3706;
    stim[42] = 15'h30be;
    stim[43] = 15'h0155;
    stim[44] = 15'h3d38;
    stim[45] = 15'h2276;
    stim[46] = 15'h3f85;
    stim[47] = 15'h0c6e;
    stim[48] = 15'h2136;
    stim[49] = 15'h3168;
    stim[50] = 15'h086a;
    stim[51] = 15'h19a2;
    stim[52] = 15'h31b8;
    stim[53] = 15'h14f1;
    stim[54] = 15'h17a6;
    stim[55] = 15'h1b94;
    stim[56] = 15'h0674;
    stim[57] = 15'h273a;
    stim[58] = 15'h0976;
    stim[59] = 15'h3f6e;
    stim[60] = 15'h1eb8;
    stim[61] = 15'h2f26;
    stim[62] = 15'h05f0;
    stim[63] = 15'h0062;
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
      expv[0] = 6'h00;
      expv[1] = 6'h26;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
