// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07453 dut (
    .clk(clk),
    .reset(in_vec[76:76]),
    .mulreq_msg_a(in_vec[75:44]),
    .mulreq_msg_b(in_vec[43:12]),
    .sign_en(in_vec[11:11]),
    .result_en(in_vec[10:10]),
    .a_mux_sel(in_vec[9:9]),
    .b_mux_sel(in_vec[8:8]),
    .op_shamt(in_vec[7:3]),
    .result_mux_sel(in_vec[2:2]),
    .add_mux_sel(in_vec[1:1]),
    .sign_mux_sel(in_vec[0:0]),
    .mulresp_msg_result(out_vec[96:33]),
    .sign(out_vec[32:32]),
    .b_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h1c20c367d3c1f31288ec;
    stim[1] = 77'h1a11b4de87d97b27d88f;
    stim[2] = 77'h0073380ba654e4b88be3;
    stim[3] = 77'h02722f2e724fca31a5c6;
    stim[4] = 77'h18fb106e326009ffbab2;
    stim[5] = 77'h0023fd5579f8ff990d73;
    stim[6] = 77'h0a613db7fcb1ca9c1d6f;
    stim[7] = 77'h02c1c8f1de27ff2ffaa0;
    stim[8] = 77'h0f658042440d98e00324;
    stim[9] = 77'h0b2bf233c0353c2166c0;
    stim[10] = 77'h03262a07f363da766f25;
    stim[11] = 77'h0784b0d4de416e4a772a;
    stim[12] = 77'h00f1a205f6d2ef420b50;
    stim[13] = 77'h033665cf2e5f6146abca;
    stim[14] = 77'h0ff3136ac0b51a8486ae;
    stim[15] = 77'h121b2d22af219526ab8a;
    stim[16] = 77'h031014a246e5476acad7;
    stim[17] = 77'h0ceb09d8809c84c94d74;
    stim[18] = 77'h089b1b14605fa761c2c8;
    stim[19] = 77'h06cb8cf6369660d6c86a;
    stim[20] = 77'h0451a1a59fdc9d822757;
    stim[21] = 77'h0b009a3a3d5c4438afd7;
    stim[22] = 77'h0d43b82675aef4ab97fe;
    stim[23] = 77'h0f660dbc398de97f5493;
    stim[24] = 77'h095ed3c3676f0c6ebc13;
    stim[25] = 77'h02365c651142bca947c8;
    stim[26] = 77'h0c17dc431f9779d93c0e;
    stim[27] = 77'h03786f55145f3eea80fe;
    stim[28] = 77'h0529148d5a65021763fa;
    stim[29] = 77'h065be19a3ac1655a6d8f;
    stim[30] = 77'h08d3e21cc54654961328;
    stim[31] = 77'h02b218d2f6268cd150fa;
    stim[32] = 77'h0b7601dd199932c16aa0;
    stim[33] = 77'h00a3fed9974b7862d306;
    stim[34] = 77'h013e6750f8ad388180e7;
    stim[35] = 77'h0329ef1ce1a74b38047b;
    stim[36] = 77'h0b3c6018a675cd01d31a;
    stim[37] = 77'h05517d89645a485bfe8c;
    stim[38] = 77'h0ff688f12f5541ec53af;
    stim[39] = 77'h0167175d8ac564e14d0d;
    stim[40] = 77'h0d280b3defddf36824c7;
    stim[41] = 77'h062bac7333bad2438e7a;
    stim[42] = 77'h06ae72a81bf6ecb7f8b8;
    stim[43] = 77'h0d8f59af22eacfdd36bb;
    stim[44] = 77'h0a2f577f302da04d7a37;
    stim[45] = 77'h026aaa1220a0c63f7f58;
    stim[46] = 77'h0779f74550478ccba4ea;
    stim[47] = 77'h09334f9d0651467f3728;
    stim[48] = 77'h0faf8433794f238323e5;
    stim[49] = 77'h00bf9c2020c282ddf8ca;
    stim[50] = 77'h09bbe9e82b256481ea1e;
    stim[51] = 77'h0d55fea1535e9d63a560;
    stim[52] = 77'h038d5fc8428d5850d98c;
    stim[53] = 77'h06121f521fe7697108d7;
    stim[54] = 77'h048b84fd7fa1a44906ca;
    stim[55] = 77'h0178e6532187f85eed7d;
    stim[56] = 77'h0a34f1eb12cd85bcfd31;
    stim[57] = 77'h0227df8f6db911aa6f6e;
    stim[58] = 77'h0572ca9809734b6c7f3d;
    stim[59] = 77'h08052d4d10ecd5704b50;
    stim[60] = 77'h00ea6ebe128d7b5035e5;
    stim[61] = 77'h0e6070cc402cbf5cab6a;
    stim[62] = 77'h01e2fe98e090556cb150;
    stim[63] = 77'h01413073410394b3a6d7;
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
      expv[0] = 97'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 97'hxxxxxxxxxxxxxxxxx3c1f3128;
      expv[2] = 97'hxxxxxxxxxxxxxxxxx7d97b27d;
      expv[3] = 97'hxxxxxxxxxxxxxxxxx00000007;
      expv[4] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[5] = 97'hxxxxxxxxxxxxxxxxx26009ffb;
      expv[6] = 97'h0000000000000000100009802;
      expv[7] = 97'h000000000047faaae00000004;
      expv[8] = 97'h000000000047faaaf1d800d01;
      expv[9] = 97'h000000000047faaaf01d800d0;
      expv[10] = 97'h000000000000000010353c216;
      expv[11] = 97'h0000000000000000000353c21;
      expv[12] = 97'h000000000000000000001a9e1;
      expv[13] = 97'h000000000000000000000006a;
      expv[14] = 97'h0000000000000000100000000;
      expv[15] = 97'h000000000000000010b51a848;
      expv[16] = 97'h00000000000000001000005a8;
      expv[17] = 97'h000000000000000006e5476ac;
      expv[18] = 97'h000000000000000010001b951;
      expv[19] = 97'h0000000000000000105fa761c;
      expv[20] = 97'h0000000000000000069660d6c;
      expv[21] = 97'h1ffffffff268e613a001a5983;
      expv[22] = 97'h0000003669fecb6c600000000;
      expv[23] = 97'h068e610396013493a00000000;
      expv[24] = 97'h000000000000000006721680b;
      expv[25] = 97'h0000000000000000176f0c6eb;
      expv[26] = 97'h000000000000000010000003b;
      expv[27] = 97'h001a84b0f280000000688626d;
      expv[28] = 97'h001a84b0f2800000045f3eea8;
      expv[29] = 97'h1fe57b4f0d800000000000000;
      expv[30] = 97'h0392f40602800000100000000;
      expv[31] = 97'h0392f40602800000100000000;
      expv[32] = 97'h0392f4060280000016268cd15;
      expv[33] = 97'h0392f406028000000666cd3ea;
      expv[34] = 97'h1c6d0bf9fd8000000666cd3ea;
      expv[35] = 97'h1c6d0bf9fd8000000752c77e8;
      expv[36] = 97'h000000000000000001a74b380;
      expv[37] = 97'h00000000000000000034e9670;
      expv[38] = 97'h0000000000000000045a485bf;
      expv[39] = 97'h000000000000000000000022d;
      expv[40] = 97'h0000000000000000100000116;
      expv[41] = 97'h0000000002ce2ebb10220c97e;
      expv[42] = 97'h000000000000000003bad2438;
      expv[43] = 97'h0000000000000000140913481;
      expv[44] = 97'h000000000000000012eacfdd3;
      expv[45] = 97'h0000000000000000102da04d7;
      expv[46] = 97'h0000000000000000000005b40;
      expv[47] = 97'h000000000000000000478ccba;
      expv[48] = 97'h000000000000000000023c665;
      expv[49] = 97'h0000000000000000000000000;
      expv[50] = 97'h000000000000000000c282ddf;
      expv[51] = 97'h000000000000000004da9b7e2;
      expv[52] = 97'h000000000000000000004da9b;
      expv[53] = 97'h0000000000000000000000002;
      expv[54] = 97'h00000000000000001018968f0;
      expv[55] = 97'h0000000000000000105e5bb70;
      expv[56] = 97'h0000000000000000000000bcb;
      expv[57] = 97'h000000000000000010000002f;
      expv[58] = 97'h1ffffffff469e3d6300000000;
      expv[59] = 97'h000000000b961c29f00000000;
      expv[60] = 97'h1ffffffff469e3d6300000000;
      expv[61] = 97'h000000000b961c29f00000000;
      expv[62] = 97'h000000000b961c29f00000000;
      expv[63] = 97'h1ffffffff469e3d6300000000;
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
