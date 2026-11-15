// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118278 dut (
    .clk(clk),
    .rst_n(in_vec[65:65]),
    .vld(in_vec[64:64]),
    .roll_rt(in_vec[63:48]),
    .yaw_rt(in_vec[47:32]),
    .AY(in_vec[31:16]),
    .AZ(in_vec[15:0]),
    .incline(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h02665535a322ab2a2;
    stim[1] = 66'h0a270bd199aa4d2e9;
    stim[2] = 66'h3a27366ccf278711e;
    stim[3] = 66'h3cc85cea12470f3c7;
    stim[4] = 66'h195f4d6b0d587c89a;
    stim[5] = 66'h3973e3785f9b3c264;
    stim[6] = 66'h3bddad0495fd66154;
    stim[7] = 66'h341d2ae08c2ce1f0e;
    stim[8] = 66'h26a3a2cf48b47f1ad;
    stim[9] = 66'h27f6231cc755cf6c4;
    stim[10] = 66'h20612d098558652c3;
    stim[11] = 66'h220f4521fb73e10c7;
    stim[12] = 66'h23c0420db97c1e37f;
    stim[13] = 66'h20e4ab5e95475d399;
    stim[14] = 66'h37a10a0aea0c5b0ef;
    stim[15] = 66'h27db513330fc79d82;
    stim[16] = 66'h216661b93ec8d1a20;
    stim[17] = 66'h31f4db6d9b20dcc75;
    stim[18] = 66'h2489e8e7ace59d480;
    stim[19] = 66'h38a1b13943b07a36f;
    stim[20] = 66'h39170c37fb602e01f;
    stim[21] = 66'h2aff80c907675f818;
    stim[22] = 66'h25c4923d14e3b7028;
    stim[23] = 66'h3d66459febc153e35;
    stim[24] = 66'h329fb6278b1738aaa;
    stim[25] = 66'h2c59edaeb95161455;
    stim[26] = 66'h24242cc3373415fdc;
    stim[27] = 66'h31dd1eb754491f85f;
    stim[28] = 66'h3dc089b22e1eeeb9b;
    stim[29] = 66'h3684e6c3cda139784;
    stim[30] = 66'h210c5a9b3f8d0242d;
    stim[31] = 66'h38d7f59e88151f452;
    stim[32] = 66'h3cb56b6055069d7ba;
    stim[33] = 66'h388d2d4b1fe69c61c;
    stim[34] = 66'h248dfba6bed88bd49;
    stim[35] = 66'h31cc225952e90cc83;
    stim[36] = 66'h32c6baa935fc68fca;
    stim[37] = 66'h3bac0304842560e46;
    stim[38] = 66'h2aea3a0bcf87b0155;
    stim[39] = 66'h325ac9227493946bb;
    stim[40] = 66'h36a51b5662f9ac57e;
    stim[41] = 66'h3011276c0198acc46;
    stim[42] = 66'h2a9a1ee740f92a899;
    stim[43] = 66'h28de15de2e80935f0;
    stim[44] = 66'h2aad9060e7765969b;
    stim[45] = 66'h26dcbee6212fd9ae5;
    stim[46] = 66'h1a65bc60fd2eb4ac0;
    stim[47] = 66'h246177628dd7dafbe;
    stim[48] = 66'h2f569b89950aea229;
    stim[49] = 66'h3caa92f499af9917d;
    stim[50] = 66'h3a728786670d0e995;
    stim[51] = 66'h3284d12c42959c8ab;
    stim[52] = 66'h3167b7b7fcb30677e;
    stim[53] = 66'h25f12b5533dcd087a;
    stim[54] = 66'h3d892d248210110cd;
    stim[55] = 66'h3d85b45e45e826bec;
    stim[56] = 66'h3d2d229e01350bdc0;
    stim[57] = 66'h346e19b2b88e50ca2;
    stim[58] = 66'h32be4fd36d9a5b4c3;
    stim[59] = 66'h216690b139e223a43;
    stim[60] = 66'h322b439943ebf5451;
    stim[61] = 66'h22441bd67f756724c;
    stim[62] = 66'h3428ef51eba43b35a;
    stim[63] = 66'h292864460e44d1663;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h1ffa;
      expv[11] = 13'h1ffa;
      expv[12] = 13'h1ffa;
      expv[13] = 13'h1ffa;
      expv[14] = 13'h1ffa;
      expv[15] = 13'h1ffa;
      expv[16] = 13'h1ffa;
      expv[17] = 13'h1ff7;
      expv[18] = 13'h1ff7;
      expv[19] = 13'h1ff7;
      expv[20] = 13'h1ff5;
      expv[21] = 13'h1ff5;
      expv[22] = 13'h1fef;
      expv[23] = 13'h1fd9;
      expv[24] = 13'h1fd9;
      expv[25] = 13'h1fd9;
      expv[26] = 13'h1fc9;
      expv[27] = 13'h1fc3;
      expv[28] = 13'h1fc3;
      expv[29] = 13'h1fc3;
      expv[30] = 13'h1fd7;
      expv[31] = 13'h1fdb;
      expv[32] = 13'h1fd6;
      expv[33] = 13'h1fd6;
      expv[34] = 13'h1fdc;
      expv[35] = 13'h1fd9;
      expv[36] = 13'h1fd8;
      expv[37] = 13'h1fd8;
      expv[38] = 13'h1fda;
      expv[39] = 13'h1fc9;
      expv[40] = 13'h1fb7;
      expv[41] = 13'h1fb7;
      expv[42] = 13'h1fc5;
      expv[43] = 13'h1fb1;
      expv[44] = 13'h1fb0;
      expv[45] = 13'h1fb0;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h000f;
      expv[55] = 13'h0019;
      expv[56] = 13'h0019;
      expv[57] = 13'h0030;
      expv[58] = 13'h001f;
      expv[59] = 13'h0030;
      expv[60] = 13'h002d;
      expv[61] = 13'h0018;
      expv[62] = 13'h0018;
      expv[63] = 13'h0020;
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
