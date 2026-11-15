// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093137 dut (
    .iRegToiDec(in_vec[18:3]),
    .nsel(in_vec[2:0]),
    .opcode(out_vec[49:47]),
    .op(out_vec[46:45]),
    .ALUop(out_vec[44:43]),
    .sximm5(out_vec[42:27]),
    .sximm8(out_vec[26:11]),
    .shift(out_vec[10:9]),
    .readnum(out_vec[8:6]),
    .writenum(out_vec[5:3]),
    .b_cond(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h50059;
    stim[1] = 19'h71b74;
    stim[2] = 19'h0ceca;
    stim[3] = 19'h6f10a;
    stim[4] = 19'h6e761;
    stim[5] = 19'h3f88a;
    stim[6] = 19'h05cb0;
    stim[7] = 19'h4786b;
    stim[8] = 19'h3519a;
    stim[9] = 19'h04ca3;
    stim[10] = 19'h5ef25;
    stim[11] = 19'h5bef2;
    stim[12] = 19'h0bf97;
    stim[13] = 19'h24d90;
    stim[14] = 19'h46119;
    stim[15] = 19'h78707;
    stim[16] = 19'h4d79b;
    stim[17] = 19'h3bbad;
    stim[18] = 19'h420b8;
    stim[19] = 19'h11b78;
    stim[20] = 19'h1a9a4;
    stim[21] = 19'h65f61;
    stim[22] = 19'h3ac4e;
    stim[23] = 19'h0a70e;
    stim[24] = 19'h7f7c5;
    stim[25] = 19'h3acc2;
    stim[26] = 19'h46b0e;
    stim[27] = 19'h5c752;
    stim[28] = 19'h45517;
    stim[29] = 19'h11c71;
    stim[30] = 19'h01d10;
    stim[31] = 19'h7df1d;
    stim[32] = 19'h249f7;
    stim[33] = 19'h1699d;
    stim[34] = 19'h511a9;
    stim[35] = 19'h74b44;
    stim[36] = 19'h28f34;
    stim[37] = 19'h412ea;
    stim[38] = 19'h61382;
    stim[39] = 19'h236b5;
    stim[40] = 19'h19e5f;
    stim[41] = 19'h0627b;
    stim[42] = 19'h574d7;
    stim[43] = 19'h44039;
    stim[44] = 19'h68c74;
    stim[45] = 19'h7528f;
    stim[46] = 19'h40775;
    stim[47] = 19'h653a3;
    stim[48] = 19'h5850f;
    stim[49] = 19'h58f98;
    stim[50] = 19'h4436f;
    stim[51] = 19'h11439;
    stim[52] = 19'h489ba;
    stim[53] = 19'h66c19;
    stim[54] = 19'h4b285;
    stim[55] = 19'h6f7fb;
    stim[56] = 19'h2f397;
    stim[57] = 19'h1cfc5;
    stim[58] = 19'h5a3e3;
    stim[59] = 19'h1365e;
    stim[60] = 19'h795f3;
    stim[61] = 19'h715b9;
    stim[62] = 19'h513ea;
    stim[63] = 19'h2af73;
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
      expv[0] = 50'h2800058005ad8;
      expv[1] = 50'h38000700372db;
      expv[2] = 50'h07fffcffecfb1;
      expv[3] = 50'h378000801084e;
      expv[4] = 50'h3780067ff6324;
      expv[5] = 50'h1ffff88008c07;
      expv[6] = 50'h02fffb7fcbxxx;
      expv[7] = 50'h2280068006xxx;
      expv[8] = 50'h1afff98019c4a;
      expv[9] = 50'h02fffa7fcaxxx;
      expv[10] = 50'h2f80027ff2xxx;
      expv[11] = 50'h2d7fff7fef7b7;
      expv[12] = 50'h057ff97ff9xxx;
      expv[13] = 50'h12fff97fd9xxx;
      expv[14] = 50'h22800180118dc;
      expv[15] = 50'h3d00007ff0xxx;
      expv[16] = 50'h27fff9fff9xxx;
      expv[17] = 50'h1d7ffa803axxx;
      expv[18] = 50'h207ffb800bxxx;
      expv[19] = 50'h0800078037xxx;
      expv[20] = 50'h0d7ffa001a56d;
      expv[21] = 50'h3280067ff6323;
      expv[22] = 50'h1d0004ffc4xxx;
      expv[23] = 50'h050000fff0xxx;
      expv[24] = 50'h3ffffc7ffcxxx;
      expv[25] = 50'h1d7ffc7fcc725;
      expv[26] = 50'h2280008030xxx;
      expv[27] = 50'h2f80057ff53f8;
      expv[28] = 50'h2280017fd1xxx;
      expv[29] = 50'h0800077fc73b3;
      expv[30] = 50'h0000017fd1xxx;
      expv[31] = 50'h3f8001fff1xxx;
      expv[32] = 50'h12ffff001fxxx;
      expv[33] = 50'h0afff98019xxx;
      expv[34] = 50'h287ffa801ad6a;
      expv[35] = 50'h3a80040034249;
      expv[36] = 50'h1500037ff3049;
      expv[37] = 50'h207ffe802ee92;
      expv[38] = 50'h307ff800384da;
      expv[39] = 50'h107ffb7febxxx;
      expv[40] = 50'h0d0005ffe5xxx;
      expv[41] = 50'h0280078027xxx;
      expv[42] = 50'h2afffd7fcdxxx;
      expv[43] = 50'h22800380039f8;
      expv[44] = 50'h3500077fc7249;
      expv[45] = 50'h3afff88028xxx;
      expv[46] = 50'h2000077ff7xxx;
      expv[47] = 50'h32fffa003axxx;
      expv[48] = 50'h2d0000ffd0xxx;
      expv[49] = 50'h2d7ff9fff9xxx;
      expv[50] = 50'h2280068036xxx;
      expv[51] = 50'h080003ffc39fa;
      expv[52] = 50'h257ffb801bc49;
      expv[53] = 50'h328001ffc18dd;
      expv[54] = 50'h257ff80028xxx;
      expv[55] = 50'h37ffffffffxxx;
      expv[56] = 50'h17fff90039xxx;
      expv[57] = 50'h0ffffc7ffcxxx;
      expv[58] = 50'h2d7ffe003exxx;
      expv[59] = 50'h080005ffe5xxx;
      expv[60] = 50'h3d7fff7fdfxxx;
      expv[61] = 50'h387ffbffdbdfa;
      expv[62] = 50'h287ffe803eeda;
      expv[63] = 50'h1500077ff7xxx;
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
