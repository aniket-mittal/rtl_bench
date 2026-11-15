// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06402 dut (
    .clk(clk),
    .address(in_vec[37:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h183709c08b;
    stim[1] = 38'h117f1e20d1;
    stim[2] = 38'h261810a655;
    stim[3] = 38'h3e651ace25;
    stim[4] = 38'h1f64ea989a;
    stim[5] = 38'h17fa6b84a6;
    stim[6] = 38'h2b1e0f127f;
    stim[7] = 38'h161b914804;
    stim[8] = 38'h36b075c295;
    stim[9] = 38'h26487e96de;
    stim[10] = 38'h0b6c6d9d8b;
    stim[11] = 38'h3796510612;
    stim[12] = 38'h09375d9b8c;
    stim[13] = 38'h3fc4b3fee2;
    stim[14] = 38'h1a92e1ea05;
    stim[15] = 38'h3a7fa66606;
    stim[16] = 38'h22ade6dde4;
    stim[17] = 38'h3334adb48f;
    stim[18] = 38'h3699425064;
    stim[19] = 38'h1bcfc54006;
    stim[20] = 38'h3b1125b1d5;
    stim[21] = 38'h1f432b508b;
    stim[22] = 38'h37beea0263;
    stim[23] = 38'h068a889705;
    stim[24] = 38'h3706604920;
    stim[25] = 38'h360fe70377;
    stim[26] = 38'h3e41e31db2;
    stim[27] = 38'h0a406c5374;
    stim[28] = 38'h3dd3eb05f2;
    stim[29] = 38'h1bea77b348;
    stim[30] = 38'h269e2b8c01;
    stim[31] = 38'h0fe5265e67;
    stim[32] = 38'h1a250b00fc;
    stim[33] = 38'h32d66bb838;
    stim[34] = 38'h0fe665d80a;
    stim[35] = 38'h2678f9957a;
    stim[36] = 38'h1bb3a74eb5;
    stim[37] = 38'h3a73aa870a;
    stim[38] = 38'h2fc878e86f;
    stim[39] = 38'h3a207c10ab;
    stim[40] = 38'h37920376b1;
    stim[41] = 38'h1b12d6be05;
    stim[42] = 38'h233ebf6d59;
    stim[43] = 38'h2f067d7629;
    stim[44] = 38'h070d9daa85;
    stim[45] = 38'h3333c6429b;
    stim[46] = 38'h12d8c03f9d;
    stim[47] = 38'h026de626e1;
    stim[48] = 38'h2ba08d546e;
    stim[49] = 38'h16b4a66ef9;
    stim[50] = 38'h12b3120bd9;
    stim[51] = 38'h2eb368a58d;
    stim[52] = 38'h0fdda74ebc;
    stim[53] = 38'h1676e84486;
    stim[54] = 38'h3a9fd44b23;
    stim[55] = 38'h02eb3d2bb0;
    stim[56] = 38'h1ecb8fcc5c;
    stim[57] = 38'h1f7a8e30e8;
    stim[58] = 38'h03e75df8cb;
    stim[59] = 38'h264af4d0e2;
    stim[60] = 38'h3b048c423e;
    stim[61] = 38'h3e847f4bcb;
    stim[62] = 38'h1ec41eef6f;
    stim[63] = 38'h2f573f04bb;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h5500000000;
      expv[4] = 40'h5500000000;
      expv[5] = 40'h5500000000;
      expv[6] = 40'h5500000000;
      expv[7] = 40'h5500000000;
      expv[8] = 40'h5500000000;
      expv[9] = 40'h5500000000;
      expv[10] = 40'hdf00000000;
      expv[11] = 40'hdf00000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0500000000;
      expv[25] = 40'h0500000000;
      expv[26] = 40'h0500000000;
      expv[27] = 40'h0500000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0100000000;
      expv[32] = 40'h0100000000;
      expv[33] = 40'h0100000000;
      expv[34] = 40'h0100000000;
      expv[35] = 40'h0100000000;
      expv[36] = 40'h7b00000000;
      expv[37] = 40'h7b00000000;
      expv[38] = 40'h7b00000000;
      expv[39] = 40'h7b00000000;
      expv[40] = 40'h7b00000000;
      expv[41] = 40'h7b00000000;
      expv[42] = 40'h7b00000000;
      expv[43] = 40'h7b00000000;
      expv[44] = 40'h7b0000007b;
      expv[45] = 40'h7b00000000;
      expv[46] = 40'h7b00000000;
      expv[47] = 40'h7b0000007b;
      expv[48] = 40'h7b00000000;
      expv[49] = 40'h7b00000000;
      expv[50] = 40'h7b00000000;
      expv[51] = 40'h7b00000000;
      expv[52] = 40'h7200000000;
      expv[53] = 40'h7200000000;
      expv[54] = 40'h7200000000;
      expv[55] = 40'h7200000072;
      expv[56] = 40'h7200000000;
      expv[57] = 40'h7200000000;
      expv[58] = 40'h7200000072;
      expv[59] = 40'h7200000000;
      expv[60] = 40'hf200000000;
      expv[61] = 40'hf200000000;
      expv[62] = 40'hf200000000;
      expv[63] = 40'hf200000000;
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
