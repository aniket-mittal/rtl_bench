// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144922 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .angle(in_vec[31:0]),
    .sin_out(out_vec[95:64]),
    .cos_out(out_vec[63:32]),
    .tan_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1be515877;
    stim[1] = 33'h1bd21340f;
    stim[2] = 33'h02bb6202b;
    stim[3] = 33'h09301573d;
    stim[4] = 33'h007e307a8;
    stim[5] = 33'h0a769c48f;
    stim[6] = 33'h042046638;
    stim[7] = 33'h0723c028c;
    stim[8] = 33'h05aa0eb81;
    stim[9] = 33'h00f2d99ab;
    stim[10] = 33'h011a0fbe1;
    stim[11] = 33'h068a002f2;
    stim[12] = 33'h08024c2e1;
    stim[13] = 33'h02e8d9cc6;
    stim[14] = 33'h00ea28e7a;
    stim[15] = 33'h091fbc770;
    stim[16] = 33'h03ff440b1;
    stim[17] = 33'h1fab566c7;
    stim[18] = 33'h0ab58ea30;
    stim[19] = 33'h07d9bc81f;
    stim[20] = 33'h06a40b6e6;
    stim[21] = 33'h01975e826;
    stim[22] = 33'h0e228dfd9;
    stim[23] = 33'h08dfa0362;
    stim[24] = 33'h0b865bf9a;
    stim[25] = 33'h0c7f67738;
    stim[26] = 33'h0c78ef2f9;
    stim[27] = 33'h0e60ae831;
    stim[28] = 33'h069fca2ec;
    stim[29] = 33'h030f1b70d;
    stim[30] = 33'h02868e705;
    stim[31] = 33'h00500aca7;
    stim[32] = 33'h04ae14a41;
    stim[33] = 33'h053613d73;
    stim[34] = 33'h0876f0b82;
    stim[35] = 33'h0b5ebd10d;
    stim[36] = 33'h0812b4ad3;
    stim[37] = 33'h04c71afda;
    stim[38] = 33'h07a152934;
    stim[39] = 33'h0d24b56ad;
    stim[40] = 33'h0d49378d1;
    stim[41] = 33'h01244ca88;
    stim[42] = 33'h04edc7568;
    stim[43] = 33'h03be304fd;
    stim[44] = 33'h097093cf6;
    stim[45] = 33'h001343360;
    stim[46] = 33'h0e2d07c9a;
    stim[47] = 33'h0bcdc5211;
    stim[48] = 33'h0664c2f8c;
    stim[49] = 33'h075f26ba3;
    stim[50] = 33'h0a8db2dd9;
    stim[51] = 33'h09a5e7319;
    stim[52] = 33'h057321604;
    stim[53] = 33'h0f3c49d94;
    stim[54] = 33'h00e222f00;
    stim[55] = 33'h00ee8689c;
    stim[56] = 33'h01f76474e;
    stim[57] = 33'h0312d6f37;
    stim[58] = 33'h07f702deb;
    stim[59] = 33'h0b05b6f4e;
    stim[60] = 33'h02ea238bb;
    stim[61] = 33'h0267f18b0;
    stim[62] = 33'h0d340af08;
    stim[63] = 33'h02df8a01b;
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
      expv[0] = 96'h000000000001000000000000;
      expv[1] = 96'h000000000001000000000000;
      expv[2] = 96'h000000000001000000000000;
      expv[3] = 96'hxxxxxxxxxxxxxxxx00000000;
      expv[4] = 96'h0000000000010000xxxxxxxx;
      expv[5] = 96'h2bb6202b0000e66900000000;
      expv[6] = 96'h93008598000092e6000023bd;
      expv[7] = 96'h07e291eb00009deb0000e8d0;
      expv[8] = 96'ha7699c600000cce40000ec8b;
      expv[9] = 96'h420433380000e2b80000c361;
      expv[10] = 96'h723bbd7000008f2d000039d5;
      expv[11] = 96'h5aa06b060000890d000152b7;
      expv[12] = 96'h0f2d54b00000c9d30000c7e9;
      expv[13] = 96'h11a083e50000a67700006b6b;
      expv[14] = 96'h689f607c0000d8bc0000cad5;
      expv[15] = 96'h802406910000ce30000071f6;
      expv[16] = 96'h2e8d81730000e2f200000827;
      expv[17] = 96'h000000000001000000000000;
      expv[18] = 96'h000000000001000000000000;
      expv[19] = 96'h91fb376a0000b78100000000;
      expv[20] = 96'h000000000001000000004d4e;
      expv[21] = 96'hab58ea300000846300000000;
      expv[22] = 96'h7d9b1ad20000e4030001c4da;
      expv[23] = 96'h6a3ff0e20000c92b00001e1c;
      expv[24] = 96'h19755c6a0000c7600001328a;
      expv[25] = 96'he228534c0000923b000076a9;
      expv[26] = 96'h8df9748e0000b847000091d3;
      expv[27] = 96'hb864fb590000f08b0000a1eb;
      expv[28] = 96'hc7f64a1e0000cc6e00010b7f;
      expv[29] = 96'hc78e012a0000b79500005cd0;
      expv[30] = 96'he60a059e0000feca0000019f;
      expv[31] = 96'h69fbce0500009fd9000005a4;
      expv[32] = 96'h30f1b2920000fb52000149f2;
      expv[33] = 96'h2867ebdf0000f5bb0000b5e5;
      expv[34] = 96'h04ffad62000082c80000f5ba;
      expv[35] = 96'h4ae145030000e81b00015364;
      expv[36] = 96'h5360a87f0000e70d00004c1d;
      expv[37] = 96'h876e905d0000f4600000bab0;
      expv[38] = 96'hb5eb0ab2000092b60000973b;
      expv[39] = 96'h812adf35000090a0000012a9;
      expv[40] = 96'h4c713fb60000ec6100018b19;
      expv[41] = 96'h7a1474110000d36c000044ff;
      expv[42] = 96'hd24b04760000a2a500008c89;
      expv[43] = 96'hd492c39e0000ef7b00000705;
      expv[44] = 96'h12443e050000d3c30000d11c;
      expv[45] = 96'h4edb7e8e0000cfb400004af9;
      expv[46] = 96'h3be22f550000c49d00009bfb;
      expv[47] = 96'h97090d2f0000ba1800003da0;
      expv[48] = 96'h013358140000ab5900001222;
      expv[49] = 96'he2cfd2ba0000b08e00008397;
      expv[50] = 96'hbcdbe1aa0000f03d0001318c;
      expv[51] = 96'h664c21bd000096060000f078;
      expv[52] = 96'h75f1d8b40000aa4a00003992;
      expv[53] = 96'ha8da61ac0000db42000145c6;
      expv[54] = 96'h9a5d9280000098f30000720a;
      expv[55] = 96'h5731c70a0000d6460000f534;
      expv[56] = 96'hf3c413fb0000ae310000edcc;
      expv[57] = 96'h0e21e2ea0000bdb000001d5d;
      expv[58] = 96'h0ee7db1b000095410001323d;
      expv[59] = 96'h1f763b9e0000a61e000177cf;
      expv[60] = 96'h312d50600000d42d00005bdf;
      expv[61] = 96'h7f70294c0000d012000060f9;
      expv[62] = 96'hb05b25710000b714000032cf;
      expv[63] = 96'h2ea19e480000f9610000345a;
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
