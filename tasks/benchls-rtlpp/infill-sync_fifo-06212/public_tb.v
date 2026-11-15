// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06212 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h45f;
    stim[1] = 11'h0ff;
    stim[2] = 11'h7b0;
    stim[3] = 11'h464;
    stim[4] = 11'h7b2;
    stim[5] = 11'h028;
    stim[6] = 11'h6ee;
    stim[7] = 11'h7f2;
    stim[8] = 11'h338;
    stim[9] = 11'h762;
    stim[10] = 11'h716;
    stim[11] = 11'h3d0;
    stim[12] = 11'h79e;
    stim[13] = 11'h51b;
    stim[14] = 11'h046;
    stim[15] = 11'h202;
    stim[16] = 11'h6e7;
    stim[17] = 11'h608;
    stim[18] = 11'h094;
    stim[19] = 11'h4ce;
    stim[20] = 11'h2f8;
    stim[21] = 11'h33e;
    stim[22] = 11'h4a2;
    stim[23] = 11'h77a;
    stim[24] = 11'h442;
    stim[25] = 11'h1d0;
    stim[26] = 11'h0be;
    stim[27] = 11'h74a;
    stim[28] = 11'h302;
    stim[29] = 11'h1f8;
    stim[30] = 11'h436;
    stim[31] = 11'h0f6;
    stim[32] = 11'h6ae;
    stim[33] = 11'h036;
    stim[34] = 11'h376;
    stim[35] = 11'h24a;
    stim[36] = 11'h5ce;
    stim[37] = 11'h296;
    stim[38] = 11'h5ea;
    stim[39] = 11'h27e;
    stim[40] = 11'h4d0;
    stim[41] = 11'h6e8;
    stim[42] = 11'h3d0;
    stim[43] = 11'h1b4;
    stim[44] = 11'h49c;
    stim[45] = 11'h7bc;
    stim[46] = 11'h20e;
    stim[47] = 11'h05e;
    stim[48] = 11'h55e;
    stim[49] = 11'h30a;
    stim[50] = 11'h134;
    stim[51] = 11'h7fe;
    stim[52] = 11'h486;
    stim[53] = 11'h716;
    stim[54] = 11'h39c;
    stim[55] = 11'h540;
    stim[56] = 11'h3cc;
    stim[57] = 11'h3ea;
    stim[58] = 11'h556;
    stim[59] = 11'h43a;
    stim[60] = 11'h52c;
    stim[61] = 11'h28e;
    stim[62] = 11'h2d3;
    stim[63] = 11'h4bc;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h002;
      expv[4] = 10'h000;
      expv[5] = 10'h232;
      expv[6] = 10'h232;
      expv[7] = 10'h232;
      expv[8] = 10'h232;
      expv[9] = 10'h232;
      expv[10] = 10'h232;
      expv[11] = 10'h232;
      expv[12] = 10'h232;
      expv[13] = 10'h002;
      expv[14] = 10'h002;
      expv[15] = 10'h002;
      expv[16] = 10'h002;
      expv[17] = 10'h002;
      expv[18] = 10'h002;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h04a;
      expv[24] = 10'h04a;
      expv[25] = 10'h04a;
      expv[26] = 10'h04a;
      expv[27] = 10'h04a;
      expv[28] = 10'h04a;
      expv[29] = 10'h04a;
      expv[30] = 10'h04a;
      expv[31] = 10'h04a;
      expv[32] = 10'h04a;
      expv[33] = 10'h04a;
      expv[34] = 10'h04a;
      expv[35] = 10'h04a;
      expv[36] = 10'h04a;
      expv[37] = 10'h04a;
      expv[38] = 10'h04a;
      expv[39] = 10'h04a;
      expv[40] = 10'h04a;
      expv[41] = 10'h04a;
      expv[42] = 10'h04a;
      expv[43] = 10'h04a;
      expv[44] = 10'h048;
      expv[45] = 10'h048;
      expv[46] = 10'h048;
      expv[47] = 10'h048;
      expv[48] = 10'h048;
      expv[49] = 10'h048;
      expv[50] = 10'h0d8;
      expv[51] = 10'h0d8;
      expv[52] = 10'h0d8;
      expv[53] = 10'h0d8;
      expv[54] = 10'h0d8;
      expv[55] = 10'h0d8;
      expv[56] = 10'h0d8;
      expv[57] = 10'h0d8;
      expv[58] = 10'h24c;
      expv[59] = 10'h24c;
      expv[60] = 10'h3dc;
      expv[61] = 10'h3dc;
      expv[62] = 10'h002;
      expv[63] = 10'h002;
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
