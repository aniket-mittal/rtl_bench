// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 63;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07584 dut (
    .in0(in_vec[62:54]),
    .in1(in_vec[53:31]),
    .in2(in_vec[30:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 63'h2125495cfaf8b45e;
    stim[1] = 63'h0a5e379e314a5440;
    stim[2] = 63'h313a9b5d4fe43438;
    stim[3] = 63'h294a741b28e7bb9a;
    stim[4] = 63'h7c71ad0fcf52dee3;
    stim[5] = 63'h285712b972e070e9;
    stim[6] = 63'h37ec1fe65434283c;
    stim[7] = 63'h148312edd92be782;
    stim[8] = 63'h3c275415ba847990;
    stim[9] = 63'h185d6402dc32653e;
    stim[10] = 63'h7c53dc778516f0f2;
    stim[11] = 63'h0eb07938d2251961;
    stim[12] = 63'h24415e0454472378;
    stim[13] = 63'h6260feafa29d3b48;
    stim[14] = 63'h73aeedd78d8cabc4;
    stim[15] = 63'h7dd1232b75aa4c64;
    stim[16] = 63'h6f22b346622f4518;
    stim[17] = 63'h69cb504ba4f9cba6;
    stim[18] = 63'h70053be3afdfa18b;
    stim[19] = 63'h50763f752e070621;
    stim[20] = 63'h14275530fe11f8ee;
    stim[21] = 63'h32e1846836a6c167;
    stim[22] = 63'h66fb89e25496e7b1;
    stim[23] = 63'h3281b2ab86f0c8e7;
    stim[24] = 63'h0346b97539a54770;
    stim[25] = 63'h244aaca2e75a179e;
    stim[26] = 63'h456834303b3d72a2;
    stim[27] = 63'h67476adda574f23b;
    stim[28] = 63'h0b9699e82f98aa5a;
    stim[29] = 63'h4433449cffdbe30d;
    stim[30] = 63'h0700ba5bad7e06d5;
    stim[31] = 63'h53376f97fc86728c;
    stim[32] = 63'h1937fe8804b49a5a;
    stim[33] = 63'h1beef094d75f17f8;
    stim[34] = 63'h67a2189e8d3bf797;
    stim[35] = 63'h62ff63f19b525cb5;
    stim[36] = 63'h2dcb5864d3bbd84c;
    stim[37] = 63'h32fa41e6ab0393c3;
    stim[38] = 63'h6f894021d75d60b4;
    stim[39] = 63'h1568f985352fe483;
    stim[40] = 63'h58d5d6de76cde788;
    stim[41] = 63'h3cf15b60665fb48e;
    stim[42] = 63'h5720912629fc8e8e;
    stim[43] = 63'h0c142c3c4dd20b3a;
    stim[44] = 63'h6c7ce49b6407bdba;
    stim[45] = 63'h16a4d1687465fc12;
    stim[46] = 63'h0949cb425d513ec7;
    stim[47] = 63'h0d4bea47f67838ba;
    stim[48] = 63'h0844555aab4e601a;
    stim[49] = 63'h1538b5e98b7c5ca3;
    stim[50] = 63'h7e30835909fcbf82;
    stim[51] = 63'h19dbeef172ec1ef0;
    stim[52] = 63'h0d69197695946340;
    stim[53] = 63'h47f6cf9ff9b9ba1a;
    stim[54] = 63'h1dbde89d59c445b4;
    stim[55] = 63'h19855b244423688e;
    stim[56] = 63'h5b8aa3b60221bcb5;
    stim[57] = 63'h2419fd55ddad3d6b;
    stim[58] = 63'h3045a69f997b6e80;
    stim[59] = 63'h76193850a9253a77;
    stim[60] = 63'h41443c01d0a123c9;
    stim[61] = 63'h157ea6f863f670a3;
    stim[62] = 63'h1f23361683a927a9;
    stim[63] = 63'h31eae62ff7eecca3;
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
      expv[0] = 32'ha16c5bc2;
      expv[1] = 32'h3af824dc;
      expv[2] = 32'ha9a21aa0;
      expv[3] = 32'h36616668;
      expv[4] = 32'h49809712;
      expv[5] = 32'h8fe5fd9b;
      expv[6] = 32'ha113baf0;
      expv[7] = 32'h5b2407a8;
      expv[8] = 32'h844221e0;
      expv[9] = 32'h72782f23;
      expv[10] = 32'h02c31af1;
      expv[11] = 32'h681c06fb;
      expv[12] = 32'h55d3a400;
      expv[13] = 32'h03f0741f;
      expv[14] = 32'hfb37c396;
      expv[15] = 32'h7475d35e;
      expv[16] = 32'h4fc007e8;
      expv[17] = 32'h1d1bf727;
      expv[18] = 32'h2d41afcb;
      expv[19] = 32'hdd14558b;
      expv[20] = 32'h96a7373e;
      expv[21] = 32'h6bcebe57;
      expv[22] = 32'h259c1b5d;
      expv[23] = 32'h099ebf8d;
      expv[24] = 32'h3a541d52;
      expv[25] = 32'h7371a7b3;
      expv[26] = 32'hf16da282;
      expv[27] = 32'h1fb84aea;
      expv[28] = 32'h37b7f9ba;
      expv[29] = 32'h1fbb3d9d;
      expv[30] = 32'h2da6cad9;
      expv[31] = 32'h2e918580;
      expv[32] = 32'h3073749a;
      expv[33] = 32'h8013b8bf;
      expv[34] = 32'hf3211e3d;
      expv[35] = 32'he16101f6;
      expv[36] = 32'h63f437fb;
      expv[37] = 32'h87681752;
      expv[38] = 32'h52984f6e;
      expv[39] = 32'h506596d5;
      expv[40] = 32'h5c045b3c;
      expv[41] = 32'hc4132cce;
      expv[42] = 32'h004295de;
      expv[43] = 32'h5562a1ba;
      expv[44] = 32'h3e72a610;
      expv[45] = 32'h8e493932;
      expv[46] = 32'h6025ffdb;
      expv[47] = 32'h7b673a55;
      expv[48] = 32'h2c6c616f;
      expv[49] = 32'h30b3bddf;
      expv[50] = 32'h06f489f2;
      expv[51] = 32'h896664de;
      expv[52] = 32'h2698ee51;
      expv[53] = 32'h1960c3bb;
      expv[54] = 32'h92d6b670;
      expv[55] = 32'h4868093e;
      expv[56] = 32'hf5ff011d;
      expv[57] = 32'h7aea3d9b;
      expv[58] = 32'h2200aaff;
      expv[59] = 32'h2143a14f;
      expv[60] = 32'h485378d8;
      expv[61] = 32'h8d915153;
      expv[62] = 32'h25c58d75;
      expv[63] = 32'hbaa0aa7c;
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
