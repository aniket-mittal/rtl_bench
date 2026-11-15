// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213942 dut (
    .clk(clk),
    .reset(in_vec[65:65]),
    .start(in_vec[64:64]),
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .D(out_vec[65:34]),
    .R(out_vec[33:2]),
    .ok(out_vec[1:1]),
    .err(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h257e1472b1c15c714;
    stim[1] = 66'h2005dc71da683c0fa;
    stim[2] = 66'h1545afe2c7245f2a5;
    stim[3] = 66'h03d9492d9740f1861;
    stim[4] = 66'h0391d98515a2f8dc3;
    stim[5] = 66'h0cbc9ac262c0d867a;
    stim[6] = 66'h04874c1d1332327bd;
    stim[7] = 66'h11c12702befa93fab;
    stim[8] = 66'h1107b94c7d7480cf2;
    stim[9] = 66'h1748f9713f850d7ab;
    stim[10] = 66'h0dfe3d6e98119649e;
    stim[11] = 66'h0d643655c528760ad;
    stim[12] = 66'h0e6a133c70388a4af;
    stim[13] = 66'h1d15d119eec626138;
    stim[14] = 66'h0a23b12d708fb73ec;
    stim[15] = 66'h0158ffd38f838b59f;
    stim[16] = 66'h0c44d44f28c5cbce7;
    stim[17] = 66'h11578c991a8329c35;
    stim[18] = 66'h102dac6d075aea73e;
    stim[19] = 66'h07590f343d512581f;
    stim[20] = 66'h02ee50f36f5052bfb;
    stim[21] = 66'h1ac8c7f9166a63f17;
    stim[22] = 66'h1851fc9f5eaeae4f7;
    stim[23] = 66'h10edd300de78439b7;
    stim[24] = 66'h112978306022930dd;
    stim[25] = 66'h04afd7d7972e8419f;
    stim[26] = 66'h025c103f6028273b8;
    stim[27] = 66'h066f4beb2db77f874;
    stim[28] = 66'h0bd5adffb2968384e;
    stim[29] = 66'h136a610cb2dea4022;
    stim[30] = 66'h0983d37294eff2e7f;
    stim[31] = 66'h04979db10ff80e792;
    stim[32] = 66'h107250b4d3ac3109d;
    stim[33] = 66'h1ed8c0f56691ca78f;
    stim[34] = 66'h1c31313353b437622;
    stim[35] = 66'h18e23dfe16cdd4b22;
    stim[36] = 66'h1d1015c7ba28edc50;
    stim[37] = 66'h33fde8b19dcbecaf9;
    stim[38] = 66'h0452f07852f0f01eb;
    stim[39] = 66'h0106448f984ee5cd9;
    stim[40] = 66'h0ee056ea23ea7f3c2;
    stim[41] = 66'h1e8364178f4c03abf;
    stim[42] = 66'h104377f412e11f5f3;
    stim[43] = 66'h057fcdf85fc7d1970;
    stim[44] = 66'h156ce141ad434bc29;
    stim[45] = 66'h051350536ccdac194;
    stim[46] = 66'h1bcedf2583a698b4e;
    stim[47] = 66'h07b033350411442c9;
    stim[48] = 66'h11767638280f86bf7;
    stim[49] = 66'h10780764e54b4f075;
    stim[50] = 66'h0c1f2d9877247ad1a;
    stim[51] = 66'h1ade2b708e8cd7239;
    stim[52] = 66'h19edc4b1172738339;
    stim[53] = 66'h0dce0b4158116b74c;
    stim[54] = 66'h12e174b83c06324a8;
    stim[55] = 66'h16f1498dc420cc88c;
    stim[56] = 66'h01f9cfc006577050c;
    stim[57] = 66'h00b2dc8e6f5282e91;
    stim[58] = 66'h090a64a07baa7ad08;
    stim[59] = 66'h0c59601dc4ce2c32a;
    stim[60] = 66'h1bc2d73ca118f274d;
    stim[61] = 66'h075f4c0ba26423336;
    stim[62] = 66'h2eb66d8bfc3a935a4;
    stim[63] = 66'h175f167f5410d18fd;
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
      expv[0] = 66'h00000000000000002;
      expv[1] = 66'h00000000000000002;
      expv[2] = 66'h00000000000000002;
      expv[3] = 66'h000000001516bf8b0;
      expv[4] = 66'h000000002a2d7f160;
      expv[5] = 66'h000000004d9c026cc;
      expv[6] = 66'h000000009b3804d9c;
      expv[7] = 66'h00000001367009b38;
      expv[8] = 66'h0000000007049c0ac;
      expv[9] = 66'h00000000041ee531c;
      expv[10] = 66'h000000001d23e5c4c;
      expv[11] = 66'h000000003a47cb898;
      expv[12] = 66'h00000000348f97130;
      expv[13] = 66'h00000000291f2e260;
      expv[14] = 66'h00000000345744678;
      expv[15] = 66'h0000000028ae88cf0;
      expv[16] = 66'h00000000115d119e0;
      expv[17] = 66'h0000000022ba233c0;
      expv[18] = 66'h00000000055e32644;
      expv[19] = 66'h0000000000b6b1b40;
      expv[20] = 66'h00000000016d63680;
      expv[21] = 66'h0000000002dac6d00;
      expv[22] = 66'h000000002b231fe44;
      expv[23] = 66'h000000002147f27d4;
      expv[24] = 66'h0000000003b74c034;
      expv[25] = 66'h0000000004a5e0c18;
      expv[26] = 66'h00000000441b948a4;
      expv[27] = 66'h00000000c39148530;
      expv[28] = 66'h00000001c306fc1bc;
      expv[29] = 66'h00000003c27cafe48;
      expv[30] = 66'h000000000da98432c;
      expv[31] = 66'h00000000422ef42a4;
      expv[32] = 66'h00000000845de854c;
      expv[33] = 66'h0000000001c942d34;
      expv[34] = 66'h000000003b6303d58;
      expv[35] = 66'h0000000030c4c4cd4;
      expv[36] = 66'h000000002388f7f84;
      expv[37] = 66'h00000000000000002;
      expv[38] = 66'h00000000000000002;
      expv[39] = 66'h00000000000000002;
      expv[40] = 66'h00000000000000002;
      expv[41] = 66'h00000000000000002;
      expv[42] = 66'h000000003a0d905e0;
      expv[43] = 66'h00000000010ddfd04;
      expv[44] = 66'h00000000021bbfa08;
      expv[45] = 66'h0000000015b385068;
      expv[46] = 66'h000000002b670a0d0;
      expv[47] = 66'h000000002f3b7c960;
      expv[48] = 66'h0000000060a119c28;
      expv[49] = 66'h0000000005d9d8e08;
      expv[50] = 66'h0000000001e01d938;
      expv[51] = 66'h0000000003c03b270;
      expv[52] = 66'h000000002b78adc20;
      expv[53] = 66'h0000000027b712c44;
      expv[54] = 66'h000000004b1a31f60;
      expv[55] = 66'h000000000b85d2e0c;
      expv[56] = 66'h000000001bc526370;
      expv[57] = 66'h000000004b41f4140;
      expv[58] = 66'h000000009683e8284;
      expv[59] = 66'h000000014600b6054;
      expv[60] = 66'h000000028c016c0ac;
      expv[61] = 66'h000000002f0b5cf28;
      expv[62] = 66'h00000000000000002;
      expv[63] = 66'h00000000000000002;
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
