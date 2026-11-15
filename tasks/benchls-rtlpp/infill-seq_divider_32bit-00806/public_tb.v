// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00806 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[66:66]),
    .rst_i(in_vec[65:65]),
    .divide_i(in_vec[64:64]),
    .dividend_i(in_vec[63:32]),
    .divisor_i(in_vec[31:0]),
    .quotient_o(out_vec[64:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h251d9e50068368eed;
    stim[1] = 67'h23583dd79a8c488ae;
    stim[2] = 67'h1f0d8cda227706f18;
    stim[3] = 67'h5a33c2325641fbd1f;
    stim[4] = 67'h1c3150321e0b97659;
    stim[5] = 67'h07e00bfae14a2d494;
    stim[6] = 67'h1ca41892fc477b4f3;
    stim[7] = 67'h198c96d69044accdc;
    stim[8] = 67'h0a11db09e52b31dbf;
    stim[9] = 67'h1d55d5d8de77aec5a;
    stim[10] = 67'h5a03a3cbb0889b76b;
    stim[11] = 67'h0c2d49db55aa66e6b;
    stim[12] = 67'h512aaa25dc2e3eb02;
    stim[13] = 67'h4bf21f2d17ebfb391;
    stim[14] = 67'h5d22c891e2e8f2148;
    stim[15] = 67'h5f62f907df08790d7;
    stim[16] = 67'h08851fbe34352f4c7;
    stim[17] = 67'h0ec88addf4eb67987;
    stim[18] = 67'h17837f7822e16fafa;
    stim[19] = 67'h0546f67294245a913;
    stim[20] = 67'h141185a4d87584f29;
    stim[21] = 67'h0af3699108bed91d3;
    stim[22] = 67'h0f8023700369f2922;
    stim[23] = 67'h0eada965dc067d08f;
    stim[24] = 67'h01b80c546d1f97b12;
    stim[25] = 67'h403cbd38d0800c5cf;
    stim[26] = 67'h03b6e4a6bef9f3b9a;
    stim[27] = 67'h09df74157934ba889;
    stim[28] = 67'h66b50609241d84d47;
    stim[29] = 67'h4ed0ac59d7d7a3338;
    stim[30] = 67'h4bb2603addacdb051;
    stim[31] = 67'h0f7b6814eccfcd7f2;
    stim[32] = 67'h1edfc0f839a140b47;
    stim[33] = 67'h0e951edbaebac7c3d;
    stim[34] = 67'h5263977fafb7e7b15;
    stim[35] = 67'h466ebf37ce3d0af46;
    stim[36] = 67'h0aa21e0f47e437f03;
    stim[37] = 67'h483b525411fe7024c;
    stim[38] = 67'h4319562c5f644f50f;
    stim[39] = 67'h0c7b136d2de0cc29a;
    stim[40] = 67'h5e5b3d260a7268185;
    stim[41] = 67'h1a5e3bf077f9b2aae;
    stim[42] = 67'h4fb73867387bc1e1c;
    stim[43] = 67'h4e628c1f923b6e94c;
    stim[44] = 67'h4faf6ecfc299d4747;
    stim[45] = 67'h55f4714589b1f7ff2;
    stim[46] = 67'h078cc830e2522f576;
    stim[47] = 67'h4b4f0373e767ebffa;
    stim[48] = 67'h356368fea4f2e3a05;
    stim[49] = 67'h06a4277769962295b;
    stim[50] = 67'h418dc0622d9875743;
    stim[51] = 67'h4a3f243bd589f3144;
    stim[52] = 67'h0eaafbde0fc4ebadb;
    stim[53] = 67'h45f672a1843f27e66;
    stim[54] = 67'h0da3e80c34dff2b47;
    stim[55] = 67'h4a1d55e638b380e04;
    stim[56] = 67'h08c9e09e438b53b18;
    stim[57] = 67'h1e7f7f320015c5bd2;
    stim[58] = 67'h465842764130bb8b4;
    stim[59] = 67'h02c329eea49edd90b;
    stim[60] = 67'h0043800d4ce4fe94c;
    stim[61] = 67'h52657ec89b107d889;
    stim[62] = 67'h194e304a120b7e639;
    stim[63] = 67'h5f570e8a245e8e43f;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000002;
      expv[31] = 65'h00000000000000006;
      expv[32] = 65'h00000000000000006;
      expv[33] = 65'h00000000000000006;
      expv[34] = 65'h00000000000000006;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000002;
      expv[52] = 65'h00000000000000006;
      expv[53] = 65'h00000000000000006;
      expv[54] = 65'h0000000000000000e;
      expv[55] = 65'h0000000000000000e;
      expv[56] = 65'h0000000000000001e;
      expv[57] = 65'h0000000000000001e;
      expv[58] = 65'h0000000000000001e;
      expv[59] = 65'h0000000000000003e;
      expv[60] = 65'h0000000000000003e;
      expv[61] = 65'h0000000000000003e;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
