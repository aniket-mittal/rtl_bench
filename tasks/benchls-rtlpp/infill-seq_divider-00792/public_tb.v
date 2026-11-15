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

  rtlpp_00792 dut (
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
    stim[0] = 27'h78a1dc2;
    stim[1] = 27'h3e9153a;
    stim[2] = 27'h014b8b3;
    stim[3] = 27'h0740971;
    stim[4] = 27'h55f900d;
    stim[5] = 27'h582ecf6;
    stim[6] = 27'h0344577;
    stim[7] = 27'h113e249;
    stim[8] = 27'h5082f23;
    stim[9] = 27'h1751018;
    stim[10] = 27'h09fe580;
    stim[11] = 27'h6a060b4;
    stim[12] = 27'h19bd283;
    stim[13] = 27'h49d57e5;
    stim[14] = 27'h4ff31dc;
    stim[15] = 27'h1cbea0d;
    stim[16] = 27'h0b985ce;
    stim[17] = 27'h4ad5f9f;
    stim[18] = 27'h1284f8a;
    stim[19] = 27'h560ac54;
    stim[20] = 27'h0734e83;
    stim[21] = 27'h1a89e16;
    stim[22] = 27'h073e9ca;
    stim[23] = 27'h135f8fc;
    stim[24] = 27'h5b5feaa;
    stim[25] = 27'h44fe27d;
    stim[26] = 27'h0a35743;
    stim[27] = 27'h1f2a6aa;
    stim[28] = 27'h40da1d3;
    stim[29] = 27'h03b5d16;
    stim[30] = 27'h17ae4bb;
    stim[31] = 27'h017cea0;
    stim[32] = 27'h4ce92db;
    stim[33] = 27'h59ef56b;
    stim[34] = 27'h16dbb6b;
    stim[35] = 27'h3f879c5;
    stim[36] = 27'h402dd50;
    stim[37] = 27'h4515250;
    stim[38] = 27'h048ea74;
    stim[39] = 27'h024a61e;
    stim[40] = 27'h1ca0988;
    stim[41] = 27'h5d5ca22;
    stim[42] = 27'h4efb56d;
    stim[43] = 27'h01ef89e;
    stim[44] = 27'h1da80ad;
    stim[45] = 27'h485f7d3;
    stim[46] = 27'h5894490;
    stim[47] = 27'h0454eaa;
    stim[48] = 27'h0dcc5d5;
    stim[49] = 27'h13f0aab;
    stim[50] = 27'h517f97b;
    stim[51] = 27'h087fe71;
    stim[52] = 27'h19c1854;
    stim[53] = 27'h559203d;
    stim[54] = 27'h4f8bea0;
    stim[55] = 27'h734e3ce;
    stim[56] = 27'h5debe75;
    stim[57] = 27'h1958b49;
    stim[58] = 27'h1c74306;
    stim[59] = 27'h4569071;
    stim[60] = 27'h454eb87;
    stim[61] = 27'h139aca3;
    stim[62] = 27'h5d5c97e;
    stim[63] = 27'h416ecd1;
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
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00002;
      expv[15] = 17'h00006;
      expv[16] = 17'h00006;
      expv[17] = 17'h00006;
      expv[18] = 17'h0000e;
      expv[19] = 17'h0000e;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00002;
      expv[27] = 17'h00002;
      expv[28] = 17'h00002;
      expv[29] = 17'h00006;
      expv[30] = 17'h00006;
      expv[31] = 17'h00006;
      expv[32] = 17'h00006;
      expv[33] = 17'h0000e;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00002;
      expv[38] = 17'h00006;
      expv[39] = 17'h00006;
      expv[40] = 17'h00006;
      expv[41] = 17'h00006;
      expv[42] = 17'h00000;
      expv[43] = 17'h00002;
      expv[44] = 17'h00002;
      expv[45] = 17'h00002;
      expv[46] = 17'h00006;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00002;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00002;
      expv[61] = 17'h00006;
      expv[62] = 17'h00006;
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
