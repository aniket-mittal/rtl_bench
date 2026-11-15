// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139175 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .input_vector1(in_vec[63:32]),
    .input_vector2(in_vec[31:0]),
    .result(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h15c81d1dd5ea6a492;
    stim[1] = 65'h1cd9b8df69a013c33;
    stim[2] = 65'h0354b1170ba4bb8c1;
    stim[3] = 65'h0389c574c03913003;
    stim[4] = 65'h0b6daecf00a6cc74c;
    stim[5] = 65'h0be5b62226bd27e53;
    stim[6] = 65'h0c7e0f47e994d3702;
    stim[7] = 65'h003a0513c412146ae;
    stim[8] = 65'h0cfdc36f54c01885d;
    stim[9] = 65'h0d6960021cf47391b;
    stim[10] = 65'h086695254188d1d5a;
    stim[11] = 65'h0d6e8d3f9b7a1c922;
    stim[12] = 65'h09a2ac4f6a50c24fa;
    stim[13] = 65'h0b0a839c530148c7c;
    stim[14] = 65'h01d721fbc51c9cc13;
    stim[15] = 65'h15b9d3e15adf1c997;
    stim[16] = 65'h0438e863760b4e4ed;
    stim[17] = 65'h0a2da142526127a90;
    stim[18] = 65'h18a3c2df636893c7d;
    stim[19] = 65'h06293eee59aa9d1c0;
    stim[20] = 65'h1daf03fb01b0496b1;
    stim[21] = 65'h082791d7bbbae1975;
    stim[22] = 65'h06ee3905cba0beb9b;
    stim[23] = 65'h052f86c2c006a1bfc;
    stim[24] = 65'h020425b5dfd561e41;
    stim[25] = 65'h03347927f703a6e3f;
    stim[26] = 65'h0d51e628e2478f44f;
    stim[27] = 65'h021c363dbe13fd428;
    stim[28] = 65'h02985dd41015f2d85;
    stim[29] = 65'h04f621d28c559b901;
    stim[30] = 65'h0dcb866c53b44b336;
    stim[31] = 65'h09a8c76a0ac52d85d;
    stim[32] = 65'h08ec11a07c7827f0b;
    stim[33] = 65'h029b6f27096822601;
    stim[34] = 65'h0d6ab92d09952b899;
    stim[35] = 65'h0d8e76600a3e4ad33;
    stim[36] = 65'h0ba642e3c4b3ac0a7;
    stim[37] = 65'h062b598b056af292c;
    stim[38] = 65'h071c1fdcaac40b4e6;
    stim[39] = 65'h05d943104aad55d5a;
    stim[40] = 65'h0f47cc81b93338172;
    stim[41] = 65'h0b7d2f64f0c381c43;
    stim[42] = 65'h05898718829842c61;
    stim[43] = 65'h0c751ea3a0abb14f1;
    stim[44] = 65'h013264aa134bfdc29;
    stim[45] = 65'h009ec278c590e6ec7;
    stim[46] = 65'h06e5f44d31d856d79;
    stim[47] = 65'h01dc8d7aff1a66241;
    stim[48] = 65'h01823efeedfab6efc;
    stim[49] = 65'h08f85c0fe0c15784e;
    stim[50] = 65'h0b849126a7e7155aa;
    stim[51] = 65'h06b62fe00b5491038;
    stim[52] = 65'h0d1258b847fd646be;
    stim[53] = 65'h0377526a677f32672;
    stim[54] = 65'h031599b8381daf78e;
    stim[55] = 65'h0e300f494a33a5a8e;
    stim[56] = 65'h00a5f2afc296e4544;
    stim[57] = 65'h09437d71894a6af7b;
    stim[58] = 65'h04ecd61e578e63e1e;
    stim[59] = 65'h02df1526c4b199f15;
    stim[60] = 65'h0f86ca6b46c3a29ef;
    stim[61] = 65'h00446c2a9583b6264;
    stim[62] = 65'h084db61a7f5c20d0a;
    stim[63] = 65'h026b334c5101ebeb4;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
