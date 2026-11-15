// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06512 dut (
    .clk(clk),
    .control(in_vec[66:35]),
    .src_dac_ddata(in_vec[34:3]),
    .src_dac_dunf(in_vec[2:2]),
    .src_dac_dvalid(in_vec[1:1]),
    .dst_dac_en(in_vec[0:0]),
    .status(out_vec[66:35]),
    .src_dac_en(out_vec[34:34]),
    .dst_dac_ddata(out_vec[33:2]),
    .dst_dac_dunf(out_vec[1:1]),
    .dst_dac_dvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h271a8426a93731f03;
    stim[1] = 67'h60158d8152601f343;
    stim[2] = 67'h6d9698917d1c85505;
    stim[3] = 67'h14c9e3353a7de831f;
    stim[4] = 67'h65487ad1a4776f5dc;
    stim[5] = 67'h67c1c1e502579f030;
    stim[6] = 67'h5d89bdbbea6f53ec4;
    stim[7] = 67'h7910351526e5921dd;
    stim[8] = 67'h0e0042d75c2db9b86;
    stim[9] = 67'h30eb01e5b5e793656;
    stim[10] = 67'h44d79a7e9634c2cf4;
    stim[11] = 67'h311a314765aa09bee;
    stim[12] = 67'h64db55d48fc26f895;
    stim[13] = 67'h7ad51c57d9691cbc7;
    stim[14] = 67'h112d4a0ea0bf351b5;
    stim[15] = 67'h30ee4b84ec0e6b582;
    stim[16] = 67'h186569f76ecc55efc;
    stim[17] = 67'h5789130eca1068ae0;
    stim[18] = 67'h048933c211b469142;
    stim[19] = 67'h5300998bddf50f433;
    stim[20] = 67'h76cc275b66a933e4e;
    stim[21] = 67'h57ea5a841b05d8e61;
    stim[22] = 67'h7b33ef5529844febe;
    stim[23] = 67'h08169afbb6553bd5d;
    stim[24] = 67'h4746e7e344a53a3cb;
    stim[25] = 67'h3cfa7dea96c29eb58;
    stim[26] = 67'h54ba5fc416c76a22f;
    stim[27] = 67'h6ea2d8e98f7dda9f6;
    stim[28] = 67'h03884557267a4ee24;
    stim[29] = 67'h42590e26f7208e46d;
    stim[30] = 67'h417e9278534719f9a;
    stim[31] = 67'h7a78aecac386441f7;
    stim[32] = 67'h669d38dc842820a3e;
    stim[33] = 67'h59cc5bf0ddb31f879;
    stim[34] = 67'h30bf16c87c2bcc2ba;
    stim[35] = 67'h1a39f8f9e2a2ffe6b;
    stim[36] = 67'h10f1d8e540304966c;
    stim[37] = 67'h73d187c0ed48177dc;
    stim[38] = 67'h1d3913332532727f1;
    stim[39] = 67'h4fe599aee8f36c9be;
    stim[40] = 67'h22942e4961e99a64a;
    stim[41] = 67'h4f9eac8f2aeca675e;
    stim[42] = 67'h1fee03fa344045f6d;
    stim[43] = 67'h7f9c17d138a3624d8;
    stim[44] = 67'h6fd958d95a26f3541;
    stim[45] = 67'h2f786f5b19b7f6876;
    stim[46] = 67'h4d3780cf823be5a17;
    stim[47] = 67'h2724b558404be0292;
    stim[48] = 67'h3fffb393be7ad0ba8;
    stim[49] = 67'h209fc0465edb8dc79;
    stim[50] = 67'h13ca6fa83cea22c22;
    stim[51] = 67'h422ee7704a1e69bbc;
    stim[52] = 67'h73c79c043b0056aa2;
    stim[53] = 67'h38a435e8f0296246e;
    stim[54] = 67'h036d8270947d02883;
    stim[55] = 67'h7739f25c783b37678;
    stim[56] = 67'h20af6d9bc07e183af;
    stim[57] = 67'h3f796d3980aa836bc;
    stim[58] = 67'h18e04aaad4899e7fc;
    stim[59] = 67'h3c3d80960d33ff4b3;
    stim[60] = 67'h1de1554eb5c88be1e;
    stim[61] = 67'h0b0e8c8fcd41a8892;
    stim[62] = 67'h7d634fbe659689ad8;
    stim[63] = 67'h517c5cbe07b6a5018;
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
      expv[0] = 67'h00000050xxxxxxxxx;
      expv[1] = 67'h00000050549b98f81;
      expv[2] = 67'h0000005069300f9a1;
      expv[3] = 67'h000000507e8e42a82;
      expv[4] = 67'h000000505d3ef418f;
      expv[5] = 67'h00000050123bb7aee;
      expv[6] = 67'h00000050012bcf818;
      expv[7] = 67'h000000503537a9f62;
      expv[8] = 67'h000000505372c90ee;
      expv[9] = 67'h000000502e16dcdc3;
      expv[10] = 67'h000000501af3c9b2b;
      expv[11] = 67'h000000500b1a6167a;
      expv[12] = 67'h0000005032d504df7;
      expv[13] = 67'h0000005047e137c4a;
      expv[14] = 67'h000000506cb48e5e3;
      expv[15] = 67'h00000050505f9a8da;
      expv[16] = 67'h00000050360735ac1;
      expv[17] = 67'h0000005037662af7e;
      expv[18] = 67'h00000050250834570;
      expv[19] = 67'h0000005008da348a1;
      expv[20] = 67'h000000506efa87a19;
      expv[21] = 67'h00000050335499f27;
      expv[22] = 67'h000000504d82ec730;
      expv[23] = 67'h0000005014c227f5f;
      expv[24] = 67'h000000505b2a9deae;
      expv[25] = 67'h0000005062529d1e5;
      expv[26] = 67'h000000500b614f5ac;
      expv[27] = 67'h000000504b63b5117;
      expv[28] = 67'h0000005007beed4fb;
      expv[29] = 67'h00000050133d27712;
      expv[30] = 67'h000000507b9047236;
      expv[31] = 67'h0000005029a38cfcd;
      expv[32] = 67'h0000005061c3220fb;
      expv[33] = 67'h0000005002141051f;
      expv[34] = 67'h000000506ed98fc3c;
      expv[35] = 67'h000000503e15e615d;
      expv[36] = 67'h0000005071517ff35;
      expv[37] = 67'h00000050201824b36;
      expv[38] = 67'h0000005036a40bbee;
      expv[39] = 67'h000000505299393f8;
      expv[40] = 67'h000000503479b64df;
      expv[41] = 67'h0000005030f4cd325;
      expv[42] = 67'h000000501576533af;
      expv[43] = 67'h000000505a2022fb6;
      expv[44] = 67'h000000501c51b126c;
      expv[45] = 67'h000000506d1379aa0;
      expv[46] = 67'h000000500cdbfb43b;
      expv[47] = 67'h00000050411df2d0b;
      expv[48] = 67'h000000502025f0149;
      expv[49] = 67'h000000501f3d685d4;
      expv[50] = 67'h000000506f6dc6e3c;
      expv[51] = 67'h000000501e7511611;
      expv[52] = 67'h00000050250f34dde;
      expv[53] = 67'h000000501d802b551;
      expv[54] = 67'h000000503814b1237;
      expv[55] = 67'h000000504a3e81441;
      expv[56] = 67'h000000503c1d9bb3c;
      expv[57] = 67'h00000050603f0c1d7;
      expv[58] = 67'h00000050005541b5e;
      expv[59] = 67'h000000502a44cf3fe;
      expv[60] = 67'h000000504699ffa59;
      expv[61] = 67'h000000501ae445f0f;
      expv[62] = 67'h0000005026a0d4449;
      expv[63] = 67'h0000005032cb44d6c;
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
