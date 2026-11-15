// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_010209 dut (
    .clk(clk),
    .rst_n(in_vec[28:28]),
    .din_data(in_vec[27:4]),
    .din_valid(in_vec[3:3]),
    .din_startofpacket(in_vec[2:2]),
    .din_endofpacket(in_vec[1:1]),
    .dout_ready(in_vec[0:0]),
    .din_ready(out_vec[63:63]),
    .im_width(out_vec[62:47]),
    .im_height(out_vec[46:31]),
    .im_interlaced(out_vec[30:27]),
    .dout_data(out_vec[26:3]),
    .dout_valid(out_vec[2:2]),
    .dout_startofpacket(out_vec[1:1]),
    .dout_endofpacket(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h0c5509d0;
    stim[1] = 29'h021aaeb1;
    stim[2] = 29'h10fc1c41;
    stim[3] = 29'h15ab2e34;
    stim[4] = 29'h168602f4;
    stim[5] = 29'h1a2b60fb;
    stim[6] = 29'h1ab0ad8e;
    stim[7] = 29'h1658e0c6;
    stim[8] = 29'h159e2b72;
    stim[9] = 29'h14beac68;
    stim[10] = 29'h1f8cfd61;
    stim[11] = 29'h1930584d;
    stim[12] = 29'h12926317;
    stim[13] = 29'h18725d4f;
    stim[14] = 29'h1a9fa7fa;
    stim[15] = 29'h1fb84596;
    stim[16] = 29'h1ceb4a0b;
    stim[17] = 29'h19e29005;
    stim[18] = 29'h11a515dc;
    stim[19] = 29'h1fb85391;
    stim[20] = 29'h1bbc7684;
    stim[21] = 29'h1d5ac111;
    stim[22] = 29'h109a7452;
    stim[23] = 29'h1133b711;
    stim[24] = 29'h1c00b1a1;
    stim[25] = 29'h1b451851;
    stim[26] = 29'h1eb0ebe7;
    stim[27] = 29'h1cb9d45a;
    stim[28] = 29'h1d89bbf6;
    stim[29] = 29'h1b86bf92;
    stim[30] = 29'h19dc1dc0;
    stim[31] = 29'h1e3af230;
    stim[32] = 29'h15c039f7;
    stim[33] = 29'h15130b1f;
    stim[34] = 29'h1b31b872;
    stim[35] = 29'h168d9d18;
    stim[36] = 29'h14ef26c5;
    stim[37] = 29'h1e54412d;
    stim[38] = 29'h1aeaa975;
    stim[39] = 29'h190d237d;
    stim[40] = 29'h13863f97;
    stim[41] = 29'h14c06e2b;
    stim[42] = 29'h1bfb580c;
    stim[43] = 29'h11100ecd;
    stim[44] = 29'h1a59c403;
    stim[45] = 29'h115bb7c3;
    stim[46] = 29'h16848813;
    stim[47] = 29'h11036844;
    stim[48] = 29'h1bdc7667;
    stim[49] = 29'h1866335b;
    stim[50] = 29'h12dcecfa;
    stim[51] = 29'h14fad050;
    stim[52] = 29'h15d5402f;
    stim[53] = 29'h1d7d533b;
    stim[54] = 29'h1b793991;
    stim[55] = 29'h1978b63e;
    stim[56] = 29'h1a90e6bf;
    stim[57] = 29'h120f91ed;
    stim[58] = 29'h18df3db3;
    stim[59] = 29'h18c13fde;
    stim[60] = 29'h14236bdc;
    stim[61] = 29'h1516a1e5;
    stim[62] = 29'h1453f5e2;
    stim[63] = 29'h1aacbb67;
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
      expv[0] = 64'h80000000062a84e8;
      expv[1] = 64'h80000000010d5758;
      expv[2] = 64'h80000000007e0e20;
      expv[3] = 64'h8000000002d59718;
      expv[4] = 64'h8000000003430178;
      expv[5] = 64'h800000000515b078;
      expv[6] = 64'h80000000055856c0;
      expv[7] = 64'h80000000032c7060;
      expv[8] = 64'h8000000002cf15b8;
      expv[9] = 64'h80000000025f5630;
      expv[10] = 64'h8000000007c67eb0;
      expv[11] = 64'h8000000004982c20;
      expv[12] = 64'h8000000001493188;
      expv[13] = 64'h8000000004392ea0;
      expv[14] = 64'h80000000054fd3f8;
      expv[15] = 64'h8000000007dc22c8;
      expv[16] = 64'h800000000675a500;
      expv[17] = 64'h8000000004f14800;
      expv[18] = 64'h8000000000d28ae8;
      expv[19] = 64'h8000000007dc29c8;
      expv[20] = 64'h8000000005de3b40;
      expv[21] = 64'h8000000006ad6088;
      expv[22] = 64'h80000000004d3a28;
      expv[23] = 64'h800000000099db88;
      expv[24] = 64'h80000000060058d0;
      expv[25] = 64'h8000000005a28c28;
      expv[26] = 64'h80000000075875f0;
      expv[27] = 64'h80000000065cea28;
      expv[28] = 64'h8000000006c4ddf8;
      expv[29] = 64'h8000000005c35fc8;
      expv[30] = 64'h8000000004ee0ee0;
      expv[31] = 64'h80000000071d7918;
      expv[32] = 64'h8000000002e01cf8;
      expv[33] = 64'h8000000002898588;
      expv[34] = 64'h800000000598dc38;
      expv[35] = 64'h800000000346ce88;
      expv[36] = 64'h8000000002779360;
      expv[37] = 64'h80000000072a2090;
      expv[38] = 64'h80000000057554b8;
      expv[39] = 64'h80000000048691b8;
      expv[40] = 64'h8000000001c31fc8;
      expv[41] = 64'h8000000002603710;
      expv[42] = 64'h0000000005fdac00;
      expv[43] = 64'h8000000000880766;
      expv[44] = 64'h80000000052ce201;
      expv[45] = 64'h8000000000addbe1;
      expv[46] = 64'h8000000003424409;
      expv[47] = 64'h000000000081b420;
      expv[48] = 64'h8000000005ee3b31;
      expv[49] = 64'h80000000043319ad;
      expv[50] = 64'h80000000016e7678;
      expv[51] = 64'h80000000027d6828;
      expv[52] = 64'h8000000002eaa010;
      expv[53] = 64'h8000000006bea998;
      expv[54] = 64'h8000000005bc9cc8;
      expv[55] = 64'h8000000004bc5b18;
      expv[56] = 64'h8000000005487358;
      expv[57] = 64'h800000000107c8f0;
      expv[58] = 64'h80000000046f9ed8;
      expv[59] = 64'h8000000004609fe8;
      expv[60] = 64'h800000000211b5e8;
      expv[61] = 64'h80000000028b50f0;
      expv[62] = 64'h800000000229faf0;
      expv[63] = 64'h8000000005565db0;
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
