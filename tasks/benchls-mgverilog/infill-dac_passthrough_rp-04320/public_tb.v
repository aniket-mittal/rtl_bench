// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04320 dut (
    .clk(clk),
    .control(in_vec[49:18]),
    .src_dac_data(in_vec[17:2]),
    .dst_dac_enable(in_vec[1:1]),
    .dst_dac_valid(in_vec[0:0]),
    .status(out_vec[49:18]),
    .src_dac_enable(out_vec[17:17]),
    .src_dac_valid(out_vec[16:16]),
    .dst_dac_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h0b579f5f2ef34;
    stim[1] = 50'h2cb0a72444c2b;
    stim[2] = 50'h0cf35cedc9b73;
    stim[3] = 50'h17a22f7c43123;
    stim[4] = 50'h35964a16863d1;
    stim[5] = 50'h267fd86285f32;
    stim[6] = 50'h254dbd913072c;
    stim[7] = 50'h37a735c3f73f6;
    stim[8] = 50'h0c2e9f63293ff;
    stim[9] = 50'h1fef35155ec60;
    stim[10] = 50'h21743eaaca2ac;
    stim[11] = 50'h3f455e174f281;
    stim[12] = 50'h22a133a7be25f;
    stim[13] = 50'h0b0d4ce7788f4;
    stim[14] = 50'h1472d51434c8a;
    stim[15] = 50'h375bb728e6305;
    stim[16] = 50'h0fadd3b521b67;
    stim[17] = 50'h253ebb4219f49;
    stim[18] = 50'h29d146763ab4f;
    stim[19] = 50'h01f275f8e621e;
    stim[20] = 50'h1d89c552d7c6d;
    stim[21] = 50'h142c0d6667fa9;
    stim[22] = 50'h2d98f2995455a;
    stim[23] = 50'h173d59c18987f;
    stim[24] = 50'h3d079b9034858;
    stim[25] = 50'h0865d25df21ee;
    stim[26] = 50'h1f6c92819566d;
    stim[27] = 50'h0c8e61db38e66;
    stim[28] = 50'h15ec626a1663d;
    stim[29] = 50'h06c14139ccc8d;
    stim[30] = 50'h274b1cfeedaad;
    stim[31] = 50'h092f20a962c44;
    stim[32] = 50'h2163f7376a85e;
    stim[33] = 50'h0dc4cf4dc3b68;
    stim[34] = 50'h2d8be455d0ac6;
    stim[35] = 50'h219ef730c621f;
    stim[36] = 50'h2232965314c9c;
    stim[37] = 50'h2b46190f38e53;
    stim[38] = 50'h0eb2f4c904372;
    stim[39] = 50'h090ac5645beeb;
    stim[40] = 50'h343e8e8bd6d06;
    stim[41] = 50'h292f8f2eeda28;
    stim[42] = 50'h04ba48dd6c518;
    stim[43] = 50'h37de353a2e480;
    stim[44] = 50'h2df7534863615;
    stim[45] = 50'h32f06c316b959;
    stim[46] = 50'h3454dd0b15136;
    stim[47] = 50'h0fa1281898b40;
    stim[48] = 50'h3f145ddceee66;
    stim[49] = 50'h0edb699bbc993;
    stim[50] = 50'h142b704a660d8;
    stim[51] = 50'h1c1fa7f8d888c;
    stim[52] = 50'h2f55d653c8afb;
    stim[53] = 50'h0a47428043eac;
    stim[54] = 50'h194cfb878b73a;
    stim[55] = 50'h11807cc1566b4;
    stim[56] = 50'h0db3940772587;
    stim[57] = 50'h091abbfa5308e;
    stim[58] = 50'h03e8fe880c721;
    stim[59] = 50'h340526ff64545;
    stim[60] = 50'h2632e2c70cfb9;
    stim[61] = 50'h3371b4f69ee55;
    stim[62] = 50'h3bc8e312665ec;
    stim[63] = 50'h34d5c206718ac;
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
      expv[0] = 50'h00000028xxxxx;
      expv[1] = 50'h000000280bbcd;
      expv[2] = 50'h000000283130a;
      expv[3] = 50'h00000028326dc;
      expv[4] = 50'h0000002830c48;
      expv[5] = 50'h00000028118f4;
      expv[6] = 50'h00000028217cc;
      expv[7] = 50'h000000280c1cb;
      expv[8] = 50'h000000282dcfd;
      expv[9] = 50'h000000283a4ff;
      expv[10] = 50'h0000002807b18;
      expv[11] = 50'h00000028028ab;
      expv[12] = 50'h0000002813ca0;
      expv[13] = 50'h000000283f897;
      expv[14] = 50'h000000280e23d;
      expv[15] = 50'h000000282d322;
      expv[16] = 50'h00000028198c1;
      expv[17] = 50'h00000028386d9;
      expv[18] = 50'h00000028167d2;
      expv[19] = 50'h000000283ead3;
      expv[20] = 50'h0000002829887;
      expv[21] = 50'h0000002815f1b;
      expv[22] = 50'h0000002819fea;
      expv[23] = 50'h0000002825156;
      expv[24] = 50'h000000283261f;
      expv[25] = 50'h000000280d216;
      expv[26] = 50'h000000282c87b;
      expv[27] = 50'h000000281559b;
      expv[28] = 50'h000000282e399;
      expv[29] = 50'h000000281598f;
      expv[30] = 50'h0000002813323;
      expv[31] = 50'h000000281b6ab;
      expv[32] = 50'h0000002808b11;
      expv[33] = 50'h000000282aa17;
      expv[34] = 50'h0000002800eda;
      expv[35] = 50'h00000028242b1;
      expv[36] = 50'h0000002831887;
      expv[37] = 50'h0000002805327;
      expv[38] = 50'h000000283e394;
      expv[39] = 50'h00000028210dc;
      expv[40] = 50'h0000002836fba;
      expv[41] = 50'h0000002825b41;
      expv[42] = 50'h000000280b68a;
      expv[43] = 50'h000000280b146;
      expv[44] = 50'h000000280b920;
      expv[45] = 50'h0000002818d85;
      expv[46] = 50'h000000281ae56;
      expv[47] = 50'h000000282544d;
      expv[48] = 50'h00000028062d0;
      expv[49] = 50'h000000282bb99;
      expv[50] = 50'h000000283f264;
      expv[51] = 50'h0000002809836;
      expv[52] = 50'h0000002806223;
      expv[53] = 50'h00000028322be;
      expv[54] = 50'h0000002800fab;
      expv[55] = 50'h0000002822dce;
      expv[56] = 50'h00000028059ad;
      expv[57] = 50'h000000283c961;
      expv[58] = 50'h0000002824c23;
      expv[59] = 50'h00000028131c8;
      expv[60] = 50'h0000002819151;
      expv[61] = 50'h00000028133ee;
      expv[62] = 50'h0000002817b95;
      expv[63] = 50'h000000280997b;
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
