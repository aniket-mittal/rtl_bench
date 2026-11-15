// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01479 dut (
    .CLK_3M(in_vec[71:71]),
    .DECODE_DATA(in_vec[70:39]),
    .ENCODE_READ_EN(in_vec[38:38]),
    .DECODE_CLK_3M(in_vec[37:37]),
    .DECODE_WRITE_EN(in_vec[36:36]),
    .FSL_Clk(in_vec[35:35]),
    .FSL_Rst(in_vec[34:34]),
    .FSL_S_Data(in_vec[33:2]),
    .FSL_S_Exists(in_vec[1:1]),
    .FSL_M_Full(in_vec[0:0]),
    .ENCODE_DATA(out_vec[69:38]),
    .FSL_S_Clk(out_vec[37:37]),
    .FSL_S_Read(out_vec[36:36]),
    .FSL_S_Control(out_vec[35:35]),
    .FSL_M_Clk(out_vec[34:34]),
    .FSL_M_Write(out_vec[33:33]),
    .FSL_M_Data(out_vec[32:1]),
    .FSL_M_Control(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hb25f215384eebce5b3;
    stim[1] = 72'h7b552da02eae3a923b;
    stim[2] = 72'h146e93fe71fd9e1a2c;
    stim[3] = 72'h1d08451be8e99684ff;
    stim[4] = 72'hd3e6ecffd9bc383d53;
    stim[5] = 72'h397c60a100ca880baa;
    stim[6] = 72'h4ee46c1788a28f7706;
    stim[7] = 72'h891d7f6b73b41fdf86;
    stim[8] = 72'h20ae964952e5a0b8d0;
    stim[9] = 72'h39b84b54338a61e7b8;
    stim[10] = 72'h3f75fef2b14e01cf19;
    stim[11] = 72'h8d40a66b52fa39dec6;
    stim[12] = 72'h9e059b48cbc8b50626;
    stim[13] = 72'hf7a48e0fb2b5fbba39;
    stim[14] = 72'h7c86ec4b5a45e5f518;
    stim[15] = 72'hcdd966f5d2d715b3ef;
    stim[16] = 72'h368dde6150e3d9131c;
    stim[17] = 72'h65571427100f7e7027;
    stim[18] = 72'he46c6335b163581580;
    stim[19] = 72'hcab2dbd3998c1711eb;
    stim[20] = 72'hb95366b2430d844d54;
    stim[21] = 72'h372feda06b8dc3b00c;
    stim[22] = 72'hab128049622f48fad1;
    stim[23] = 72'h6b7b8ce41ad4f6ad81;
    stim[24] = 72'h5376ab8d680e93ec80;
    stim[25] = 72'h8d7b25074805f8f902;
    stim[26] = 72'hd312482140d88c3837;
    stim[27] = 72'h2dadb79b806895b929;
    stim[28] = 72'h67e949df20c5fa53e9;
    stim[29] = 72'hd16b11c6e1a944d03c;
    stim[30] = 72'hae7b879ec0450d4108;
    stim[31] = 72'h76dedd0f5248d8bfde;
    stim[32] = 72'hb48d7ada7825cbdc69;
    stim[33] = 72'hc16d0ec51acf160213;
    stim[34] = 72'h9fa6a5f251dc28d9f6;
    stim[35] = 72'h74862f8c28b9c1eb63;
    stim[36] = 72'h02e35269c80c6eb1fe;
    stim[37] = 72'h19aa5824db5ec24d50;
    stim[38] = 72'hceafd42400cf535aec;
    stim[39] = 72'h271a9505c09709ccca;
    stim[40] = 72'hbbd038d7932b7bc07f;
    stim[41] = 72'h03efe8301aabb69f93;
    stim[42] = 72'h07238ee2684efc4e31;
    stim[43] = 72'hee22308fbb65d5687a;
    stim[44] = 72'he90fb6404a4c44b68d;
    stim[45] = 72'h8b90741b7b6bfc94ee;
    stim[46] = 72'h167ffd32cbaea45103;
    stim[47] = 72'h469c474bda8d4636a9;
    stim[48] = 72'h753e4c4893b9ce2773;
    stim[49] = 72'h47ab1fe8a13ce35f9e;
    stim[50] = 72'hc3d2d87a300285a20b;
    stim[51] = 72'h75a143dddb5e1b9353;
    stim[52] = 72'h696767a2b233becfd9;
    stim[53] = 72'h0b49c1ff49852c8156;
    stim[54] = 72'hf8fab4b628b30d6647;
    stim[55] = 72'he88d84841b80b8acb8;
    stim[56] = 72'h61072bf982396cea2b;
    stim[57] = 72'h07e821d3e300a4a64c;
    stim[58] = 72'h8366080d68e5759770;
    stim[59] = 72'h9bb00c0fb92880bacc;
    stim[60] = 72'h3dbe6c043a316687ad;
    stim[61] = 72'he796c8db6d4b5016ac;
    stim[62] = 72'h9d9acaa940a3d5ad8d;
    stim[63] = 72'hfab088332b55e549ea;
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
      expv[0] = 70'h0eebce5b28c97c854f;
      expv[1] = 70'h2ae3a9238ded54b681;
      expv[2] = 70'h1fd9e1a2de51ba4ff9;
      expv[3] = 70'h0e99684fdc7421146f;
      expv[4] = 70'h1bc383d53b4f9bb3ff;
      expv[5] = 70'h0ca880ba88e5f18285;
      expv[6] = 70'h0a28f770493b91b05f;
      expv[7] = 70'h3b41fdf87e2475fdad;
      expv[8] = 70'h2e5a0b8d1a82ba5925;
      expv[9] = 70'h38a61e7b8ee6e12d51;
      expv[10] = 70'h14e01cf18efdd7fbcb;
      expv[11] = 70'h2fa39dec7a350299ad;
      expv[12] = 70'h3c8b50627878166d23;
      expv[13] = 70'h2b5fbba3afde92383f;
      expv[14] = 70'h245e5f519bf21bb12d;
      expv[15] = 70'h2d715b3efb37659bd7;
      expv[16] = 70'h0e3d9131dada377985;
      expv[17] = 70'h00f7e7024b955c509d;
      expv[18] = 70'h163581582f91b18cd7;
      expv[19] = 70'h18c1711eab2acb6f4f;
      expv[20] = 70'h30d844d578e54d9ac9;
      expv[21] = 70'h38dc3b00dcdcbfb681;
      expv[22] = 70'h22f48fad3cac4a0125;
      expv[23] = 70'h2d4f6ad80badee3391;
      expv[24] = 70'h00e93ec81d4ddaae35;
      expv[25] = 70'h005f8f903835ec941d;
      expv[26] = 70'h0d88c383794c492085;
      expv[27] = 70'h06895b9288b6b6de6f;
      expv[28] = 70'h0c5fa53e8d9fa5277d;
      expv[29] = 70'h1a944d03fd45ac471b;
      expv[30] = 70'h0450d410b8b9ee1e7b;
      expv[31] = 70'h248d8bfddbdb7b743d;
      expv[32] = 70'h025cbdc6bed235eb69;
      expv[33] = 70'h2cf160212b05b43b15;
      expv[34] = 70'h1dc28d9f7a7e9a97c9;
      expv[35] = 70'h0b9c1eb60dd218be31;
      expv[36] = 70'h00c6eb1fd80b8d49a7;
      expv[37] = 70'h35ec24d51a66a96093;
      expv[38] = 70'h0cf535aee93abf5091;
      expv[39] = 70'h09709ccc989c6a5417;
      expv[40] = 70'h32b7bc07eaef40e35f;
      expv[41] = 70'h2abb69f90a0fbfa0c1;
      expv[42] = 70'h04efc4e31c1c8e3b89;
      expv[43] = 70'h365d5687afb888c23f;
      expv[44] = 70'h24c44b68f9a43ed901;
      expv[45] = 70'h36bfc94efe2e41d06d;
      expv[46] = 70'h3aea45101859fff4cb;
      expv[47] = 70'h28d4636a9b1a711d2f;
      expv[48] = 70'h3b9ce2770bd4f93123;
      expv[49] = 70'h13ce35f9cd1eac7fa3;
      expv[50] = 70'h00285a20af0f4b61e9;
      expv[51] = 70'h35e1b9351bd6850f77;
      expv[52] = 70'h233becfd8fa59d9e8b;
      expv[53] = 70'h1852c815582d2707fd;
      expv[54] = 70'h0b30d6646de3ead2d9;
      expv[55] = 70'h380b8acbaba2361211;
      expv[56] = 70'h2396cea289841cafe7;
      expv[57] = 70'h300a4a64dc1fa0874f;
      expv[58] = 70'h0e5759773c0d982035;
      expv[59] = 70'h12880bacee6ec0303f;
      expv[60] = 70'h2316687acef6f9b011;
      expv[61] = 70'h14b5016afd9e5b236d;
      expv[62] = 70'h0a3d5ad8f8766b2aa5;
      expv[63] = 70'h355e549eadeac220cd;
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
