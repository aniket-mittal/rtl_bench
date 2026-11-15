// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 135;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_084457 dut (
    .clk(clk),
    .data_in(in_vec[20:12]),
    .reset(in_vec[11:11]),
    .write_en(in_vec[10:10]),
    .read_en(in_vec[9:9]),
    .chiprd_en(in_vec[8:8]),
    .in_address(in_vec[7:4]),
    .out_address(in_vec[3:0]),
    .data_out(out_vec[134:126]),
    .result_out(out_vec[125:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h066f8d;
    stim[1] = 21'h1b79d4;
    stim[2] = 21'h0460c8;
    stim[3] = 21'h0a51b7;
    stim[4] = 21'h06d649;
    stim[5] = 21'h170409;
    stim[6] = 21'h056546;
    stim[7] = 21'h1b7ee4;
    stim[8] = 21'h1004e4;
    stim[9] = 21'h01e45b;
    stim[10] = 21'h082691;
    stim[11] = 21'h013712;
    stim[12] = 21'h00b164;
    stim[13] = 21'h09d251;
    stim[14] = 21'h0c071a;
    stim[15] = 21'h08a2d9;
    stim[16] = 21'h11959d;
    stim[17] = 21'h0164ac;
    stim[18] = 21'h19a0ff;
    stim[19] = 21'h033625;
    stim[20] = 21'h0ae023;
    stim[21] = 21'h1ace29;
    stim[22] = 21'h0ae7f4;
    stim[23] = 21'h0d4fa4;
    stim[24] = 21'h10d38e;
    stim[25] = 21'h17439d;
    stim[26] = 21'h1e7484;
    stim[27] = 21'h1ad60b;
    stim[28] = 21'h0e4643;
    stim[29] = 21'h0d60fc;
    stim[30] = 21'h1792c4;
    stim[31] = 21'h1576ee;
    stim[32] = 21'h1cb2b9;
    stim[33] = 21'h0ea031;
    stim[34] = 21'h1d7241;
    stim[35] = 21'h075546;
    stim[36] = 21'h1f90ca;
    stim[37] = 21'h01630a;
    stim[38] = 21'h0e51a7;
    stim[39] = 21'h08a6b4;
    stim[40] = 21'h047729;
    stim[41] = 21'h0054c3;
    stim[42] = 21'h1ed093;
    stim[43] = 21'h01e16a;
    stim[44] = 21'h0840ec;
    stim[45] = 21'h0e87d3;
    stim[46] = 21'h1e6642;
    stim[47] = 21'h0d1448;
    stim[48] = 21'h07a547;
    stim[49] = 21'h00433c;
    stim[50] = 21'h06c0d5;
    stim[51] = 21'h1675fb;
    stim[52] = 21'h16fbbc;
    stim[53] = 21'h0953f8;
    stim[54] = 21'h0ed53e;
    stim[55] = 21'h1ba73a;
    stim[56] = 21'h0445ee;
    stim[57] = 21'h1ca248;
    stim[58] = 21'h0357dc;
    stim[59] = 21'h0c7343;
    stim[60] = 21'h0ca11e;
    stim[61] = 21'h169419;
    stim[62] = 21'h1cf31a;
    stim[63] = 21'h1bb6c7;
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
      expv[0] = 135'h0000000000000000000000000000000000;
      expv[1] = 135'h0000000000000066000000000000000000;
      expv[2] = 135'h0000000000000000000000000000000000;
      expv[3] = 135'h0000000000000000000000000000000000;
      expv[4] = 135'h0000000000000000000000000000000000;
      expv[5] = 135'h0000000000000000000000000000000000;
      expv[6] = 135'h0000000000000000000000000000000000;
      expv[7] = 135'h0000000000000000000000000000000000;
      expv[8] = 135'h0000000000000000000000000000000000;
      expv[9] = 135'h0000000000000000000000000000000000;
      expv[10] = 135'h0000000000000000000000000000000000;
      expv[11] = 135'h0000000000000000000000000000000000;
      expv[12] = 135'h0000000000000000000000000000000000;
      expv[13] = 135'h0000000000000000000000000000000000;
      expv[14] = 135'h0000000000000000000000000000000000;
      expv[15] = 135'h0000000000000000000000000000000000;
      expv[16] = 135'h0000000000000000000000000000000000;
      expv[17] = 135'h0000000000000000000000000000000000;
      expv[18] = 135'h0000000000000000000000000000000000;
      expv[19] = 135'h0000000000000000000000000000000000;
      expv[20] = 135'h0000000000000000000000000000000000;
      expv[21] = 135'h0000000000000000000000000000000000;
      expv[22] = 135'h0000000000000000000000000000000000;
      expv[23] = 135'h0000000000000000000000000000000000;
      expv[24] = 135'h0000000000000000000000000000000000;
      expv[25] = 135'h0000000000000000000000000000000000;
      expv[26] = 135'h0000000000000000000000000000000000;
      expv[27] = 135'h0000000000000000000000000000000000;
      expv[28] = 135'h0000000000000000000000000000000000;
      expv[29] = 135'h0000000000000000000000000000000000;
      expv[30] = 135'h0000000000000000000000000000000000;
      expv[31] = 135'h0000000000000000000000000000000000;
      expv[32] = 135'h0000000000000000000000000000000000;
      expv[33] = 135'h0000000000000000000000000000000000;
      expv[34] = 135'h0000000000000000000000000000000000;
      expv[35] = 135'h0000000000000000000000000000000000;
      expv[36] = 135'h0000000000000000000000000000000000;
      expv[37] = 135'h0000000000000000000000000000000000;
      expv[38] = 135'h0000000000000000000000000000000000;
      expv[39] = 135'h0000000000000000000000000000000000;
      expv[40] = 135'h0000000000000000000000000000000000;
      expv[41] = 135'h0000000000000000000000000000000000;
      expv[42] = 135'h0000000000000000000000000000000000;
      expv[43] = 135'h0000000000000000000000000000000000;
      expv[44] = 135'h0000000000000000000000000000000000;
      expv[45] = 135'h0000000000000000000000000000000000;
      expv[46] = 135'h0000000000000000000000000000000000;
      expv[47] = 135'h0000000000000000000000000000000000;
      expv[48] = 135'h0000000000000000000000000000000000;
      expv[49] = 135'h0000000000000000000000000000000000;
      expv[50] = 135'h0000000000000000000000000000000000;
      expv[51] = 135'h0000000000000000000000000000000000;
      expv[52] = 135'h0000000000000000000000000000000000;
      expv[53] = 135'h0000000000000000000000000000000000;
      expv[54] = 135'h0000000000000000000000000000000000;
      expv[55] = 135'h0000000000000000000000000000000000;
      expv[56] = 135'h0000000000000000000000000000000000;
      expv[57] = 135'h0000000000000000000000000000000000;
      expv[58] = 135'h0000000000000000000000000000000000;
      expv[59] = 135'h0000000000000000000000000000000000;
      expv[60] = 135'h0000000000000000000000000000000000;
      expv[61] = 135'h0000000000000000000000000000000000;
      expv[62] = 135'h0000000000000000000000000000000000;
      expv[63] = 135'h0000000000000000000000000000000000;
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
