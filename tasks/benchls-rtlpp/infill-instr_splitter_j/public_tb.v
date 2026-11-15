// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  instr_splitter_j dut (
    .instruction(in_vec[31:0]),
    .imm_address(out_vec[25:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha0720efd;
    stim[1] = 32'hde99d3a2;
    stim[2] = 32'h96efadde;
    stim[3] = 32'h47f3386a;
    stim[4] = 32'hc4aa8e3e;
    stim[5] = 32'hf22c3ea2;
    stim[6] = 32'h4818fe99;
    stim[7] = 32'h555811a5;
    stim[8] = 32'h80728fb4;
    stim[9] = 32'h4020778c;
    stim[10] = 32'he05a93d5;
    stim[11] = 32'hedfe4f3c;
    stim[12] = 32'ha89d9c98;
    stim[13] = 32'hcbd05fd4;
    stim[14] = 32'hb7464a2d;
    stim[15] = 32'h7e480556;
    stim[16] = 32'h986a78ce;
    stim[17] = 32'hbd518451;
    stim[18] = 32'h8e6fc1e0;
    stim[19] = 32'h1d08deed;
    stim[20] = 32'hf6377746;
    stim[21] = 32'hf019e338;
    stim[22] = 32'hb6acde8d;
    stim[23] = 32'h5735eb3b;
    stim[24] = 32'h227ccde9;
    stim[25] = 32'h5638392b;
    stim[26] = 32'h963fffc2;
    stim[27] = 32'h5d958aaa;
    stim[28] = 32'h92d8582a;
    stim[29] = 32'h55cfd560;
    stim[30] = 32'hd26a8106;
    stim[31] = 32'ha796bff9;
    stim[32] = 32'h128f1c98;
    stim[33] = 32'hf849f716;
    stim[34] = 32'hd3675428;
    stim[35] = 32'h47b114ab;
    stim[36] = 32'hb72de5b6;
    stim[37] = 32'h14f73e6e;
    stim[38] = 32'h78dc9ca3;
    stim[39] = 32'hed38e13d;
    stim[40] = 32'h87b70205;
    stim[41] = 32'h33398a00;
    stim[42] = 32'h529b080e;
    stim[43] = 32'h9272b6b8;
    stim[44] = 32'h5db73e2f;
    stim[45] = 32'hfcc3d34a;
    stim[46] = 32'h36958672;
    stim[47] = 32'h4fe31d5b;
    stim[48] = 32'h473dc556;
    stim[49] = 32'h10374872;
    stim[50] = 32'h76b48d82;
    stim[51] = 32'hdb61149e;
    stim[52] = 32'hbf8d457f;
    stim[53] = 32'h25ed8c15;
    stim[54] = 32'h41287844;
    stim[55] = 32'h2ed1cc58;
    stim[56] = 32'hc75e8d1c;
    stim[57] = 32'h4c318d84;
    stim[58] = 32'hb35a9959;
    stim[59] = 32'h311fa42b;
    stim[60] = 32'h254babb7;
    stim[61] = 32'hd55feda0;
    stim[62] = 32'h14313063;
    stim[63] = 32'hff0c2ab4;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 26'h0720efd;
      expv[1] = 26'h299d3a2;
      expv[2] = 26'h2efadde;
      expv[3] = 26'h3f3386a;
      expv[4] = 26'h0aa8e3e;
      expv[5] = 26'h22c3ea2;
      expv[6] = 26'h018fe99;
      expv[7] = 26'h15811a5;
      expv[8] = 26'h0728fb4;
      expv[9] = 26'h020778c;
      expv[10] = 26'h05a93d5;
      expv[11] = 26'h1fe4f3c;
      expv[12] = 26'h09d9c98;
      expv[13] = 26'h3d05fd4;
      expv[14] = 26'h3464a2d;
      expv[15] = 26'h2480556;
      expv[16] = 26'h06a78ce;
      expv[17] = 26'h1518451;
      expv[18] = 26'h26fc1e0;
      expv[19] = 26'h108deed;
      expv[20] = 26'h2377746;
      expv[21] = 26'h019e338;
      expv[22] = 26'h2acde8d;
      expv[23] = 26'h335eb3b;
      expv[24] = 26'h27ccde9;
      expv[25] = 26'h238392b;
      expv[26] = 26'h23fffc2;
      expv[27] = 26'h1958aaa;
      expv[28] = 26'h2d8582a;
      expv[29] = 26'h1cfd560;
      expv[30] = 26'h26a8106;
      expv[31] = 26'h396bff9;
      expv[32] = 26'h28f1c98;
      expv[33] = 26'h049f716;
      expv[34] = 26'h3675428;
      expv[35] = 26'h3b114ab;
      expv[36] = 26'h32de5b6;
      expv[37] = 26'h0f73e6e;
      expv[38] = 26'h0dc9ca3;
      expv[39] = 26'h138e13d;
      expv[40] = 26'h3b70205;
      expv[41] = 26'h3398a00;
      expv[42] = 26'h29b080e;
      expv[43] = 26'h272b6b8;
      expv[44] = 26'h1b73e2f;
      expv[45] = 26'h0c3d34a;
      expv[46] = 26'h2958672;
      expv[47] = 26'h3e31d5b;
      expv[48] = 26'h33dc556;
      expv[49] = 26'h0374872;
      expv[50] = 26'h2b48d82;
      expv[51] = 26'h361149e;
      expv[52] = 26'h38d457f;
      expv[53] = 26'h1ed8c15;
      expv[54] = 26'h1287844;
      expv[55] = 26'h2d1cc58;
      expv[56] = 26'h35e8d1c;
      expv[57] = 26'h0318d84;
      expv[58] = 26'h35a9959;
      expv[59] = 26'h11fa42b;
      expv[60] = 26'h14babb7;
      expv[61] = 26'h15feda0;
      expv[62] = 26'h0313063;
      expv[63] = 26'h30c2ab4;
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
