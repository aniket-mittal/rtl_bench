// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00490 dut (
    .clk_i(clk),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .fracta_28_o(out_vec[63:36]),
    .fractb_28_o(out_vec[35:8]),
    .exp_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hef76cdffed11c2c9;
    stim[1] = 64'hb452b9b8e7d17364;
    stim[2] = 64'h11e7c47bf9ddd068;
    stim[3] = 64'hf632a16abaf74e0e;
    stim[4] = 64'hfb142fa9dbb01b04;
    stim[5] = 64'h5e9b9a367222b1b8;
    stim[6] = 64'hc072a7559102d2bd;
    stim[7] = 64'hd0dc0805bf14e3cd;
    stim[8] = 64'had2880bdafcf4d0b;
    stim[9] = 64'h9a748827bb73b739;
    stim[10] = 64'hf24ed08937e9bf9a;
    stim[11] = 64'hb874508a8e3ed941;
    stim[12] = 64'h2ab37071955a0bc3;
    stim[13] = 64'hda2b263995d97c44;
    stim[14] = 64'h651ef4bc3768f2fa;
    stim[15] = 64'h4da0e3d73b00e960;
    stim[16] = 64'he7618e0e98269e8f;
    stim[17] = 64'hfbe3e841777735f4;
    stim[18] = 64'h1be5620faf0c84f1;
    stim[19] = 64'hddd1c52aeb88a7b5;
    stim[20] = 64'he5e8dbcc6523242e;
    stim[21] = 64'h433da477e3b42b58;
    stim[22] = 64'h90b2f8bbe6761423;
    stim[23] = 64'h2f992b8c41b84666;
    stim[24] = 64'h5ad70b2fe378ec18;
    stim[25] = 64'h3c30951e8a7ef163;
    stim[26] = 64'h621007c5846523da;
    stim[27] = 64'h6e8fc2e0b30c6b31;
    stim[28] = 64'h942840ef7b9242ce;
    stim[29] = 64'ha985776c3747c6e6;
    stim[30] = 64'h29c835b6a2761eb1;
    stim[31] = 64'h4945bfb46a9360cc;
    stim[32] = 64'he503b7aa59e51c91;
    stim[33] = 64'h541e8f6d48c19bb2;
    stim[34] = 64'h35e6ea4d91f23ee2;
    stim[35] = 64'h85f464ac0bce2225;
    stim[36] = 64'h2924466c08756859;
    stim[37] = 64'h530f2d04f2cdf6fd;
    stim[38] = 64'h79b106147aa8c3b2;
    stim[39] = 64'h69a6c1cbbd421761;
    stim[40] = 64'he7b2b38d91c0855e;
    stim[41] = 64'hcf2f5aca9afa729d;
    stim[42] = 64'h32f0b06d772872dd;
    stim[43] = 64'h3d49f61cc27b7394;
    stim[44] = 64'hc1d8714c643508d4;
    stim[45] = 64'h441056b3ed62563e;
    stim[46] = 64'h3023576e6524d929;
    stim[47] = 64'hcd8ee71424587ee3;
    stim[48] = 64'h6037582db7496348;
    stim[49] = 64'hff169e28031fa349;
    stim[50] = 64'ha7b975cd5c268a3b;
    stim[51] = 64'h27ec88d06e73286d;
    stim[52] = 64'h001793224a487f23;
    stim[53] = 64'hde8c92b5588ad317;
    stim[54] = 64'h6da185a39010f687;
    stim[55] = 64'h28f816725ef9b9ea;
    stim[56] = 64'h48e220146ce01d0b;
    stim[57] = 64'h1a010e96b31ca8c6;
    stim[58] = 64'ha9cedf3c6adea5f5;
    stim[59] = 64'h5dcf7f04f4a3b96b;
    stim[60] = 64'heddfe0059ec1814b;
    stim[61] = 64'h1afed2f228d15e5b;
    stim[62] = 64'he33b96ab40ffb247;
    stim[63] = 64'hd829cc7d5d136038;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h7b66ff848e164800;
      expv[2] = 64'h0695cdc68b9b20de;
      expv[3] = 64'h00000016ee8340cf;
      expv[4] = 64'h5950b500000001f3;
      expv[5] = 64'h4a17d480000001ec;
      expv[6] = 64'h00000015158dc0f6;
      expv[7] = 64'h7953aa80000001e4;
      expv[8] = 64'h6e04028000000180;
      expv[9] = 64'h000000167a6858a1;
      expv[10] = 64'h03d220979db9c85f;
      expv[11] = 64'h6768448000000176;
      expv[12] = 64'h7a284500000001e4;
      expv[13] = 64'h59b8388000000170;
      expv[14] = 64'h55931c8000000155;
      expv[15] = 64'h4f7a5e00000001b4;
      expv[16] = 64'h5071eb80000001ca;
      expv[17] = 64'h70c707000000019b;
      expv[18] = 64'h71f42080000001ce;
      expv[19] = 64'h00395894642788f7;
      expv[20] = 64'h00000014453da85e;
      expv[21] = 64'h746de600000001d7;
      expv[22] = 64'h2f691dc5a15ac0cb;
      expv[23] = 64'h00000017b0a118c7;
      expv[24] = 64'h00000015c23330cc;
      expv[25] = 64'h00000017c760c083;
      expv[26] = 64'h584a8f000003fbc6;
      expv[27] = 64'h4803e28000000178;
      expv[28] = 64'h47e17000000001c4;
      expv[29] = 64'h00000014921670dd;
      expv[30] = 64'h000000163e3730f7;
      expv[31] = 64'h641adb000000016e;
      expv[32] = 64'h0000c5b49b066053;
      expv[33] = 64'h41dbd500000001d5;
      expv[34] = 64'h4f47b68000000dca;
      expv[35] = 64'h7375268000000fa8;
      expv[36] = 64'h000000167111286b;
      expv[37] = 64'h52233600007ab517;
      expv[38] = 64'h000000166fb7e852;
      expv[39] = 64'h00000015461d90e5;
      expv[40] = 64'h5360e581842ec2f5;
      expv[41] = 64'h5959c680000001d3;
      expv[42] = 64'h57ad6500000001cf;
      expv[43] = 64'h000000154396e89e;
      expv[44] = 64'h00000017db9ca0ee;
      expv[45] = 64'h001b0e35a846a084;
      expv[46] = 64'h0000001712b1f0c8;
      expv[47] = 64'h0000001526c948da;
      expv[48] = 64'h47738a00000001ca;
      expv[49] = 64'h5bac16800000019b;
      expv[50] = 64'h4b4f1400000001c0;
      expv[51] = 64'h000000153451d8fe;
      expv[52] = 64'h00000017994368b8;
      expv[53] = 64'h0000001643f918dc;
      expv[54] = 64'h46495a8000000194;
      expv[55] = 64'h50c2d18000487bbd;
      expv[56] = 64'h00000017cdcf50db;
      expv[57] = 64'h0000001700e858bd;
      expv[58] = 64'h00000014e54630d9;
      expv[59] = 64'h00000016f52fa866;
      expv[60] = 64'h000000151dcb58d5;
      expv[61] = 64'h6ff00280000001e9;
      expv[62] = 64'h000000168af2d8db;
      expv[63] = 64'h5dcb558000000151;
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
