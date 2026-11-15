// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 94;
  localparam OW = 92;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060581 dut (
    .clk(clk),
    .rst(in_vec[93:93]),
    .EX_MWrite(in_vec[92:92]),
    .EX_MemtoReg(in_vec[91:91]),
    .EX_RegWrite(in_vec[90:90]),
    .EX_MemWrite(in_vec[89:89]),
    .EX_Jal(in_vec[88:88]),
    .EX_Half(in_vec[87:87]),
    .EX_ALU_result(in_vec[86:55]),
    .EX_Rt_data(in_vec[54:23]),
    .EX_PCplus8(in_vec[22:5]),
    .EX_WR_out(in_vec[4:0]),
    .M_MemtoReg(out_vec[91:91]),
    .M_RegWrite(out_vec[90:90]),
    .M_MemWrite(out_vec[89:89]),
    .M_Jal(out_vec[88:88]),
    .M_Half(out_vec[87:87]),
    .M_ALU_result(out_vec[86:55]),
    .M_Rt_data(out_vec[54:23]),
    .M_PCplus8(out_vec[22:5]),
    .M_WR_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 94'h2ca37778f6806a43b69820c6;
    stim[1] = 94'h2b8747e9980698ef13a07e64;
    stim[2] = 94'h10a663690f3c8d2dad6e9f2e;
    stim[3] = 94'h127e5785d9a67532290e9a54;
    stim[4] = 94'h1cc89b75a2933892fd58ff3c;
    stim[5] = 94'h08607339b571a1bb3be6e6d1;
    stim[6] = 94'h1726af8958dbf8fc4da9b5cc;
    stim[7] = 94'h0babd55fca4bd3507ee5e0d8;
    stim[8] = 94'h11961117a2507e8b4390cec5;
    stim[9] = 94'h1a10387df9db831f5bc5946b;
    stim[10] = 94'h15a4aeba769acfc26514af68;
    stim[11] = 94'h0a621887740a90e748ea360f;
    stim[12] = 94'h12e274912d2058a3d868f54b;
    stim[13] = 94'h01e4fc7964346e1734303f37;
    stim[14] = 94'h1a877fb99153f59f06c37ff0;
    stim[15] = 94'h1e5969e795ad975994e0b461;
    stim[16] = 94'h0eaffb9b78ab5663ac2a01b5;
    stim[17] = 94'h15ecaa1a1ca736f1a44fa976;
    stim[18] = 94'h007d9b5f1dc0f73e14363637;
    stim[19] = 94'h108a8a4bc75fe07c6c526e88;
    stim[20] = 94'h052bd596bc5c8a92778d4d89;
    stim[21] = 94'h078e501139cce1bdb077cc1a;
    stim[22] = 94'h11a679fafda554430bf1b24b;
    stim[23] = 94'h0016d922b70ca70985f0ed4b;
    stim[24] = 94'h082b6d3fde0e10b56289bf49;
    stim[25] = 94'h0650360ee38b9e468e2b5fb7;
    stim[26] = 94'h0ed86cddb49fbea2304325a9;
    stim[27] = 94'h074bff0d7ee1da33a76d1884;
    stim[28] = 94'h1fbdb5391a3419803a2249c9;
    stim[29] = 94'h16e14dc19828b9fa98d96507;
    stim[30] = 94'h12cc4a8793c786da08054981;
    stim[31] = 94'h02f41ea0f0d2660ec9a1efcc;
    stim[32] = 94'h0493c762eed189ca7683fd0a;
    stim[33] = 94'h0dff6e01d41c1257973efa46;
    stim[34] = 94'h01d9582917d44097fabd44ed;
    stim[35] = 94'h04ede48fc747542f5357233a;
    stim[36] = 94'h01c362fc57f6f136755f8a69;
    stim[37] = 94'h08e6155577717aae432de25c;
    stim[38] = 94'h1417c36cfc9a4d711f8c9189;
    stim[39] = 94'h181dfbbe4ece55ff6745d4cf;
    stim[40] = 94'h095413a9c39dc8a4d0690aad;
    stim[41] = 94'h0a3bc385c0253c0889dd25fc;
    stim[42] = 94'h1151ab48066608fe02ad9a5b;
    stim[43] = 94'h0ef11eec3ca6c13270d56db8;
    stim[44] = 94'h1982e0f700425f5b2f12ca83;
    stim[45] = 94'h0fd74200505368e2817ad1a0;
    stim[46] = 94'h1f1a05fe4d27677256ff7d30;
    stim[47] = 94'h07f382ca998899adc940c12f;
    stim[48] = 94'h2a10eb1dc2f3a814808d03b5;
    stim[49] = 94'h15e11e85122b582b51a3c948;
    stim[50] = 94'h0ed8791388981ac153ffe439;
    stim[51] = 94'h2c238aa9739d1732044d23a2;
    stim[52] = 94'h1ab0d2fcbd32f087113824eb;
    stim[53] = 94'h09a93dc39f25f942c63767c3;
    stim[54] = 94'h1683dc0db612ccd17851e155;
    stim[55] = 94'h0e2b487a65a2b0af843574a7;
    stim[56] = 94'h1713437114fc626c7bf59a9e;
    stim[57] = 94'h158b60221d1e92371e3e7313;
    stim[58] = 94'h003599282dedd60049e73fcf;
    stim[59] = 94'h1989f3a21b83e6f7735e8e6d;
    stim[60] = 94'h0eb6d3bf78b288c900fb5097;
    stim[61] = 94'h0bbe2fc216c74ef8243841e3;
    stim[62] = 94'h014c2884a5586a1e50b777fd;
    stim[63] = 94'h090f53fa1ed133e1b1efff0e;
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
      expv[0] = 92'h00000000000000000000000;
      expv[1] = 92'h00000000000000000000000;
      expv[2] = 92'h00000000000000000000000;
      expv[3] = 92'h0a663690f3c8d2dad6e9f2e;
      expv[4] = 92'h27e5785d9a67532290e9a54;
      expv[5] = 92'hcc89b75a2933892fd58ff3c;
      expv[6] = 92'hcc89b75a2933892fd58ff3c;
      expv[7] = 92'h726af8958dbf8fc4da9b5cc;
      expv[8] = 92'h726af8958dbf8fc4da9b5cc;
      expv[9] = 92'h1961117a2507e8b4390cec5;
      expv[10] = 92'ha10387df9db831f5bc5946b;
      expv[11] = 92'h5a4aeba769acfc26514af68;
      expv[12] = 92'h5a4aeba769acfc26514af68;
      expv[13] = 92'h2e274912d2058a3d868f54b;
      expv[14] = 92'h2e274912d2058a3d868f54b;
      expv[15] = 92'ha877fb99153f59f06c37ff0;
      expv[16] = 92'he5969e795ad975994e0b461;
      expv[17] = 92'he5969e795ad975994e0b461;
      expv[18] = 92'h5ecaa1a1ca736f1a44fa976;
      expv[19] = 92'h5ecaa1a1ca736f1a44fa976;
      expv[20] = 92'h08a8a4bc75fe07c6c526e88;
      expv[21] = 92'h08a8a4bc75fe07c6c526e88;
      expv[22] = 92'h08a8a4bc75fe07c6c526e88;
      expv[23] = 92'h1a679fafda554430bf1b24b;
      expv[24] = 92'h1a679fafda554430bf1b24b;
      expv[25] = 92'h1a679fafda554430bf1b24b;
      expv[26] = 92'h1a679fafda554430bf1b24b;
      expv[27] = 92'h1a679fafda554430bf1b24b;
      expv[28] = 92'h1a679fafda554430bf1b24b;
      expv[29] = 92'hfbdb5391a3419803a2249c9;
      expv[30] = 92'h6e14dc19828b9fa98d96507;
      expv[31] = 92'h2cc4a8793c786da08054981;
      expv[32] = 92'h2cc4a8793c786da08054981;
      expv[33] = 92'h2cc4a8793c786da08054981;
      expv[34] = 92'h2cc4a8793c786da08054981;
      expv[35] = 92'h2cc4a8793c786da08054981;
      expv[36] = 92'h2cc4a8793c786da08054981;
      expv[37] = 92'h2cc4a8793c786da08054981;
      expv[38] = 92'h2cc4a8793c786da08054981;
      expv[39] = 92'h417c36cfc9a4d711f8c9189;
      expv[40] = 92'h81dfbbe4ece55ff6745d4cf;
      expv[41] = 92'h81dfbbe4ece55ff6745d4cf;
      expv[42] = 92'h81dfbbe4ece55ff6745d4cf;
      expv[43] = 92'h151ab48066608fe02ad9a5b;
      expv[44] = 92'h151ab48066608fe02ad9a5b;
      expv[45] = 92'h982e0f700425f5b2f12ca83;
      expv[46] = 92'h982e0f700425f5b2f12ca83;
      expv[47] = 92'hf1a05fe4d27677256ff7d30;
      expv[48] = 92'h00000000000000000000000;
      expv[49] = 92'h00000000000000000000000;
      expv[50] = 92'h5e11e85122b582b51a3c948;
      expv[51] = 92'h00000000000000000000000;
      expv[52] = 92'h00000000000000000000000;
      expv[53] = 92'hab0d2fcbd32f087113824eb;
      expv[54] = 92'hab0d2fcbd32f087113824eb;
      expv[55] = 92'h683dc0db612ccd17851e155;
      expv[56] = 92'h683dc0db612ccd17851e155;
      expv[57] = 92'h713437114fc626c7bf59a9e;
      expv[58] = 92'h58b60221d1e92371e3e7313;
      expv[59] = 92'h58b60221d1e92371e3e7313;
      expv[60] = 92'h989f3a21b83e6f7735e8e6d;
      expv[61] = 92'h989f3a21b83e6f7735e8e6d;
      expv[62] = 92'h989f3a21b83e6f7735e8e6d;
      expv[63] = 92'h989f3a21b83e6f7735e8e6d;
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
