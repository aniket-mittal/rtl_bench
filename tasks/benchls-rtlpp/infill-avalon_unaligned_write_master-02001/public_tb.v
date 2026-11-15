// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02001 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h273264d72551c309e0;
    stim[1] = 70'h200396c77a9c41b6da;
    stim[2] = 70'h00ab63ff4528bb7d38;
    stim[3] = 70'h0f7fead298dc58fcb9;
    stim[4] = 70'h1c065043fa56c63b18;
    stim[5] = 70'h1907cfd453e1862f11;
    stim[6] = 70'h19316f0377fefbbcad;
    stim[7] = 70'h0b634234c703e069ad;
    stim[8] = 70'h13f870362b536865e7;
    stim[9] = 70'h121b24d191db5b9024;
    stim[10] = 70'h0f7e00382c9c556dd2;
    stim[11] = 70'h02298189980cb13ae4;
    stim[12] = 70'h12c26e00c74b9b0ffe;
    stim[13] = 70'h0f0498c2245f99877d;
    stim[14] = 70'h1a41f971df587bcf7d;
    stim[15] = 70'h0a2a31b0e03c32ab0c;
    stim[16] = 70'h1137ec5d350baf2693;
    stim[17] = 70'h17ae0ba51f8316f10f;
    stim[18] = 70'h0bd6a81b4bfe2ed295;
    stim[19] = 70'h1ba3945823e3bacda0;
    stim[20] = 70'h05062fb644cfbd5136;
    stim[21] = 70'h033fee94137b5be570;
    stim[22] = 70'h0eac86238a981e6f51;
    stim[23] = 70'h0440f2e854b2f38613;
    stim[24] = 70'h082919e7ae4b8c4ee0;
    stim[25] = 70'h0106019fd351bb89a1;
    stim[26] = 70'h1809f06b399200c982;
    stim[27] = 70'h00a18938827bc198b6;
    stim[28] = 70'h1bb447f6c78f54586c;
    stim[29] = 70'h0dd978b9b1e08cf732;
    stim[30] = 70'h1ecfa0daf71b24d7a0;
    stim[31] = 70'h08d6102c0f0d410f78;
    stim[32] = 70'h03973fa29b6f53b1c1;
    stim[33] = 70'h06db80903b7d7c2136;
    stim[34] = 70'h122ea9096427d9e895;
    stim[35] = 70'h1b0d005ff44e7563be;
    stim[36] = 70'h03caf9390f85308c29;
    stim[37] = 70'h07b6ea0903fcb6d0f0;
    stim[38] = 70'h0948321563922d76b0;
    stim[39] = 70'h0be3ab96c2b978f0f2;
    stim[40] = 70'h0125f6d7931d4ee757;
    stim[41] = 70'h15577feffd42acc1b0;
    stim[42] = 70'h1a4ed7bbb8c428ac68;
    stim[43] = 70'h02066a8cddb3b05e4c;
    stim[44] = 70'h06ec6a6b1935a8429b;
    stim[45] = 70'h179869a4e02ee70bc9;
    stim[46] = 70'h17654b9970a351d1d7;
    stim[47] = 70'h1e48562efd7495f84c;
    stim[48] = 70'h021432ddfa0ec75eb6;
    stim[49] = 70'h2e1d0baa364cd05ba6;
    stim[50] = 70'h1d0a0e262122638f12;
    stim[51] = 70'h19956c0b5820f8b7f7;
    stim[52] = 70'h1627490a54df154421;
    stim[53] = 70'h0ae216d41e220cafca;
    stim[54] = 70'h0e0deddec4981e8a9d;
    stim[55] = 70'h1ccbd773f17532bab0;
    stim[56] = 70'h1488f216fd01104cee;
    stim[57] = 70'h1369e3712e5d87a9ab;
    stim[58] = 70'h3246e639a75da2ee46;
    stim[59] = 70'h0ee84577845d441a31;
    stim[60] = 70'h1ed00a3bb1361a06ad;
    stim[61] = 70'h0a4e0348cd428eda56;
    stim[62] = 70'h08d0fdfde3785682b7;
    stim[63] = 70'h0cf23355080a1d591e;
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
      expv[0] = 33'h151c309e0;
      expv[1] = 33'h09c41b6da;
      expv[2] = 33'h128bb7d38;
      expv[3] = 33'h0dc58fcb8;
      expv[4] = 33'h056c63b18;
      expv[5] = 33'h1e1862f10;
      expv[6] = 33'h1fefbbcac;
      expv[7] = 33'h103e069ac;
      expv[8] = 33'h1536865e6;
      expv[9] = 33'h1db5b9025;
      expv[10] = 33'h09c556dd2;
      expv[11] = 33'h00cb13ae4;
      expv[12] = 33'h14b9b0ffe;
      expv[13] = 33'h05f99877c;
      expv[14] = 33'h1587bcf7c;
      expv[15] = 33'h03c32ab0c;
      expv[16] = 33'h10baf2692;
      expv[17] = 33'h18316f10e;
      expv[18] = 33'h1fe2ed294;
      expv[19] = 33'h1e3bacda0;
      expv[20] = 33'h0cfbd5136;
      expv[21] = 33'h17b5be570;
      expv[22] = 33'h0981e6f50;
      expv[23] = 33'h0b2f38612;
      expv[24] = 33'h04b8c4ee0;
      expv[25] = 33'h151bb89a0;
      expv[26] = 33'h19200c983;
      expv[27] = 33'h07bc198b6;
      expv[28] = 33'h18f54586c;
      expv[29] = 33'h1e08cf732;
      expv[30] = 33'h11b24d7a0;
      expv[31] = 33'h10d410f78;
      expv[32] = 33'h16f53b1c0;
      expv[33] = 33'h17d7c2136;
      expv[34] = 33'h027d9e894;
      expv[35] = 33'h04e7563be;
      expv[36] = 33'h185308c28;
      expv[37] = 33'h1fcb6d0f0;
      expv[38] = 33'h1922d76b0;
      expv[39] = 33'h0b978f0f2;
      expv[40] = 33'h11d4ee756;
      expv[41] = 33'h142acc1b0;
      expv[42] = 33'h0c428ac69;
      expv[43] = 33'h1b3b05e4c;
      expv[44] = 33'h135a8429a;
      expv[45] = 33'h02ee70bc8;
      expv[46] = 33'h0a351d1d6;
      expv[47] = 33'h17495f84c;
      expv[48] = 33'h00ec75eb6;
      expv[49] = 33'h04cd05ba6;
      expv[50] = 33'h122638f13;
      expv[51] = 33'h020f8b7f6;
      expv[52] = 33'h0df154420;
      expv[53] = 33'h0220cafca;
      expv[54] = 33'h0981e8a9c;
      expv[55] = 33'h17532bab1;
      expv[56] = 33'h101104cee;
      expv[57] = 33'h05d87a9aa;
      expv[58] = 33'h15da2ee46;
      expv[59] = 33'h05d441a30;
      expv[60] = 33'h1361a06ac;
      expv[61] = 33'h1428eda56;
      expv[62] = 33'h1785682b6;
      expv[63] = 33'h00a1d591e;
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
