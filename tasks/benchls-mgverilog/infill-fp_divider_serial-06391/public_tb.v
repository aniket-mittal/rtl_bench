// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06391 dut (
    .clk_i(clk),
    .dvdnd_i(in_vec[79:30]),
    .dvsor_i(in_vec[29:3]),
    .sign_dvd_i(in_vec[2:2]),
    .sign_div_i(in_vec[1:1]),
    .start_i(in_vec[0:0]),
    .ready_o(out_vec[56:56]),
    .qutnt_o(out_vec[55:29]),
    .rmndr_o(out_vec[28:2]),
    .sign_o(out_vec[1:1]),
    .div_zero_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'hb3e70dec4b2c79dbbc5c;
    stim[1] = 80'hec665ee030c959fa33e1;
    stim[2] = 80'h6180d0d7d3fcffb3d254;
    stim[3] = 80'h0454ae37c48aa53322d4;
    stim[4] = 80'h51f737474e391b45b876;
    stim[5] = 80'h03204904f1a10bcf072d;
    stim[6] = 80'h51c28d8ffed32ead89c6;
    stim[7] = 80'h7a7077d15124352c7c8d;
    stim[8] = 80'h190d71738390e2efb6ff;
    stim[9] = 80'h72aa489fc1d667c5a432;
    stim[10] = 80'hc212a8a14925ad4360ed;
    stim[11] = 80'h0eb2ad86a476e5f8f9ea;
    stim[12] = 80'h259a928e46338724690b;
    stim[13] = 80'he6a394a955e9dbb785c8;
    stim[14] = 80'heffa2e821bb033438a25;
    stim[15] = 80'ha5ad1c31653557a72e2f;
    stim[16] = 80'h044913c6a3a9bbe7d88e;
    stim[17] = 80'h5c71128692572f763d39;
    stim[18] = 80'ha90b1df9fecb4352429e;
    stim[19] = 80'h8224c29d3c2e16ff06e8;
    stim[20] = 80'h12df696ea67cebdc04b3;
    stim[21] = 80'hf2731e486a297acd7dc9;
    stim[22] = 80'h048cb4e1cbc31a8e50ee;
    stim[23] = 80'h9eed48d9a8f7c69452d8;
    stim[24] = 80'h3d460b07b6b084f92cf6;
    stim[25] = 80'h43f5404d64a7111c1c32;
    stim[26] = 80'h75badc958c98cf9429c7;
    stim[27] = 80'h585e94f9bb3dd290dd11;
    stim[28] = 80'h7d2577cea3aec058ab23;
    stim[29] = 80'hd8b2c411d4c10bac6e95;
    stim[30] = 80'ha2b4917449dadfd4c642;
    stim[31] = 80'h8314c9335cb74569c16f;
    stim[32] = 80'h1950f0b83384360b9731;
    stim[33] = 80'h23d991d85768ef5757d5;
    stim[34] = 80'haeba3dcd492510032433;
    stim[35] = 80'haea1ce4bf20dbd68325d;
    stim[36] = 80'haed43294276ccd27d9a8;
    stim[37] = 80'h1f4ec5c9d6b4bb3bc59d;
    stim[38] = 80'h95e806472e548db93fdd;
    stim[39] = 80'hd8d6b2c1468720bd361a;
    stim[40] = 80'h4d7b156891edd3e596c1;
    stim[41] = 80'he943f7b9e1f73aaddef1;
    stim[42] = 80'h960d7fe096388435e429;
    stim[43] = 80'h35088358e3e1a8c6554a;
    stim[44] = 80'hf19ed4d627c521d45dea;
    stim[45] = 80'hbf9f2c6d54fa7c83be41;
    stim[46] = 80'h1d4229a8b731dfa9ea3e;
    stim[47] = 80'h31d65e821057ebe86921;
    stim[48] = 80'h93f5e611d8ca25c0aa3c;
    stim[49] = 80'h659a0e46b03bc455c129;
    stim[50] = 80'h25ebce1b702e52da2979;
    stim[51] = 80'h30fa35e49a34107f4e6d;
    stim[52] = 80'h9b207743036a0965770a;
    stim[53] = 80'h25e56f583d5f276333dd;
    stim[54] = 80'h041e5056cfd4f1cfbca8;
    stim[55] = 80'h4ee5f7cf58aa22dc03de;
    stim[56] = 80'ha02299c484b263a33e76;
    stim[57] = 80'he09c91ceef82dad303d2;
    stim[58] = 80'he06d96b7fa7d2eda251f;
    stim[59] = 80'h382e2db752e0b76b37fc;
    stim[60] = 80'h18cf34781e30d71d47ea;
    stim[61] = 80'hf298de4f30220e3b58a6;
    stim[62] = 80'h60736da89d7b76907aab;
    stim[63] = 80'h6b6d46b0a922b08d9454;
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
      expv[0] = 57'hxxxxxxxxxxxxxxx;
      expv[1] = 57'h0xxxxxxxxxxxxxx;
      expv[2] = 57'h0xxxxxxxxxxxxxx;
      expv[3] = 57'h000000000000002;
      expv[4] = 57'h000000001860340;
      expv[5] = 57'h0000000030c0682;
      expv[6] = 57'h000000006180d00;
      expv[7] = 57'h000000000000002;
      expv[8] = 57'h000000001470a34;
      expv[9] = 57'h000000000000002;
      expv[10] = 57'h000000000000002;
      expv[11] = 57'h000000001caa922;
      expv[12] = 57'h000000000000002;
      expv[13] = 57'h0000000003acab4;
      expv[14] = 57'h000000000000002;
      expv[15] = 57'h0000000039a8e50;
      expv[16] = 57'h000000000000000;
      expv[17] = 57'h000000000000000;
      expv[18] = 57'h00000000011244c;
      expv[19] = 57'h000000000000000;
      expv[20] = 57'h080000002a42c76;
      expv[21] = 57'h080000001f61650;
      expv[22] = 57'h000000000000000;
      expv[23] = 57'h000000000000000;
      expv[24] = 57'h0000000001232d0;
      expv[25] = 57'h0000000002465a2;
      expv[26] = 57'h00000000048cb40;
      expv[27] = 57'h000000000919680;
      expv[28] = 57'h000000000000002;
      expv[29] = 57'h000000000000002;
      expv[30] = 57'h000000000000002;
      expv[31] = 57'h000000000000000;
      expv[32] = 57'h0000000028ad244;
      expv[33] = 57'h000000000000002;
      expv[34] = 57'h000000000000002;
      expv[35] = 57'h000000000000002;
      expv[36] = 57'h000000000000000;
      expv[37] = 57'h000000000000002;
      expv[38] = 57'h000000002bb50ca;
      expv[39] = 57'h000000000000002;
      expv[40] = 57'h000000000000000;
      expv[41] = 57'h000000003635ac8;
      expv[42] = 57'h000000000000000;
      expv[43] = 57'h000000000000002;
      expv[44] = 57'h000000000000002;
      expv[45] = 57'h000000000d4220c;
      expv[46] = 57'h000000001a84418;
      expv[47] = 57'h000000000000000;
      expv[48] = 57'h0000000007508a6;
      expv[49] = 57'h000000000000000;
      expv[50] = 57'h0000000024fd798;
      expv[51] = 57'h000000000000002;
      expv[52] = 57'h000000000000002;
      expv[53] = 57'h000000000000002;
      expv[54] = 57'h0000000026c81dc;
      expv[55] = 57'h000000000000000;
      expv[56] = 57'h000000000107940;
      expv[57] = 57'h00000000020f282;
      expv[58] = 57'h00000000041e500;
      expv[59] = 57'h00000000083ca02;
      expv[60] = 57'h000000000000002;
      expv[61] = 57'h000000000e0b8b4;
      expv[62] = 57'h000000001c1716a;
      expv[63] = 57'h00000000382e2d2;
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
