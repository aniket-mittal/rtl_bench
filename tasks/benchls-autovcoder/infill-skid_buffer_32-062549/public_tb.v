// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062549 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .din(in_vec[33:2]),
    .din_valid(in_vec[1:1]),
    .dout_ready(in_vec[0:0]),
    .din_ready(out_vec[33:33]),
    .dout(out_vec[32:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7c6f3d55c;
    stim[1] = 35'h4e3eb62f4;
    stim[2] = 35'h10af2fa9f;
    stim[3] = 35'h0b184b466;
    stim[4] = 35'h03bb8e69b;
    stim[5] = 35'h07bb0b250;
    stim[6] = 35'h0c581b98d;
    stim[7] = 35'h2856fc856;
    stim[8] = 35'h1fc4dddc7;
    stim[9] = 35'h10796264c;
    stim[10] = 35'h0e3f82ee8;
    stim[11] = 35'h0adbe8e00;
    stim[12] = 35'h0ab636ae3;
    stim[13] = 35'h20c785674;
    stim[14] = 35'h11259ca4b;
    stim[15] = 35'h2a7b7d1f0;
    stim[16] = 35'h0796cfb9b;
    stim[17] = 35'h2fe001272;
    stim[18] = 35'h050225cde;
    stim[19] = 35'h3b1274c2e;
    stim[20] = 35'h13cfe873c;
    stim[21] = 35'h05edc06e0;
    stim[22] = 35'h137d70d09;
    stim[23] = 35'h2ceaa7b09;
    stim[24] = 35'h31b57c105;
    stim[25] = 35'h0c020f8ac;
    stim[26] = 35'h1070e67dd;
    stim[27] = 35'h0fb8ab42a;
    stim[28] = 35'h316dddc8c;
    stim[29] = 35'h160399a21;
    stim[30] = 35'h057200974;
    stim[31] = 35'h36a5d771a;
    stim[32] = 35'h2917f5de6;
    stim[33] = 35'h32280b906;
    stim[34] = 35'h19f50d1e1;
    stim[35] = 35'h2eaabaacb;
    stim[36] = 35'h361ef6b36;
    stim[37] = 35'h1f6cd1013;
    stim[38] = 35'h0a3bf7e50;
    stim[39] = 35'h1378cf945;
    stim[40] = 35'h2ec327cb9;
    stim[41] = 35'h123daeb07;
    stim[42] = 35'h07893b623;
    stim[43] = 35'h0610bb462;
    stim[44] = 35'h030034720;
    stim[45] = 35'h2603644b6;
    stim[46] = 35'h004952ac7;
    stim[47] = 35'h1c427e6bd;
    stim[48] = 35'h176852817;
    stim[49] = 35'h0fc654f7c;
    stim[50] = 35'h2e77c86ce;
    stim[51] = 35'h24f8771bb;
    stim[52] = 35'h2c1dfbf76;
    stim[53] = 35'h22f069111;
    stim[54] = 35'h379bf1dcc;
    stim[55] = 35'h0d187a913;
    stim[56] = 35'h09598f88f;
    stim[57] = 35'h1f4fe9143;
    stim[58] = 35'h37a0b4f91;
    stim[59] = 35'h08409643b;
    stim[60] = 35'h1125cd54a;
    stim[61] = 35'h34961c33c;
    stim[62] = 35'h3c15ca3e3;
    stim[63] = 35'h0e21ea7c2;
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
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'h085797d4f;
      expv[4] = 34'h285797d4f;
      expv[5] = 34'h01ddc734d;
      expv[6] = 34'h21ddc734d;
      expv[7] = 34'h21ddc734c;
      expv[8] = 34'h342b7e42b;
      expv[9] = 34'h0fe26eee3;
      expv[10] = 34'h0fe26eee3;
      expv[11] = 34'h0fe26eee3;
      expv[12] = 34'h2fe26eee3;
      expv[13] = 34'h055b1b571;
      expv[14] = 34'h255b1b571;
      expv[15] = 34'h0892ce525;
      expv[16] = 34'h2892ce525;
      expv[17] = 34'h03cb67dcd;
      expv[18] = 34'h03cb67dcd;
      expv[19] = 34'h03cb67dcd;
      expv[20] = 34'h03cb67dcd;
      expv[21] = 34'h03cb67dcd;
      expv[22] = 34'h23cb67dcd;
      expv[23] = 34'h23cb67dcc;
      expv[24] = 34'h23cb67dcc;
      expv[25] = 34'h23cb67dcc;
      expv[26] = 34'h23cb67dcc;
      expv[27] = 34'h23cb67dcc;
      expv[28] = 34'h07dc55a15;
      expv[29] = 34'h27dc55a15;
      expv[30] = 34'h27dc55a14;
      expv[31] = 34'h27dc55a14;
      expv[32] = 34'h1b52ebb8d;
      expv[33] = 34'h1b52ebb8d;
      expv[34] = 34'h3b52ebb8d;
      expv[35] = 34'h3b52ebb8c;
      expv[36] = 34'h17555d565;
      expv[37] = 34'h37555d565;
      expv[38] = 34'h0fb668809;
      expv[39] = 34'h2fb668809;
      expv[40] = 34'h2fb668808;
      expv[41] = 34'h2fb668808;
      expv[42] = 34'h291ed7583;
      expv[43] = 34'h03c49db11;
      expv[44] = 34'h03c49db11;
      expv[45] = 34'h03c49db11;
      expv[46] = 34'h23c49db11;
      expv[47] = 34'h2024a9563;
      expv[48] = 34'h2024a9562;
      expv[49] = 34'h0bb42940b;
      expv[50] = 34'h0bb42940b;
      expv[51] = 34'h2bb42940b;
      expv[52] = 34'h127c3b8dd;
      expv[53] = 34'h327c3b8dd;
      expv[54] = 34'h327c3b8dc;
      expv[55] = 34'h327c3b8dc;
      expv[56] = 34'h268c3d489;
      expv[57] = 34'h24acc7c47;
      expv[58] = 34'h2fa7f48a1;
      expv[59] = 34'h2fa7f48a0;
      expv[60] = 34'h04204b21d;
      expv[61] = 34'h04204b21d;
      expv[62] = 34'h24204b21d;
      expv[63] = 34'h1e0ae51f1;
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
