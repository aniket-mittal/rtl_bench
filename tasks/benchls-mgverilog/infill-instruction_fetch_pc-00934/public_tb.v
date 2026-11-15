// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 93;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00934 dut (
    .clk_i(clk),
    .rst_i(in_vec[64:64]),
    .stall_i(in_vec[63:63]),
    .take_branch_i(in_vec[62:62]),
    .branch_pc_i(in_vec[61:32]),
    .rmemdata_i(in_vec[31:0]),
    .ir_o(out_vec[92:61]),
    .nextpc_o(out_vec[60:31]),
    .re_o(out_vec[30:30]),
    .rmemaddr_o(out_vec[29:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1e22f9f535af03962;
    stim[1] = 65'h183e6fa541e87afd5;
    stim[2] = 65'h050966ea826c7e606;
    stim[3] = 65'h03c93040859e25dde;
    stim[4] = 65'h01ef34f0986942f49;
    stim[5] = 65'h0858a70111d2ab61c;
    stim[6] = 65'h09bb41275fbdc8457;
    stim[7] = 65'h0033031fe26127aeb;
    stim[8] = 65'h082992adddfaa8cb0;
    stim[9] = 65'h0ee911e7a8ceb76fb;
    stim[10] = 65'h0b0076d6f783ed449;
    stim[11] = 65'h06623ddd9e20ca824;
    stim[12] = 65'h0db18d0d44f10062a;
    stim[13] = 65'h0c506e6d56076677a;
    stim[14] = 65'h05679e746db959fe3;
    stim[15] = 65'h0d07e9b760d16bc2f;
    stim[16] = 65'h0ed5a2a1f2c21f3a6;
    stim[17] = 65'h08fe412bfcb7341c2;
    stim[18] = 65'h0f5233cd31dabd9c4;
    stim[19] = 65'h003c25c81ef0ea4ea;
    stim[20] = 65'h00972dd8d3a9a4db9;
    stim[21] = 65'h0028e2329457f7f21;
    stim[22] = 65'h0237bf1143443890e;
    stim[23] = 65'h0bf45af71db1d6db7;
    stim[24] = 65'h09aea73154031ab26;
    stim[25] = 65'h033826fed6c52a0b6;
    stim[26] = 65'h00a0394dd03d344cf;
    stim[27] = 65'h05dcdfa857d419c9b;
    stim[28] = 65'h04ebffa9f9e05229c;
    stim[29] = 65'h0e7daf47fc11cf606;
    stim[30] = 65'h0d2ef48277191c6e7;
    stim[31] = 65'h0958c3c5f6ad56fa1;
    stim[32] = 65'h0c3dced50f852a3bb;
    stim[33] = 65'h0b69bec88e8568b01;
    stim[34] = 65'h0fcd41eebb27bef49;
    stim[35] = 65'h0c1dbac0998ebd9b0;
    stim[36] = 65'h0007168a0455029f7;
    stim[37] = 65'h058b5a6e78c086509;
    stim[38] = 65'h0c0cfab1cdce80043;
    stim[39] = 65'h0d5da6d6b38054103;
    stim[40] = 65'h0ea2c9bd7642ddca7;
    stim[41] = 65'h096b442f006f379e5;
    stim[42] = 65'h0be076fcaf6bcc980;
    stim[43] = 65'h0d4fb533ca1c8fd48;
    stim[44] = 65'h0f8a82a37623daeb8;
    stim[45] = 65'h065fdbbfd002e4795;
    stim[46] = 65'h0638446267e38cea0;
    stim[47] = 65'h037fba5542fe565f7;
    stim[48] = 65'h01fcba8f61d2e88ab;
    stim[49] = 65'h04ac472dadd566402;
    stim[50] = 65'h0a2677c8691bef0fb;
    stim[51] = 65'h14a695abaa7ef74a3;
    stim[52] = 65'h054195d1aa65dff7f;
    stim[53] = 65'h033cc29e5b4cfcdf6;
    stim[54] = 65'h020dc23d3fe6050d8;
    stim[55] = 65'h0155fcca2985b556c;
    stim[56] = 65'h01601a0bb262d508f;
    stim[57] = 65'h0408cf75fbef9ea7c;
    stim[58] = 65'h00ca0357769160e07;
    stim[59] = 65'h04b9facb7e9a688d3;
    stim[60] = 65'h0aa4a55bb02e4f4b6;
    stim[61] = 65'h0eb0b96aa83c96bdb;
    stim[62] = 65'h0cfacebd2a43bac5b;
    stim[63] = 65'h07fd94ba34118cf6c;
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
      expv[0] = 93'h0b5e072c5117cfa9x22f9f53;
      expv[1] = 93'h03d0f5faa000000040000000;
      expv[2] = 93'h04d8fcc0c84b375450966ea8;
      expv[3] = 93'h0b3c4bbbc84b3754d0966ea9;
      expv[4] = 93'h10d285e9284b375550966eaa;
      expv[5] = 93'h03a556c3884b3755d0966eab;
      expv[6] = 93'h1f7b908ae84b375590966eab;
      expv[7] = 93'h04c24f5d684b375590966eab;
      expv[8] = 93'h1bf55196084b375650966eac;
      expv[9] = 93'h119d6edf77488f3d2e911e7a;
      expv[10] = 93'h0f07da89284b375610966eac;
      expv[11] = 93'h1c4195049311eeeca623ddd9;
      expv[12] = 93'h09e200c54d8c686a5b18d0d4;
      expv[13] = 93'h0c0eccef4283736a8506e6d5;
      expv[14] = 93'h1b72b3fc6b3cf3a31679e746;
      expv[15] = 93'h01a2d785e83f4dbb507e9b76;
      expv[16] = 93'h05843e74d6ad150fad5a2a1f;
      expv[17] = 93'h196e68384b3cf3a39679e747;
      expv[18] = 93'h03b57b389a919e69b5233cd3;
      expv[19] = 93'h1de1d49d4b3cf3a39679e747;
      expv[20] = 93'h075349b72b3cf3a45679e748;
      expv[21] = 93'h08afefe42b3cf3a4d679e749;
      expv[22] = 93'h06887121cb3cf3a55679e74a;
      expv[23] = 93'h1b63adb6eb3cf3a5d679e74b;
      expv[24] = 93'h08063564cb3cf3a59679e74b;
      expv[25] = 93'h0d8a5416cb3cf3a59679e74b;
      expv[26] = 93'h007a6899eb3cf3a65679e74c;
      expv[27] = 93'h0fa833936ee6fd42ddcdfa85;
      expv[28] = 93'h13c0a453875ffd4fcebffa9f;
      expv[29] = 93'h18239ec0d3ed7a3fe7daf47f;
      expv[30] = 93'h0e3238dce977a41392ef4827;
      expv[31] = 93'h0d5aadf4275ffd500ebffaa0;
      expv[32] = 93'h1f0a547761ee76a803dced50;
      expv[33] = 93'h1d0ad160275ffd500ebffaa0;
      expv[34] = 93'h164f7de93e6a0f75bcd41eeb;
      expv[35] = 93'h131d7b3600edd60481dbac09;
      expv[36] = 93'h08aa053ee75ffd500ebffaa0;
      expv[37] = 93'h11810ca12c5ad373d8b5a6e7;
      expv[38] = 93'h1b9d00086067d58e40cfab1c;
      expv[39] = 93'h0700a8206aed36b595da6d6b;
      expv[40] = 93'h0c85bb94f5164debaa2c9bd7;
      expv[41] = 93'h00de6f3cac5ad37418b5a6e8;
      expv[42] = 93'h1ed799300c5ad37418b5a6e8;
      expv[43] = 93'h14391fa90a7da99e14fb533c;
      expv[44] = 93'h0c47b5d71c54151bb8a82a37;
      expv[45] = 93'h0005c8f2b2feddfea5fdbbfd;
      expv[46] = 93'h0fc719d411c2231363844626;
      expv[47] = 93'h05fcacbef1c22313e3844627;
      expv[48] = 93'h03a5d11571c2231463844628;
      expv[49] = 93'h1baacc804562396d4ac472da;
      expv[50] = 93'h1237de1f6562396dcac472db;
      expv[51] = 93'h14fdee946534ad5d0a695aba;
      expv[52] = 93'h14cbbfefea0cae8d54195d1a;
      expv[53] = 93'h1699f9beca0cae8dd4195d1b;
      expv[54] = 93'h1fcc0a1b0a0cae8e54195d1c;
      expv[55] = 93'h130b6aad8a0cae8ed4195d1d;
      expv[56] = 93'h04c5aa11ea0cae8f54195d1e;
      expv[57] = 93'h17df3d4f80467bafc08cf75f;
      expv[58] = 93'h0d22c1c0e0467bb0408cf760;
      expv[59] = 93'h1d34d11a65cfd65bcb9facb7;
      expv[60] = 93'h005c9e96c5cfd65c4b9facb8;
      expv[61] = 93'h10792d7b7585cb552b0b96aa;
      expv[62] = 93'h1487758b67d675e90facebd2;
      expv[63] = 93'h082319ed9feca5d1bfd94ba3;
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
