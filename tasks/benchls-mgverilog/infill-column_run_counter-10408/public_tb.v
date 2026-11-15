// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10408 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .push_in(in_vec[32:32]),
    .in_col_index(in_vec[31:0]),
    .push_out(out_vec[37:37]),
    .out_col_index(out_vec[36:5]),
    .out_count(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h23e94b9c7;
    stim[1] = 34'h28487c623;
    stim[2] = 34'h0acdd2020;
    stim[3] = 34'h0cd23b9ef;
    stim[4] = 34'h0dc32352b;
    stim[5] = 34'h01b4c6de7;
    stim[6] = 34'h0fe051f2a;
    stim[7] = 34'h10dc17e1c;
    stim[8] = 34'h109bf3b0f;
    stim[9] = 34'h1fefa51e2;
    stim[10] = 34'h1bd4db205;
    stim[11] = 34'h110fa4d86;
    stim[12] = 34'h0e6bb7579;
    stim[13] = 34'h1b0918994;
    stim[14] = 34'h0fb9a41c9;
    stim[15] = 34'h1677bb8a8;
    stim[16] = 34'h01a53153e;
    stim[17] = 34'h157d36864;
    stim[18] = 34'h0cd505bc4;
    stim[19] = 34'h0207a6332;
    stim[20] = 34'h05afe09fc;
    stim[21] = 34'h1620fc019;
    stim[22] = 34'h095fd7ddd;
    stim[23] = 34'h17a5e46c3;
    stim[24] = 34'h103d79735;
    stim[25] = 34'h040cef977;
    stim[26] = 34'h10bbfbb93;
    stim[27] = 34'h1c132af43;
    stim[28] = 34'h022979b1d;
    stim[29] = 34'h1d8182e8a;
    stim[30] = 34'h15ec57b4f;
    stim[31] = 34'h179795914;
    stim[32] = 34'h0565ecfc2;
    stim[33] = 34'h1d6395d6f;
    stim[34] = 34'h1c0309b34;
    stim[35] = 34'h0d34a7708;
    stim[36] = 34'h072867ec3;
    stim[37] = 34'h1cc4a6c39;
    stim[38] = 34'h15c913160;
    stim[39] = 34'h165a0e52d;
    stim[40] = 34'h10397643b;
    stim[41] = 34'h1822b82cf;
    stim[42] = 34'h160595739;
    stim[43] = 34'h1bb0f13e9;
    stim[44] = 34'h1e85ff87e;
    stim[45] = 34'h15c0a9c2d;
    stim[46] = 34'h1cc332923;
    stim[47] = 34'h0c47ae454;
    stim[48] = 34'h166e1e075;
    stim[49] = 34'h0173290f9;
    stim[50] = 34'h063b0e9b8;
    stim[51] = 34'h1668a995a;
    stim[52] = 34'h05ee5cd8e;
    stim[53] = 34'h0e15efd0e;
    stim[54] = 34'h09e46c86b;
    stim[55] = 34'h0a4c6de08;
    stim[56] = 34'h140f336a7;
    stim[57] = 34'h0d6adf07d;
    stim[58] = 34'h02b4d24d7;
    stim[59] = 34'h07e9c0420;
    stim[60] = 34'h1387714b4;
    stim[61] = 34'h0e08ea7d3;
    stim[62] = 34'h1805a7b5e;
    stim[63] = 34'h0d40ef386;
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
      expv[0] = 38'hxxxxxxxxxx;
      expv[1] = 38'hxxxxxxxxxx;
      expv[2] = 38'hxxxxxxxxxx;
      expv[3] = 38'hxxxxxxxxxx;
      expv[4] = 38'hxxxxxxxxxx;
      expv[5] = 38'hxxxxxxxxxx;
      expv[6] = 38'hxxxxxxxxxx;
      expv[7] = 38'hxxxxxxxxxx;
      expv[8] = 38'hxxxxxxxxxx;
      expv[9] = 38'h21b82fc380;
      expv[10] = 38'h2137e761e0;
      expv[11] = 38'h3fdf4a3c40;
      expv[12] = 38'h37a9b640a0;
      expv[13] = 38'h17a9b640a0;
      expv[14] = 38'h221f49b0c0;
      expv[15] = 38'h021f49b0c0;
      expv[16] = 38'h3612313280;
      expv[17] = 38'h1612313280;
      expv[18] = 38'h2cef771500;
      expv[19] = 38'h0cef771500;
      expv[20] = 38'h0cef771500;
      expv[21] = 38'h0cef771500;
      expv[22] = 38'h2afa6d0c80;
      expv[23] = 38'h0afa6d0c80;
      expv[24] = 38'h2c41f80320;
      expv[25] = 38'h2f4bc8d860;
      expv[26] = 38'h0f4bc8d860;
      expv[27] = 38'h207af2e6a0;
      expv[28] = 38'h2177f77260;
      expv[29] = 38'h0177f77260;
      expv[30] = 38'h382655e860;
      expv[31] = 38'h3b0305d140;
      expv[32] = 38'h2bd8af69e0;
      expv[33] = 38'h0bd8af69e0;
      expv[34] = 38'h2f2f2b2280;
      expv[35] = 38'h3ac72bade0;
      expv[36] = 38'h1ac72bade0;
      expv[37] = 38'h1ac72bade0;
      expv[38] = 38'h3806136680;
      expv[39] = 38'h39894d8720;
      expv[40] = 38'h2b92262c00;
      expv[41] = 38'h2cb41ca5a0;
      expv[42] = 38'h2072ec8760;
      expv[43] = 38'h30457059e0;
      expv[44] = 38'h2c0b2ae720;
      expv[45] = 38'h3761e27d20;
      expv[46] = 38'h3d0bff0fc0;
      expv[47] = 38'h2b815385a0;
      expv[48] = 38'h0b815385a0;
      expv[49] = 38'h3986652460;
      expv[50] = 38'h1986652460;
      expv[51] = 38'h1986652460;
      expv[52] = 38'h2cdc3c0ea0;
      expv[53] = 38'h0cdc3c0ea0;
      expv[54] = 38'h0cdc3c0ea0;
      expv[55] = 38'h0cdc3c0ea0;
      expv[56] = 38'h0cdc3c0ea0;
      expv[57] = 38'h2cd1532b40;
      expv[58] = 38'h0cd1532b40;
      expv[59] = 38'h0cd1532b40;
      expv[60] = 38'h0cd1532b40;
      expv[61] = 38'h281e66d4e0;
      expv[62] = 38'h081e66d4e0;
      expv[63] = 38'h270ee29680;
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
