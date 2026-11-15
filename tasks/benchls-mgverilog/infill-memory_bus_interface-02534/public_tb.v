// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 63;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02534 dut (
    .clk(clk),
    .c1(in_vec[62:62]),
    .c3(in_vec[61:61]),
    .bank(in_vec[60:53]),
    .address_in(in_vec[52:35]),
    .data_in(in_vec[34:19]),
    .rd(in_vec[18:18]),
    .hwr(in_vec[17:17]),
    .lwr(in_vec[16:16]),
    .ramdata_in(in_vec[15:0]),
    .data_out(out_vec[56:41]),
    ._bhe(out_vec[40:40]),
    ._ble(out_vec[39:39]),
    ._we(out_vec[38:38]),
    ._oe(out_vec[37:37]),
    .address(out_vec[36:16]),
    .data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 63'h1c80288879ed1be1;
    stim[1] = 63'h4ba59aecd971404f;
    stim[2] = 63'h59edf3257e4b3042;
    stim[3] = 63'h33bf796d45c5de17;
    stim[4] = 63'h48c4e138a0f71c9f;
    stim[5] = 63'h7c06d00ce9f1f06d;
    stim[6] = 63'h4eb4e50c4d22432d;
    stim[7] = 63'h7a23e2ac9944a605;
    stim[8] = 63'h26b17ea4a5cafe24;
    stim[9] = 63'h798849893730e75a;
    stim[10] = 63'h0858b0be9dfc1af9;
    stim[11] = 63'h7f4deedeeff2d857;
    stim[12] = 63'h275df490cfb4cfb4;
    stim[13] = 63'h40b9c76dc562158f;
    stim[14] = 63'h77b035befa5e2fcc;
    stim[15] = 63'h7a0a68052a470910;
    stim[16] = 63'h3aa8c7ff29736413;
    stim[17] = 63'h3fabdde7fece8221;
    stim[18] = 63'h58591fe5022925a0;
    stim[19] = 63'h5d0037d2c9758225;
    stim[20] = 63'h359c9831ea96f5dc;
    stim[21] = 63'h0b8dfc00c528dbc0;
    stim[22] = 63'h1db4f4306fb1f10a;
    stim[23] = 63'h4039f10b5b0ee238;
    stim[24] = 63'h68bd748c6ad65e29;
    stim[25] = 63'h7414dc28b12ab3d4;
    stim[26] = 63'h7050e800d0cbcd86;
    stim[27] = 63'h3b44ea1824c5fd4c;
    stim[28] = 63'h21db585ece548f6f;
    stim[29] = 63'h089aebe8e2abc485;
    stim[30] = 63'h7c0b01b9823b4610;
    stim[31] = 63'h14b7fcfa843884e6;
    stim[32] = 63'h41b81a5b9f118963;
    stim[33] = 63'h0b65b61fdef34e3d;
    stim[34] = 63'h4d402973ac75bdae;
    stim[35] = 63'h051bb7dfaeb9849d;
    stim[36] = 63'h02299173c1e6bc99;
    stim[37] = 63'h46cd5fba89b8eb2c;
    stim[38] = 63'h1cdb1ef3062631d0;
    stim[39] = 63'h091408554e655a74;
    stim[40] = 63'h4b0a5469fa9501f8;
    stim[41] = 63'h6de76d9c5e16a89a;
    stim[42] = 63'h2af3a64018f48f2e;
    stim[43] = 63'h7122027e0fada740;
    stim[44] = 63'h41a6dd71f7faca18;
    stim[45] = 63'h0b2f745b43c78bc1;
    stim[46] = 63'h34e197fda74f8b90;
    stim[47] = 63'h39440072c7976d9b;
    stim[48] = 63'h002d2d27db417527;
    stim[49] = 63'h1be75a7cc61bbb03;
    stim[50] = 63'h30bcc507bb9fbaff;
    stim[51] = 63'h70c8d3f80f91569c;
    stim[52] = 63'h7b6522092ffe8f65;
    stim[53] = 63'h027260f6d1168865;
    stim[54] = 63'h340a9a005adabb12;
    stim[55] = 63'h1ff72ba2c05940b8;
    stim[56] = 63'h739eb0e11db914ce;
    stim[57] = 63'h1565cf992ffce3c4;
    stim[58] = 63'h433706fda9c738a3;
    stim[59] = 63'h4b3c7af3e8f88248;
    stim[60] = 63'h682bd97a0a7c5f19;
    stim[61] = 63'h4965d300e823027a;
    stim[62] = 63'h5b21dc5273115a41;
    stim[63] = 63'h2207fc647ed2294a;
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
      expv[0] = 57'h037c31c05110f3d;
      expv[1] = 57'h000013cb35d9b2e;
      expv[2] = 57'h000003dbe64afc9;
      expv[3] = 57'h1bc2f1fef2da8b8;
      expv[4] = 57'h0393e1c9c27141e;
      expv[5] = 57'h000013cda019d3e;
      expv[6] = 57'h00000be9ca189a4;
      expv[7] = 57'h14c0bdc7c559328;
      expv[8] = 57'h00000be2fd494b9;
      expv[9] = 57'h00001fd093126e6;
      expv[10] = 57'h035f3df1617d3bf;
      expv[11] = 57'h00000bdbddbddfe;
      expv[12] = 57'h19f69dfbe9219f6;
      expv[13] = 57'h00000ab38edb8ac;
      expv[14] = 57'h05f989e06b7df4b;
      expv[15] = 57'h012201d4d00a548;
      expv[16] = 57'h000003d18ffe52e;
      expv[17] = 57'h104429d7bbcffd9;
      expv[18] = 57'h000013f23fca045;
      expv[19] = 57'h1044b1c06fa592e;
      expv[20] = 57'h1ebb89f93063d52;
      expv[21] = 57'h00001fdbf8018a5;
      expv[22] = 57'h000013e9e860df6;
      expv[23] = 57'h1c470833e216b61;
      expv[24] = 57'h0bc529bae918d5a;
      expv[25] = 57'h00000be9b851625;
      expv[26] = 57'h000003e1d001a19;
      expv[27] = 57'h1fa991c9d430498;
      expv[28] = 57'h11edfcf6b0bd9ca;
      expv[29] = 57'h000003b5d7d1c55;
      expv[30] = 57'h000003d60373047;
      expv[31] = 57'h00001feff9f5087;
      expv[32] = 57'h000012f034b73e2;
      expv[33] = 57'h000003cb6c3fbde;
      expv[34] = 57'h17b5d1c052e758e;
      expv[35] = 57'h000013f76fbf5d7;
      expv[36] = 57'h1793291322e783c;
      expv[37] = 57'h00001fdabf75137;
      expv[38] = 57'h063a09f63de60c4;
      expv[39] = 57'h0b4e91e810aa9cc;
      expv[40] = 57'h003f11d4a8d3f52;
      expv[41] = 57'h151349cedb38bc2;
      expv[42] = 57'h11e5dde74c8031e;
      expv[43] = 57'h14e811c404fc1f5;
      expv[44] = 57'h00000acdbae3eff;
      expv[45] = 57'h117821dee8b6878;
      expv[46] = 57'h117201c32ffb4e9;
      expv[47] = 57'h0db361c800e58f2;
      expv[48] = 57'h0000121a5a4fb68;
      expv[49] = 57'h000003ceb4f98c3;
      expv[50] = 57'h175fe1f98a0f773;
      expv[51] = 57'h000013d1a7f01f2;
      expv[52] = 57'h11eca9ca44125ff;
      expv[53] = 57'h110ca964c1eda22;
      expv[54] = 57'h00000bd53400b5b;
      expv[55] = 57'h000013ee574580b;
      expv[56] = 57'h000013fd61c23b7;
      expv[57] = 57'h1c789dcb9f325ff;
      expv[58] = 57'h071461ee0dfb538;
      expv[59] = 57'h00001ff8f5e7d1f;
      expv[60] = 57'h0be33d97b2f414f;
      expv[61] = 57'h000003cba601d04;
      expv[62] = 57'h000013c3b8a4e62;
      expv[63] = 57'h00000b0ff8c8fda;
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
