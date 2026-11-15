// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115880 dut (
    .clk(clk),
    .reset(in_vec[54:54]),
    .pRead(in_vec[53:53]),
    .pWrite(in_vec[52:52]),
    .addr(in_vec[51:50]),
    .pWriteData(in_vec[49:18]),
    .buttonL(in_vec[17:17]),
    .buttonR(in_vec[16:16]),
    .switch(in_vec[15:0]),
    .pReadData(out_vec[43:12]),
    .led(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h5c1c01a56816a2;
    stim[1] = 55'h473d779cb362da;
    stim[2] = 55'h3978c999427311;
    stim[3] = 55'h3b2b5835692379;
    stim[4] = 55'h2a92fab8eae190;
    stim[5] = 55'h317a6f6437ffbd;
    stim[6] = 55'h1cbee3a0ad3a37;
    stim[7] = 55'h02e452180ec06d;
    stim[8] = 55'h3e388e6446894e;
    stim[9] = 55'h039500d7724b50;
    stim[10] = 55'h3b41b50932e369;
    stim[11] = 55'h2696bf68a94809;
    stim[12] = 55'h194fd3f79ee579;
    stim[13] = 55'h1d6accf07d11a5;
    stim[14] = 55'h1493bd24f55fbd;
    stim[15] = 55'h1be24fcb351da9;
    stim[16] = 55'h3f4cb5d623b667;
    stim[17] = 55'h22d701884599fb;
    stim[18] = 55'h3b4f420b4e54f9;
    stim[19] = 55'h3902225af784a2;
    stim[20] = 55'h0f29d6feea231a;
    stim[21] = 55'h2265edaccd42d1;
    stim[22] = 55'h1ff1312b8477f0;
    stim[23] = 55'h2f0053815efdc0;
    stim[24] = 55'h022c990c016905;
    stim[25] = 55'h021e84339d41c4;
    stim[26] = 55'h01118475d909f5;
    stim[27] = 55'h3e29f7fbdaf9a8;
    stim[28] = 55'h1a9e691f373cbe;
    stim[29] = 55'h2006dc083eabed;
    stim[30] = 55'h0695c5660a84e5;
    stim[31] = 55'h1cd6d1d137ddad;
    stim[32] = 55'h210db1939aee49;
    stim[33] = 55'h1999f970c9c7fe;
    stim[34] = 55'h0c2c8c78bc8f83;
    stim[35] = 55'h06fba520a7fbdb;
    stim[36] = 55'h12510de13c2b6d;
    stim[37] = 55'h366df1caeda878;
    stim[38] = 55'h0749b51d250186;
    stim[39] = 55'h00c9520b0564aa;
    stim[40] = 55'h215101ef4df701;
    stim[41] = 55'h19d0aa1cd1ca09;
    stim[42] = 55'h346a270bb0d248;
    stim[43] = 55'h3722f3a6314112;
    stim[44] = 55'h39e6ec7a5c3e2e;
    stim[45] = 55'h315e80634a9fff;
    stim[46] = 55'h2be73f45e4de88;
    stim[47] = 55'h3f76105061e921;
    stim[48] = 55'h14d3b177fcdddf;
    stim[49] = 55'h36066cb8c0f635;
    stim[50] = 55'h34eacf643ac7f4;
    stim[51] = 55'h08c86c9171dd6e;
    stim[52] = 55'h11eb52d1176dc7;
    stim[53] = 55'h32b5694b1d8ef0;
    stim[54] = 55'h3324e92c962c5b;
    stim[55] = 55'h3de4ab97cb00c9;
    stim[56] = 55'h1219e6d6a1571f;
    stim[57] = 55'h484ba32e2d96a3;
    stim[58] = 55'h39fb5e3303c8a2;
    stim[59] = 55'h0f28f68b3601d9;
    stim[60] = 55'h286b322e2905dd;
    stim[61] = 55'h2a5a2d48b96319;
    stim[62] = 55'h027274940c16cb;
    stim[63] = 55'h03220de21f3bd3;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h00000000000;
      expv[3] = 44'h00000000000;
      expv[4] = 44'h00000000000;
      expv[5] = 44'h00000079000;
      expv[6] = 44'h00000003000;
      expv[7] = 44'h00000003000;
      expv[8] = 44'h00000003000;
      expv[9] = 44'h0000003a000;
      expv[10] = 44'h0000003a000;
      expv[11] = 44'h00000037000;
      expv[12] = 44'h00000000000;
      expv[13] = 44'h00000000000;
      expv[14] = 44'h00000000000;
      expv[15] = 44'h00000000000;
      expv[16] = 44'h00000000000;
      expv[17] = 44'h0000001d93d;
      expv[18] = 44'h0000000393d;
      expv[19] = 44'h000000fb93d;
      expv[20] = 44'h000000fb93d;
      expv[21] = 44'h000000fb93d;
      expv[22] = 44'h0000000393d;
      expv[23] = 44'h0000000393d;
      expv[24] = 44'h0000004293d;
      expv[25] = 44'h0000004293d;
      expv[26] = 44'h0000004293d;
      expv[27] = 44'h0000004293d;
      expv[28] = 44'h0000000993d;
      expv[29] = 44'h0000000993d;
      expv[30] = 44'h0000000393d;
      expv[31] = 44'h0000000393d;
      expv[32] = 44'h0000000393d;
      expv[33] = 44'h0000000393d;
      expv[34] = 44'h0000000393d;
      expv[35] = 44'h0000000393d;
      expv[36] = 44'h0000000393d;
      expv[37] = 44'h0000000393d;
      expv[38] = 44'h0000000093d;
      expv[39] = 44'h0000000093d;
      expv[40] = 44'h0000000093d;
      expv[41] = 44'h0000000293d;
      expv[42] = 44'h0000000293d;
      expv[43] = 44'h0000000093d;
      expv[44] = 44'h0000000093d;
      expv[45] = 44'h0000001293d;
      expv[46] = 44'h0000000298c;
      expv[47] = 44'h0000001298c;
      expv[48] = 44'h0000004198c;
      expv[49] = 44'h0000004198c;
      expv[50] = 44'h0000000098c;
      expv[51] = 44'h00000000e30;
      expv[52] = 44'h00000000e30;
      expv[53] = 44'h0000000090e;
      expv[54] = 44'h0000000390e;
      expv[55] = 44'h0000000390e;
      expv[56] = 44'h0000008e90e;
      expv[57] = 44'h00000000000;
      expv[58] = 44'h00000000000;
      expv[59] = 44'h00000000000;
      expv[60] = 44'h00000000000;
      expv[61] = 44'h000000a2000;
      expv[62] = 44'h000000dd000;
      expv[63] = 44'h000000dd000;
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
