// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070496 dut (
    .clk(clk),
    .reset(in_vec[68:68]),
    .op_div(in_vec[67:67]),
    .op_signed(in_vec[66:66]),
    .op_set_remainder(in_vec[65:65]),
    .op_set_quotient(in_vec[64:64]),
    .in_data0(in_vec[63:32]),
    .in_data1(in_vec[31:0]),
    .out_en(out_vec[65:65]),
    .out_quotient(out_vec[64:33]),
    .out_remainder(out_vec[32:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h12c27b3d46b9c40163;
    stim[1] = 69'h1008dbcc127b7150d4;
    stim[2] = 69'h028f93c48b75be103f;
    stim[3] = 69'h1d367af4eb98aceed5;
    stim[4] = 69'h01bbbb634e3738d429;
    stim[5] = 69'h08c2eee77621626f8e;
    stim[6] = 69'h0e167ccadab0c4c926;
    stim[7] = 69'h0b62c6154f1912277c;
    stim[8] = 69'h073ba24096af0eb1ac;
    stim[9] = 69'h03135e7fb55ad19279;
    stim[10] = 69'h0a95da872ee515c4a3;
    stim[11] = 69'h0c71679bdae92a7813;
    stim[12] = 69'h09d18e3995d322f763;
    stim[13] = 69'h02c05b855baed0aa02;
    stim[14] = 69'h00f9b7419fb16b891d;
    stim[15] = 69'h036945793dcfdf9d27;
    stim[16] = 69'h0eaefef88c268a3d42;
    stim[17] = 69'h0db9a5ef62580b8fcc;
    stim[18] = 69'h07b40a41a44b36be70;
    stim[19] = 69'h034dea9ef1334ba9d7;
    stim[20] = 69'h0ee1d2551ade81b286;
    stim[21] = 69'h092806d66a2e815f64;
    stim[22] = 69'h148b549625eae95f89;
    stim[23] = 69'h0a3f464c7c6f72c804;
    stim[24] = 69'h091ba3460335fe319b;
    stim[25] = 69'h08c604decc72cc4b97;
    stim[26] = 69'h00c67bc542efe20298;
    stim[27] = 69'h0bb4b43fc0aa557cd1;
    stim[28] = 69'h0028df128fd82d1e20;
    stim[29] = 69'h0488dd7bdbc80ec6c7;
    stim[30] = 69'h07e46bf7441a4a1a34;
    stim[31] = 69'h007b96dfa895f046e2;
    stim[32] = 69'h0a385222e2aa822497;
    stim[33] = 69'h1b871587f608b9beb9;
    stim[34] = 69'h07a2d91de780cc4346;
    stim[35] = 69'h0d29b972c6571f14ce;
    stim[36] = 69'h0bf188220812384dc0;
    stim[37] = 69'h04fc77145222ab270d;
    stim[38] = 69'h0de6411cdbb77d6ef9;
    stim[39] = 69'h0f9d0730a48044fa8c;
    stim[40] = 69'h0d1f5935af0a036c2f;
    stim[41] = 69'h0ed633317fc5731b80;
    stim[42] = 69'h07bfcc0e7354fea226;
    stim[43] = 69'h0a24ebaef5a7ceed5b;
    stim[44] = 69'h0d4b50d8b82c66d3e1;
    stim[45] = 69'h0b6dcde60fa6a843c7;
    stim[46] = 69'h0a7a00ea163ae3a04a;
    stim[47] = 69'h0d9ba8b052d8ef6f56;
    stim[48] = 69'h0ee1cc3b957ec41d01;
    stim[49] = 69'h008921c976aab5dc76;
    stim[50] = 69'h045b00e5ad95e3a629;
    stim[51] = 69'h021fbf1be18a65c682;
    stim[52] = 69'h057389d5003d3e7f98;
    stim[53] = 69'h0c9e921ca9c6ae39a9;
    stim[54] = 69'h084b470907152720e4;
    stim[55] = 69'h0e9571869c9c42ccc0;
    stim[56] = 69'h0e482a692dfffea108;
    stim[57] = 69'h006af1d09c1419adbb;
    stim[58] = 69'h060a043d7d034fc2e2;
    stim[59] = 69'h024a58d3e65e35bb52;
    stim[60] = 69'h082afe1757c8fe47d8;
    stim[61] = 69'h04247beedfce969566;
    stim[62] = 69'h0dc57e4a5b866f4b48;
    stim[63] = 69'h0e0c04dc3fbe193bcc;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxx1f278916;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'h17776c69xxxxxxxxx;
      expv[6] = 66'h185ddceec00000001;
      expv[7] = 66'h10bbb9dd800000003;
      expv[8] = 66'h017773bb000000007;
      expv[9] = 66'h02eee77600000000d;
      expv[10] = 66'h05ddceec000000019;
      expv[11] = 66'h0bbb9dd8000000031;
      expv[12] = 66'h17773bb0000000061;
      expv[13] = 66'h0eee77600000000c3;
      expv[14] = 66'h1ddceec0000000185;
      expv[15] = 66'h1bb9dd8000000030b;
      expv[16] = 66'h1773bb00000000617;
      expv[17] = 66'h0ee77600000000c2f;
      expv[18] = 66'h1dceec0000000185d;
      expv[19] = 66'h1b9dd8000000030bb;
      expv[20] = 66'h173bb000000006177;
      expv[21] = 66'h0e77600000000c2ef;
      expv[22] = 66'h1ceec0000000185dd;
      expv[23] = 66'hxxxxxxxxxxxxxxxxx;
      expv[24] = 66'h07e8c98f800000001;
      expv[25] = 66'h0fd1931f000000001;
      expv[26] = 66'h1fa3263e000000001;
      expv[27] = 66'h1f464c7c000000003;
      expv[28] = 66'h1e8c98f8000000007;
      expv[29] = 66'h1d1931f000000000f;
      expv[30] = 66'h1a3263e000000001f;
      expv[31] = 66'h1464c7c000000003f;
      expv[32] = 66'h08c98f8000000007f;
      expv[33] = 66'h11931f000000000fd;
      expv[34] = 66'hxxxxxxxxxxxxxxxxx;
      expv[35] = 66'h145b23bcf45b23bce;
      expv[36] = 66'h05372e58c00000001;
      expv[37] = 66'h0a6e5cb1800000001;
      expv[38] = 66'h14dcb963000000001;
      expv[39] = 66'h09b972c6000000003;
      expv[40] = 66'h1372e58c000000005;
      expv[41] = 66'h06e5cb1800000000b;
      expv[42] = 66'h0dcb9630000000015;
      expv[43] = 66'h1b972c60000000029;
      expv[44] = 66'h172e58c0000000053;
      expv[45] = 66'h0e5cb1800000000a7;
      expv[46] = 66'h1cb9630000000014d;
      expv[47] = 66'h1972c60000000029b;
      expv[48] = 66'h12e58c00000000537;
      expv[49] = 66'h05cb1800000000a6f;
      expv[50] = 66'h0b9630000000014dd;
      expv[51] = 66'h172c60000000029b9;
      expv[52] = 66'h0e58c000000005373;
      expv[53] = 66'h1cb1800000000a6e5;
      expv[54] = 66'h19630000000014dcb;
      expv[55] = 66'h12c60000000029b97;
      expv[56] = 66'h058c000000005372f;
      expv[57] = 66'h0b1800000000a6e5d;
      expv[58] = 66'h1630000000014dcb9;
      expv[59] = 66'h0c60000000029b973;
      expv[60] = 66'h18c000000005372e5;
      expv[61] = 66'h11800000000a6e5cb;
      expv[62] = 66'h030000000014dcb97;
      expv[63] = 66'h060000000029b972d;
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
