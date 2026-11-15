// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_001214 dut (
    .in0(in_vec[66:35]),
    .in1(in_vec[34:3]),
    .op(in_vec[2:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6c7f52a85994f2999;
    stim[1] = 67'h6cfdddc5ad27bd3bf;
    stim[2] = 67'h25ffa33c7288a3e66;
    stim[3] = 67'h6f9f8bdc4ae81cc09;
    stim[4] = 67'h077e44016406e3eb7;
    stim[5] = 67'h2b9d30ae990ce75bc;
    stim[6] = 67'h342d848bf7654783a;
    stim[7] = 67'h05a0aab3a3e6b0e70;
    stim[8] = 67'h373a6e7a72c45cdc5;
    stim[9] = 67'h449484477f09a4688;
    stim[10] = 67'h30aad53a24a59746c;
    stim[11] = 67'h6bb985b6d6f9e66ad;
    stim[12] = 67'h037907ed0571b7fb1;
    stim[13] = 67'h589bc4d46dd5135fb;
    stim[14] = 67'h732977a9c4d37a4a7;
    stim[15] = 67'h0f43e08795e58541e;
    stim[16] = 67'h5e5b7d470bb43c5ce;
    stim[17] = 67'h077526ec259abfcb1;
    stim[18] = 67'h710e5d818ce2d2a40;
    stim[19] = 67'h0f992305be968964f;
    stim[20] = 67'h4c01328be349cfdf6;
    stim[21] = 67'h2a648925540d51002;
    stim[22] = 67'h5bc9c924dc05c9c89;
    stim[23] = 67'h7abbc1f89e6489277;
    stim[24] = 67'h09bdde86837fe1b3a;
    stim[25] = 67'h2e4f559ed797958fe;
    stim[26] = 67'h4fd2a7b75e15b9483;
    stim[27] = 67'h3fa2b303a83910a64;
    stim[28] = 67'h41ecc256bd5416fdb;
    stim[29] = 67'h1902bc7cf648d3d78;
    stim[30] = 67'h725cf07000238765c;
    stim[31] = 67'h3b69f9caecdf030b0;
    stim[32] = 67'h6c7f29a5b77cca88d;
    stim[33] = 67'h6e8f2b254ed604bb2;
    stim[34] = 67'h7fa0fb4627fd58e36;
    stim[35] = 67'h4f510361713644748;
    stim[36] = 67'h0a5b48583b5b6282d;
    stim[37] = 67'h04b3bddb847f5b973;
    stim[38] = 67'h7b166abed8b27d0a2;
    stim[39] = 67'h0734cc8a2481958d2;
    stim[40] = 67'h6b6ccc025a4ee6958;
    stim[41] = 67'h6e718426a4c812422;
    stim[42] = 67'h4179e100ee85f29fc;
    stim[43] = 67'h5c1dbef2c24073e70;
    stim[44] = 67'h4e4e2ebc2dddacfc3;
    stim[45] = 67'h2dc755e6584b5eabd;
    stim[46] = 67'h205036a2a7f9b9780;
    stim[47] = 67'h16a2789f1bbf36c06;
    stim[48] = 67'h5e53a85a65fe32462;
    stim[49] = 67'h7290b3326eadddb44;
    stim[50] = 67'h0e939a86f3abbd91c;
    stim[51] = 67'h072d18ff45778260f;
    stim[52] = 67'h4a9a60179e04dd313;
    stim[53] = 67'h4144154adb64e25e6;
    stim[54] = 67'h3d8d8c1c895160941;
    stim[55] = 67'h4b958d4b8b4aacb1e;
    stim[56] = 67'h2176013359f357e7c;
    stim[57] = 67'h7ac82b3f04f302719;
    stim[58] = 67'h179f5f1d08992e72a;
    stim[59] = 67'h23b9f6f2f313d305f;
    stim[60] = 67'h5125516a1bd3ea717;
    stim[61] = 67'h1cf6748797639a9af;
    stim[62] = 67'h07ee8387d23afde80;
    stim[63] = 67'h03a0df6afcf3f3391;
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
      expv[0] = 32'hfbffe573;
      expv[1] = 32'h00000000;
      expv[2] = 32'h66edfeac;
      expv[3] = 32'hdfff3fb9;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h5725981e;
      expv[7] = 32'h03414146;
      expv[8] = 32'h00000000;
      expv[9] = 32'h88010880;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h0ef36ffe;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'hf2bcb68c;
      expv[16] = 32'ha54e81d5;
      expv[17] = 32'h4fff7fde;
      expv[18] = 32'h0004a100;
      expv[19] = 32'h00000000;
      expv[20] = 32'hd16ec559;
      expv[21] = 32'hfce3b44a;
      expv[22] = 32'hbf9b93d9;
      expv[23] = 32'h00000000;
      expv[24] = 32'h1a7b8074;
      expv[25] = 32'had6f801e;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h200120a9;
      expv[30] = 32'h00000000;
      expv[31] = 32'h50920214;
      expv[32] = 32'h00000000;
      expv[33] = 32'h7aca5fc0;
      expv[34] = 32'haf4744c6;
      expv[35] = 32'h822000c0;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'ha791cf91;
      expv[39] = 32'h576cc42e;
      expv[40] = 32'h94998800;
      expv[41] = 32'h26732cd1;
      expv[42] = 32'h00000000;
      expv[43] = 32'h800065c4;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h40a06040;
      expv[47] = 32'hf5c683be;
      expv[48] = 32'h88a3b540;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'hcbbe65d9;
      expv[54] = 32'h7bbbd939;
      expv[55] = 32'h8095c134;
      expv[56] = 32'h00000000;
      expv[57] = 32'hfdf656ff;
      expv[58] = 32'h40711b1f;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h04550300;
      expv[63] = 32'hffe7fef7;
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
