// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 142;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136467 dut (
    .clk(clk),
    .rst(in_vec[105:105]),
    .wb_ack_i(in_vec[104:104]),
    .wb_err_i(in_vec[103:103]),
    .wb_rty_i(in_vec[102:102]),
    .wb_dat_i(in_vec[101:70]),
    .cbu_adr_i(in_vec[69:38]),
    .cbu_dat_i(in_vec[37:6]),
    .cbu_rqt_i(in_vec[5:5]),
    .cbu_we_i(in_vec[4:4]),
    .cbu_sel_i(in_vec[3:0]),
    .wb_cyc_o(out_vec[141:141]),
    .wb_adr_o(out_vec[140:109]),
    .wb_stb_o(out_vec[108:108]),
    .wb_we_o(out_vec[107:107]),
    .wb_sel_o(out_vec[106:103]),
    .wb_dat_o(out_vec[102:71]),
    .wb_cti_o(out_vec[70:68]),
    .wb_bte_o(out_vec[67:66]),
    .cbu_ack_o(out_vec[65:65]),
    .cbu_err_o(out_vec[64:64]),
    .cbu_dat_o(out_vec[63:32]),
    .cbu_adr_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h368608ff991384fd3c1ba6f9562;
    stim[1] = 106'h2609f9543d6293ae04988c04b39;
    stim[2] = 106'h02acd30a33ce06be2eec5fd1549;
    stim[3] = 106'h0803b4e3c8c06486d5fe892cd21;
    stim[4] = 106'h0188b44f372a1dbca3ee52e16ea;
    stim[5] = 106'h0e182b4c343cdfd7bd38db5ebb9;
    stim[6] = 106'h150b2a21b0bf9e839e0169fbe54;
    stim[7] = 106'h1ab9d872a8cb11ff6d66db3eb0f;
    stim[8] = 106'h1bf88d997e796eec4f8a73aff45;
    stim[9] = 106'h1ab94dc2f29bd687225f1ea14b8;
    stim[10] = 106'h0c323ef45e406ef4f3dc210dda5;
    stim[11] = 106'h13d0c560844b1c55531e203dc5a;
    stim[12] = 106'h19b6cb6a41ba55d0dc980f994fd;
    stim[13] = 106'h0e6a0fec13855fb418eababd493;
    stim[14] = 106'h1abc70bb56a15243c5ce5e9a4e2;
    stim[15] = 106'h1465f2116542f0f1698a56f9eea;
    stim[16] = 106'h03fb28b666e878f81c07aec9fa7;
    stim[17] = 106'h1795fa1f76b7d254128536947f2;
    stim[18] = 106'h12f327142f23e48597b76005310;
    stim[19] = 106'h0b763d1953881b4fa4c918a5755;
    stim[20] = 106'h09bad078db30b247a77ef4d230c;
    stim[21] = 106'h00918bc77eb55d9e8322a950d0f;
    stim[22] = 106'h0809ebc120aa122c102e2832e1d;
    stim[23] = 106'h0e59c85f26a0c873a8a96b96987;
    stim[24] = 106'h1b9674f1518b23bf1e1c2b7e7a5;
    stim[25] = 106'h113a8af4afcabb9408fd2e30d86;
    stim[26] = 106'h02125cbe44e91c0c9f597592c4b;
    stim[27] = 106'h116977a352ba2c0680042ba706e;
    stim[28] = 106'h00724fb79a3c3a6fc088ed718ed;
    stim[29] = 106'h15727581a84455fbb8290c2aa59;
    stim[30] = 106'h148df7a73c50e993ad4be4fe734;
    stim[31] = 106'h1fc8e9e8e65c61edfd035c8fc2c;
    stim[32] = 106'h0a9f616d3bc68dd42a6c465beaa;
    stim[33] = 106'h1d9b59667befde3203e977c99f7;
    stim[34] = 106'h19539e73b350e7a2a76b6fafa4d;
    stim[35] = 106'h175433ed2918697be9c17d710b6;
    stim[36] = 106'h0dbfad111c3b7759d404257be3e;
    stim[37] = 106'h0a7035f8aa98ee9c80980c62e72;
    stim[38] = 106'h0e6de32de4384ef08f326b10293;
    stim[39] = 106'h1a0cd08601b8aa505eb0193fc8c;
    stim[40] = 106'h1fd50af661da880c42558ee0a16;
    stim[41] = 106'h1c60d94321bc4ae15933df52901;
    stim[42] = 106'h1b14dc0e3c148010283cdf4a6e5;
    stim[43] = 106'h1825780effd37d270504a3e893d;
    stim[44] = 106'h157e36f0b23bcb30c26095179e6;
    stim[45] = 106'h1504a80f362d4660d5a2d4cc1d4;
    stim[46] = 106'h0b77a8dbafd70c9e2cef5e1b350;
    stim[47] = 106'h18a2b433ea72d1d66c124f99997;
    stim[48] = 106'h049e1daee1de4238748edc424ae;
    stim[49] = 106'h1e9271c0dda6cb8383d1dc0977a;
    stim[50] = 106'h03cf6151daf048e7ec5a946f3be;
    stim[51] = 106'h1bd7e607397e61caf5865225b1c;
    stim[52] = 106'h1009665b43cdac90ea7c0f1d3ca;
    stim[53] = 106'h1ac236e9b78c0aceeb1de7cdfd7;
    stim[54] = 106'h1525fce018814e6e0acfe532dd6;
    stim[55] = 106'h1a6509f373534bd987e90e0b0ef;
    stim[56] = 106'h1f9e90d951d31174374448ad141;
    stim[57] = 106'h10c0ca8a3e2e2b0d5a56437b50f;
    stim[58] = 106'h0cfc35bcf03f8ed48e1aea396e5;
    stim[59] = 106'h0c30513681d88e4f259d197d77e;
    stim[60] = 106'h000a4d3720258d36b8da6536764;
    stim[61] = 106'h0c1cf6ed0994a19c969a6b214df;
    stim[62] = 106'h17d1c1e16d6360185b38ae7b45e;
    stim[63] = 106'h1859651189a6a01f41cc1318a3c;
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
      expv[0] = 142'h000000000000000000000000000000000000;
      expv[1] = 142'h000000000000000000000000000000000000;
      expv[2] = 142'h000000000000000000000000000000000000;
      expv[3] = 142'h000000000000000000000000000000000000;
      expv[4] = 142'h26032436b0bfd1259a010000000000000000;
      expv[5] = 142'h3950ede5157dca5c2d800000000000000000;
      expv[6] = 142'h21e6febdfca71b6bd70100000000ca876f28;
      expv[7] = 142'h01e6febde0000000000242ca886c0f37f5ef;
      expv[8] = 142'h01e6febde00000000002ae761caa0f37f5ef;
      expv[9] = 142'h01e6febde00000000002fe23665f0f37f5ef;
      expv[10] = 142'h34deb4391c4be3d42902ae5370bc0f37f5ef;
      expv[11] = 142'h320377a792fb8421bb0100000000a6f5a1c8;
      expv[12] = 142'h120377a7800000000002f4315821901bbd3c;
      expv[13] = 142'h2dd2ae86fe9301f329826db2da90901bbd3c;
      expv[14] = 142'h0dd2ae86e00000000001000000006e957437;
      expv[15] = 142'h350a921e3139cbd34982af1c2ed56e957437;
      expv[16] = 142'h2a17878b55314adf3d82197c8459a85490f1;
      expv[17] = 142'h3743c7c0f380f5d93f00197c8459a85490f1;
      expv[18] = 142'h35be92a09950a6d28f82e57e87ddba1e3e07;
      expv[19] = 142'h15be92a0800000000002bcc9c50badf49504;
      expv[20] = 142'h15be92a080000000000100000000adf49504;
      expv[21] = 142'h15be92a080000000000100000000adf49504;
      expv[22] = 142'h15be92a080000000000000000000adf49504;
      expv[23] = 142'h15be92a080000000000100000000adf49504;
      expv[24] = 142'h15be92a080000000000100000000adf49504;
      expv[25] = 142'h2c591df8f2c3856fcf02e59d3c54adf49504;
      expv[26] = 142'h0c591df8e000000000024ea2bd2b62c8efc7;
      expv[27] = 142'h0c591df8e000000000004ea2bd2b62c8efc7;
      expv[28] = 142'h35d1603417008574e0825a5de8d462c8efc7;
      expv[29] = 142'h31e1d37e16911dae31805a5de8d462c8efc7;
      expv[30] = 142'h11e1d37e0000000000025c9d606a8f0e9bf0;
      expv[31] = 142'h22874c9d7a297c9fce02237de9cf8f0e9bf0;
      expv[32] = 142'h32e30f6ff6206b91f802f23a7a39143a64eb;
      expv[33] = 142'h3e346ea1554d88cb7d010000000097187b7f;
      expv[34] = 142'h3f7ef1901bfd2ef9338266d6599ef1a3750a;
      expv[35] = 142'h1f7ef19000000000000254e79cecfbf78c80;
      expv[36] = 142'h28c34bdf5b382fae2102d50cfb4afbf78c80;
      expv[37] = 142'h21dbbacebf0084af7c0100000000461a5efa;
      expv[38] = 142'h34c774e41913018c5c81000000000eddd675;
      expv[39] = 142'h14c774e400000000000100000000a63ba720;
      expv[40] = 142'h14c774e400000000000283342180a63ba720;
      expv[41] = 142'h14c774e4000000000002f542bd98a63ba720;
      expv[42] = 142'h14c774e4000000000002183650c8a63ba720;
      expv[43] = 142'h20a4008152879be94d82c537038fa63ba720;
      expv[44] = 142'h3e9be9383ea0947d1202095e03bf0520040a;
      expv[45] = 142'h31de5986134c12a2f3825f8dbc2cf4df49c1;
      expv[46] = 142'h11de5986000000000002412a03cd8ef2cc30;
      expv[47] = 142'h11de5986000000000001000000008ef2cc30;
      expv[48] = 142'h11de598600000000000228ad0cfa8ef2cc30;
      expv[49] = 142'h2ef211c3b711db88490028ad0cfa8ef2cc30;
      expv[50] = 142'h2d365c1c1d7a3b812e82a49c703777908e1d;
      expv[51] = 142'h3782473f7f0b528de700a49c703777908e1d;
      expv[52] = 142'h1782473f600000000002f5f981cebc1239fb;
      expv[53] = 142'h1782473f600000000002025996d0bc1239fb;
      expv[54] = 142'h1782473f600000000002b08dba6dbc1239fb;
      expv[55] = 142'h1782473f600000000002497f3806bc1239fb;
      expv[56] = 142'h3a9a5ecc37fd21c1618299427cdcbc1239fb;
      expv[57] = 142'h1a9a5ecc200000000002e7a43654d4d2f661;
      expv[58] = 142'h1a9a5ecc2000000000023032a28fd4d2f661;
      expv[59] = 142'h21fc76a472c35d472d8100000000d4d2f661;
      expv[60] = 142'h2ec472793f33a32fae81000000000fe3b523;
      expv[61] = 142'h212c69b5d21b4ca6ce80000000000fe3b523;
      expv[62] = 142'h012c69b5c000000000010000000009634dae;
      expv[63] = 142'h012c69b5c00000000002f470785b09634dae;
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
