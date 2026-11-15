// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138164 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .sub(in_vec[0:0]),
    .result(out_vec[32:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h051883690d1aa04b7;
    stim[1] = 65'h0df480f7ea5b4830e;
    stim[2] = 65'h0d58cb05712a584b8;
    stim[3] = 65'h10f60c326b6fd99dd;
    stim[4] = 65'h1aaeab2c247b83b54;
    stim[5] = 65'h11ae9022c96d8a9db;
    stim[6] = 65'h0681fba8f3e246efa;
    stim[7] = 65'h075f4f10e4f566436;
    stim[8] = 65'h0308280d58ffee7b3;
    stim[9] = 65'h16c30c222f6856a94;
    stim[10] = 65'h1bd2e30d00c97564f;
    stim[11] = 65'h012b7d810a5226ea0;
    stim[12] = 65'h0086b0296022edb04;
    stim[13] = 65'h044386569ec293e7a;
    stim[14] = 65'h116d2377bc0b4765a;
    stim[15] = 65'h10ab19914a56b870e;
    stim[16] = 65'h18b4d8a7360fa72b0;
    stim[17] = 65'h0846dd66fe6a9d64e;
    stim[18] = 65'h0dbd98af786ce4ad0;
    stim[19] = 65'h055faa1e4fedd20bd;
    stim[20] = 65'h1db70715b0359d2e3;
    stim[21] = 65'h062e12bb4a0370611;
    stim[22] = 65'h08238ffad36e88210;
    stim[23] = 65'h1d1128f0aa6a49283;
    stim[24] = 65'h05a6813214dd703b4;
    stim[25] = 65'h08596615b4cdf1a04;
    stim[26] = 65'h0123b61d73ba1d20b;
    stim[27] = 65'h14517d02cf8b37eba;
    stim[28] = 65'h0b7ed5f3aae0e66a5;
    stim[29] = 65'h04dde9ffe65c3be62;
    stim[30] = 65'h0ce672cc0a3c8f84a;
    stim[31] = 65'h0eff38b2a00b5bf1f;
    stim[32] = 65'h1c767ec3138f22e08;
    stim[33] = 65'h03d6b0169419ed5db;
    stim[34] = 65'h16387ae7ae5d0ddd8;
    stim[35] = 65'h1899debdf16e4bd73;
    stim[36] = 65'h198c2025cd2495273;
    stim[37] = 65'h0469fefe9a879775d;
    stim[38] = 65'h1ca75a472253aed5a;
    stim[39] = 65'h14517d824106b7b8d;
    stim[40] = 65'h055fe76b527071a92;
    stim[41] = 65'h0c3967be695969525;
    stim[42] = 65'h182be3eb02c60df11;
    stim[43] = 65'h01208bd4c05105c4f;
    stim[44] = 65'h1dfb35c40c321a6ec;
    stim[45] = 65'h0c8d476b713070266;
    stim[46] = 65'h1ffd7916cd73d9cec;
    stim[47] = 65'h0618505d645fe7ff7;
    stim[48] = 65'h182f072b1a8316edf;
    stim[49] = 65'h152971dd415ce5a2e;
    stim[50] = 65'h0419bfc9e4d2a2b72;
    stim[51] = 65'h01b0faedc2954b79d;
    stim[52] = 65'h1d06ad835bad52dd4;
    stim[53] = 65'h14c88f318df9fcc72;
    stim[54] = 65'h1617a37a2f41e2d30;
    stim[55] = 65'h1e5e284a51be2376c;
    stim[56] = 65'h104c13fb271693fd3;
    stim[57] = 65'h0b7a86f00d7550deb;
    stim[58] = 65'h0b8c58631d0cf75eb;
    stim[59] = 65'h0cf629d5e8e012e02;
    stim[60] = 65'h1fc753b819f059132;
    stim[61] = 65'h0e9f526311d15761d;
    stim[62] = 65'h13d9154f89d2a5788;
    stim[63] = 65'h087ad80553a0f247e;
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
      expv[0] = 33'h123323b47;
      expv[1] = 33'h184fc928c;
      expv[2] = 33'h1e832350e;
      expv[3] = 33'h1c65e5d03;
      expv[4] = 33'h1f2a2ee16;
      expv[5] = 33'h1b1c1ac07;
      expv[6] = 33'h1a6442988;
      expv[7] = 33'h0c54b5544;
      expv[8] = 33'h1c0816887;
      expv[9] = 33'h062b62cb7;
      expv[10] = 33'h1c9c5871f;
      expv[11] = 33'h0b7da46b0;
      expv[12] = 33'h00a99dd9a;
      expv[13] = 33'h03061a3e3;
      expv[14] = 33'h0d786add5;
      expv[15] = 33'h1b01d2022;
      expv[16] = 33'h0ec47fd23;
      expv[17] = 33'h06b17acbd;
      expv[18] = 33'h062a7d5c7;
      expv[19] = 33'h154d7c2a1;
      expv[20] = 33'h0deca443c;
      expv[21] = 33'h1031831c5;
      expv[22] = 33'h1b92181bc;
      expv[23] = 33'h077b7218c;
      expv[24] = 33'h1a83f16d4;
      expv[25] = 33'h1d2757b5e;
      expv[26] = 33'h14ddd33e1;
      expv[27] = 33'h03dcb4ee7;
      expv[28] = 33'h165fbc5df;
      expv[29] = 33'h0b3a25e60;
      expv[30] = 33'h17230250a;
      expv[31] = 33'h0f0a94a49;
      expv[32] = 33'h1005a1a39;
      expv[33] = 33'h17f09d743;
      expv[34] = 33'h049588c53;
      expv[35] = 33'h0a082a950;
      expv[36] = 33'h06b0b54ce;
      expv[37] = 33'h1ef196745;
      expv[38] = 33'h1efb091cc;
      expv[39] = 33'h1558353b1;
      expv[40] = 33'h17d059146;
      expv[41] = 33'h1592d110b;
      expv[42] = 33'h1af1f1dc1;
      expv[43] = 33'h01719199b;
      expv[44] = 33'h0a2d5032d;
      expv[45] = 33'h1dbdb791c;
      expv[46] = 33'h0d7152e59;
      expv[47] = 33'h0a78385cd;
      expv[48] = 33'h12b21e18e;
      expv[49] = 33'h168657802;
      expv[50] = 33'h08ec62810;
      expv[51] = 33'h044646679;
      expv[52] = 33'h18b400609;
      expv[53] = 33'h02c28bf8b;
      expv[54] = 33'h0559864d3;
      expv[55] = 33'h101c4bc11;
      expv[56] = 33'h1762a7f85;
      expv[57] = 33'h18efd7ceb;
      expv[58] = 33'h08994fc1a;
      expv[59] = 33'h15d63cb60;
      expv[60] = 33'h19b7accb3;
      expv[61] = 33'h0070a9c4c;
      expv[62] = 33'h1dabbac80;
      expv[63] = 33'h1c1bca4d2;
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
