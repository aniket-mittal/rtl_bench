// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062328 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h23557a55fb3;
    stim[1] = 43'h2bf430cbf96;
    stim[2] = 43'h657bdbf8aa0;
    stim[3] = 43'h77350188759;
    stim[4] = 43'h751152c2d92;
    stim[5] = 43'h0cc99f333b7;
    stim[6] = 43'h4958c725f72;
    stim[7] = 43'h51514b5f282;
    stim[8] = 43'h18e61eba998;
    stim[9] = 43'h4fcad3b81b8;
    stim[10] = 43'h119d980832f;
    stim[11] = 43'h364474a9290;
    stim[12] = 43'h5b0ade82b7b;
    stim[13] = 43'h76bf85ae4c5;
    stim[14] = 43'h6287049f1c9;
    stim[15] = 43'h19566b37465;
    stim[16] = 43'h1edef77436a;
    stim[17] = 43'h4299673a538;
    stim[18] = 43'h4db5eb08132;
    stim[19] = 43'h5d582e7af97;
    stim[20] = 43'h0db8d92b252;
    stim[21] = 43'h34d53bd0f7a;
    stim[22] = 43'h0a8c9634b7b;
    stim[23] = 43'h311beb8db2d;
    stim[24] = 43'h6f8e9da2121;
    stim[25] = 43'h590b2f63b5e;
    stim[26] = 43'h0fbe92d5f81;
    stim[27] = 43'h0827bc4d211;
    stim[28] = 43'h0830c74cee8;
    stim[29] = 43'h5415460ed23;
    stim[30] = 43'h7e99e2a37ec;
    stim[31] = 43'h70e27d23a6e;
    stim[32] = 43'h321eeaf2e49;
    stim[33] = 43'h60bb895ddd7;
    stim[34] = 43'h26004b3f3dc;
    stim[35] = 43'h1e575d6ecad;
    stim[36] = 43'h5c4e9936c26;
    stim[37] = 43'h19d096d37fe;
    stim[38] = 43'h2c28ffb5532;
    stim[39] = 43'h0aa7d58bf8b;
    stim[40] = 43'h5bdfde14f0a;
    stim[41] = 43'h38b7e5887f4;
    stim[42] = 43'h47371ba2d99;
    stim[43] = 43'h27a1c3a65d7;
    stim[44] = 43'h050aa8465fe;
    stim[45] = 43'h62aace090ee;
    stim[46] = 43'h59ee95f41ef;
    stim[47] = 43'h4e55d90d502;
    stim[48] = 43'h42ea28c7afb;
    stim[49] = 43'h3a079c1a265;
    stim[50] = 43'h33a73151009;
    stim[51] = 43'h282ea547675;
    stim[52] = 43'h46e5f285777;
    stim[53] = 43'h389de80cf1f;
    stim[54] = 43'h343d7dbcc73;
    stim[55] = 43'h09b63040b6b;
    stim[56] = 43'h3b7f74b54dd;
    stim[57] = 43'h7f9b48a6d83;
    stim[58] = 43'h0d3f8284a26;
    stim[59] = 43'h609ecc4d13a;
    stim[60] = 43'h17c8d20f7a5;
    stim[61] = 43'h51965fbca3c;
    stim[62] = 43'h7ccf43950be;
    stim[63] = 43'h33bde502619;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h23557a55fb3;
      expv[2] = 43'h2bf430cbf96;
      expv[3] = 43'h657bdbf8aa0;
      expv[4] = 43'h77350188759;
      expv[5] = 43'h751152c2d92;
      expv[6] = 43'h0cc99f333b7;
      expv[7] = 43'h4958c725f72;
      expv[8] = 43'h51514b5f282;
      expv[9] = 43'h18e61eba998;
      expv[10] = 43'h4fcad3b81b8;
      expv[11] = 43'h119d980832f;
      expv[12] = 43'h364474a9290;
      expv[13] = 43'h5b0ade82b7b;
      expv[14] = 43'h76bf85ae4c5;
      expv[15] = 43'h6287049f1c9;
      expv[16] = 43'h19566b37465;
      expv[17] = 43'h1edef77436a;
      expv[18] = 43'h4299673a538;
      expv[19] = 43'h4db5eb08132;
      expv[20] = 43'h5d582e7af97;
      expv[21] = 43'h0db8d92b252;
      expv[22] = 43'h34d53bd0f7a;
      expv[23] = 43'h0a8c9634b7b;
      expv[24] = 43'h311beb8db2d;
      expv[25] = 43'h6f8e9da2121;
      expv[26] = 43'h590b2f63b5e;
      expv[27] = 43'h0fbe92d5f81;
      expv[28] = 43'h0827bc4d211;
      expv[29] = 43'h0830c74cee8;
      expv[30] = 43'h5415460ed23;
      expv[31] = 43'h7e99e2a37ec;
      expv[32] = 43'h70e27d23a6e;
      expv[33] = 43'h321eeaf2e49;
      expv[34] = 43'h60bb895ddd7;
      expv[35] = 43'h26004b3f3dc;
      expv[36] = 43'h1e575d6ecad;
      expv[37] = 43'h5c4e9936c26;
      expv[38] = 43'h19d096d37fe;
      expv[39] = 43'h2c28ffb5532;
      expv[40] = 43'h0aa7d58bf8b;
      expv[41] = 43'h5bdfde14f0a;
      expv[42] = 43'h38b7e5887f4;
      expv[43] = 43'h47371ba2d99;
      expv[44] = 43'h27a1c3a65d7;
      expv[45] = 43'h050aa8465fe;
      expv[46] = 43'h62aace090ee;
      expv[47] = 43'h59ee95f41ef;
      expv[48] = 43'h4e55d90d502;
      expv[49] = 43'h42ea28c7afb;
      expv[50] = 43'h3a079c1a265;
      expv[51] = 43'h33a73151009;
      expv[52] = 43'h282ea547675;
      expv[53] = 43'h46e5f285777;
      expv[54] = 43'h389de80cf1f;
      expv[55] = 43'h343d7dbcc73;
      expv[56] = 43'h09b63040b6b;
      expv[57] = 43'h3b7f74b54dd;
      expv[58] = 43'h7f9b48a6d83;
      expv[59] = 43'h0d3f8284a26;
      expv[60] = 43'h609ecc4d13a;
      expv[61] = 43'h17c8d20f7a5;
      expv[62] = 43'h51965fbca3c;
      expv[63] = 43'h7ccf43950be;
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
