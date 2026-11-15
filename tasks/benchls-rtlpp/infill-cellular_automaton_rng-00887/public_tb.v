// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00887 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .loadseed_i(in_vec[32:32]),
    .seed_i(in_vec[31:0]),
    .number_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2d48706b4;
    stim[1] = 34'h375836c19;
    stim[2] = 34'h15a5e7d0d;
    stim[3] = 34'h1881e5de7;
    stim[4] = 34'h0ce9bba35;
    stim[5] = 34'h01f759e56;
    stim[6] = 34'h17dcd4db3;
    stim[7] = 34'h1cc208ded;
    stim[8] = 34'h1fca36d95;
    stim[9] = 34'h16437d954;
    stim[10] = 34'h146207527;
    stim[11] = 34'h1779eaccd;
    stim[12] = 34'h1c7f1f356;
    stim[13] = 34'h06ef55714;
    stim[14] = 34'h07e44d38b;
    stim[15] = 34'h13a4b5ae8;
    stim[16] = 34'h0295be4e9;
    stim[17] = 34'h0494faa11;
    stim[18] = 34'h1d6a3f402;
    stim[19] = 34'h12250e648;
    stim[20] = 34'h0be42267d;
    stim[21] = 34'h055f1fc98;
    stim[22] = 34'h0273861e7;
    stim[23] = 34'h0aeef7446;
    stim[24] = 34'h0c944b94b;
    stim[25] = 34'h1fc525f93;
    stim[26] = 34'h06cc1fbf0;
    stim[27] = 34'h1a842da15;
    stim[28] = 34'h12a5773ea;
    stim[29] = 34'h1996d2941;
    stim[30] = 34'h1c5dbfb58;
    stim[31] = 34'h148bcaaaa;
    stim[32] = 34'h08b514028;
    stim[33] = 34'h1438ec149;
    stim[34] = 34'h0aa807f53;
    stim[35] = 34'h1f9d52791;
    stim[36] = 34'h0e664f7e5;
    stim[37] = 34'h15c47d631;
    stim[38] = 34'h0b2f2aac2;
    stim[39] = 34'h0bb0fe7b2;
    stim[40] = 34'h0ae5bb67c;
    stim[41] = 34'h180fe7ee2;
    stim[42] = 34'h1e3303f96;
    stim[43] = 34'h12a5cc766;
    stim[44] = 34'h18ab38e04;
    stim[45] = 34'h03d7a5299;
    stim[46] = 34'h082c3d0a3;
    stim[47] = 34'h09ff8e1cb;
    stim[48] = 34'h025eeed26;
    stim[49] = 34'h0c02bd311;
    stim[50] = 34'h1f6cf3a57;
    stim[51] = 34'h0dd86c088;
    stim[52] = 34'h105e9e6f7;
    stim[53] = 34'h1001354ce;
    stim[54] = 34'h035f1d774;
    stim[55] = 34'h19c27c459;
    stim[56] = 34'h0c884fb80;
    stim[57] = 34'h15b467ee2;
    stim[58] = 34'h000cda0f1;
    stim[59] = 34'h0d7d09385;
    stim[60] = 34'h026a76941;
    stim[61] = 34'h16d3fa71f;
    stim[62] = 34'h05750475f;
    stim[63] = 34'h1604a0389;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'h00000000;
      expv[6] = 32'h252f3e86;
      expv[7] = 32'h02979f43;
      expv[8] = 32'hf8ea30a8;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h3bcf5666;
      expv[16] = 32'h1de7ab33;
      expv[17] = 32'h0a88bcc8;
      expv[18] = 32'h7f687e6f;
      expv[19] = 32'h1f1e70dd;
      expv[20] = 32'hba77d4d7;
      expv[21] = 32'h00000000;
      expv[22] = 32'h6b51fa01;
      expv[23] = 32'h35a8fd00;
      expv[24] = 32'hd4c26c85;
      expv[25] = 32'h196a3f40;
      expv[26] = 32'h8b7ec130;
      expv[27] = 32'ha72bff20;
      expv[28] = 32'hf7fd41f0;
      expv[29] = 32'hdba87fe0;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h62edfdac;
      expv[35] = 32'h4e6c0de8;
      expv[36] = 32'hfe35e67c;
      expv[37] = 32'hd2b41638;
      expv[38] = 32'hc785d1dc;
      expv[39] = 32'heb042198;
      expv[40] = 32'hb4e5be9c;
      expv[41] = 32'h956678b6;
      expv[42] = 32'hb5c078b7;
      expv[43] = 32'h58e7c5b6;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h1d2e63b3;
      expv[48] = 32'h169731d9;
      expv[49] = 32'h7adc7593;
      expv[50] = 32'h69a5cc76;
      expv[51] = 32'hbd7f45e7;
      expv[52] = 32'h87f156d6;
      expv[53] = 32'h61d670a7;
      expv[54] = 32'h5b586396;
      expv[55] = 32'h00000000;
      expv[56] = 32'h02f4f37b;
      expv[57] = 32'h0e3a2b19;
      expv[58] = 32'h1e80a549;
      expv[59] = 32'h124e7d2b;
      expv[60] = 32'h2668092d;
      expv[61] = 32'h40438d11;
      expv[62] = 32'h87e9eb13;
      expv[63] = 32'ha3e13c81;
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
