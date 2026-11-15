// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 157;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_core dut (
    .clk_i(clk),
    .rst_ni(in_vec[156:156]),
    .test_en_i(in_vec[155:155]),
    .hart_id_i(in_vec[154:123]),
    .boot_addr_i(in_vec[122:91]),
    .instr_gnt_i(in_vec[90:90]),
    .instr_rvalid_i(in_vec[89:89]),
    .instr_rdata_i(in_vec[88:57]),
    .instr_err_i(in_vec[56:56]),
    .data_gnt_i(in_vec[55:55]),
    .data_rvalid_i(in_vec[54:54]),
    .data_rdata_i(in_vec[53:22]),
    .data_err_i(in_vec[21:21]),
    .irq_software_i(in_vec[20:20]),
    .irq_timer_i(in_vec[19:19]),
    .irq_external_i(in_vec[18:18]),
    .irq_fast_i(in_vec[17:3]),
    .irq_nm_i(in_vec[2:2]),
    .debug_req_i(in_vec[1:1]),
    .fetch_enable_i(in_vec[0:0]),
    .instr_req_o(out_vec[103:103]),
    .instr_addr_o(out_vec[102:71]),
    .data_req_o(out_vec[70:70]),
    .data_we_o(out_vec[69:69]),
    .data_be_o(out_vec[68:65]),
    .data_addr_o(out_vec[64:33]),
    .data_wdata_o(out_vec[32:1]),
    .core_sleep_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 157'h08d214e65aa5d6802948384446fc26228e673b18;
    stim[1] = 157'h011b8434ffdb03edbd2cccdb027e2a9eb0db393e;
    stim[2] = 157'h1e9920ee911c8e000a0fd0aa385e704da3ddd79a;
    stim[3] = 157'h1ca2624b500158acae34b84a33360c818376da7f;
    stim[4] = 157'h1890cc6455bf1c699dcfc0683406f25c34a1c1f4;
    stim[5] = 157'h1aed014105a472fd3df172d855c52edaa6de2a9b;
    stim[6] = 157'h106f41aa360dcd6dda89eb2787b4df669962f874;
    stim[7] = 157'h15bbbdfb4b3389018ff1dbb22ea393b1ac5fac3d;
    stim[8] = 157'h1306aebc0d319eae5d940fec2b5384e275c72c9e;
    stim[9] = 157'h1bb5bbb8bfefdeab00a5dd894ddbb1dab9653a23;
    stim[10] = 157'h19bf7932bb120cc52af829296835a30b6ddb4213;
    stim[11] = 157'h19fc3df900743c60ccc6daa940c68a29ab2c472f;
    stim[12] = 157'h1ab1d5350d672ce194f17d77153f27c4221a5b95;
    stim[13] = 157'h1c0ad67f264610c248f862207d10671d4371fbac;
    stim[14] = 157'h1ea30bcc49033df923c6a3f07ada7b037d21e7d8;
    stim[15] = 157'h1e145341d995edecd6fa2b6bcd85f6f3eb01c1d4;
    stim[16] = 157'h15e48fce8701af0ee48a3418937984422ddd2585;
    stim[17] = 157'h1743981598d19fdfc4f317c88700f002c8371c1f;
    stim[18] = 157'h15aae35d5c5c62a745bcf0e01f7676d77b34d4b8;
    stim[19] = 157'h17e09935a33fc6d806cca4b664b65d37db01614a;
    stim[20] = 157'h17bc672ffef597e684fb95a5f606f61260fde1d2;
    stim[21] = 157'h13fb7f389d24cbb7b186ce1333b5aaeaddf8ca0f;
    stim[22] = 157'h12388e7ea5cbff8bc68a08b37f6bb936b75cb160;
    stim[23] = 157'h1cf990b09601afc564a86f6cf6c100ff46823437;
    stim[24] = 157'h1447795a9b8c1ff106c72b2118b3fa53797a5324;
    stim[25] = 157'h191bc8aaf7fe2043d61679f792909b2c0f36e1b5;
    stim[26] = 157'h143049ef631f2a79552c38b1838bc77e422c26be;
    stim[27] = 157'h1cc4928701ef4d1ae2f6e8852bd6f63100b43c7a;
    stim[28] = 157'h1ce6721f04547e46273f50488f2a5fd81d48f31c;
    stim[29] = 157'h163a7f9beac779dc476b949a622611a6fb5f723c;
    stim[30] = 157'h14c49b896a5e6ab6d79ff726e3eea7679c7220e8;
    stim[31] = 157'h18cf8f005c99708f070f0d3eee848e9eb23f5799;
    stim[32] = 157'h1da0dc5eeca4bfa803492a46acb7fb2314fdfd7e;
    stim[33] = 157'h1c5f117a5777d3fb8579f1983be657e2967d0c35;
    stim[34] = 157'h1ea093d5552f32322d8d0d5053e65d881ca7f612;
    stim[35] = 157'h182036b1cee23ee025237321a438d425c8e9e874;
    stim[36] = 157'h1b47bc71ad3c4479d44cd909a645e3a6a3521b33;
    stim[37] = 157'h164182ff45fdf561e96d4ed1b72cc7051e563d48;
    stim[38] = 157'h196595ed21fef0f2bb4eb0eaa1ac716316041b2f;
    stim[39] = 157'h14806f89565e4b94624582e72b3aa8055689a4dd;
    stim[40] = 157'h1c49bf2b6d887ff9492f12a0ff962f9e1b9b5571;
    stim[41] = 157'h12c750c11900501be564117056055497eaf4a946;
    stim[42] = 157'h1b64c260af2f6313bde193f22a55063048ed07d3;
    stim[43] = 157'h11b8d67eaba80d134242bbe626390ed778ccadb1;
    stim[44] = 157'h19eb2e60723b0f2de3df0281abd3b38751751689;
    stim[45] = 157'h126b8b0f1aad52dd20928cbe4142d36ab0f67657;
    stim[46] = 157'h12e2e500831befa8bf5623470be5a1e99e7cd554;
    stim[47] = 157'h18d623c6d63075b7b3640d3d465a477828d438e0;
    stim[48] = 157'h1cc45abdb4a3a592eb8421769a361f5bf578527e;
    stim[49] = 157'h1130503aca936d7460bd769b6053a93c476bdf57;
    stim[50] = 157'h11eeb16add5ed6ead1c7c0aef6b401221feae1c5;
    stim[51] = 157'h1a2924cfd0bf2fc199665a0dfdf9fa0211bb681a;
    stim[52] = 157'h139f4cd0ff87acee2d07474f6bb27f671e540e17;
    stim[53] = 157'h1f2d309d21bdaaf4c676d94755799a0ccd238fcc;
    stim[54] = 157'h129102a7a50410cfa368c39b1c8e0491f5293579;
    stim[55] = 157'h1492576bbd15f9b129f367c4b1d2d7b3ea1d2808;
    stim[56] = 157'h103ffa03f22c9620505b1b71f77a329a222904e0;
    stim[57] = 157'h1c8e503a567ccf312b6952381f30d6e95f7865e2;
    stim[58] = 157'h1fe6fada4ee6ff50f5df8ed54834bb0ea61d5eda;
    stim[59] = 157'h15bb157d2673a3f32395a9b4d2c26fad6db77ed4;
    stim[60] = 157'h0325d4bed028d2ac0656fbe875e2657446f67d65;
    stim[61] = 157'h1535b1fa0f90a5cca9f219798e0660d15b73d186;
    stim[62] = 157'h1904b0326f50a2a5ee1993407aa596d01bc0288a;
    stim[63] = 157'h12c92967e8b114a8283816d6119ea5dfbf2fcdae;
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
      expv[0] = 104'h2a5d68401xxxxxxxxxxxxxxxxx;
      expv[1] = 104'h7db03ec01xxxxxxxxxxxxxxxxx;
      expv[2] = 104'h11c8e0401xxxxxxxxxxxxxxxxx;
      expv[3] = 104'h00158ac01xxxxxxxxxxxxxxxxx;
      expv[4] = 104'hdbf1c6c01xxxxxxxxxxxxxxxxx;
      expv[5] = 104'hdbf1c6c21xxxxxxxxxxxxxxxxx;
      expv[6] = 104'h5bf1c6c41xxxxxxxxxxxxxxxxx;
      expv[7] = 104'hdbf1c6c41dfffff76000000000;
      expv[8] = 104'hdbf1c6801dfffff76000000000;
      expv[9] = 104'h0d0884001dfffff76000000000;
      expv[10] = 104'h0d0884001dfffff76000000000;
      expv[11] = 104'h8d0884001dfffff76000000000;
      expv[12] = 104'h0d0884021dfffff76000000000;
      expv[13] = 104'h0d0884021dfffff76000000000;
      expv[14] = 104'h0d0884021dfffff76000000000;
      expv[15] = 104'h8d0884021dfffff76000000000;
      expv[16] = 104'h8d08840411fffff05800000000;
      expv[17] = 104'h0d08840411fffff05800000000;
      expv[18] = 104'h0d08840411fffff05800000000;
      expv[19] = 104'h0d08840411fffff05800000000;
      expv[20] = 104'h8d08840411fffff05800000000;
      expv[21] = 104'h0d08840611fffff05800000000;
      expv[22] = 104'h0d08840611fffff05800000000;
      expv[23] = 104'h8d08840611fffff05800000000;
      expv[24] = 104'h0d08840811fffff05800000000;
      expv[25] = 104'h8d08840811fffff38800000000;
      expv[26] = 104'h8d08840411fffff38800000000;
      expv[27] = 104'h0d08840611fffff38800000000;
      expv[28] = 104'h8d08840611fffff38800000000;
      expv[29] = 104'h8d0884081800000c0800000000;
      expv[30] = 104'h8d0884041800000c0800000000;
      expv[31] = 104'h8d0884061800000c0800000000;
      expv[32] = 104'h8d0884081e00000f1000000000;
      expv[33] = 104'h8d0884081e00000f1000000000;
      expv[34] = 104'h8d0884041e00000f1000000000;
      expv[35] = 104'h0d0884061e00000f1000000000;
      expv[36] = 104'h0d0884061e00000f1000000000;
      expv[37] = 104'h0d0884061e00000f1000000000;
      expv[38] = 104'h0d0884061e00000f1000000000;
      expv[39] = 104'h8d0884061e00000f1000000000;
      expv[40] = 104'h8d0884061ffffca00000000000;
      expv[41] = 104'h8d0884061ffffca00000000000;
      expv[42] = 104'h8d0884041ffffca00000000000;
      expv[43] = 104'h0d0884061ffffca00000000000;
      expv[44] = 104'h8d0884061ffffca00000000000;
      expv[45] = 104'h8d0884061c0000002800000000;
      expv[46] = 104'h8d0884061c0000002800000000;
      expv[47] = 104'h8d0884041c0000002800000000;
      expv[48] = 104'h8d0884041c0000002800000000;
      expv[49] = 104'h8d0884041c0000002800000000;
      expv[50] = 104'h8d0884041c0000002800000000;
      expv[51] = 104'h8d0884041c0000002800000000;
      expv[52] = 104'h8d0884041c0000002800000000;
      expv[53] = 104'h8d0884061c0000002800000000;
      expv[54] = 104'h8d08840819fffff89000000000;
      expv[55] = 104'h8d08840819fffff89000000000;
      expv[56] = 104'h8d08840819fffff89000000000;
      expv[57] = 104'h8d08840819fffff89000000000;
      expv[58] = 104'h8d08840819fffff89000000000;
      expv[59] = 104'h8d08840419fffff89000000000;
      expv[60] = 104'h028d2ac019fffff89000000000;
      expv[61] = 104'h790a5cc019fffff89000000000;
      expv[62] = 104'h750a2a4019fffff89000000000;
      expv[63] = 104'h0b114ac019fffff89000000000;
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
