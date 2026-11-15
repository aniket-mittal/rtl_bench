// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018196 dut (
    .a(in_vec[67:36]),
    .b(in_vec[35:4]),
    .alu_op(in_vec[3:0]),
    .result(out_vec[95:64]),
    .hi(out_vec[63:32]),
    .lo(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'ha3ea37f0b79c3c207;
    stim[1] = 68'h1e89ce77fd1b193db;
    stim[2] = 68'h74eb87a4cf144706d;
    stim[3] = 68'hda287fcb63c53f732;
    stim[4] = 68'h6dfefdd8f2b0bd521;
    stim[5] = 68'h8b91648507d7b5cfb;
    stim[6] = 68'h53169edfcb13c5ce1;
    stim[7] = 68'ha7aab21c47ceed472;
    stim[8] = 68'h0bd22e543f7c83cd7;
    stim[9] = 68'h352c3a25f9b38c73d;
    stim[10] = 68'h4426030b690bd7717;
    stim[11] = 68'ha30c65c8936c53ab3;
    stim[12] = 68'h1081301a7afcfd218;
    stim[13] = 68'h5ea4bb9b6fde99458;
    stim[14] = 68'he70b1c934a88be934;
    stim[15] = 68'h9c2eecd621c389122;
    stim[16] = 68'hc81e8ea7ae7a6cc62;
    stim[17] = 68'hf4603887afbf1ed93;
    stim[18] = 68'hfe400a4108dfe9590;
    stim[19] = 68'h7d76890708dc9fdc9;
    stim[20] = 68'h50f8429a3c5a9471c;
    stim[21] = 68'h92995836777aa5a14;
    stim[22] = 68'h51062025b1e34c768;
    stim[23] = 68'h6ed153f23c351fa5d;
    stim[24] = 68'h39a1d19d07682462f;
    stim[25] = 68'h98fbb2e8a2b28ce60;
    stim[26] = 68'hb074aa6828e6f3b3d;
    stim[27] = 68'h03879b2d1331574ef;
    stim[28] = 68'hce71e9b12fafdf499;
    stim[29] = 68'hd06d3385593f44ed1;
    stim[30] = 68'h65ea55bdd6fe516a4;
    stim[31] = 68'h53aca7e7af17f55a0;
    stim[32] = 68'h6e5dad862d4f758f3;
    stim[33] = 68'h4ed700c44e0c749a9;
    stim[34] = 68'ha1b7613a107e0cc0c;
    stim[35] = 68'h6561792d0b67eb60f;
    stim[36] = 68'h9ae91e6fe05e0273f;
    stim[37] = 68'h9e8e269b8a6814afa;
    stim[38] = 68'h883cb2fd49e0e498b;
    stim[39] = 68'h422500da46d7dc251;
    stim[40] = 68'h5b86776b06bab5a7e;
    stim[41] = 68'h68a720748b62c1216;
    stim[42] = 68'h7e811cf6dc8575377;
    stim[43] = 68'h0e9fc002612ce7de2;
    stim[44] = 68'h9354868d0feaf7515;
    stim[45] = 68'h8c4d2fefc8c95f534;
    stim[46] = 68'hbf0cb804b68dc99d6;
    stim[47] = 68'h89ab140c4a12e315b;
    stim[48] = 68'h55be2754e8f85c323;
    stim[49] = 68'hea32318f4f02a0c57;
    stim[50] = 68'h5d810c005e09bc7d2;
    stim[51] = 68'hab76f5f0aee69a963;
    stim[52] = 68'h04f1583fe612e3d7c;
    stim[53] = 68'h8fccc4e75e64e3f39;
    stim[54] = 68'he2caaea10f91df608;
    stim[55] = 68'ha6c003c86e56d91ae;
    stim[56] = 68'habded1191b0c5a890;
    stim[57] = 68'hcf64a41f397fac164;
    stim[58] = 68'h68a76d5f3bfe01aac;
    stim[59] = 68'hc449970d0e97a692c;
    stim[60] = 68'hfe62b053c9e7eb393;
    stim[61] = 68'hac5efc57cd5953bc7;
    stim[62] = 68'hbcd0b531847c07afd;
    stim[63] = 68'hc25bb4ef5fc02a017;
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
      expv[0] = 96'ha3ea37f00000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h00000000e9a82de044f3a9d8;
      expv[3] = 96'h42003f430000000000000000;
      expv[4] = 96'h9f4e408a0000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'h98055b110000000000000000;
      expv[7] = 96'h078aa0040000000000000000;
      expv[8] = 96'h45ca80000000000000000000;
      expv[9] = 96'h00000000feb11581b7895a9f;
      expv[10] = 96'h061600000000000000000000;
      expv[11] = 96'h7cf3be770000000000000000;
      expv[12] = 96'h0840980d0000000000000000;
      expv[13] = 96'h02f525dc0000000000000000;
      expv[14] = 96'h3193db260000000000000000;
      expv[15] = 96'h000288120000000000000000;
      expv[16] = 96'h881a0c860000000000000000;
      expv[17] = 96'h5bdfe77e0000000000000000;
      expv[18] = 96'hfedfeb590000000000000000;
      expv[19] = 96'he0916ebe0000000000000000;
      expv[20] = 96'h000000000000000000000000;
      expv[21] = 96'h0a13fdd70000000000000000;
      expv[22] = 96'h000001440000000000000000;
      expv[23] = 96'h000000001a100eb5df2f68fa;
      expv[24] = 96'h000000000000000000000000;
      expv[25] = 96'hbafbbeee0000000000000000;
      expv[26] = 96'h00000000f34a77b878c3deb8;
      expv[27] = 96'h000000000000000000000000;
      expv[28] = 96'h8d978e730000000000000000;
      expv[29] = 96'h895277680000000000000000;
      expv[30] = 96'h3ce8a7270000000000000000;
      expv[31] = 96'hffbff7ff0000000000000000;
      expv[32] = 96'hd3b2da790000000000000000;
      expv[33] = 96'h2300eb720000000000000000;
      expv[34] = 96'h000000010000000000000000;
      expv[35] = 96'h000000000000000000000000;
      expv[36] = 96'h000000000000000000000000;
      expv[37] = 96'h000000000000000000000000;
      expv[38] = 96'h000000000000000000000000;
      expv[39] = 96'h04f2dcff0000000000000000;
      expv[40] = 96'h00000000040b3df00000000d;
      expv[41] = 96'h9758df8b0000000000000000;
      expv[42] = 96'h7b0000000000000000000000;
      expv[43] = 96'h000cc0020000000000000000;
      expv[44] = 96'h83698f3c0000000000000000;
      expv[45] = 96'h55168f420000000000000000;
      expv[46] = 96'h40f347fb0000000000000000;
      expv[47] = 96'h000000000000000000000000;
      expv[48] = 96'hbf47fbef0000000000000000;
      expv[49] = 96'h464631e00000000000000000;
      expv[50] = 96'h5c010c000000000000000000;
      expv[51] = 96'h55996f6f0000000000000000;
      expv[52] = 96'h000000000000000000000000;
      expv[53] = 96'he72333f10000000000000000;
      expv[54] = 96'he2caaea10000000000000000;
      expv[55] = 96'h00000000a6c003c800000000;
      expv[56] = 96'hbbdedb990000000000000000;
      expv[57] = 96'h08e450350000000000000000;
      expv[58] = 96'h000000000000000000000000;
      expv[59] = 96'h000000010000000000000000;
      expv[60] = 96'h379d5fee0000000000000000;
      expv[61] = 96'h700000000000000000000000;
      expv[62] = 96'h00000000206a5b4fcf5c337f;
      expv[63] = 96'h84b769de0000000000000000;
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
