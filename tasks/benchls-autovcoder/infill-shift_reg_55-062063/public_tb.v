// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062063 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h34eb2daea676a5;
    stim[1] = 55'h1aa5adf59ca15a;
    stim[2] = 55'h57be7c8a500301;
    stim[3] = 55'h6698e678b2ee22;
    stim[4] = 55'h32d1ee7737d655;
    stim[5] = 55'h2f654bec8b1dfd;
    stim[6] = 55'h099f7f4319d812;
    stim[7] = 55'h2afd4e3f080f39;
    stim[8] = 55'h369faf3bf26209;
    stim[9] = 55'h35853a7445fa12;
    stim[10] = 55'h1494faf0937827;
    stim[11] = 55'h32fdff4930a5b3;
    stim[12] = 55'h0aae9ad12c28ac;
    stim[13] = 55'h1c46b32d46f088;
    stim[14] = 55'h51bc7b2bd71352;
    stim[15] = 55'h288a828086a766;
    stim[16] = 55'h09d9523444faa2;
    stim[17] = 55'h0f28647d17f66b;
    stim[18] = 55'h32a2b71bab5325;
    stim[19] = 55'h62b6d356e46b25;
    stim[20] = 55'h1e4330cf7e1a1c;
    stim[21] = 55'h0e28a223a8eac8;
    stim[22] = 55'h2f786ab154f586;
    stim[23] = 55'h155177ae0925b7;
    stim[24] = 55'h74272022682493;
    stim[25] = 55'h31fc363f1ac4de;
    stim[26] = 55'h33c53d4620fb55;
    stim[27] = 55'h54708e719e9c61;
    stim[28] = 55'h11d438293d5e3e;
    stim[29] = 55'h76d7d78eead8f3;
    stim[30] = 55'h73daca1677b61d;
    stim[31] = 55'h772537924c1e87;
    stim[32] = 55'h03e6da270e0d65;
    stim[33] = 55'h07ecff764e1461;
    stim[34] = 55'h21f923a8bc7209;
    stim[35] = 55'h377992511dbc83;
    stim[36] = 55'h1887d126f68105;
    stim[37] = 55'h0d48dec5ce2978;
    stim[38] = 55'h77002cbc44ed2d;
    stim[39] = 55'h7769749af49d73;
    stim[40] = 55'h7dbac76b01c0a6;
    stim[41] = 55'h3bf940bdbb237b;
    stim[42] = 55'h32d94a5cf694fd;
    stim[43] = 55'h1ffd724b9c7cbf;
    stim[44] = 55'h27b1dc97a8f877;
    stim[45] = 55'h43d217ecbbf6ba;
    stim[46] = 55'h449c59a4ee9147;
    stim[47] = 55'h7ac3b6b93ddcc8;
    stim[48] = 55'h18cae3a9c5414a;
    stim[49] = 55'h0b52aa3719d001;
    stim[50] = 55'h5cac47a2e209fe;
    stim[51] = 55'h68579998a7d477;
    stim[52] = 55'h46fa2c8ba83592;
    stim[53] = 55'h29d192fe03a02b;
    stim[54] = 55'h2ff920be689e27;
    stim[55] = 55'h3cd76e0a5768df;
    stim[56] = 55'h5efd211cda93ab;
    stim[57] = 55'h51902a2edae2b9;
    stim[58] = 55'h168cf82f9e5681;
    stim[59] = 55'h63cb7857eba4a6;
    stim[60] = 55'h1646536d1944c4;
    stim[61] = 55'h2a0758320f62d7;
    stim[62] = 55'h4ba33136f6a722;
    stim[63] = 55'h08bae58478042e;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h34eb2daea676a5;
      expv[2] = 55'h1aa5adf59ca15a;
      expv[3] = 55'h57be7c8a500301;
      expv[4] = 55'h6698e678b2ee22;
      expv[5] = 55'h32d1ee7737d655;
      expv[6] = 55'h2f654bec8b1dfd;
      expv[7] = 55'h099f7f4319d812;
      expv[8] = 55'h2afd4e3f080f39;
      expv[9] = 55'h369faf3bf26209;
      expv[10] = 55'h35853a7445fa12;
      expv[11] = 55'h1494faf0937827;
      expv[12] = 55'h32fdff4930a5b3;
      expv[13] = 55'h0aae9ad12c28ac;
      expv[14] = 55'h1c46b32d46f088;
      expv[15] = 55'h51bc7b2bd71352;
      expv[16] = 55'h288a828086a766;
      expv[17] = 55'h09d9523444faa2;
      expv[18] = 55'h0f28647d17f66b;
      expv[19] = 55'h32a2b71bab5325;
      expv[20] = 55'h62b6d356e46b25;
      expv[21] = 55'h1e4330cf7e1a1c;
      expv[22] = 55'h0e28a223a8eac8;
      expv[23] = 55'h2f786ab154f586;
      expv[24] = 55'h155177ae0925b7;
      expv[25] = 55'h74272022682493;
      expv[26] = 55'h31fc363f1ac4de;
      expv[27] = 55'h33c53d4620fb55;
      expv[28] = 55'h54708e719e9c61;
      expv[29] = 55'h11d438293d5e3e;
      expv[30] = 55'h76d7d78eead8f3;
      expv[31] = 55'h73daca1677b61d;
      expv[32] = 55'h772537924c1e87;
      expv[33] = 55'h03e6da270e0d65;
      expv[34] = 55'h07ecff764e1461;
      expv[35] = 55'h21f923a8bc7209;
      expv[36] = 55'h377992511dbc83;
      expv[37] = 55'h1887d126f68105;
      expv[38] = 55'h0d48dec5ce2978;
      expv[39] = 55'h77002cbc44ed2d;
      expv[40] = 55'h7769749af49d73;
      expv[41] = 55'h7dbac76b01c0a6;
      expv[42] = 55'h3bf940bdbb237b;
      expv[43] = 55'h32d94a5cf694fd;
      expv[44] = 55'h1ffd724b9c7cbf;
      expv[45] = 55'h27b1dc97a8f877;
      expv[46] = 55'h43d217ecbbf6ba;
      expv[47] = 55'h449c59a4ee9147;
      expv[48] = 55'h7ac3b6b93ddcc8;
      expv[49] = 55'h18cae3a9c5414a;
      expv[50] = 55'h0b52aa3719d001;
      expv[51] = 55'h5cac47a2e209fe;
      expv[52] = 55'h68579998a7d477;
      expv[53] = 55'h46fa2c8ba83592;
      expv[54] = 55'h29d192fe03a02b;
      expv[55] = 55'h2ff920be689e27;
      expv[56] = 55'h3cd76e0a5768df;
      expv[57] = 55'h5efd211cda93ab;
      expv[58] = 55'h51902a2edae2b9;
      expv[59] = 55'h168cf82f9e5681;
      expv[60] = 55'h63cb7857eba4a6;
      expv[61] = 55'h1646536d1944c4;
      expv[62] = 55'h2a0758320f62d7;
      expv[63] = 55'h4ba33136f6a722;
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
