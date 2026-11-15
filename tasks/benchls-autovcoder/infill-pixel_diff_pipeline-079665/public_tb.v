// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079665 dut (
    .clk(clk),
    .pixel_in(in_vec[26:15]),
    .predic_in(in_vec[14:3]),
    .end_in(in_vec[2:2]),
    .rst(in_vec[1:1]),
    .valid_in(in_vec[0:0]),
    .val_out(out_vec[27:15]),
    .val_out$1(out_vec[14:2]),
    .valid_out(out_vec[1:1]),
    .end_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h50d2c3e;
    stim[1] = 27'h2c6f736;
    stim[2] = 27'h7139bf9;
    stim[3] = 27'h451c0cc;
    stim[4] = 27'h420a6a8;
    stim[5] = 27'h0998729;
    stim[6] = 27'h414c864;
    stim[7] = 27'h782c8ac;
    stim[8] = 27'h1927c99;
    stim[9] = 27'h3e11fe0;
    stim[10] = 27'h722fdcd;
    stim[11] = 27'h45fe0e4;
    stim[12] = 27'h39f1611;
    stim[13] = 27'h4383200;
    stim[14] = 27'h64d2298;
    stim[15] = 27'h1660969;
    stim[16] = 27'h7ea83ac;
    stim[17] = 27'h38dc978;
    stim[18] = 27'h087f1f5;
    stim[19] = 27'h0db91e5;
    stim[20] = 27'h3fd9410;
    stim[21] = 27'h44de1e4;
    stim[22] = 27'h068a7e4;
    stim[23] = 27'h6b5a540;
    stim[24] = 27'h6930ba1;
    stim[25] = 27'h39672e1;
    stim[26] = 27'h5218a81;
    stim[27] = 27'h6fc72b0;
    stim[28] = 27'h6d4db29;
    stim[29] = 27'h2c8d044;
    stim[30] = 27'h57d11d0;
    stim[31] = 27'h02dee78;
    stim[32] = 27'h09dd288;
    stim[33] = 27'h48399b5;
    stim[34] = 27'h49644f1;
    stim[35] = 27'h60de8ec;
    stim[36] = 27'h04f9c71;
    stim[37] = 27'h4b71880;
    stim[38] = 27'h07a1460;
    stim[39] = 27'h1fff7bd;
    stim[40] = 27'h6aa0461;
    stim[41] = 27'h387c615;
    stim[42] = 27'h1832ee1;
    stim[43] = 27'h4d9b945;
    stim[44] = 27'h2d80a10;
    stim[45] = 27'h6d7968c;
    stim[46] = 27'h0943005;
    stim[47] = 27'h54efbd4;
    stim[48] = 27'h668f8d1;
    stim[49] = 27'h3dbb38c;
    stim[50] = 27'h763fce4;
    stim[51] = 27'h4815564;
    stim[52] = 27'h5f4bf08;
    stim[53] = 27'h5b62f01;
    stim[54] = 27'h31553e0;
    stim[55] = 27'h7e7c760;
    stim[56] = 27'h54c00f5;
    stim[57] = 27'h6f923fc;
    stim[58] = 27'h2440de4;
    stim[59] = 27'h7f0bb34;
    stim[60] = 27'h3e9a3ec;
    stim[61] = 27'h34a0a25;
    stim[62] = 27'h7d3bb90;
    stim[63] = 27'h5cd3249;
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
      expv[0] = 28'h0000000;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h5542a9e;
      expv[4] = 28'h5542a9d;
      expv[5] = 28'h5542a9c;
      expv[6] = 28'h0270136;
      expv[7] = 28'h0270135;
      expv[8] = 28'h0270135;
      expv[9] = 28'h9c8ce42;
      expv[10] = 28'h9c8ce40;
      expv[11] = 28'hf467a2f;
      expv[12] = 28'hf467a2d;
      expv[13] = 28'h23e11ee;
      expv[14] = 28'h23e11ec;
      expv[15] = 28'h23e11ec;
      expv[16] = 28'h0cf867a;
      expv[17] = 28'h0cf8679;
      expv[18] = 28'h0cf8678;
      expv[19] = 28'h968cb43;
      expv[20] = 28'hfbdfdeb;
      expv[21] = 28'hfbdfde8;
      expv[22] = 28'hfbdfde9;
      expv[23] = 28'hfbdfde9;
      expv[24] = 28'hfbdfde8;
      expv[25] = 28'h5d92ec6;
      expv[26] = 28'hc68633e;
      expv[27] = 28'h479a3ca;
      expv[28] = 28'h479a3c8;
      expv[29] = 28'h122090e;
      expv[30] = 28'h122090d;
      expv[31] = 28'h122090c;
      expv[32] = 28'h122090c;
      expv[33] = 28'h122090c;
      expv[34] = 28'h2e89743;
      expv[35] = 28'h0470236;
      expv[36] = 28'h0470235;
      expv[37] = 28'he88f442;
      expv[38] = 28'he88f440;
      expv[39] = 28'he88f440;
      expv[40] = 28'ha84541f;
      expv[41] = 28'h664331e;
      expv[42] = 28'hf26f933;
      expv[43] = 28'he9574a6;
      expv[44] = 28'h1458a2b;
      expv[45] = 28'h1458a28;
      expv[46] = 28'h1458a29;
      expv[47] = 28'hd946c9f;
      expv[48] = 28'hd946c9d;
      expv[49] = 28'hedbf6da;
      expv[50] = 28'hedbf6d9;
      expv[51] = 28'hedbf6d9;
      expv[52] = 28'hedbf6d9;
      expv[53] = 28'hedbf6d8;
      expv[54] = 28'h2c6162e;
      expv[55] = 28'h2c6162c;
      expv[56] = 28'h2c6162c;
      expv[57] = 28'h53d29e7;
      expv[58] = 28'h53d29e5;
      expv[59] = 28'h53d29e5;
      expv[60] = 28'h53d29e5;
      expv[61] = 28'h53d29e5;
      expv[62] = 28'h2a8153f;
      expv[63] = 28'h2a8153c;
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
