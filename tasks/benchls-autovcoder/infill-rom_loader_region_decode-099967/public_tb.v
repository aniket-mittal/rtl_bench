// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099967 dut (
    .clk_sys(clk),
    .reset(in_vec[44:44]),
    .ioctl_addr(in_vec[43:18]),
    .ioctl_dout(in_vec[17:2]),
    .ioctl_wr(in_vec[1:1]),
    .load_en(in_vec[0:0]),
    .rom_68k_we(out_vec[31:31]),
    .rom_z80_we(out_vec[30:30]),
    .rom_tiles_we(out_vec[29:29]),
    .rom_sprites_we(out_vec[28:28]),
    .rom_007232_we(out_vec[27:27]),
    .rom_prom2_we(out_vec[26:26]),
    .rom_addr(out_vec[25:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1bc92925daf8;
    stim[1] = 45'h1c1e3fc755a3;
    stim[2] = 45'h0b5cf45acfe0;
    stim[3] = 45'h0d6ed3bb5938;
    stim[4] = 45'h0e8ef8d8ccf8;
    stim[5] = 45'h08e49ea5490a;
    stim[6] = 45'h0ad9834b6a45;
    stim[7] = 45'h0e387e9659a4;
    stim[8] = 45'h02eb5e04f485;
    stim[9] = 45'h06930ce3a19a;
    stim[10] = 45'h0645d86957b7;
    stim[11] = 45'h0dc41b35403d;
    stim[12] = 45'h04781e6b1cbf;
    stim[13] = 45'h0e8b0a2f6acc;
    stim[14] = 45'h0e86c0547ccf;
    stim[15] = 45'h00093dadbb99;
    stim[16] = 45'h0f26b2a59761;
    stim[17] = 45'h0b9ccec00392;
    stim[18] = 45'h0eeeb74bc533;
    stim[19] = 45'h0a31ef297161;
    stim[20] = 45'h140ed129d4ca;
    stim[21] = 45'h05f29e28c730;
    stim[22] = 45'h0c643cd1adcb;
    stim[23] = 45'h00c7dfb1d7eb;
    stim[24] = 45'h00d0dedf06a5;
    stim[25] = 45'h0d49b1885975;
    stim[26] = 45'h0c04481f1c75;
    stim[27] = 45'h0f41b25b57b5;
    stim[28] = 45'h0d9e08b283e8;
    stim[29] = 45'h0acca7cad313;
    stim[30] = 45'h09ec72a37262;
    stim[31] = 45'h0e76fd096044;
    stim[32] = 45'h070769006ed3;
    stim[33] = 45'h0b55004b4155;
    stim[34] = 45'h017fed132783;
    stim[35] = 45'h0045eea0687c;
    stim[36] = 45'h0899601084b0;
    stim[37] = 45'h0b5c5cfcf8c7;
    stim[38] = 45'h0c2154191d83;
    stim[39] = 45'h062fdd32ec4c;
    stim[40] = 45'h0b28d1475536;
    stim[41] = 45'h069dafc3e99d;
    stim[42] = 45'h0dc6682f8841;
    stim[43] = 45'h02794b63cd4d;
    stim[44] = 45'h0013315f68b9;
    stim[45] = 45'h083ca5a140fd;
    stim[46] = 45'h0148443345e3;
    stim[47] = 45'h0db37c4f385d;
    stim[48] = 45'h087d8113748f;
    stim[49] = 45'h01273682f71e;
    stim[50] = 45'h0a4faaff6e71;
    stim[51] = 45'h0ff2c5af556d;
    stim[52] = 45'h0a9708a25a0e;
    stim[53] = 45'h02e7ba3fa2a0;
    stim[54] = 45'h0b46a602f638;
    stim[55] = 45'h0eabf9d1a714;
    stim[56] = 45'h0b310b565e0a;
    stim[57] = 45'h00143c28ee01;
    stim[58] = 45'h0823c039c1f4;
    stim[59] = 45'h0ef69e04f582;
    stim[60] = 45'h0f20936148e2;
    stim[61] = 45'h0d516b416fd5;
    stim[62] = 45'h084d0bc51c70;
    stim[63] = 45'h0f7dfb3057ed;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h0xxxxxxx;
      expv[2] = 32'h0xxxxxxx;
      expv[3] = 32'h0xxxxxxx;
      expv[4] = 32'h0xxxxxxx;
      expv[5] = 32'h0xxxxxxx;
      expv[6] = 32'h0xxxxxxx;
      expv[7] = 32'h0xxxxxxx;
      expv[8] = 32'h0xxxxxxx;
      expv[9] = 32'h0xxxxxxx;
      expv[10] = 32'h0xxxxxxx;
      expv[11] = 32'h0xxxxxxx;
      expv[12] = 32'h0xxxxxxx;
      expv[13] = 32'h0xxxxxxx;
      expv[14] = 32'h0xxxxxxx;
      expv[15] = 32'h0xxxxxxx;
      expv[16] = 32'h0xxxxxxx;
      expv[17] = 32'h0xxxxxxx;
      expv[18] = 32'h0xxxxxxx;
      expv[19] = 32'h0xxxxxxx;
      expv[20] = 32'h0xxxxxxx;
      expv[21] = 32'h0xxxxxxx;
      expv[22] = 32'h0xxxxxxx;
      expv[23] = 32'h0xxxxxxx;
      expv[24] = 32'h0xxxxxxx;
      expv[25] = 32'h0xxxxxxx;
      expv[26] = 32'h0xxxxxxx;
      expv[27] = 32'h0xxxxxxx;
      expv[28] = 32'h0xxxxxxx;
      expv[29] = 32'h0xxxxxxx;
      expv[30] = 32'h0xxxxxxx;
      expv[31] = 32'h0xxxxxxx;
      expv[32] = 32'h0xxxxxxx;
      expv[33] = 32'h0xxxxxxx;
      expv[34] = 32'h0xxxxxxx;
      expv[35] = 32'h0xxxxxxx;
      expv[36] = 32'h0xxxxxxx;
      expv[37] = 32'h0xxxxxxx;
      expv[38] = 32'h0xxxxxxx;
      expv[39] = 32'h0xxxxxxx;
      expv[40] = 32'h0xxxxxxx;
      expv[41] = 32'h0xxxxxxx;
      expv[42] = 32'h0xxxxxxx;
      expv[43] = 32'h0xxxxxxx;
      expv[44] = 32'h0xxxxxxx;
      expv[45] = 32'h0xxxxxxx;
      expv[46] = 32'h0xxxxxxx;
      expv[47] = 32'h0xxxxxxx;
      expv[48] = 32'h0xxxxxxx;
      expv[49] = 32'h0xxxxxxx;
      expv[50] = 32'h0xxxxxxx;
      expv[51] = 32'h0xxxxxxx;
      expv[52] = 32'h0xxxxxxx;
      expv[53] = 32'h0xxxxxxx;
      expv[54] = 32'h0xxxxxxx;
      expv[55] = 32'h0xxxxxxx;
      expv[56] = 32'h0xxxxxxx;
      expv[57] = 32'h0xxxxxxx;
      expv[58] = 32'h0xxxxxxx;
      expv[59] = 32'h0xxxxxxx;
      expv[60] = 32'h0xxxxxxx;
      expv[61] = 32'h0xxxxxxx;
      expv[62] = 32'h0xxxxxxx;
      expv[63] = 32'h0xxxxxxx;
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
