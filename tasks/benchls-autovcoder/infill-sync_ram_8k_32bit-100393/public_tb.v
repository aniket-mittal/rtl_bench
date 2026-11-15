// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_100393 dut (
    .clock(clk),
    .io_addr(in_vec[42:33]),
    .io_dataIn(in_vec[32:1]),
    .io_we(in_vec[0:0]),
    .io_dataOut(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h7dd1dd4d531;
    stim[1] = 43'h4dc2ff4aaa8;
    stim[2] = 43'h1bb1aaa004f;
    stim[3] = 43'h5a7a68146dc;
    stim[4] = 43'h2e1f96000d2;
    stim[5] = 43'h2050d0020e9;
    stim[6] = 43'h0b7426fee94;
    stim[7] = 43'h554c683445e;
    stim[8] = 43'h5cc82e43119;
    stim[9] = 43'h2afe6b7e0cc;
    stim[10] = 43'h4738736e86f;
    stim[11] = 43'h678129a35c5;
    stim[12] = 43'h22367a1228a;
    stim[13] = 43'h4f910ce7602;
    stim[14] = 43'h587bf034bb0;
    stim[15] = 43'h2cd11854c88;
    stim[16] = 43'h14a80854477;
    stim[17] = 43'h70c8507f3ae;
    stim[18] = 43'h729558c4c06;
    stim[19] = 43'h031ad386608;
    stim[20] = 43'h62855b03c0f;
    stim[21] = 43'h7b7855060c8;
    stim[22] = 43'h3850ccc0c25;
    stim[23] = 43'h18222b4fa27;
    stim[24] = 43'h59ba52a130c;
    stim[25] = 43'h4afe3245b52;
    stim[26] = 43'h049e739ca0e;
    stim[27] = 43'h11c5de66b6d;
    stim[28] = 43'h28f3ccf5c35;
    stim[29] = 43'h0027d87d8e7;
    stim[30] = 43'h2dbc7bd50b7;
    stim[31] = 43'h301664cf9cc;
    stim[32] = 43'h48bf4b9aed8;
    stim[33] = 43'h38d97eaa01d;
    stim[34] = 43'h068da52f77a;
    stim[35] = 43'h6b51c3586bb;
    stim[36] = 43'h1676bf56123;
    stim[37] = 43'h5e6da23eceb;
    stim[38] = 43'h755dd083efa;
    stim[39] = 43'h681381d537b;
    stim[40] = 43'h1a755d4ae21;
    stim[41] = 43'h0c681c296bd;
    stim[42] = 43'h040b02f898a;
    stim[43] = 43'h0407bd91d79;
    stim[44] = 43'h07e0e1c016f;
    stim[45] = 43'h6c309d76f71;
    stim[46] = 43'h23d7d964278;
    stim[47] = 43'h5b81037d41b;
    stim[48] = 43'h275871ecb9a;
    stim[49] = 43'h68c38c3397e;
    stim[50] = 43'h40a210b96c1;
    stim[51] = 43'h243154c0ded;
    stim[52] = 43'h13ff592e537;
    stim[53] = 43'h55881e8e0c1;
    stim[54] = 43'h4fff37f6674;
    stim[55] = 43'h595ed5688ae;
    stim[56] = 43'h2bf76fe64e7;
    stim[57] = 43'h130c98a9a0a;
    stim[58] = 43'h1e9b586cfc9;
    stim[59] = 43'h6afcdeb1f40;
    stim[60] = 43'h108e73d7849;
    stim[61] = 43'h520073ae28f;
    stim[62] = 43'h6fefa17516a;
    stim[63] = 43'h58b0d2cb526;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'h3dec8ebc;
      expv[45] = 32'h3dec8ebc;
      expv[46] = 32'h3dec8ebc;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
