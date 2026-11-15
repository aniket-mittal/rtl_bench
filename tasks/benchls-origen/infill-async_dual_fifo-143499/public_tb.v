// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 102;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143499 dut (
    .int_clk(clk),
    .ext_clk(in_vec[75:75]),
    .rst(in_vec[74:74]),
    .RAM_D_pi(in_vec[73:38]),
    .datain(in_vec[37:2]),
    .src_rdy_i(in_vec[1:1]),
    .dst_rdy_i(in_vec[0:0]),
    .dataout(out_vec[101:66]),
    .src_rdy_o(out_vec[65:65]),
    .dst_rdy_o(out_vec[64:64]),
    .debug(out_vec[63:32]),
    .debug2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'hf27bb8b77e881dbce6b;
    stim[1] = 76'hfa6aef06cdedf098df0;
    stim[2] = 76'h314928935d4c067a503;
    stim[3] = 76'h3453613a111294822b0;
    stim[4] = 76'hbe4949905f2e3230561;
    stim[5] = 76'h9472de0a9a689421018;
    stim[6] = 76'h8d4ddb862b528c179c4;
    stim[7] = 76'ha72bdd1580a71f0b3f3;
    stim[8] = 76'h13a8a3ca6919e0f695b;
    stim[9] = 76'h88e61182b343e6efb21;
    stim[10] = 76'h1076ab94fa3c8c05085;
    stim[11] = 76'hbd74d428f88d9b65a24;
    stim[12] = 76'h3193d26c356a3f7446f;
    stim[13] = 76'h84e98475c69b52ff704;
    stim[14] = 76'hbe6770690f99020e3f6;
    stim[15] = 76'ha26b439172725b3a16e;
    stim[16] = 76'h05a0be99369a3d7b502;
    stim[17] = 76'h8f6acd81b04ca508579;
    stim[18] = 76'hbaaed34e2484f7fba95;
    stim[19] = 76'h108ee1f79f63f1c3075;
    stim[20] = 76'ha337405b046c55aec16;
    stim[21] = 76'h9aa0dafbfb0c21410e3;
    stim[22] = 76'h9cbcecf848930bd3dbf;
    stim[23] = 76'h341278378d4899bdd49;
    stim[24] = 76'h2820bfaa127499ef0ec;
    stim[25] = 76'ha0b1e4e841fb0c2a670;
    stim[26] = 76'ha0960059d660e17e9f1;
    stim[27] = 76'ha15ac79b6284eac7a39;
    stim[28] = 76'h18bdbcd7fb5f99408db;
    stim[29] = 76'h29c6434463cd3520cb2;
    stim[30] = 76'h040e730326f7f11adc5;
    stim[31] = 76'h2d970ffee6b6d0f7d01;
    stim[32] = 76'h29ff9a791629eb1fa96;
    stim[33] = 76'hade6c5871480f12fb06;
    stim[34] = 76'ha50c122a9275361c311;
    stim[35] = 76'h2f843d343f1491dc3be;
    stim[36] = 76'h9cdc620770f0ecf3048;
    stim[37] = 76'h8a8e4fcd7906c39985f;
    stim[38] = 76'h93801ad0cc9bc1b898d;
    stim[39] = 76'had858199821da8ff793;
    stim[40] = 76'hb428bae94560127c9b4;
    stim[41] = 76'h0f111dd2296f387bc8a;
    stim[42] = 76'hb6313c168f59a673ac5;
    stim[43] = 76'ha7de5bfffb007779bcf;
    stim[44] = 76'h0d948b96679cd0a170d;
    stim[45] = 76'hb0768d576acca82dc95;
    stim[46] = 76'h92b88d3d9dbcb0d04f9;
    stim[47] = 76'h007abb4d600c671cff3;
    stim[48] = 76'h10aa8b6936bc23285a1;
    stim[49] = 76'h924d28842287b861c4d;
    stim[50] = 76'h27598d9444f20d417c3;
    stim[51] = 76'h843fbac199052d24fb6;
    stim[52] = 76'h9c605101dbf67ad6998;
    stim[53] = 76'h041428114e3f07d59c6;
    stim[54] = 76'ha300edbedc165fd4b19;
    stim[55] = 76'h11b2599d0b83b3f7139;
    stim[56] = 76'h24968d0520a89fe924b;
    stim[57] = 76'h2404c3b87ab4f7c51c6;
    stim[58] = 76'h10c932160f205376f28;
    stim[59] = 76'h0c1346901076c30b14a;
    stim[60] = 76'h3fd465f029d993cc1b4;
    stim[61] = 76'h9bb39632dbe01782dc3;
    stim[62] = 76'hfb34d495b2f18034c4b;
    stim[63] = 76'h20deceed48f86445ded;
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
      expv[0] = 102'h0000000000xxxxxxxxxxxxxxxx;
      expv[1] = 102'h00000000000000001c00000040;
      expv[2] = 102'h00000000000000001000000040;
      expv[3] = 102'h00000000020000001c00000040;
      expv[4] = 102'h00000000030000800200000048;
      expv[5] = 102'h14c067a5030000800700020018;
      expv[6] = 102'h14c067a5020000805300020030;
      expv[7] = 102'h14c067a5020000805200020020;
      expv[8] = 102'h14c067a5020000805e00020000;
      expv[9] = 102'h0a71f0b3f30001004e00020000;
      expv[10] = 102'h119e0f695b0001808700040100;
      expv[11] = 102'h119e0f695a000180d700040100;
      expv[12] = 102'h119e0f695a000180d200060200;
      expv[13] = 102'h119e0f695a000180de00060200;
      expv[14] = 102'h119e0f695b000200c200080300;
      expv[15] = 102'h119e0f695b000200cb00080300;
      expv[16] = 102'h119e0f695b000280cb00080300;
      expv[17] = 102'h119e0f695b000300cb00080300;
      expv[18] = 102'h16a3f7446f000380c7000a0400;
      expv[19] = 102'h399020e3f700038107000a0400;
      expv[20] = 102'h2725b3a16f00038147000a0400;
      expv[21] = 102'h2725b3a16f0003818b000c0500;
      expv[22] = 102'h29a3d7b5030004018f000c0500;
      expv[23] = 102'h06c55aec17000481cf000c0500;
      expv[24] = 102'h30c21410e300050207000c0500;
      expv[25] = 102'h30c21410e300050243000c0500;
      expv[26] = 102'h30c21410e300050243000e0600;
      expv[27] = 102'h0930bd3dbf00050247000e0600;
      expv[28] = 102'h0930bd3dbe00050297000e0600;
      expv[29] = 102'h0930bd3dbe0005029e000e0600;
      expv[30] = 102'h0930bd3dbf0005828a000e0600;
      expv[31] = 102'h35f99408db00060287000e0600;
      expv[32] = 102'h3cd3520cb3000602c7000e0600;
      expv[33] = 102'h3cd3520cb20006031b000e0600;
      expv[34] = 102'h3cd3520cb30006830a00100700;
      expv[35] = 102'h229eb1fa970007030700100700;
      expv[36] = 102'h229eb1fa970007034b00100700;
      expv[37] = 102'h229eb1fa970007834300120800;
      expv[38] = 102'h080f12fb070007834f00120800;
      expv[39] = 102'h31491dc3bf0008038700120800;
      expv[40] = 102'h106c39985f000803cf00120800;
      expv[41] = 102'h106c39985f0008840300120800;
      expv[42] = 102'h106c39985f0008840b00120800;
      expv[43] = 102'h21da8ff7930009040700140900;
      expv[44] = 102'h16f387bc8b0009044f00140900;
      expv[45] = 102'h3007779bcf0009848700140900;
      expv[46] = 102'h3007779bce000984d700160a00;
      expv[47] = 102'h3007779bce000984d600160a00;
      expv[48] = 102'h3007779bce000984de00160a00;
      expv[49] = 102'h00c671cff3000a04c600160a00;
      expv[50] = 102'h00c671cff2000a051700180b00;
      expv[51] = 102'h00c671cff2000a051e00180b00;
      expv[52] = 102'h00c671cff3000a850a001a0c00;
      expv[53] = 102'h00c671cff3000b0503001a0c00;
      expv[54] = 102'h00c671cff3000b050b001a0c00;
      expv[55] = 102'h0f20d417c3000b8507001c0d00;
      expv[56] = 102'h1052d24fb7000b8547001c0d00;
      expv[57] = 102'h23f07d59c7000b858f001c0d00;
      expv[58] = 102'h23f07d59c7000c05cb001c0d00;
      expv[59] = 102'h23f07d59c7000c85c3001c0d00;
      expv[60] = 102'h23f07d59c7000c85cb001c0d00;
      expv[61] = 102'h23f07d59c7000d05c3001c0d00;
      expv[62] = 102'h0000000000000d05cf001e0e00;
      expv[63] = 102'h00000000000000001c00000040;
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
