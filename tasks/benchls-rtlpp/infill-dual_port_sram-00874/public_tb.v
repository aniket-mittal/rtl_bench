// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 94;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00874 dut (
    .CLKA(in_vec[93:93]),
    .CENA(in_vec[92:92]),
    .AA(in_vec[91:84]),
    .CLKB(in_vec[83:83]),
    .CENB(in_vec[82:82]),
    .AB(in_vec[81:74]),
    .DB(in_vec[73:55]),
    .EMAA(in_vec[54:52]),
    .EMASA(in_vec[51:51]),
    .EMAB(in_vec[50:48]),
    .TENA(in_vec[47:47]),
    .TCENA(in_vec[46:46]),
    .TAA(in_vec[45:38]),
    .TENB(in_vec[37:37]),
    .TCENB(in_vec[36:36]),
    .TAB(in_vec[35:28]),
    .TDB(in_vec[27:9]),
    .RET1N(in_vec[8:8]),
    .SIA(in_vec[7:6]),
    .SEA(in_vec[5:5]),
    .DFTRAMBYP(in_vec[4:4]),
    .SIB(in_vec[3:2]),
    .SEB(in_vec[1:1]),
    .COLLDISN(in_vec[0:0]),
    .CENYA(out_vec[40:40]),
    .AYA(out_vec[39:32]),
    .CENYB(out_vec[31:31]),
    .AYB(out_vec[30:23]),
    .QA(out_vec[22:4]),
    .SOA(out_vec[3:2]),
    .SOB(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 94'h2642a50923396f42ef52b069;
    stim[1] = 94'h373843e5a4beb8dca6f6e564;
    stim[2] = 94'h0926bc92d5e3fc5f81b67566;
    stim[3] = 94'h21ed73b67c704563b1b3b4c6;
    stim[4] = 94'h1e1a69261dc5426637d489fa;
    stim[5] = 94'h190cc07e660a931088369d4b;
    stim[6] = 94'h01e510db3c539e3059d57b0b;
    stim[7] = 94'h05e87b776ff936449f3622ab;
    stim[8] = 94'h0d6b2a1dab5282fa1206d7f3;
    stim[9] = 94'h3b2a33eeff9e888939ac8276;
    stim[10] = 94'h138666dec3099926d3c96391;
    stim[11] = 94'h28438065eb31d5329600aa38;
    stim[12] = 94'h1e0a55fa48d1d300300e8d8f;
    stim[13] = 94'h267a85a1cd5cdad850a77ea7;
    stim[14] = 94'h1723b5586d554141151c81c0;
    stim[15] = 94'h0b846e8ebb906e0095e6a77c;
    stim[16] = 94'h01bad7b6aef333841d16d2f6;
    stim[17] = 94'h29829daa28ffe72ca07df97a;
    stim[18] = 94'h0dc6d28b13dea0c1b7b2aea8;
    stim[19] = 94'h1d10914647cdf81a7efef4e7;
    stim[20] = 94'h0e02d7fc89f63ced880cccd0;
    stim[21] = 94'h25b9c57835b25bed66d2e120;
    stim[22] = 94'h0607c8cceb46964371e0781f;
    stim[23] = 94'h38769f1fc4cc088bd87c91d8;
    stim[24] = 94'h36cdccba2061599c126df9f7;
    stim[25] = 94'h0d27e7729f5ae1d7a4dbe711;
    stim[26] = 94'h38a36673c3cb30dce393080d;
    stim[27] = 94'h247a43ac8e9764ff45c142f1;
    stim[28] = 94'h39ff828b897aba5a7390d82b;
    stim[29] = 94'h29180d0c5fa30513a486d368;
    stim[30] = 94'h306feb2054d90428bb487944;
    stim[31] = 94'h17ecd310b775222f901df447;
    stim[32] = 94'h3a9af416a7952735947a3007;
    stim[33] = 94'h12dc8dbb81ed468a30ead090;
    stim[34] = 94'h38e66b0257fb1d85aef28eb3;
    stim[35] = 94'h31671e93f300bb27cffa676b;
    stim[36] = 94'h3a69fc331a06fbea399f391c;
    stim[37] = 94'h26dab4b272964a0847146916;
    stim[38] = 94'h0121bed05c5a7a7e74538e5f;
    stim[39] = 94'h01468ab15373f8efda6810cc;
    stim[40] = 94'h38ab0fdeef3c88ba0f79442b;
    stim[41] = 94'h0251b468a3024dacf0928d0e;
    stim[42] = 94'h01e0df32bb32e9566d5898e9;
    stim[43] = 94'h38e328586e817ad9c9f8b3f8;
    stim[44] = 94'h31ba0bfb953616ad6d562a89;
    stim[45] = 94'h1e2d19101497c47c3e972949;
    stim[46] = 94'h32b7442a1d91e9c950edf7e9;
    stim[47] = 94'h1f99a8ed4386715eabc36936;
    stim[48] = 94'h2a5114d32efba3cb92bad4c0;
    stim[49] = 94'h2f7f6f047399224b7521d2e6;
    stim[50] = 94'h086ea979f6e58011c455c402;
    stim[51] = 94'h1da0ec174daf93b4ba8ebe1d;
    stim[52] = 94'h34435f34ec7ecee0b10b0f46;
    stim[53] = 94'h1ae618a01be12f1ab483d6c8;
    stim[54] = 94'h0d64bbf9acf0281de847324d;
    stim[55] = 94'h2cf9d0672b1de02b86d410f6;
    stim[56] = 94'h1fb7f1587303b33fa6e01872;
    stim[57] = 94'h20425b15b3d43e57f6dfd913;
    stim[58] = 94'h2d6a8172227d2842050c8420;
    stim[59] = 94'h3e19fcca66f02c89434e69c4;
    stim[60] = 94'h122245be41ae9591eecf3d56;
    stim[61] = 94'h02470c9a9546d832b97361a1;
    stim[62] = 94'h3511d76ae5f14475c2b10661;
    stim[63] = 94'h02a032480fc7088b0c8f3f0e;
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
      expv[0] = 41'hxxxxxx1246x;
      expv[1] = 41'hxxxxxxcb49x;
      expv[2] = 41'hxxxxxx25abx;
      expv[3] = 41'hxxxxxx6cf8x;
      expv[4] = 41'hxxxxxx4c3bx;
      expv[5] = 41'hxxxxxxfcccx;
      expv[6] = 41'hxxxxxxb678x;
      expv[7] = 41'hxxxxxxeedfx;
      expv[8] = 41'hxxxxxx3b56x;
      expv[9] = 41'hxxxxxxddffx;
      expv[10] = 41'hxxxxxxbd86x;
      expv[11] = 41'hxxxxxxcbd6x;
      expv[12] = 41'hxxxxxxf491x;
      expv[13] = 41'hxxxxxx439ax;
      expv[14] = 41'hxxxxxxb0dax;
      expv[15] = 41'hxxxxxx1d77x;
      expv[16] = 41'hxxxxxx6d5dx;
      expv[17] = 41'hxxxxxx5451x;
      expv[18] = 41'hxxxxxx1627x;
      expv[19] = 41'hxxxxxx8c8fx;
      expv[20] = 41'hxxxxxxf913x;
      expv[21] = 41'hxxxxxxf06bx;
      expv[22] = 41'hxxxxxx99d6x;
      expv[23] = 41'hxxxxxx3f89x;
      expv[24] = 41'hxxxxxx7440x;
      expv[25] = 41'hxxxxxxe53ex;
      expv[26] = 41'hxxxxxxe787x;
      expv[27] = 41'hxxxxxx591dx;
      expv[28] = 41'hxxxxxx1712x;
      expv[29] = 41'hxxxxxx18bfx;
      expv[30] = 41'hxxxxxx40a9x;
      expv[31] = 41'hxxxxxx216ex;
      expv[32] = 41'hxxxxxx2d4fx;
      expv[33] = 41'hxxxxxx7703x;
      expv[34] = 41'hxxxxxx04afx;
      expv[35] = 41'hxxxxxx27e6x;
      expv[36] = 41'hxxxxxx6634x;
      expv[37] = 41'hxxxxxx64e5x;
      expv[38] = 41'hxxxxxxa0b8x;
      expv[39] = 41'hxxxxxx62a6x;
      expv[40] = 41'hxxxxxxbddex;
      expv[41] = 41'hxxxxxxd146x;
      expv[42] = 41'hxxxxxx6576x;
      expv[43] = 41'hxxxxxxb0ddx;
      expv[44] = 41'hxxxxxxf72ax;
      expv[45] = 41'hxxxxxx2029x;
      expv[46] = 41'hxxxxxx543bx;
      expv[47] = 41'hxxxxxxda87x;
      expv[48] = 41'hxxxxxxa65dx;
      expv[49] = 41'hxxxxxx08e7x;
      expv[50] = 41'hxxxxxxf3edx;
      expv[51] = 41'hxxxxxx2e9bx;
      expv[52] = 41'hxxxxxx69d8x;
      expv[53] = 41'hxxxxxx4037x;
      expv[54] = 41'hxxxxxxf359x;
      expv[55] = 41'hxxxxxxce56x;
      expv[56] = 41'hxxxxxxb0e6x;
      expv[57] = 41'hxxxxxx2b67x;
      expv[58] = 41'hxxxxxxe444x;
      expv[59] = 41'hxxxxxx94cdx;
      expv[60] = 41'hxxxxxx7c83x;
      expv[61] = 41'hxxxxxx352ax;
      expv[62] = 41'hxxxxxxd5cbx;
      expv[63] = 41'hxxxxxx901fx;
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
