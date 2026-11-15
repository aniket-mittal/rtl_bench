// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00804 dut (
    .clk(clk),
    .datain(in_vec[50:0]),
    .dataout(out_vec[50:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h4f43967ba3de7;
    stim[1] = 51'h53de240b7b624;
    stim[2] = 51'h61555d302698c;
    stim[3] = 51'h31682d30cc919;
    stim[4] = 51'h31c21d64c805f;
    stim[5] = 51'h4764c4e15571e;
    stim[6] = 51'h0506196df8eee;
    stim[7] = 51'h0da14bc64221f;
    stim[8] = 51'h4dae8084ab496;
    stim[9] = 51'h0f1f3c3bc1b2f;
    stim[10] = 51'h0582ca01ff373;
    stim[11] = 51'h09e6ce808e9e1;
    stim[12] = 51'h09aa166e67fa9;
    stim[13] = 51'h11a56a8248963;
    stim[14] = 51'h5dfcc0975a89d;
    stim[15] = 51'h07076e5686338;
    stim[16] = 51'h14cc127338feb;
    stim[17] = 51'h3dd9c240b65f6;
    stim[18] = 51'h42628a0a5ffbe;
    stim[19] = 51'h19f1bcc903495;
    stim[20] = 51'h2a933b3ebad5d;
    stim[21] = 51'h059bbcadaa589;
    stim[22] = 51'h5cf0bbb94ab5c;
    stim[23] = 51'h04a8f3e90a182;
    stim[24] = 51'h076f00f5758ae;
    stim[25] = 51'h60b237f61b609;
    stim[26] = 51'h2bdb4d1541fda;
    stim[27] = 51'h491e2bbe49ce3;
    stim[28] = 51'h5487f48fe883a;
    stim[29] = 51'h4a79789b54adc;
    stim[30] = 51'h604831692692a;
    stim[31] = 51'h472a029c05c27;
    stim[32] = 51'h68d2f3b07d63d;
    stim[33] = 51'h0a7d8c2602a48;
    stim[34] = 51'h09dd236f59b28;
    stim[35] = 51'h0cae3f08e8722;
    stim[36] = 51'h24b265ee561e9;
    stim[37] = 51'h2ad035a3efa33;
    stim[38] = 51'h4a1cae779896a;
    stim[39] = 51'h237280d88e787;
    stim[40] = 51'h2d7f0ccb19b8a;
    stim[41] = 51'h7aced6a66bd0f;
    stim[42] = 51'h6172478206fd0;
    stim[43] = 51'h2e52f8c4756da;
    stim[44] = 51'h59397bb8643b3;
    stim[45] = 51'h425e7a16464ab;
    stim[46] = 51'h2fe7b3035600f;
    stim[47] = 51'h303a2b1155ef3;
    stim[48] = 51'h31c1567b81d31;
    stim[49] = 51'h32497ba6c6b11;
    stim[50] = 51'h5bf4512180050;
    stim[51] = 51'h579b820f8e3cf;
    stim[52] = 51'h2db9cf3332179;
    stim[53] = 51'h55998d83eb606;
    stim[54] = 51'h0323db3ca5fc9;
    stim[55] = 51'h5fcb77fc8064a;
    stim[56] = 51'h430a4cdbf2db3;
    stim[57] = 51'h78d44252d897c;
    stim[58] = 51'h6f84af34d9ba6;
    stim[59] = 51'h3a053ca24e83c;
    stim[60] = 51'h5502de87817ac;
    stim[61] = 51'h49d04ac556799;
    stim[62] = 51'h0c80dfafcb8c6;
    stim[63] = 51'h3655479ac8fad;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'h4f43967ba3de7;
      expv[2] = 51'h53de240b7b624;
      expv[3] = 51'h61555d302698c;
      expv[4] = 51'h31682d30cc919;
      expv[5] = 51'h31c21d64c805f;
      expv[6] = 51'h4764c4e15571e;
      expv[7] = 51'h0506196df8eee;
      expv[8] = 51'h0da14bc64221f;
      expv[9] = 51'h4dae8084ab496;
      expv[10] = 51'h0f1f3c3bc1b2f;
      expv[11] = 51'h0582ca01ff373;
      expv[12] = 51'h09e6ce808e9e1;
      expv[13] = 51'h09aa166e67fa9;
      expv[14] = 51'h11a56a8248963;
      expv[15] = 51'h5dfcc0975a89d;
      expv[16] = 51'h07076e5686338;
      expv[17] = 51'h14cc127338feb;
      expv[18] = 51'h3dd9c240b65f6;
      expv[19] = 51'h42628a0a5ffbe;
      expv[20] = 51'h19f1bcc903495;
      expv[21] = 51'h2a933b3ebad5d;
      expv[22] = 51'h059bbcadaa589;
      expv[23] = 51'h5cf0bbb94ab5c;
      expv[24] = 51'h04a8f3e90a182;
      expv[25] = 51'h076f00f5758ae;
      expv[26] = 51'h60b237f61b609;
      expv[27] = 51'h2bdb4d1541fda;
      expv[28] = 51'h491e2bbe49ce3;
      expv[29] = 51'h5487f48fe883a;
      expv[30] = 51'h4a79789b54adc;
      expv[31] = 51'h604831692692a;
      expv[32] = 51'h472a029c05c27;
      expv[33] = 51'h68d2f3b07d63d;
      expv[34] = 51'h0a7d8c2602a48;
      expv[35] = 51'h09dd236f59b28;
      expv[36] = 51'h0cae3f08e8722;
      expv[37] = 51'h24b265ee561e9;
      expv[38] = 51'h2ad035a3efa33;
      expv[39] = 51'h4a1cae779896a;
      expv[40] = 51'h237280d88e787;
      expv[41] = 51'h2d7f0ccb19b8a;
      expv[42] = 51'h7aced6a66bd0f;
      expv[43] = 51'h6172478206fd0;
      expv[44] = 51'h2e52f8c4756da;
      expv[45] = 51'h59397bb8643b3;
      expv[46] = 51'h425e7a16464ab;
      expv[47] = 51'h2fe7b3035600f;
      expv[48] = 51'h303a2b1155ef3;
      expv[49] = 51'h31c1567b81d31;
      expv[50] = 51'h32497ba6c6b11;
      expv[51] = 51'h5bf4512180050;
      expv[52] = 51'h579b820f8e3cf;
      expv[53] = 51'h2db9cf3332179;
      expv[54] = 51'h55998d83eb606;
      expv[55] = 51'h0323db3ca5fc9;
      expv[56] = 51'h5fcb77fc8064a;
      expv[57] = 51'h430a4cdbf2db3;
      expv[58] = 51'h78d44252d897c;
      expv[59] = 51'h6f84af34d9ba6;
      expv[60] = 51'h3a053ca24e83c;
      expv[61] = 51'h5502de87817ac;
      expv[62] = 51'h49d04ac556799;
      expv[63] = 51'h0c80dfafcb8c6;
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
