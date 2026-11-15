// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05468 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .if_instruction(in_vec[99:68]),
    .if_pc_current(in_vec[67:36]),
    .if_pc_add4(in_vec[35:4]),
    .if_stall(in_vec[3:3]),
    .if_flush(in_vec[2:2]),
    .id_stall(in_vec[1:1]),
    .if_is_ds(in_vec[0:0]),
    .id_instruction(out_vec[96:65]),
    .id_pc_current(out_vec[64:33]),
    .id_pc_add4(out_vec[32:1]),
    .id_is_flushed(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h135d1106d6a462d67f7fa04f54;
    stim[1] = 101'h1fe94bea362d0600d8ed3c4c67;
    stim[2] = 101'h04a9deb4a152c59d45c2e04740;
    stim[3] = 101'h05827d2bd3d3c7778dfeb3e040;
    stim[4] = 101'h0b07cf72441f62c7282b032ad2;
    stim[5] = 101'h0117ee95c0222ca82fddd4be31;
    stim[6] = 101'h04cb3238ee2ca16dd139fcdd77;
    stim[7] = 101'h0a169ce43957e43563ec58ab81;
    stim[8] = 101'h0a801f638ba86cff5cdaa97d01;
    stim[9] = 101'h0f4fe959164f78c1425aac28e3;
    stim[10] = 101'h0cadcef6d6031fa2bfac786a0a;
    stim[11] = 101'h05e845e97773353c87a40cd1b1;
    stim[12] = 101'h01314182a357ae1a41336e68f0;
    stim[13] = 101'h06769566ee46d3a98150805e3a;
    stim[14] = 101'h0260f059a64a25d74995424ae7;
    stim[15] = 101'h099a61db4cf7d9441bc9d7c8c8;
    stim[16] = 101'h01de482c8ee252da9242696911;
    stim[17] = 101'h05b9a351b14920c94e067af8e3;
    stim[18] = 101'h098c02e6520b6f88b2d80598c9;
    stim[19] = 101'h0e35821cf93bf8a429ec72e40a;
    stim[20] = 101'h0f710fa2c54ecbf276b4ee265f;
    stim[21] = 101'h0899b7d0cf09d73266051b5f99;
    stim[22] = 101'h0ae1ee63022b5ada9b9660e03b;
    stim[23] = 101'h05f4a3f862ff675b6f2c59262c;
    stim[24] = 101'h0e31c7ac2013ba4296a4c2c5b3;
    stim[25] = 101'h0280270e4773d7ba5ae43d8a33;
    stim[26] = 101'h0271afa77833548b1a407b2f3f;
    stim[27] = 101'h0d442b376080868e63617573d1;
    stim[28] = 101'h0421242e9407fbf022b76ea116;
    stim[29] = 101'h0aa24483afadf33ec0d578ff6c;
    stim[30] = 101'h0cc6267bd284c6ffda60f898f9;
    stim[31] = 101'h05b8216ee547e0bc03c8f9bdfd;
    stim[32] = 101'h0d1d28caaf337462c116d9add7;
    stim[33] = 101'h067fb1d5ecd42f30c8cd619b96;
    stim[34] = 101'h00e70d33383a07cc8ade1ba051;
    stim[35] = 101'h01ec806a164060b04574cb67c2;
    stim[36] = 101'h0d54e28a3ce1eabd8fc62e78c7;
    stim[37] = 101'h0c1a591f07f372b83ee89c7baa;
    stim[38] = 101'h044aa3e4a9622c29d93d27056b;
    stim[39] = 101'h0933d9251fa73f01d79a746d8c;
    stim[40] = 101'h063ee4d8edb1ee695f806c1edc;
    stim[41] = 101'h0cf7b178057f43724e8887042a;
    stim[42] = 101'h0bc30c06de5c0a4257e83db129;
    stim[43] = 101'h0a59caec508815e466f8e8e740;
    stim[44] = 101'h0c765a24eb3f7b392faf7ec6e2;
    stim[45] = 101'h0683450afeac681b87983400b9;
    stim[46] = 101'h06ea9399f97820a96b6fd58db4;
    stim[47] = 101'h03f8eb1685a37f14cd5e17adfb;
    stim[48] = 101'h07d87d8e453736ffa62be3544a;
    stim[49] = 101'h064c5303a5956e15d2742367a5;
    stim[50] = 101'h0795f501398dfc8ad4277bb7a9;
    stim[51] = 101'h0793e9ac95d9da81b70dc54769;
    stim[52] = 101'h0984d2eb4bf77248d35f59e8ed;
    stim[53] = 101'h0e4eee71f5f9736218fe48861c;
    stim[54] = 101'h0ee6a82d4c29b1a7ddb02c5ce6;
    stim[55] = 101'h0c7dc42d80057f9f61526a4a0e;
    stim[56] = 101'h0da5ee52a7e3bb35a6537b6b22;
    stim[57] = 101'h0455620181bc992de0efbe6666;
    stim[58] = 101'h0ac91b5f492e1e8edad72f65a9;
    stim[59] = 101'h08312a9e6272331ffabb2142ad;
    stim[60] = 101'h0704d003143a0567746c3c4812;
    stim[61] = 101'h05f21fc01199885e7fd4763512;
    stim[62] = 101'h07f05c7946116ee8166733b184;
    stim[63] = 101'h0740aa29fd6f99e7a11f90cff4;
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
      expv[0] = 97'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 97'h0000000000000000000000000;
      expv[2] = 97'h0000000000000000000000000;
      expv[3] = 97'h0953bd6942a58b3a8b85c08e8;
      expv[4] = 97'h0b04fa57a7a78eef1bfd67c08;
      expv[5] = 97'h0b04fa57a7a78eef1bfd67c08;
      expv[6] = 97'h0000000007a78eef000000000;
      expv[7] = 97'h0000000007a78eef000000000;
      expv[8] = 97'h0000000007a78eef000000000;
      expv[9] = 97'h0000000007a78eef000000000;
      expv[10] = 97'h0000000007a78eef000000000;
      expv[11] = 97'h0000000007a78eef000000000;
      expv[12] = 97'h0000000007a78eef000000000;
      expv[13] = 97'h0262830546af5c348266dcd1e;
      expv[14] = 97'h0262830546af5c348266dcd1e;
      expv[15] = 97'h0262830546af5c348266dcd1e;
      expv[16] = 97'h0000000019efb288200000000;
      expv[17] = 97'h0000000019efb288200000000;
      expv[18] = 97'h0000000019efb288200000000;
      expv[19] = 97'h0000000019efb288200000000;
      expv[20] = 97'h0000000019efb288200000000;
      expv[21] = 97'h0000000019efb288200000000;
      expv[22] = 97'h0000000019efb288200000000;
      expv[23] = 97'h0000000019efb288200000000;
      expv[24] = 97'h0000000005feceb6c00000001;
      expv[25] = 97'h0000000005feceb6c00000001;
      expv[26] = 97'h0000000005feceb6c00000001;
      expv[27] = 97'h0000000005feceb6c00000001;
      expv[28] = 97'h0000000005feceb6c00000000;
      expv[29] = 97'h0000000005feceb6c00000000;
      expv[30] = 97'h000000001f5be67d800000001;
      expv[31] = 97'h000000001f5be67d800000000;
      expv[32] = 97'h000000001f5be67d800000001;
      expv[33] = 97'h000000001f5be67d800000001;
      expv[34] = 97'h000000001f5be67d800000001;
      expv[35] = 97'h000000001f5be67d800000000;
      expv[36] = 97'h000000001f5be67d800000000;
      expv[37] = 97'h000000001f5be67d800000000;
      expv[38] = 97'h000000001f5be67d800000000;
      expv[39] = 97'h000000001f5be67d800000000;
      expv[40] = 97'h000000001f4e7e03a00000001;
      expv[41] = 97'h000000001b63dcd2a00000001;
      expv[42] = 97'h000000001b63dcd2a00000001;
      expv[43] = 97'h000000001b63dcd2a00000000;
      expv[44] = 97'h14b395d8a1102bc8cdf1d1ce8;
      expv[45] = 97'h14b395d8a1102bc8cdf1d1ce8;
      expv[46] = 97'h0000000001102bc8c00000000;
      expv[47] = 97'h0000000012f04152c00000001;
      expv[48] = 97'h0000000012f04152c00000001;
      expv[49] = 97'h0000000012f04152c00000001;
      expv[50] = 97'h0000000012f04152c00000001;
      expv[51] = 97'h0000000012f04152c00000000;
      expv[52] = 97'h0000000012f04152c00000000;
      expv[53] = 97'h0000000012f04152c00000001;
      expv[54] = 97'h000000000bf2e6c4200000001;
      expv[55] = 97'h000000000bf2e6c4200000001;
      expv[56] = 97'h000000000bf2e6c4200000001;
      expv[57] = 97'h000000000bf2e6c4200000001;
      expv[58] = 97'h000000000bf2e6c4200000001;
      expv[59] = 97'h000000000bf2e6c4200000000;
      expv[60] = 97'h000000000bf2e6c4200000001;
      expv[61] = 97'h000000000bf2e6c4200000001;
      expv[62] = 97'h000000000bf2e6c4200000001;
      expv[63] = 97'h000000000c22ddd0200000001;
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
