// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118015 dut (
    .clk108MHz(clk),
    .performDither(in_vec[46:46]),
    .vidClmn_DitherIn(in_vec[45:35]),
    .vidRow__DitherIn(in_vec[34:24]),
    .pixlRGB_DitherIn(in_vec[23:0]),
    .vidClmn_DitherOut(out_vec[33:23]),
    .vidRow__DitherOut(out_vec[22:12]),
    .pixlRGB_DitherOut(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h75a8f334af66;
    stim[1] = 47'h43aafc83eb55;
    stim[2] = 47'h692548c8dd2a;
    stim[3] = 47'h2419ef1b6e54;
    stim[4] = 47'h4c5d3580cb69;
    stim[5] = 47'h4eb242934df9;
    stim[6] = 47'h246a5d9d160e;
    stim[7] = 47'h30bbb53af669;
    stim[8] = 47'h4355b1502798;
    stim[9] = 47'h3c1919797f05;
    stim[10] = 47'h75292a7507ca;
    stim[11] = 47'h2c8c5363a702;
    stim[12] = 47'h037d0544d7d7;
    stim[13] = 47'h3198560910cf;
    stim[14] = 47'h0e440f294ff1;
    stim[15] = 47'h6653d3f9e20c;
    stim[16] = 47'h23c8d27ecdea;
    stim[17] = 47'h2a84e405ef95;
    stim[18] = 47'h61e6629cc630;
    stim[19] = 47'h24d511383467;
    stim[20] = 47'h13f5d482eeaa;
    stim[21] = 47'h4b586f2bcfb9;
    stim[22] = 47'h50e82361bde5;
    stim[23] = 47'h524a3d0e050d;
    stim[24] = 47'h174e93a3de3d;
    stim[25] = 47'h282f0efec1be;
    stim[26] = 47'h26489fcdc444;
    stim[27] = 47'h49c9b5499e26;
    stim[28] = 47'h3c24d8562dd0;
    stim[29] = 47'h183c1f137c79;
    stim[30] = 47'h611ff247d74f;
    stim[31] = 47'h6cc00d697e34;
    stim[32] = 47'h483a900d6496;
    stim[33] = 47'h36fed141f85f;
    stim[34] = 47'h73391590e91d;
    stim[35] = 47'h6840c2bb3ac7;
    stim[36] = 47'h5263dc1fd3e8;
    stim[37] = 47'h50ff30ec037c;
    stim[38] = 47'h50f259d63ea0;
    stim[39] = 47'h7a7121a0ad00;
    stim[40] = 47'h2e9b6be59ae7;
    stim[41] = 47'h689c2386fdc0;
    stim[42] = 47'h76b19dcb5866;
    stim[43] = 47'h1ac41d4057a0;
    stim[44] = 47'h0189bf603d85;
    stim[45] = 47'h75e60734226c;
    stim[46] = 47'h058a3af6d1c3;
    stim[47] = 47'h5ff1eac9fcdd;
    stim[48] = 47'h0c8520f9414c;
    stim[49] = 47'h5410e48a1ef8;
    stim[50] = 47'h5e68cd858ec2;
    stim[51] = 47'h658649a6fb17;
    stim[52] = 47'h1e13450eb7c8;
    stim[53] = 47'h7848db74858d;
    stim[54] = 47'h5ad9a257a06e;
    stim[55] = 47'h1e8c768a8b42;
    stim[56] = 47'h4604f95a0f5c;
    stim[57] = 47'h1495958a0cb1;
    stim[58] = 47'h2098a8d119f1;
    stim[59] = 47'h2a7ada9d8966;
    stim[60] = 47'h06bf36ad7ff2;
    stim[61] = 47'h49c752e1ca66;
    stim[62] = 47'h1a0e53bfe599;
    stim[63] = 47'h2f7e57c6210e;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h35a8f3xxx;
      expv[2] = 34'h03aafc3b6;
      expv[3] = 34'h2925488f5;
      expv[4] = 34'h2419efde3;
      expv[5] = 34'h0c5d35165;
      expv[6] = 34'h0eb2428d7;
      expv[7] = 34'h246a5da5f;
      expv[8] = 34'h30bbb5910;
      expv[9] = 34'h0355b13f6;
      expv[10] = 34'h3c1919529;
      expv[11] = 34'h35292a770;
      expv[12] = 34'h2c8c5370c;
      expv[13] = 34'h037d056a0;
      expv[14] = 34'h3198564dd;
      expv[15] = 34'h0e440f01c;
      expv[16] = 34'h2653d324f;
      expv[17] = 34'h23c8d2fe0;
      expv[18] = 34'h2a84e47ce;
      expv[19] = 34'h21e6620e9;
      expv[20] = 34'h24d511ad3;
      expv[21] = 34'h13f5d4336;
      expv[22] = 34'h0b586f8ea;
      expv[23] = 34'h10e8233dc;
      expv[24] = 34'h124a3d6ce;
      expv[25] = 34'h174e93111;
      expv[26] = 34'h282f0ead3;
      expv[27] = 34'h26489ffcb;
      expv[28] = 34'h09c9b5cc4;
      expv[29] = 34'h3c24d85a3;
      expv[30] = 34'h183c1f52d;
      expv[31] = 34'h211ff2177;
      expv[32] = 34'h2cc00d4d5;
      expv[33] = 34'h083a90683;
      expv[34] = 34'h36fed1169;
      expv[35] = 34'h3339154f5;
      expv[36] = 34'h2840c29f2;
      expv[37] = 34'h1263dcc4d;
      expv[38] = 34'h10ff302ef;
      expv[39] = 34'h10f259f08;
      expv[40] = 34'h3a7121d3a;
      expv[41] = 34'h2e9b6baa0;
      expv[42] = 34'h289c23e9e;
      expv[43] = 34'h36b19d9fc;
      expv[44] = 34'h1ac41dc56;
      expv[45] = 34'h0189bf45a;
      expv[46] = 34'h35e607638;
      expv[47] = 34'h058a3a326;
      expv[48] = 34'h1ff1eafdc;
      expv[49] = 34'h0c8520dfe;
      expv[50] = 34'h1410e4f44;
      expv[51] = 34'h1e68cd92f;
      expv[52] = 34'h25864999c;
      expv[53] = 34'h1e1345af1;
      expv[54] = 34'h3848db0bc;
      expv[55] = 34'h1ad9a2789;
      expv[56] = 34'h1e8c765a7;
      expv[57] = 34'h0604f9884;
      expv[58] = 34'h149595515;
      expv[59] = 34'h2098a880b;
      expv[60] = 34'h2a7adad1f;
      expv[61] = 34'h06bf36986;
      expv[62] = 34'h09c752a7f;
      expv[63] = 34'h1a0e53ed7;
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
