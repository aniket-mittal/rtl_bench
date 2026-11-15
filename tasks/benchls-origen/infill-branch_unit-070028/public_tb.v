// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_070028 dut (
    .opcode(in_vec[45:43]),
    .fcode(in_vec[42:39]),
    .label(in_vec[38:14]),
    .carryFlag(in_vec[13:13]),
    .zFlag(in_vec[12:12]),
    .overflowFlag(in_vec[11:11]),
    .signFlag(in_vec[10:10]),
    .PC(in_vec[9:0]),
    .exNPC(out_vec[42:33]),
    .PCSrc(out_vec[32:32]),
    .ra(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h0d30c247f4d9;
    stim[1] = 46'h2582596238a3;
    stim[2] = 46'h192c4966ee86;
    stim[3] = 46'h0e2935e85f02;
    stim[4] = 46'h11b24f6db5a0;
    stim[5] = 46'h1a0e778aa1d5;
    stim[6] = 46'h2c88fc693b31;
    stim[7] = 46'h2d4c27192713;
    stim[8] = 46'h06c169ac1e18;
    stim[9] = 46'h1910b324c448;
    stim[10] = 46'h21c122da9c16;
    stim[11] = 46'h035e6ff36ba4;
    stim[12] = 46'h26a4dbafc87e;
    stim[13] = 46'h3c9905018072;
    stim[14] = 46'h223675fecb3a;
    stim[15] = 46'h00222fd4195a;
    stim[16] = 46'h266f6bcb8def;
    stim[17] = 46'h2927729ce41f;
    stim[18] = 46'h32f41a96cfd9;
    stim[19] = 46'h11d97eab55f6;
    stim[20] = 46'h0932dec806a1;
    stim[21] = 46'h0be416dd33ba;
    stim[22] = 46'h34787fded7cb;
    stim[23] = 46'h2bf44ab7daf6;
    stim[24] = 46'h150af4a1c1f5;
    stim[25] = 46'h26ac2089e1fb;
    stim[26] = 46'h1e024d9fa9cb;
    stim[27] = 46'h2e81d4d01e39;
    stim[28] = 46'h33ce33ddf2a9;
    stim[29] = 46'h178fe212bd27;
    stim[30] = 46'h3ad02f2caa14;
    stim[31] = 46'h01c36d37cc6b;
    stim[32] = 46'h02e90e1b8f6c;
    stim[33] = 46'h2ad6a3266041;
    stim[34] = 46'h062ec0f815a8;
    stim[35] = 46'h3a4a3b1058c6;
    stim[36] = 46'h0735585ffa40;
    stim[37] = 46'h29b2f5fb1f88;
    stim[38] = 46'h3e7347273cfc;
    stim[39] = 46'h279734cc788d;
    stim[40] = 46'h2a7f838e2c88;
    stim[41] = 46'h1b9e09ad93d9;
    stim[42] = 46'h08b582d2250a;
    stim[43] = 46'h1adbc6105f9e;
    stim[44] = 46'h10c39c2daa18;
    stim[45] = 46'h06d106b6610a;
    stim[46] = 46'h16f9b925bdc2;
    stim[47] = 46'h2ce6ee43bda9;
    stim[48] = 46'h2d8ddd27a581;
    stim[49] = 46'h0314771d6beb;
    stim[50] = 46'h104a13c83598;
    stim[51] = 46'h2e42bb2029a6;
    stim[52] = 46'h2d0e0c2473e3;
    stim[53] = 46'h16b1f5824885;
    stim[54] = 46'h33f36b74f7f1;
    stim[55] = 46'h0edd9729c4e0;
    stim[56] = 46'h3098dc35db7d;
    stim[57] = 46'h3aa6fdac70e8;
    stim[58] = 46'h377c6ef9a37d;
    stim[59] = 46'h198ef9fe1959;
    stim[60] = 46'h2dd25af439eb;
    stim[61] = 46'h286dd01a3c1a;
    stim[62] = 46'h334c4e9bea14;
    stim[63] = 46'h3579b41ee986;
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
      expv[0] = 43'h00000000000;
      expv[1] = 43'h31100000000;
      expv[2] = 43'h33700000000;
      expv[3] = 43'h00000000000;
      expv[4] = 43'h00000000000;
      expv[5] = 43'h00000000000;
      expv[6] = 43'h00000000000;
      expv[7] = 43'h00000000000;
      expv[8] = 43'h00000000000;
      expv[9] = 43'h12700000000;
      expv[10] = 43'h6d500000000;
      expv[11] = 43'h00000000000;
      expv[12] = 43'h57f00000000;
      expv[13] = 43'h00000000000;
      expv[14] = 43'h7f700000000;
      expv[15] = 43'h00000000000;
      expv[16] = 43'h65d00000000;
      expv[17] = 43'h00000000000;
      expv[18] = 43'h00000000000;
      expv[19] = 43'h00000000000;
      expv[20] = 43'h00000000000;
      expv[21] = 43'h00000000000;
      expv[22] = 43'h00000000000;
      expv[23] = 43'h00000000000;
      expv[24] = 43'h00000000000;
      expv[25] = 43'h44f00000000;
      expv[26] = 43'h00000000000;
      expv[27] = 43'h00000000000;
      expv[28] = 43'h00000000000;
      expv[29] = 43'h00000000000;
      expv[30] = 43'h00000000000;
      expv[31] = 43'h00000000000;
      expv[32] = 43'h00000000000;
      expv[33] = 43'h00000000000;
      expv[34] = 43'h00000000000;
      expv[35] = 43'h00000000000;
      expv[36] = 43'h00000000000;
      expv[37] = 43'h00000000000;
      expv[38] = 43'h00000000000;
      expv[39] = 43'h66300000000;
      expv[40] = 43'h00000000000;
      expv[41] = 43'h00000000000;
      expv[42] = 43'h00000000000;
      expv[43] = 43'h08300000000;
      expv[44] = 43'h00000000000;
      expv[45] = 43'h00000000000;
      expv[46] = 43'h00000000000;
      expv[47] = 43'h00000000000;
      expv[48] = 43'h00000000000;
      expv[49] = 43'h00000000000;
      expv[50] = 43'h00000000000;
      expv[51] = 43'h00000000000;
      expv[52] = 43'h00000000000;
      expv[53] = 43'h00000000000;
      expv[54] = 43'h00000000000;
      expv[55] = 43'h00000000000;
      expv[56] = 43'h00000000000;
      expv[57] = 43'h00000000000;
      expv[58] = 43'h00000000000;
      expv[59] = 43'h00000000000;
      expv[60] = 43'h00000000000;
      expv[61] = 43'h00000000000;
      expv[62] = 43'h00000000000;
      expv[63] = 43'h00000000000;
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
