// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_125943 dut (
    .clk(clk),
    .rst(in_vec[128:128]),
    .in_a(in_vec[127:96]),
    .in_b(in_vec[95:64]),
    .in_c(in_vec[63:32]),
    .in_d(in_vec[31:0]),
    .out_a(out_vec[127:96]),
    .out_b(out_vec[95:64]),
    .out_c(out_vec[63:32]),
    .out_d(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h177e74aaa3c9e97caf36b2dea8eb42e58;
    stim[1] = 129'h147a2ed6bff268732513f0f000426896d;
    stim[2] = 129'h03327a7e921f40ac3b7b3ff854067771f;
    stim[3] = 129'h001888456f682b127fd195a7eb06c1052;
    stim[4] = 129'h009a04a91f03e4ddb2a4c7441befe19fd;
    stim[5] = 129'h0e401c8073f38cd73053d6d7c442bfbbe;
    stim[6] = 129'h0697283c9195906d4b04a77190c957a73;
    stim[7] = 129'h021d405c31cd9409cf081d598ebfa1c18;
    stim[8] = 129'h0ffd5d195456979d213918eac6ae921a2;
    stim[9] = 129'h099db9eb43f4edc9657b266bde587160c;
    stim[10] = 129'h06cb79f80695419e3c8b45e662c3624e0;
    stim[11] = 129'h0e771fbe61d83c5b5e307863c1a6f857a;
    stim[12] = 129'h0fca2a54257b0c4d7e8788152ec768438;
    stim[13] = 129'h00670c0b8bc3585ef0f56309bceff009f;
    stim[14] = 129'h04dddc53cb8342a8fd5dc119f1fb1aba5;
    stim[15] = 129'h0046c7d1c6d11d53864beff64ed634e32;
    stim[16] = 129'h028b06deab003b511d800e12fb91331b6;
    stim[17] = 129'h0c320f60a4821867f77a447e7a207b718;
    stim[18] = 129'h0ac102cedc331ace50c27a6c671deea0c;
    stim[19] = 129'h0f0c14bbc49ef05a4b864036593ce3302;
    stim[20] = 129'h0b00b062dc205b3595e1a8ab40a392693;
    stim[21] = 129'h0230d88e87bdc6a5ab37464656c4743e4;
    stim[22] = 129'h080e01f1ce48290d50387109775cc1f49;
    stim[23] = 129'h06212487dc4154dc3c6e89a58d2748547;
    stim[24] = 129'h011643e3aafe2cd5ba4c650b311a5eb0b;
    stim[25] = 129'h020f2025174c4e245f8eaf5d0a523ccc1;
    stim[26] = 129'h020df8ab85a51fdb8184048c95836a489;
    stim[27] = 129'h0fbc1ecbbd224cf550c2db708960afbf2;
    stim[28] = 129'h021e96020ba636fae07fa2d2cfef9f211;
    stim[29] = 129'h013457e4c4c2b5ee0a00ddb2c17c18383;
    stim[30] = 129'h0eece28e0e7be81249b106dd6a446fc7c;
    stim[31] = 129'h0e7d2ed621a621217c3b921f2e984d919;
    stim[32] = 129'h0e72293a7b866327355003c85d3a1f551;
    stim[33] = 129'h0424263b1ee2b66dcf740a237c2405f46;
    stim[34] = 129'h0e40d93138d15998a1d59d435426a1ff3;
    stim[35] = 129'h09fe17c4c2db8cec9e1c03c0907e20fb9;
    stim[36] = 129'h0b2031664c86f9126d2421a38adcaee8d;
    stim[37] = 129'h044d08f96f69c1ae1cec8d22e08986cae;
    stim[38] = 129'h0ccb0b9958746a78587fa4a58cf4d5752;
    stim[39] = 129'h0268d03bc4a163c00c927eb77d06c1c21;
    stim[40] = 129'h0007f3d529979d2e2c189f95086550c1b;
    stim[41] = 129'h0f7743414d7e194dead8e665736a2321b;
    stim[42] = 129'h040fd850728df3eaa5177027e681d86a8;
    stim[43] = 129'h026adf2c4dc42eb79001bcdf3a3c322bc;
    stim[44] = 129'h0ae1e6349e751afb62b8a4130c6ed95bf;
    stim[45] = 129'h0751f2754668c1ffa8ec6490db44ea141;
    stim[46] = 129'h0bacce9dcb64b0b3b3a891bcd5cd30e92;
    stim[47] = 129'h0df36bc9cde0c783d39b8e35fcbf321c1;
    stim[48] = 129'h0ad4216f9bae14d24d6ea882a19e25ad6;
    stim[49] = 129'h001c85eabe1af9e1fbb305c6df34cb883;
    stim[50] = 129'h0e28d5d2686a433ef3ff80a10322f5ccf;
    stim[51] = 129'h0cbfed8aa8d0a9365f8d94b52ea02ee28;
    stim[52] = 129'h06496a753a83dfe40ae22e92f3c33c401;
    stim[53] = 129'h0991722e1f27b6e5c450f20981f108745;
    stim[54] = 129'h09dc6fa44ae087b252e26b20297b367cc;
    stim[55] = 129'h051f1cc92c6e935471d1c7c0bba37487e;
    stim[56] = 129'h05982ab9493241a86f1a77098f9fec603;
    stim[57] = 129'h04b8504e94fcfd3fddaf7adbaa64725e2;
    stim[58] = 129'h0ecd333ba8bcf66ca0761df34a9d05c32;
    stim[59] = 129'h043bdab75addd43506c935f5477d2bb46;
    stim[60] = 129'h064a396011de13d9bfc8f818786228f4b;
    stim[61] = 129'h0993531a579b696b35615640972bb1e6f;
    stim[62] = 129'h042b80e090cc17c92feb39abebb88d2f6;
    stim[63] = 129'h0c2e81b15e29ae700e26f61bd2cc2c0e3;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
