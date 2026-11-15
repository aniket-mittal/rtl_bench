// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 103;
  localparam OW = 103;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01591 dut (
    .clock(clk),
    .MEM_instruction(in_vec[102:71]),
    .MemReadData(in_vec[70:39]),
    .MEM_ALUResult(in_vec[38:7]),
    .MEM_RegWriteAddress(in_vec[6:2]),
    .MEM_RegWrite(in_vec[1:1]),
    .MEM_MemToReg(in_vec[0:0]),
    .WB_instruction(out_vec[102:71]),
    .WB_MemReadData(out_vec[70:39]),
    .WB_ALUResult(out_vec[38:7]),
    .WB_RegWriteAddress(out_vec[6:2]),
    .WB_RegWrite(out_vec[1:1]),
    .WB_MemToReg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 103'h457853c8b1cec08674f1d09840;
    stim[1] = 103'h61772def0515cf74e84e52d53d;
    stim[2] = 103'h55435dea662914a8c7dfb2cfae;
    stim[3] = 103'h6305bb64d86e79fb952557d2e1;
    stim[4] = 103'h233f23def79469f48d78e06b5a;
    stim[5] = 103'h7ebaf2f8c233f311e2070baf4a;
    stim[6] = 103'h33513b9e859dd2fbf7afb09ae0;
    stim[7] = 103'h0c13f6602c0a79c8b95cce45d2;
    stim[8] = 103'h606bb4a10068f50fd7cc2dc37e;
    stim[9] = 103'h49da32b1d3c68d2ffe216c9135;
    stim[10] = 103'h57b29a2fe8c62878710eb7b41c;
    stim[11] = 103'h6ea018a4035fdf1857f3175dc8;
    stim[12] = 103'h41104b6403bee93a08a0c63ed5;
    stim[13] = 103'h3c44ee9c6978cd523fe663a72d;
    stim[14] = 103'h5f5e99d345a2bd2bfa55e09a01;
    stim[15] = 103'h4abae04f2f28db52693cb17f90;
    stim[16] = 103'h5e0eb7dfb1609a2353267383af;
    stim[17] = 103'h5024f6633e886f9547ef7f1773;
    stim[18] = 103'h1aaa0b3b47e540d345c459fb9c;
    stim[19] = 103'h6a80b791a67ea58d3f5f3fdde0;
    stim[20] = 103'h50ce07d8f4c0af175156a85335;
    stim[21] = 103'h20199d18f86884f70539f0ff15;
    stim[22] = 103'h52b4eb408054dcaaa0975e7c90;
    stim[23] = 103'h6130321488f7b222a0b2d8daa1;
    stim[24] = 103'h107f829b6e0ecd0f10d1710617;
    stim[25] = 103'h7c6de50d623c10a4c8b0731997;
    stim[26] = 103'h737fed81834bb6db3fcb45f5a0;
    stim[27] = 103'h467ed0156971c91666fbcdb3b4;
    stim[28] = 103'h43f723903f048664faf6dcd7a0;
    stim[29] = 103'h755f6f1b9ac1762bf7a3e5b1e6;
    stim[30] = 103'h0be8486e800f8f59dd68a2454a;
    stim[31] = 103'h62b629f0bab786d6d9565d2ef7;
    stim[32] = 103'h7889378214119efd7027e08e6a;
    stim[33] = 103'h2a1319a64942a595dc0255bc0f;
    stim[34] = 103'h073b83d01ca0ff64046950b02f;
    stim[35] = 103'h546ee3183790b91e3983a7fc3c;
    stim[36] = 103'h0bb546cf7868addebb6dea6796;
    stim[37] = 103'h17415520afac1a7913573c85d0;
    stim[38] = 103'h776114cda2029f85200f7641c8;
    stim[39] = 103'h4bd380004dfbd7425649ac04af;
    stim[40] = 103'h550e5ff922ccf98ecd22137c07;
    stim[41] = 103'h2b507061f00b941b6a80e8cdc2;
    stim[42] = 103'h7a12216cb57d4887908f488b3d;
    stim[43] = 103'h53c80ded479c00c8e20f9ff906;
    stim[44] = 103'h731e570ec52a39e64e19057f35;
    stim[45] = 103'h2b9d3cfb2b35d586849002e979;
    stim[46] = 103'h7cc41042f53bbc5888b77300f8;
    stim[47] = 103'h603a0e1811b02befcdc0d012b2;
    stim[48] = 103'h283b999dd0339d621c1a043377;
    stim[49] = 103'h7f435513ac69f4d12361a46d87;
    stim[50] = 103'h4ba12edac62f125fa769ffae23;
    stim[51] = 103'h2bc0dd8a0177d067afa27fb001;
    stim[52] = 103'h1e278dd786ea29bf08dc9f7863;
    stim[53] = 103'h1b6005bcd1c3b6548d24480904;
    stim[54] = 103'h65b1caa1c18e19818f4c0b2c62;
    stim[55] = 103'h0c2b4bb57ca2c8be1225f5954c;
    stim[56] = 103'h53bae75c6440c6801708090bc8;
    stim[57] = 103'h2b205306884389f5b0bb01ef10;
    stim[58] = 103'h08a38f5da51fbd5e8986513e98;
    stim[59] = 103'h1151cdca6bfaa9c30e9b1fe163;
    stim[60] = 103'h6d5278fda5a038a4c2d6fb2661;
    stim[61] = 103'h2e454be2958f6bf49122abc5d7;
    stim[62] = 103'h6f7c11ae659e7c727f88295123;
    stim[63] = 103'h752a1a13e9ed3f5d790afcfc6c;
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
      expv[0] = 103'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 103'h457853c8b1cec08674f1d09840;
      expv[2] = 103'h61772def0515cf74e84e52d53d;
      expv[3] = 103'h55435dea662914a8c7dfb2cfae;
      expv[4] = 103'h6305bb64d86e79fb952557d2e1;
      expv[5] = 103'h233f23def79469f48d78e06b5a;
      expv[6] = 103'h7ebaf2f8c233f311e2070baf4a;
      expv[7] = 103'h33513b9e859dd2fbf7afb09ae0;
      expv[8] = 103'h0c13f6602c0a79c8b95cce45d2;
      expv[9] = 103'h606bb4a10068f50fd7cc2dc37e;
      expv[10] = 103'h49da32b1d3c68d2ffe216c9135;
      expv[11] = 103'h57b29a2fe8c62878710eb7b41c;
      expv[12] = 103'h6ea018a4035fdf1857f3175dc8;
      expv[13] = 103'h41104b6403bee93a08a0c63ed5;
      expv[14] = 103'h3c44ee9c6978cd523fe663a72d;
      expv[15] = 103'h5f5e99d345a2bd2bfa55e09a01;
      expv[16] = 103'h4abae04f2f28db52693cb17f90;
      expv[17] = 103'h5e0eb7dfb1609a2353267383af;
      expv[18] = 103'h5024f6633e886f9547ef7f1773;
      expv[19] = 103'h1aaa0b3b47e540d345c459fb9c;
      expv[20] = 103'h6a80b791a67ea58d3f5f3fdde0;
      expv[21] = 103'h50ce07d8f4c0af175156a85335;
      expv[22] = 103'h20199d18f86884f70539f0ff15;
      expv[23] = 103'h52b4eb408054dcaaa0975e7c90;
      expv[24] = 103'h6130321488f7b222a0b2d8daa1;
      expv[25] = 103'h107f829b6e0ecd0f10d1710617;
      expv[26] = 103'h7c6de50d623c10a4c8b0731997;
      expv[27] = 103'h737fed81834bb6db3fcb45f5a0;
      expv[28] = 103'h467ed0156971c91666fbcdb3b4;
      expv[29] = 103'h43f723903f048664faf6dcd7a0;
      expv[30] = 103'h755f6f1b9ac1762bf7a3e5b1e6;
      expv[31] = 103'h0be8486e800f8f59dd68a2454a;
      expv[32] = 103'h62b629f0bab786d6d9565d2ef7;
      expv[33] = 103'h7889378214119efd7027e08e6a;
      expv[34] = 103'h2a1319a64942a595dc0255bc0f;
      expv[35] = 103'h073b83d01ca0ff64046950b02f;
      expv[36] = 103'h546ee3183790b91e3983a7fc3c;
      expv[37] = 103'h0bb546cf7868addebb6dea6796;
      expv[38] = 103'h17415520afac1a7913573c85d0;
      expv[39] = 103'h776114cda2029f85200f7641c8;
      expv[40] = 103'h4bd380004dfbd7425649ac04af;
      expv[41] = 103'h550e5ff922ccf98ecd22137c07;
      expv[42] = 103'h2b507061f00b941b6a80e8cdc2;
      expv[43] = 103'h7a12216cb57d4887908f488b3d;
      expv[44] = 103'h53c80ded479c00c8e20f9ff906;
      expv[45] = 103'h731e570ec52a39e64e19057f35;
      expv[46] = 103'h2b9d3cfb2b35d586849002e979;
      expv[47] = 103'h7cc41042f53bbc5888b77300f8;
      expv[48] = 103'h603a0e1811b02befcdc0d012b2;
      expv[49] = 103'h283b999dd0339d621c1a043377;
      expv[50] = 103'h7f435513ac69f4d12361a46d87;
      expv[51] = 103'h4ba12edac62f125fa769ffae23;
      expv[52] = 103'h2bc0dd8a0177d067afa27fb001;
      expv[53] = 103'h1e278dd786ea29bf08dc9f7863;
      expv[54] = 103'h1b6005bcd1c3b6548d24480904;
      expv[55] = 103'h65b1caa1c18e19818f4c0b2c62;
      expv[56] = 103'h0c2b4bb57ca2c8be1225f5954c;
      expv[57] = 103'h53bae75c6440c6801708090bc8;
      expv[58] = 103'h2b205306884389f5b0bb01ef10;
      expv[59] = 103'h08a38f5da51fbd5e8986513e98;
      expv[60] = 103'h1151cdca6bfaa9c30e9b1fe163;
      expv[61] = 103'h6d5278fda5a038a4c2d6fb2661;
      expv[62] = 103'h2e454be2958f6bf49122abc5d7;
      expv[63] = 103'h6f7c11ae659e7c727f88295123;
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
