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

  origen_099698 dut (
    .clk(clk),
    .reset_n(in_vec[33:33]),
    .en(in_vec[32:32]),
    .new_data(in_vec[31:0]),
    .value(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0d54adb0e;
    stim[1] = 34'h04b1a195e;
    stim[2] = 34'h295370e76;
    stim[3] = 34'h2e6952f48;
    stim[4] = 34'h3a7458d8a;
    stim[5] = 34'h29bf80567;
    stim[6] = 34'h27ae36d81;
    stim[7] = 34'h3c4a1334c;
    stim[8] = 34'h22144ac08;
    stim[9] = 34'h2e9e8e254;
    stim[10] = 34'h2f0b62cae;
    stim[11] = 34'h31a321e1a;
    stim[12] = 34'h3bda536c8;
    stim[13] = 34'h22d0c930c;
    stim[14] = 34'h38d969f0e;
    stim[15] = 34'h216740893;
    stim[16] = 34'h2e4964f11;
    stim[17] = 34'h33a9b0e99;
    stim[18] = 34'h23822b777;
    stim[19] = 34'h343ed6a20;
    stim[20] = 34'h2f14b778c;
    stim[21] = 34'h3bfe33b07;
    stim[22] = 34'h38f8152d8;
    stim[23] = 34'h32f53aef6;
    stim[24] = 34'h2a8b4fe72;
    stim[25] = 34'h3d54a3913;
    stim[26] = 34'h29d6a174a;
    stim[27] = 34'h217d2f850;
    stim[28] = 34'h2a060cae8;
    stim[29] = 34'h20e098035;
    stim[30] = 34'h33d864634;
    stim[31] = 34'h2069a2dad;
    stim[32] = 34'h20a8f295c;
    stim[33] = 34'h3d0d12267;
    stim[34] = 34'h3f7ae3978;
    stim[35] = 34'h3f16407e1;
    stim[36] = 34'h29820a482;
    stim[37] = 34'h39129da56;
    stim[38] = 34'h30892554d;
    stim[39] = 34'h37f261967;
    stim[40] = 34'h2d6e4e0bd;
    stim[41] = 34'h2a1ebc89b;
    stim[42] = 34'h38234fe2d;
    stim[43] = 34'h37537e63e;
    stim[44] = 34'h20471d57a;
    stim[45] = 34'h2e08f23f3;
    stim[46] = 34'h3fe19769f;
    stim[47] = 34'h202df6659;
    stim[48] = 34'h38848ed41;
    stim[49] = 34'h37f71ad97;
    stim[50] = 34'h38f30c9c7;
    stim[51] = 34'h2a8ead6b5;
    stim[52] = 34'h2e452f9b0;
    stim[53] = 34'h33bcdee1c;
    stim[54] = 34'h36914e4b2;
    stim[55] = 34'h3e7312dfa;
    stim[56] = 34'h251fe91a5;
    stim[57] = 34'h214e72750;
    stim[58] = 34'h37b3e32d6;
    stim[59] = 34'h30afe519d;
    stim[60] = 34'h25093eb35;
    stim[61] = 34'h241abe86a;
    stim[62] = 34'h301e9d2c4;
    stim[63] = 34'h29e90348d;
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
      expv[0] = 32'h000014d6;
      expv[1] = 32'h000014d6;
      expv[2] = 32'h000014d6;
      expv[3] = 32'h000014d6;
      expv[4] = 32'h000014d6;
      expv[5] = 32'ha745a426;
      expv[6] = 32'ha745a426;
      expv[7] = 32'ha745a426;
      expv[8] = 32'h8a2a7b01;
      expv[9] = 32'h8a2a7b01;
      expv[10] = 32'h8a2a7b01;
      expv[11] = 32'h8a2a7b01;
      expv[12] = 32'h0e66e84e;
      expv[13] = 32'ha168e654;
      expv[14] = 32'ha168e654;
      expv[15] = 32'hcf4753a7;
      expv[16] = 32'hcf4753a7;
      expv[17] = 32'hcf4753a7;
      expv[18] = 32'ha415a981;
      expv[19] = 32'ha415a981;
      expv[20] = 32'h0bc63974;
      expv[21] = 32'h0bc63974;
      expv[22] = 32'ha86f49ef;
      expv[23] = 32'hdf5fc150;
      expv[24] = 32'h91ec2c57;
      expv[25] = 32'h91ec2c57;
      expv[26] = 32'hf69261eb;
      expv[27] = 32'hf69261eb;
      expv[28] = 32'hf69261eb;
      expv[29] = 32'hf69261eb;
      expv[30] = 32'hf69261eb;
      expv[31] = 32'hd0a285b4;
      expv[32] = 32'hd0a285b4;
      expv[33] = 32'hd0a285b4;
      expv[34] = 32'h7194290e;
      expv[35] = 32'h14866b64;
      expv[36] = 32'hd868d129;
      expv[37] = 32'hd868d129;
      expv[38] = 32'h21f87852;
      expv[39] = 32'h4b62a5e9;
      expv[40] = 32'he9e352e2;
      expv[41] = 32'he9e352e2;
      expv[42] = 32'he9e352e2;
      expv[43] = 32'h51f25be8;
      expv[44] = 32'hd6d351ee;
      expv[45] = 32'hd6d351ee;
      expv[46] = 32'hd6d351ee;
      expv[47] = 32'h53bfd542;
      expv[48] = 32'h53bfd542;
      expv[49] = 32'h2f3747c5;
      expv[50] = 32'h211f224a;
      expv[51] = 32'hcd0e8d53;
      expv[52] = 32'hcd0e8d53;
      expv[53] = 32'hcd0e8d53;
      expv[54] = 32'ha1d0f4ec;
      expv[55] = 32'h2ab50d6b;
      expv[56] = 32'hb25b377b;
      expv[57] = 32'hb25b377b;
      expv[58] = 32'hb25b377b;
      expv[59] = 32'h1f885c76;
      expv[60] = 32'h35eee971;
      expv[61] = 32'h35eee971;
      expv[62] = 32'h35eee971;
      expv[63] = 32'h6a340071;
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
