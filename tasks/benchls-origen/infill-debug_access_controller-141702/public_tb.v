// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141702 dut (
    .clk(clk),
    .rst_n(in_vec[17:17]),
    .cmd_in(in_vec[16:9]),
    .cmd_valid(in_vec[8:8]),
    .debug_data_in(in_vec[7:0]),
    .resp_out(out_vec[26:19]),
    .resp_valid(out_vec[18:18]),
    .debug_data_out(out_vec[17:10]),
    .debug_addr(out_vec[9:1]),
    .debug_we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1611f;
    stim[1] = 18'h0c7b1;
    stim[2] = 18'h37e29;
    stim[3] = 18'h323cb;
    stim[4] = 18'h38d6b;
    stim[5] = 18'h35301;
    stim[6] = 18'h27bd1;
    stim[7] = 18'h33d78;
    stim[8] = 18'h28aa1;
    stim[9] = 18'h28d05;
    stim[10] = 18'h39b62;
    stim[11] = 18'h38f0e;
    stim[12] = 18'h343bc;
    stim[13] = 18'h372b1;
    stim[14] = 18'h26cb5;
    stim[15] = 18'h252fb;
    stim[16] = 18'h2e394;
    stim[17] = 18'h28dda;
    stim[18] = 18'h38936;
    stim[19] = 18'h28199;
    stim[20] = 18'h28505;
    stim[21] = 18'h24881;
    stim[22] = 18'h3a47f;
    stim[23] = 18'h3d002;
    stim[24] = 18'h38cd6;
    stim[25] = 18'h39709;
    stim[26] = 18'h3795c;
    stim[27] = 18'h2f9d2;
    stim[28] = 18'h3e6d2;
    stim[29] = 18'h24d62;
    stim[30] = 18'h231af;
    stim[31] = 18'h39df6;
    stim[32] = 18'h2466a;
    stim[33] = 18'h2d5b6;
    stim[34] = 18'h23a8d;
    stim[35] = 18'h36e3e;
    stim[36] = 18'h2ba9f;
    stim[37] = 18'h266d5;
    stim[38] = 18'h3a4ea;
    stim[39] = 18'h26ef3;
    stim[40] = 18'h286fd;
    stim[41] = 18'h2fef6;
    stim[42] = 18'h3ad04;
    stim[43] = 18'h2eae3;
    stim[44] = 18'h31af6;
    stim[45] = 18'h34799;
    stim[46] = 18'h28814;
    stim[47] = 18'h2d6be;
    stim[48] = 18'h2d2dc;
    stim[49] = 18'h35883;
    stim[50] = 18'h34cd1;
    stim[51] = 18'h3f6e4;
    stim[52] = 18'h383ff;
    stim[53] = 18'h23d0a;
    stim[54] = 18'h3f2b8;
    stim[55] = 18'h32f1e;
    stim[56] = 18'h3ebd9;
    stim[57] = 18'h2e21d;
    stim[58] = 18'h3b07b;
    stim[59] = 18'h2f737;
    stim[60] = 18'h3ab04;
    stim[61] = 18'h38859;
    stim[62] = 18'h25489;
    stim[63] = 18'h238b2;
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
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000000;
      expv[3] = 27'h0000000;
      expv[4] = 27'h0000000;
      expv[5] = 27'h0040000;
      expv[6] = 27'h0040000;
      expv[7] = 27'h0040000;
      expv[8] = 27'h0040000;
      expv[9] = 27'h0040000;
      expv[10] = 27'h0040000;
      expv[11] = 27'h0040000;
      expv[12] = 27'h0040000;
      expv[13] = 27'h0040000;
      expv[14] = 27'h0040000;
      expv[15] = 27'h0040000;
      expv[16] = 27'h0040000;
      expv[17] = 27'h0040000;
      expv[18] = 27'h0040000;
      expv[19] = 27'h0040000;
      expv[20] = 27'h0040000;
      expv[21] = 27'h0040000;
      expv[22] = 27'h0040000;
      expv[23] = 27'h0040000;
      expv[24] = 27'h0040000;
      expv[25] = 27'h0040000;
      expv[26] = 27'h0040000;
      expv[27] = 27'h0040000;
      expv[28] = 27'h0040000;
      expv[29] = 27'h0040000;
      expv[30] = 27'h0040000;
      expv[31] = 27'h0040000;
      expv[32] = 27'h0040000;
      expv[33] = 27'h0040000;
      expv[34] = 27'h0040000;
      expv[35] = 27'h0040000;
      expv[36] = 27'h0040000;
      expv[37] = 27'h0040000;
      expv[38] = 27'h0040000;
      expv[39] = 27'h0040000;
      expv[40] = 27'h0040000;
      expv[41] = 27'h0040000;
      expv[42] = 27'h0040000;
      expv[43] = 27'h0040000;
      expv[44] = 27'h0040000;
      expv[45] = 27'h0040000;
      expv[46] = 27'h0040000;
      expv[47] = 27'h0040000;
      expv[48] = 27'h0040000;
      expv[49] = 27'h0040000;
      expv[50] = 27'h0040000;
      expv[51] = 27'h0040000;
      expv[52] = 27'h0040000;
      expv[53] = 27'h0040000;
      expv[54] = 27'h0040000;
      expv[55] = 27'h0040000;
      expv[56] = 27'h0040000;
      expv[57] = 27'h0040000;
      expv[58] = 27'h0040000;
      expv[59] = 27'h0040000;
      expv[60] = 27'h0040000;
      expv[61] = 27'h0040000;
      expv[62] = 27'h0040000;
      expv[63] = 27'h0040000;
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
