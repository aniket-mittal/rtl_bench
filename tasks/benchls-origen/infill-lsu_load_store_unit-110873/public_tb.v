// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 113;
  localparam OW = 108;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_110873 dut (
    .opcode(in_vec[112:106]),
    .funct3(in_vec[105:103]),
    .rd(in_vec[102:98]),
    .mem_addr(in_vec[97:66]),
    .rs2_data(in_vec[65:34]),
    .mem_valid(in_vec[33:33]),
    .data_rvalid(in_vec[32:32]),
    .data_rdata_in(in_vec[31:0]),
    .data_req_o(out_vec[107:107]),
    .data_we_o(out_vec[106:106]),
    .data_be_o(out_vec[105:102]),
    .data_addr_o(out_vec[101:70]),
    .data_wdata_o(out_vec[69:38]),
    .mem_data_out(out_vec[37:6]),
    .rd_out_lsu(out_vec[5:1]),
    .rd_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 113'h11083644d38e4ba79192b467b5e33;
    stim[1] = 113'h1897dbe21007271ae463f13f8a602;
    stim[2] = 113'h133fcae1bf3505e3fcf41562df873;
    stim[3] = 113'h096036d0e9a9512bf30d64a8dc74e;
    stim[4] = 113'h02467e8892ebc9cbec76192b55f66;
    stim[5] = 113'h055f837155a08f34aed856a36bebe;
    stim[6] = 113'h0f2b3bc9ed5b85656ac5800cac4b2;
    stim[7] = 113'h112a51c12ba22538162876290d939;
    stim[8] = 113'h0ece376041ee737262d048b5152f7;
    stim[9] = 113'h0719fcb2aa9ece6cbd40832061d10;
    stim[10] = 113'h16f9929bc928b5b7d4f2dbc467eb4;
    stim[11] = 113'h01790625813dedb9ddcbd0da9671d;
    stim[12] = 113'h0bb98b23b57443e661c66ec317b4a;
    stim[13] = 113'h1475933b35c5fc4434dfe1f0e4306;
    stim[14] = 113'h19a326848031ffca239224b05d870;
    stim[15] = 113'h00a42cfd8bbbc80540be1511a577d;
    stim[16] = 113'h17977f2c65b0dac1d109730837617;
    stim[17] = 113'h1ed1bb03b784218bf5344d2695656;
    stim[18] = 113'h1c6a4ff3643e120cd16d4f09f44c9;
    stim[19] = 113'h15e56934ebb0457801e8546e5a55d;
    stim[20] = 113'h0417299b63821aca6947605b8a2f0;
    stim[21] = 113'h0ca059b3dee220800162dd6cb652f;
    stim[22] = 113'h026309cf4a348654af92c0587d17e;
    stim[23] = 113'h038e857899957e6b2cc8f22316714;
    stim[24] = 113'h00968bfb9d33138ae982e9aef51fb;
    stim[25] = 113'h0f810e49276690c8e7f03bd1569ae;
    stim[26] = 113'h15bcaf12dccec714a053fb1bd187e;
    stim[27] = 113'h119fe64dd254835bb26015f31675f;
    stim[28] = 113'h0d5a8ed743e682ac9abc44d1b4176;
    stim[29] = 113'h1564608a9bd9cb765caf68db2abd4;
    stim[30] = 113'h1d6d2be17221acbb912d3783dd00e;
    stim[31] = 113'h109a3b94fb203a134405c9706e900;
    stim[32] = 113'h1ccac2ad6c3a74dd135849d589c9f;
    stim[33] = 113'h070eaa3d77269b63d3092689cc844;
    stim[34] = 113'h08d0b8f482937d973983e6b8c1d4e;
    stim[35] = 113'h1af864f29506d5a5cfa04d76901f3;
    stim[36] = 113'h0e0f133a0d9f1c21eda577e4d9dfe;
    stim[37] = 113'h0e69d79527b88a55b53f038c20767;
    stim[38] = 113'h0a7eee63ade6161c7325630e6cef2;
    stim[39] = 113'h12c25a17007cf31a6cf3d5365c128;
    stim[40] = 113'h0293ec4fd3a8f1e4ce2f2e24c6bac;
    stim[41] = 113'h0c41486cd24a98648bbd94a3503c0;
    stim[42] = 113'h1baf8c1903908931f06922409705b;
    stim[43] = 113'h014b1ccc585b8ebb7fbe7de1a454a;
    stim[44] = 113'h0212ca71d7d30132d313b9a087d8d;
    stim[45] = 113'h0856151436440d72b533a7eba2219;
    stim[46] = 113'h0c0dea35c4a68c32d62cf1d388f6c;
    stim[47] = 113'h0d50f0a55a664c54c6b991a4f89f7;
    stim[48] = 113'h19662298ffe2b7f6499ce8a984ec2;
    stim[49] = 113'h017605cc52dd6753e5021225e34b8;
    stim[50] = 113'h01006ada51b02a556fa067ad3a064;
    stim[51] = 113'h04a95706e2b28f7d271d15dfc530b;
    stim[52] = 113'h1fd9de60fc2311e4dbf02b63678fa;
    stim[53] = 113'h11d34e84620c76f4c82bc255eb3a2;
    stim[54] = 113'h1221633a571661c7816679952db6e;
    stim[55] = 113'h01248cb345eb9900231ae7f83aa85;
    stim[56] = 113'h140d43eecfa5ed0d53eb00bda5db5;
    stim[57] = 113'h1ab9dc0692bbc77a54d39e5f1d0f2;
    stim[58] = 113'h09522feb2f880cb563d42a34b991b;
    stim[59] = 113'h1661ddad5429341a6f19274357ad0;
    stim[60] = 113'h0ebb151fc172d6b791f0f22d735c9;
    stim[61] = 113'h103691a4260a4c0f6967fe1b4685d;
    stim[62] = 113'h09ea4265fa89b663e4a7cf111105b;
    stim[63] = 113'h1c163aff58885bf98fe8a0ccd9e5a;
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
      expv[0] = 108'h83644d38e400000000000000000;
      expv[1] = 108'h81be2100700000000000000003e;
      expv[2] = 108'h00ae1bf3500000000000000003e;
      expv[3] = 108'h836d0e9a9400000000000000000;
      expv[4] = 108'h03e8892ebc00000000000000032;
      expv[5] = 108'h0037155a080000000000000003c;
      expv[6] = 108'h03bc9ed5b800000000000000018;
      expv[7] = 108'h811c12ba2000000000000000012;
      expv[8] = 108'h0376041ee400000000000000030;
      expv[9] = 108'h03cb2aa9ec0000000000000000e;
      expv[10] = 108'h0129bc92880000000000000000c;
      expv[11] = 108'h00625813dc00000000000000008;
      expv[12] = 108'h80b23b57440000000000000000c;
      expv[13] = 108'h8133b35c5c0000000000000002c;
      expv[14] = 108'h826848031c00000000000000018;
      expv[15] = 108'h02cfd8bbbc00000000000000020;
      expv[16] = 108'h83f2c65b0c0000000000000003a;
      expv[17] = 108'h03b03b78400000000000000000c;
      expv[18] = 108'h00ff3643e000000000000000012;
      expv[19] = 108'h02934ebb040000000000000002a;
      expv[20] = 108'h8299b6382000000000000000038;
      expv[21] = 108'h019b3dee2000000000000000002;
      expv[22] = 108'h009cf4a34800000000000000018;
      expv[23] = 108'h805789995400000000000000034;
      expv[24] = 108'h80bfb9d33000000000000000034;
      expv[25] = 108'h80e492766800000000000000008;
      expv[26] = 108'h82f12dccec00000000000000024;
      expv[27] = 108'h0264dd25480000000000000003e;
      expv[28] = 108'h00ed743e6800000000000000014;
      expv[29] = 108'h8208a9bd9c00000000000000022;
      expv[30] = 108'h82be17221800000000000000028;
      expv[31] = 108'h03b94fb20000000000000000010;
      expv[32] = 108'h002ad6c3a400000000000000016;
      expv[33] = 108'h82a3d7726800000000000000034;
      expv[34] = 108'hff8f482937d973983c000000004;
      expv[35] = 108'h024f29506c00000000000000002;
      expv[36] = 108'h8133a0d9f000000000000000038;
      expv[37] = 108'h0179527b880000000000000000e;
      expv[38] = 108'h82e63ade6000000000000000036;
      expv[39] = 108'h01a17007cc00000000000000012;
      expv[40] = 108'h82c4fd3a8c0000000000000001e;
      expv[41] = 108'h0086cd24a80000000000000000a;
      expv[42] = 108'h80c19039080000000000000003c;
      expv[43] = 108'h81ccc585b800000000000000018;
      expv[44] = 108'h80a71d7d3000000000000000016;
      expv[45] = 108'h815143644000000000000000030;
      expv[46] = 108'h82a35c4a680000000000000002e;
      expv[47] = 108'h030a55a66400000000000000006;
      expv[48] = 108'h82298ffe2800000000000000030;
      expv[49] = 108'h005cc52dd400000000000000030;
      expv[50] = 108'h82ada51b0000000000000000002;
      expv[51] = 108'h01706e2b280000000000000000a;
      expv[52] = 108'h81e60fc2300000000000000000e;
      expv[53] = 108'h00e84620c40000000000000001a;
      expv[54] = 108'h8233a571640000000000000000a;
      expv[55] = 108'h80cb345eb800000000000000024;
      expv[56] = 108'h003eecfa5c0000000000000002a;
      expv[57] = 108'h01c0692bbc0000000000000000e;
      expv[58] = 108'h82feb2f88000000000000000010;
      expv[59] = 108'h81dad542900000000000000000e;
      expv[60] = 108'h8151fc172c00000000000000018;
      expv[61] = 108'h811a4260a400000000000000034;
      expv[62] = 108'h00265fa89800000000000000012;
      expv[63] = 108'h83aff5888400000000000000030;
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
