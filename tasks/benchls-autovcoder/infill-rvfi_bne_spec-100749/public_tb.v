// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_100749 dut (
    .rvfi_valid(in_vec[160:160]),
    .rvfi_insn(in_vec[159:128]),
    .rvfi_pc_rdata(in_vec[127:96]),
    .rvfi_rs1_rdata(in_vec[95:64]),
    .rvfi_rs2_rdata(in_vec[63:32]),
    .rvfi_mem_rdata(in_vec[31:0]),
    .spec_valid(out_vec[152:152]),
    .spec_trap(out_vec[151:151]),
    .spec_rs1_addr(out_vec[150:146]),
    .spec_rs2_addr(out_vec[145:141]),
    .spec_rd_addr(out_vec[140:136]),
    .spec_rd_wdata(out_vec[135:104]),
    .spec_pc_wdata(out_vec[103:72]),
    .spec_mem_addr(out_vec[71:40]),
    .spec_mem_rmask(out_vec[39:36]),
    .spec_mem_wmask(out_vec[35:32]),
    .spec_mem_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h08b2bd7c00ab9cd675cc25a6b5ec0a16bb9b1bc43;
    stim[1] = 161'h0b5a416c933421b58148dd1ebc0a1f7b4d7fe44e4;
    stim[2] = 161'h0776ff60f6c7419d2cd9b193d120038bda2a65dbe;
    stim[3] = 161'h14d42a93d44e6b9c3c24348ba38d0adbe64bcf99f;
    stim[4] = 161'h1b03918de03170a1858f36683384c696b09c8b64e;
    stim[5] = 161'h10f8d5d172786094b2c73adf25b96e7c202df12ff;
    stim[6] = 161'h117c47ba1583b2ea27a7420f3405d8f7ecbb2a994;
    stim[7] = 161'h030bc21dce26e4ce68bf4d2c542aea7d79d32e0ab;
    stim[8] = 161'h0be9c0e43664101fcf07964113663306e4b238123;
    stim[9] = 161'h003e7b1e7c2cd23a6c50f2823846dfa4b016585b4;
    stim[10] = 161'h05bbdb75cab5e25da429c0f9436c07f6e9decf2e1;
    stim[11] = 161'h0eb12791bfb96f49885c98c7e59f43a484fa621ba;
    stim[12] = 161'h1f73696699cdf6764f0b986c68b16cd2dc8c39ccc;
    stim[13] = 161'h14dc67dcff78cb1b4c8675a78f0a4eeaf9adc751b;
    stim[14] = 161'h1d521fe62b92070d394feed67635eb68567592a46;
    stim[15] = 161'h0a36fcba9758a0f7e17cde8382032115bf4211c99;
    stim[16] = 161'h112da12117ab7e01dacebd59721ce71b735ea1d1b;
    stim[17] = 161'h1b8345796f250a376d458bcf42b245ec45e2d6a18;
    stim[18] = 161'h19a7f5c433a8e575ecefe7ffd8ff6ec7691515c3f;
    stim[19] = 161'h172bc4d7531baddad346b5c412c5473f2d7d87e69;
    stim[20] = 161'h103a701c173d7d799e974dbbea54ba242514eaef5;
    stim[21] = 161'h186fc1d8577bd72cd438ec27958fd27cf42be8764;
    stim[22] = 161'h1dc0a6f966d9fa6993f96067f28a0f0f4761f1d64;
    stim[23] = 161'h0de29ada1bb29631dce73e0aa9eab385d3ef8ffd0;
    stim[24] = 161'h0947db7c15923a8bdb000b33e6a9b183879ba56fd;
    stim[25] = 161'h16dd493f1f245e1641f286a7b8ae37e6d482bc9bf;
    stim[26] = 161'h0bdea70d52192e602a654e929afe0146aafa6bf0e;
    stim[27] = 161'h0edaab243c45eea1896d880bf2a1d8b5f543d0d26;
    stim[28] = 161'h0cfc35f1c5a0e98bae3a0e8dedf6bb24fd2f19e97;
    stim[29] = 161'h1a832981be25b4f75d1683976cd236841ddcfe77e;
    stim[30] = 161'h174ddb03f7307891550bc07514ee9096055a2bcd6;
    stim[31] = 161'h0f7d6c052b0f0ec26a04aaf1e03ee6c2ecd1e2ad5;
    stim[32] = 161'h1e905ce8fc7011243e081fa115880fd46e7bff45b;
    stim[33] = 161'h16aac26b932029c38386d6398db0714884a4e98ad;
    stim[34] = 161'h1d03abaee85ce80af115722545f79342a585b06e3;
    stim[35] = 161'h10698c6bc33b6086b3bf1d8f3cd2c2f07dabe50f0;
    stim[36] = 161'h1296fd46c15df12a3c10b916b4812c34db0623ad6;
    stim[37] = 161'h1ea0653056ca6d8ae63e434ff897c008c35447277;
    stim[38] = 161'h09ab3f2ccd398a08402e8f7ab7ab775efbe230f8b;
    stim[39] = 161'h006e81a0156d4c96b96c294d5fb551a08e05aae6d;
    stim[40] = 161'h15137eb47627f88bf96a454b62ede60b28579776b;
    stim[41] = 161'h156fd0a0fbf954192946e63ba65b2fed9b1319c24;
    stim[42] = 161'h1d7e85f94601bcf7336d7afa5be7359f9e7cf569a;
    stim[43] = 161'h14984d02af039c497165bbf27918304891357ff18;
    stim[44] = 161'h11982b8ec2e7bd50c56ca7a661e3b14320f87d378;
    stim[45] = 161'h01c6ee605d13e703f5c3be225c496707329a9b47b;
    stim[46] = 161'h1c25c07358e04320ecedf29af0e22c7c12e54c990;
    stim[47] = 161'h02c4c7eef4e3194448c7aee83fcc155c53501e654;
    stim[48] = 161'h15feb396c5e1d9d6167c5ed3b619ad69ecdebb2d6;
    stim[49] = 161'h0b89321fe47c6e6d53b63bb6e0649410cec176662;
    stim[50] = 161'h136e1becc29ff417255618b1c4062deb7b640872e;
    stim[51] = 161'h1c0f1794fb3ecae9be0a0790364126c4187e209e5;
    stim[52] = 161'h1d9410446c0bad2e32c33cff685981bf5f714d9bc;
    stim[53] = 161'h1be97918c12acc3bb6447c3ad21a824d9985cc72b;
    stim[54] = 161'h07532c8a0cb1d47d0e0f3aa45d2eeaef08bf41a04;
    stim[55] = 161'h0fa1dade000066e78c644cce62d04c46d412d6380;
    stim[56] = 161'h1fe0f1dc5298722c230d3cceb1faaa236b08dd441;
    stim[57] = 161'h09e0d39c533196ba66e683817078e410bce2fa46f;
    stim[58] = 161'h1444b9f0c621fe2ad6a042c71175d2434ebe970c0;
    stim[59] = 161'h063d5a78b9796b3379639be0fa622524b38c53797;
    stim[60] = 161'h08d2f149ec60daf8532fd33b1ed7cfc12de45c228;
    stim[61] = 161'h1944bd72f8e333d0c36587c13460d49633ac81fe4;
    stim[62] = 161'h053d47ad32ba7ee1c38d8c4853eec6109a7452f28;
    stim[63] = 161'h1a13b17a6ad93ff715ee8fa081d838494b32dfdaf;
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
      expv[0] = 153'h0de40000000000ab9c615000000000000000000;
      expv[1] = 153'h0234000000000334216a4000000000000000000;
      expv[2] = 153'h07ec0000000006c74213e000000000000000000;
      expv[3] = 153'h096800000000044e6be95000000000000000000;
      expv[4] = 153'h048600000000003170528000000000000000000;
      expv[5] = 153'h0eb000000000027860a45000000000000000000;
      expv[6] = 153'h0238000000000583b3818000000000000000000;
      expv[7] = 153'h0616000000000e26e57e8000000000000000000;
      expv[8] = 153'h06120000000006640f5f8000000000000000000;
      expv[9] = 153'h03fc000000000c2cd2bc8000000000000000000;
      expv[10] = 153'h06f6000000000ab5e2b88000000000000000000;
      expv[11] = 153'h0122000000000fb96eb4a000000000000000000;
      expv[12] = 153'h03660000000009cdf5ed0000000000000000000;
      expv[13] = 153'h0338000000000f78cbe8e000000000000000000;
      expv[14] = 153'h08e4000000000b920662f000000000000000000;
      expv[15] = 153'h07ec000000000758a09b4000000000000000000;
      expv[16] = 153'h0d1a0000000007ab7e141000000000000000000;
      expv[17] = 153'h0206000000000f2509f04000000000000000000;
      expv[18] = 153'h078e0000000003a8e4916000000000000000000;
      expv[19] = 153'h0e1600000000031bae4e7000000000000000000;
      expv[20] = 153'h0bb400000000073d7dfbb000000000000000000;
      expv[21] = 153'h0e1e00000000077bd6b47000000000000000000;
      expv[22] = 153'h0d000000000006d9fa477000000000000000000;
      expv[23] = 153'h0cc4000000000bb296117000000000000000000;
      expv[24] = 153'h0ece0000000005923a20b000000000000000000;
      expv[25] = 153'h027a000000000f245f02a000000000000000000;
      expv[26] = 153'h053c0000000002192e1c2000000000000000000;
      expv[27] = 153'h0574000000000c45ee0dc000000000000000000;
      expv[28] = 153'h01b80000000005a0e8db8000000000000000000;
      expv[29] = 153'h0946000000000e25b4205000000000000000000;
      expv[30] = 153'h0eda00000000073079055000000000000000000;
      expv[31] = 153'h037a000000000b0f0e386000000000000000000;
      expv[32] = 153'h0ae0000000000c70110df000000000000000000;
      expv[33] = 153'h06140000000003202aae4000000000000000000;
      expv[34] = 153'h0d4600000000085ce7dc3000000000000000000;
      expv[35] = 153'h0c5200000000033b610d7000000000000000000;
      expv[36] = 153'h0fec00000000015df152b000000000000000000;
      expv[37] = 153'h03000000000006ca6cf54000000000000000000;
      expv[38] = 153'h01d6000000000d3989a28000000000000000000;
      expv[39] = 153'h0c1c00000000056d4c9df000000000000000000;
      expv[40] = 153'h0be6000000000627f8dd5000000000000000000;
      expv[41] = 153'h069e000000000bf954706000000000000000000;
      expv[42] = 153'h0c3c000000000601bccf1000000000000000000;
      expv[43] = 153'h0a70000000000f039c917000000000000000000;
      expv[44] = 153'h01700000000002e7bde9c000000000000000000;
      expv[45] = 153'h0f4c000000000d13e720b000000000000000000;
      expv[46] = 153'h060a0000000008e04263c000000000000000000;
      expv[47] = 153'h06080000000004e319f20000000000000000000;
      expv[48] = 153'h0dbc0000000005e1da353000000000000000000;
      expv[49] = 153'h099200000000047c6e257000000000000000000;
      expv[50] = 153'h00dc00000000029ff4cee000000000000000000;
      expv[51] = 153'h089e000000000b3eca2ad000000000000000000;
      expv[52] = 153'h08a8000000000c0bac86b000000000000000000;
      expv[53] = 153'h0bd200000000012acbf9d000000000000000000;
      expv[54] = 153'h0166000000000cb1d5720000000000000000000;
      expv[55] = 153'h06c200000000000066e32000000000000000000;
      expv[56] = 153'h0780000000000298722bc000000000000000000;
      expv[57] = 153'h068000000000033196598000000000000000000;
      expv[58] = 153'h0dc8000000000621fe70b000000000000000000;
      expv[59] = 153'h0afa0000000009796c165000000000000000000;
      expv[60] = 153'h0fa4000000000c60da84d000000000000000000;
      expv[61] = 153'h05c80000000008e332e5a000000000000000000;
      expv[62] = 153'h023a0000000002ba7fb50000000000000000000;
      expv[63] = 153'h0da6000000000ad93f97f000000000000000000;
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
