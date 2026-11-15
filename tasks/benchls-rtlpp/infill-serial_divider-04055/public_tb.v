// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04055 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[26:26]),
    .rst_i(in_vec[25:25]),
    .divide_i(in_vec[24:24]),
    .dividend_i(in_vec[23:8]),
    .divisor_i(in_vec[7:0]),
    .quotient_o(out_vec[16:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h7870b51;
    stim[1] = 27'h25ffa78;
    stim[2] = 27'h1a0ba60;
    stim[3] = 27'h49b48c3;
    stim[4] = 27'h09d5854;
    stim[5] = 27'h4537f37;
    stim[6] = 27'h1f83175;
    stim[7] = 27'h54897ab;
    stim[8] = 27'h41c2878;
    stim[9] = 27'h5a6b753;
    stim[10] = 27'h16a81e6;
    stim[11] = 27'h13d1570;
    stim[12] = 27'h12bbd21;
    stim[13] = 27'h133ddad;
    stim[14] = 27'h53240bd;
    stim[15] = 27'h0b894c5;
    stim[16] = 27'h00617c1;
    stim[17] = 27'h04292f7;
    stim[18] = 27'h19226c2;
    stim[19] = 27'h4670e0d;
    stim[20] = 27'h0034548;
    stim[21] = 27'h17ba56d;
    stim[22] = 27'h16a16c9;
    stim[23] = 27'h5c4fc46;
    stim[24] = 27'h568b950;
    stim[25] = 27'h1b85918;
    stim[26] = 27'h04e8f40;
    stim[27] = 27'h12e594c;
    stim[28] = 27'h4da3a0c;
    stim[29] = 27'h0f83b6f;
    stim[30] = 27'h0b74c2a;
    stim[31] = 27'h4801fee;
    stim[32] = 27'h5bb85bf;
    stim[33] = 27'h09d39ed;
    stim[34] = 27'h01d6a90;
    stim[35] = 27'h5a8de3a;
    stim[36] = 27'h466daf6;
    stim[37] = 27'h4ac323e;
    stim[38] = 27'h1a0fc2a;
    stim[39] = 27'h754a1a5;
    stim[40] = 27'h0aed50d;
    stim[41] = 27'h4e49e28;
    stim[42] = 27'h5e7d18c;
    stim[43] = 27'h593fcbf;
    stim[44] = 27'h44ed7b8;
    stim[45] = 27'h512abbd;
    stim[46] = 27'h18db1ca;
    stim[47] = 27'h1b714a3;
    stim[48] = 27'h0438016;
    stim[49] = 27'h4f22c53;
    stim[50] = 27'h5e73f5d;
    stim[51] = 27'h194a0e1;
    stim[52] = 27'h02669fd;
    stim[53] = 27'h5a49963;
    stim[54] = 27'h4839127;
    stim[55] = 27'h01a4bdd;
    stim[56] = 27'h16576a9;
    stim[57] = 27'h1219bdc;
    stim[58] = 27'h58093d3;
    stim[59] = 27'h55fe174;
    stim[60] = 27'h0421fbf;
    stim[61] = 27'h5570d27;
    stim[62] = 27'h5fbbdb2;
    stim[63] = 27'h5bda1ef;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00002;
      expv[5] = 17'h00002;
      expv[6] = 17'h00006;
      expv[7] = 17'h00006;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00002;
      expv[30] = 17'h00002;
      expv[31] = 17'h00002;
      expv[32] = 17'h00006;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00002;
      expv[38] = 17'h00006;
      expv[39] = 17'h00006;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00002;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00002;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00002;
      expv[56] = 17'h00002;
      expv[57] = 17'h00002;
      expv[58] = 17'h00002;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
