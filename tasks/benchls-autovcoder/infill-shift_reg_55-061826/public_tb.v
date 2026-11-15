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

  autovcoder_061826 dut (
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
    stim[0] = 55'h5eafb3dedd0c62;
    stim[1] = 55'h6e6242ee0b8e83;
    stim[2] = 55'h3adae0321791d8;
    stim[3] = 55'h48ab55e89a78a8;
    stim[4] = 55'h37f92d0815cc28;
    stim[5] = 55'h4740d8207b09c7;
    stim[6] = 55'h62c3449dbd5e69;
    stim[7] = 55'h08ad8d1cf08b95;
    stim[8] = 55'h085f24475364c8;
    stim[9] = 55'h1884a61c030761;
    stim[10] = 55'h47e510a1643966;
    stim[11] = 55'h10688ecfa894be;
    stim[12] = 55'h564446bc170585;
    stim[13] = 55'h3ecb7b55f8d067;
    stim[14] = 55'h56daa7cff398fc;
    stim[15] = 55'h7295d9a0cb4273;
    stim[16] = 55'h375e4f5a47de0a;
    stim[17] = 55'h747faeacb310d9;
    stim[18] = 55'h54378859928567;
    stim[19] = 55'h5f2123b901f98b;
    stim[20] = 55'h69badef986acd8;
    stim[21] = 55'h1168844c755d93;
    stim[22] = 55'h2f083251b4c0ee;
    stim[23] = 55'h58d02336ff3cd9;
    stim[24] = 55'h7e9880825aea0a;
    stim[25] = 55'h0950b4e08cdce8;
    stim[26] = 55'h6e4b071344fcc8;
    stim[27] = 55'h01531f356de73a;
    stim[28] = 55'h578303be05bc93;
    stim[29] = 55'h0a276edcdc9430;
    stim[30] = 55'h78483f795c1607;
    stim[31] = 55'h49c5b1f2a267b7;
    stim[32] = 55'h47fff30cf8931f;
    stim[33] = 55'h083f4d9129ce35;
    stim[34] = 55'h226cf03d97d121;
    stim[35] = 55'h74dc1f5986791a;
    stim[36] = 55'h1637f77cf1740f;
    stim[37] = 55'h67e24d8b7ba8a8;
    stim[38] = 55'h262156ed112654;
    stim[39] = 55'h30db60468fccb6;
    stim[40] = 55'h2d875a13318d1c;
    stim[41] = 55'h3b7cd55be79f23;
    stim[42] = 55'h3c950facac2baf;
    stim[43] = 55'h74f867d182764b;
    stim[44] = 55'h67947d63aa6b97;
    stim[45] = 55'h1cd01760dd774d;
    stim[46] = 55'h68e2b76fef84bb;
    stim[47] = 55'h168b86f1dd9598;
    stim[48] = 55'h1eb0f678abab02;
    stim[49] = 55'h6a6d11768d22ae;
    stim[50] = 55'h658e78d65f5e81;
    stim[51] = 55'h430b322ac02bac;
    stim[52] = 55'h00d186a29e50e5;
    stim[53] = 55'h6168624da36701;
    stim[54] = 55'h415b3744d71a02;
    stim[55] = 55'h119b9ec0cda80c;
    stim[56] = 55'h7429d405183b9a;
    stim[57] = 55'h588b33fbccf53e;
    stim[58] = 55'h2e01fbaa67a079;
    stim[59] = 55'h21b02096a35693;
    stim[60] = 55'h1c64e2179a0e0a;
    stim[61] = 55'h37bbc3058ba456;
    stim[62] = 55'h09680aaf0ee505;
    stim[63] = 55'h73b0e59dc97c76;
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
      expv[1] = 55'h5eafb3dedd0c62;
      expv[2] = 55'h6e6242ee0b8e83;
      expv[3] = 55'h3adae0321791d8;
      expv[4] = 55'h48ab55e89a78a8;
      expv[5] = 55'h37f92d0815cc28;
      expv[6] = 55'h4740d8207b09c7;
      expv[7] = 55'h62c3449dbd5e69;
      expv[8] = 55'h08ad8d1cf08b95;
      expv[9] = 55'h085f24475364c8;
      expv[10] = 55'h1884a61c030761;
      expv[11] = 55'h47e510a1643966;
      expv[12] = 55'h10688ecfa894be;
      expv[13] = 55'h564446bc170585;
      expv[14] = 55'h3ecb7b55f8d067;
      expv[15] = 55'h56daa7cff398fc;
      expv[16] = 55'h7295d9a0cb4273;
      expv[17] = 55'h375e4f5a47de0a;
      expv[18] = 55'h747faeacb310d9;
      expv[19] = 55'h54378859928567;
      expv[20] = 55'h5f2123b901f98b;
      expv[21] = 55'h69badef986acd8;
      expv[22] = 55'h1168844c755d93;
      expv[23] = 55'h2f083251b4c0ee;
      expv[24] = 55'h58d02336ff3cd9;
      expv[25] = 55'h7e9880825aea0a;
      expv[26] = 55'h0950b4e08cdce8;
      expv[27] = 55'h6e4b071344fcc8;
      expv[28] = 55'h01531f356de73a;
      expv[29] = 55'h578303be05bc93;
      expv[30] = 55'h0a276edcdc9430;
      expv[31] = 55'h78483f795c1607;
      expv[32] = 55'h49c5b1f2a267b7;
      expv[33] = 55'h47fff30cf8931f;
      expv[34] = 55'h083f4d9129ce35;
      expv[35] = 55'h226cf03d97d121;
      expv[36] = 55'h74dc1f5986791a;
      expv[37] = 55'h1637f77cf1740f;
      expv[38] = 55'h67e24d8b7ba8a8;
      expv[39] = 55'h262156ed112654;
      expv[40] = 55'h30db60468fccb6;
      expv[41] = 55'h2d875a13318d1c;
      expv[42] = 55'h3b7cd55be79f23;
      expv[43] = 55'h3c950facac2baf;
      expv[44] = 55'h74f867d182764b;
      expv[45] = 55'h67947d63aa6b97;
      expv[46] = 55'h1cd01760dd774d;
      expv[47] = 55'h68e2b76fef84bb;
      expv[48] = 55'h168b86f1dd9598;
      expv[49] = 55'h1eb0f678abab02;
      expv[50] = 55'h6a6d11768d22ae;
      expv[51] = 55'h658e78d65f5e81;
      expv[52] = 55'h430b322ac02bac;
      expv[53] = 55'h00d186a29e50e5;
      expv[54] = 55'h6168624da36701;
      expv[55] = 55'h415b3744d71a02;
      expv[56] = 55'h119b9ec0cda80c;
      expv[57] = 55'h7429d405183b9a;
      expv[58] = 55'h588b33fbccf53e;
      expv[59] = 55'h2e01fbaa67a079;
      expv[60] = 55'h21b02096a35693;
      expv[61] = 55'h1c64e2179a0e0a;
      expv[62] = 55'h37bbc3058ba456;
      expv[63] = 55'h09680aaf0ee505;
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
