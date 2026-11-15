// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_spsram_512x44 dut (
    .CLK(clk),
    .A(in_vec[98:90]),
    .CEN(in_vec[89:89]),
    .D(in_vec[88:45]),
    .GWEN(in_vec[44:44]),
    .WEN(in_vec[43:0]),
    .Q(out_vec[43:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h75d39a559a5e8619a6be30eaa;
    stim[1] = 99'h47d700660590bc2b716fcf6b1;
    stim[2] = 99'h18f3ea7ee0205ceaaf7583c9a;
    stim[3] = 99'h3aadb95bd832daba10dbfe463;
    stim[4] = 99'h0a94c2001815ad5ce6935c187;
    stim[5] = 99'h78f3550be8240c1e2ed43e0c9;
    stim[6] = 99'h55d9f0d5f949a1e66a1e92e02;
    stim[7] = 99'h0284e877135fe183d86d65e00;
    stim[8] = 99'h12e70ddada2b11d2384d96f3b;
    stim[9] = 99'h6cbfde1d1f6cd72360e9a74ba;
    stim[10] = 99'h4fe85d63de8556aa13a535b3b;
    stim[11] = 99'h2d1f4fec5df128451c36d0bdb;
    stim[12] = 99'h0ec1db5197a937f8fc9fe1c66;
    stim[13] = 99'h477492e42e1104798d019e41d;
    stim[14] = 99'h7e4f524f39f048b784fe97fe7;
    stim[15] = 99'h38688702daad31d48fa18dc6e;
    stim[16] = 99'h1091d716803faea76d3c446eb;
    stim[17] = 99'h762abaf563eadea9f991969a9;
    stim[18] = 99'h224934f870441684a7c67cf65;
    stim[19] = 99'h7fed43ee8796d78c2aea1301d;
    stim[20] = 99'h3ce72fd851bbe06bdc75517ea;
    stim[21] = 99'h530db3cac59700223064a2b98;
    stim[22] = 99'h71c257b01438f450b311e35bb;
    stim[23] = 99'h7c7107b947ab5b20f05881221;
    stim[24] = 99'h46517922d2073e786ced3a134;
    stim[25] = 99'h552d974da8020e6f86a222e84;
    stim[26] = 99'h499712f10cb7455b05cd854cb;
    stim[27] = 99'h1040a9826615908c92f9fe73f;
    stim[28] = 99'h66835157dd56715721580d1f4;
    stim[29] = 99'h359ba0fc4d1c344bfa0c5a20f;
    stim[30] = 99'h18b892bbb562eb5bdcc8d4ee7;
    stim[31] = 99'h5def1fd282aeed7233f8a9fd0;
    stim[32] = 99'h1f3d3ce173ac317bb3b9a4aa5;
    stim[33] = 99'h693554cbd6e667fccd460e7fb;
    stim[34] = 99'h0f2fac67430c382c3e98076f4;
    stim[35] = 99'h67199d631d34f965914fdf8d9;
    stim[36] = 99'h392a75b1e9d90a50dec5964c5;
    stim[37] = 99'h549413172ff22ba955d9918a9;
    stim[38] = 99'h681a2c8b8c3ede86125476948;
    stim[39] = 99'h0baf61bf0d224c04205570c27;
    stim[40] = 99'h637409305ac4a4d4e9d719df8;
    stim[41] = 99'h4e24ce8019cdd44651a575a55;
    stim[42] = 99'h4256bf0afbcbf64ba18a4e4ce;
    stim[43] = 99'h2c0875477125a2bde34580d7f;
    stim[44] = 99'h4b081275bec55e62e7cbe6c5d;
    stim[45] = 99'h47d5da93903d7d4fc2d939b3d;
    stim[46] = 99'h0b6509e5e3d3a4ddefea34e64;
    stim[47] = 99'h4aca0ee095cd082e1e30be67e;
    stim[48] = 99'h59f1b23f94c2ace4264691be3;
    stim[49] = 99'h1dfc805770e06f76895282a68;
    stim[50] = 99'h366703d241b045b5c0a958bff;
    stim[51] = 99'h0f20b8eb3789d430ebe76c65a;
    stim[52] = 99'h1b67b9ddf5f5b5d72e067ccaa;
    stim[53] = 99'h2e46bda48754b1e102872d0b2;
    stim[54] = 99'h7312c319bae0d557726fc1bb8;
    stim[55] = 99'h06a07ce38ad4ab88beb398fef;
    stim[56] = 99'h6a34e8aeba0d933df0f9e7ebc;
    stim[57] = 99'h0d92412ee8b1428d35761a155;
    stim[58] = 99'h1a7b19ad763cf77b1b1137b58;
    stim[59] = 99'h451ef0719e2c0fbc02d545be6;
    stim[60] = 99'h269378a358c44990757180d20;
    stim[61] = 99'h4bb0196e69dce724bdcb8408d;
    stim[62] = 99'h61efdbd47fa7e3324f4b52b7b;
    stim[63] = 99'h1505b9899a6d8e07436c26021;
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
      expv[0] = 44'hxxxxxxxxxxx;
      expv[1] = 44'h9cd2axxxxxx;
      expv[2] = 44'hb8033xxxxxx;
      expv[3] = 44'hb8033xxxxxx;
      expv[4] = 44'hb8033xxxxxx;
      expv[5] = 44'hxxxxxxxxxxx;
      expv[6] = 44'hxxxxxxxxxxx;
      expv[7] = 44'hxxxxxxxxxxx;
      expv[8] = 44'hxxxxxxxxxxx;
      expv[9] = 44'hxxxxxxxxxxx;
      expv[10] = 44'hxxxxxxxxxxx;
      expv[11] = 44'hxxxxxxxxxxx;
      expv[12] = 44'hfa7f6xxxxxx;
      expv[13] = 44'hxxxxxxxxxxx;
      expv[14] = 44'hxxxxxxxxxxx;
      expv[15] = 44'hxxxxxxxxxxx;
      expv[16] = 44'hxxxxxxxxxxx;
      expv[17] = 44'hxxxxxx01fd7;
      expv[18] = 44'hxxxxxx01fd7;
      expv[19] = 44'hxxxxxxxxxxx;
      expv[20] = 44'hxxxxxxxxxxx;
      expv[21] = 44'hxxxxxxxxxxx;
      expv[22] = 44'h6d9e562cb80;
      expv[23] = 44'h12bd80a1c7a;
      expv[24] = 44'h12bd80a1c7a;
      expv[25] = 44'h8bc9169039f;
      expv[26] = 44'h8bc9169039f;
      expv[27] = 44'hxxxxxxxxxxx;
      expv[28] = 44'hxxxxxx30ac8;
      expv[29] = 44'hxxxxxxxxxxx;
      expv[30] = 44'hdd07e268e1a;
      expv[31] = 44'hdd07e268e1a;
      expv[32] = 44'hdd07e268e1a;
      expv[33] = 44'hdd07e268e1a;
      expv[34] = 44'hdd07e268e1a;
      expv[35] = 44'hdd07e268e1a;
      expv[36] = 44'hxxxxxxxxxxx;
      expv[37] = 44'hxxxxxxxxxxx;
      expv[38] = 44'hxxxxxxxxxxx;
      expv[39] = 44'hxxxxxx61f6f;
      expv[40] = 44'hxxxxxx61f6f;
      expv[41] = 44'hxxxxxx61f6f;
      expv[42] = 44'hxxxxxx61f6f;
      expv[43] = 44'hb5f85xxxxxx;
      expv[44] = 44'hxxxxxx892d1;
      expv[45] = 44'h4093axxxxxx;
      expv[46] = 44'hb8033xxxxxx;
      expv[47] = 44'hb8033xxxxxx;
      expv[48] = 44'h507704ae684;
      expv[49] = 44'h507704ae684;
      expv[50] = 44'h507704ae684;
      expv[51] = 44'h507704ae684;
      expv[52] = 44'h507704ae684;
      expv[53] = 44'h507704ae684;
      expv[54] = 44'hxxxxxxxxxxx;
      expv[55] = 44'hxxxxxxxxxxx;
      expv[56] = 44'hxxxxxxxxxxx;
      expv[57] = 44'hxxxxxxxxxxx;
      expv[58] = 44'hxxxxxxxxxxx;
      expv[59] = 44'hxxxxxxxxxxx;
      expv[60] = 44'hxxxxxxxxxxx;
      expv[61] = 44'hxxxxxxxxxxx;
      expv[62] = 44'hxxxxxxxxxxx;
      expv[63] = 44'hxxxxxxxxxxx;
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
