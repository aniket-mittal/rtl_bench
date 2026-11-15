// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002746 dut (
    .CCLK(clk),
    .rst(in_vec[82:82]),
    .ready(in_vec[81:81]),
    .frame_done(in_vec[80:80]),
    .leftadc(in_vec[79:60]),
    .rightadc(in_vec[59:40]),
    .reg_status(in_vec[39:20]),
    .status_data(in_vec[19:0]),
    .cmd_vd(out_vec[66:66]),
    .left_vd(out_vec[65:65]),
    .right_vd(out_vec[64:64]),
    .leftdac(out_vec[63:44]),
    .rightdac(out_vec[43:24]),
    .cmd_addr(out_vec[23:16]),
    .cmd_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h56496ca49a0a79f5f5b0f;
    stim[1] = 83'h4d8ef247a9b171522d54b;
    stim[2] = 83'h26616e09f995377a3e343;
    stim[3] = 83'h39653c1052521bd1f4e0f;
    stim[4] = 83'h0c6dad76fcb18ca0b5288;
    stim[5] = 83'h03d921e0214d8b64d3169;
    stim[6] = 83'h0a4d3547c103f7e88b834;
    stim[7] = 83'h35c68cba03283c40d815e;
    stim[8] = 83'h3d144df9207a693c5152c;
    stim[9] = 83'h18817afed9ec3bd7f0b4a;
    stim[10] = 83'h05f8848f8c8b47409d7a5;
    stim[11] = 83'h3c688357c646f2a2a9524;
    stim[12] = 83'h1874eec0ad0ae1270c6c9;
    stim[13] = 83'h33beb720f01d10799cdab;
    stim[14] = 83'h36d1feeda4f67b43619eb;
    stim[15] = 83'h3d104a390e8ee9bf1d0a1;
    stim[16] = 83'h3bb27def5d9d3b4d37ffe;
    stim[17] = 83'h31dd6c3e6856e874ddd2d;
    stim[18] = 83'h1bfda0a5c00f92e6f4367;
    stim[19] = 83'h1391366a287830e6fcd6a;
    stim[20] = 83'h2d747775e82b3ec86968b;
    stim[21] = 83'h16ba4c950833f654f26ad;
    stim[22] = 83'h27293a695756f2237963e;
    stim[23] = 83'h530575f6a837db89b444d;
    stim[24] = 83'h0e8a7803668fbfa85f627;
    stim[25] = 83'h20aba4744a894f3336c73;
    stim[26] = 83'h2d0e8da32e8525076b465;
    stim[27] = 83'h21f52fd50fdadc6e19df0;
    stim[28] = 83'h09032709b64a3f4f5db5f;
    stim[29] = 83'h1f362e20f690c04f2feed;
    stim[30] = 83'h01ab2bd3f2ff340728297;
    stim[31] = 83'h3a38c984f60cc43a5ad2a;
    stim[32] = 83'h1a9f0f99c2a3bad001aee;
    stim[33] = 83'h3b16d67c32ae2b1a20c86;
    stim[34] = 83'h12aa3f71a2045c9fec44d;
    stim[35] = 83'h317c81f071e623c42888a;
    stim[36] = 83'h3c1e6db82a6c64bf4f38d;
    stim[37] = 83'h26929b7177e2bbd21b342;
    stim[38] = 83'h1ab49f23231f19da62915;
    stim[39] = 83'h0899248270b2a1c684909;
    stim[40] = 83'h038a7620347b849b925b7;
    stim[41] = 83'h3dd26b3c1ecf742a843dc;
    stim[42] = 83'h01f668ed147580a945e40;
    stim[43] = 83'h15add97b0dab4e1da22a5;
    stim[44] = 83'h0fb7f4a3eafc15d598ee9;
    stim[45] = 83'h2642cdc172ccacfbeefe4;
    stim[46] = 83'h25efb50eeb948f6d38f46;
    stim[47] = 83'h29853e9c9a05110d7d4d4;
    stim[48] = 83'h663857183154600cd9051;
    stim[49] = 83'h2e5d05d6f638a3f210fbb;
    stim[50] = 83'h08e71764ad0f3a13c9535;
    stim[51] = 83'h22fccbba089db88e1e656;
    stim[52] = 83'h24b62418e2b56864e9fb4;
    stim[53] = 83'h12f8f1e75e9e9d31c8a3c;
    stim[54] = 83'h0612c6f2dfbe768d5a539;
    stim[55] = 83'h3fb86c236d30bcc5e3a27;
    stim[56] = 83'h0c39deef5953b08008822;
    stim[57] = 83'h35b4f63d8e297d46cbee8;
    stim[58] = 83'h35c105778cbd4121a4cc6;
    stim[59] = 83'h30f75efc28cdd4d2eff0e;
    stim[60] = 83'h25689f89c51b8c87ff846;
    stim[61] = 83'h0913794a63f1cf3c59ba4;
    stim[62] = 83'h245a9aaa578aa9486db07;
    stim[63] = 83'h2bbcf8a5b8e2ed10f7531;
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
      expv[0] = 67'hxxxxxxxxxxxxxxxxx;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h40000000000a60000;
      expv[4] = 67'h40000000000a60000;
      expv[5] = 67'h40000000000a60000;
      expv[6] = 67'h40000000000a60000;
      expv[7] = 67'h40000000000a60000;
      expv[8] = 67'h40000000000a60000;
      expv[9] = 67'h40000000000a60000;
      expv[10] = 67'h40000000000a60000;
      expv[11] = 67'h40000000000a60000;
      expv[12] = 67'h40000000000a60000;
      expv[13] = 67'h40000000000a60000;
      expv[14] = 67'h40000000000a60000;
      expv[15] = 67'h40000000000a60000;
      expv[16] = 67'h40000000000a60000;
      expv[17] = 67'h40000000000a60000;
      expv[18] = 67'h40000000000020000;
      expv[19] = 67'h40000000000020000;
      expv[20] = 67'h40000000000020000;
      expv[21] = 67'h40000000000100000;
      expv[22] = 67'h40000000000100000;
      expv[23] = 67'h400000000001a0404;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h00000000000000000;
      expv[26] = 67'h40000000000a60000;
      expv[27] = 67'h40000000000a60000;
      expv[28] = 67'h40000000000a60000;
      expv[29] = 67'h40000000000a60000;
      expv[30] = 67'h40000000000a60000;
      expv[31] = 67'h40000000000a60000;
      expv[32] = 67'h40000000000020000;
      expv[33] = 67'h40000000000020000;
      expv[34] = 67'h40000000000100000;
      expv[35] = 67'h40000000000100000;
      expv[36] = 67'h400000000001a0404;
      expv[37] = 67'h400000000001c0000;
      expv[38] = 67'h36929b7177e800000;
      expv[39] = 67'h36929b7177e800000;
      expv[40] = 67'h36929b7177e800000;
      expv[41] = 67'h36929b7177e800000;
      expv[42] = 67'h3dd26b3c1ec800000;
      expv[43] = 67'h3dd26b3c1ec800000;
      expv[44] = 67'h3dd26b3c1ec800000;
      expv[45] = 67'h3dd26b3c1ec800000;
      expv[46] = 67'h3642cdc172c800000;
      expv[47] = 67'h35efb50eeb9800000;
      expv[48] = 67'h39853e9c9a0800000;
      expv[49] = 67'h00000000000000000;
      expv[50] = 67'h40000000000a60000;
      expv[51] = 67'h40000000000a60000;
      expv[52] = 67'h40000000000a60000;
      expv[53] = 67'h40000000000a60000;
      expv[54] = 67'h40000000000a60000;
      expv[55] = 67'h40000000000a60000;
      expv[56] = 67'h40000000000a60000;
      expv[57] = 67'h40000000000a60000;
      expv[58] = 67'h40000000000a60000;
      expv[59] = 67'h40000000000a60000;
      expv[60] = 67'h40000000000a60000;
      expv[61] = 67'h40000000000a60000;
      expv[62] = 67'h40000000000a60000;
      expv[63] = 67'h40000000000a60000;
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
