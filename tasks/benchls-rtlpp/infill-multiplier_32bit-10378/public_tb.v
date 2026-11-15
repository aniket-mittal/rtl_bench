// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10378 dut (
    .clk(clk),
    .E_src1(in_vec[65:34]),
    .E_src2(in_vec[33:2]),
    .M_en(in_vec[1:1]),
    .reset_n(in_vec[0:0]),
    .M_mul_cell_p1(out_vec[95:64]),
    .M_mul_cell_p2(out_vec[63:32]),
    .M_mul_cell_p3(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h050f2c72554dfe22a;
    stim[1] = 66'h32f58d89fd0f2fe88;
    stim[2] = 66'h1834eabb3a54cfa55;
    stim[3] = 66'h295976a94e4f652a9;
    stim[4] = 66'h19fb713e14076129d;
    stim[5] = 66'h03c7eb488bb7bd897;
    stim[6] = 66'h0b39275be8cd61cf1;
    stim[7] = 66'h3385d2f354a2dd2fb;
    stim[8] = 66'h32a0f5918162adea7;
    stim[9] = 66'h23982e8dbf71db437;
    stim[10] = 66'h05cf5558d3c802c73;
    stim[11] = 66'h3ba718a9f37549679;
    stim[12] = 66'h2b91ead3b1140a5bf;
    stim[13] = 66'h3eb999e325aa7618d;
    stim[14] = 66'h036127e7efdd96af9;
    stim[15] = 66'h1ccc5ead554fce615;
    stim[16] = 66'h0aea052f3cd02b77d;
    stim[17] = 66'h030d805960238ed5f;
    stim[18] = 66'h1ab1cbf43752e6e7b;
    stim[19] = 66'h1e7044a7c00423979;
    stim[20] = 66'h2b43b9e9af5043075;
    stim[21] = 66'h126702c9f979fc3a3;
    stim[22] = 66'h3eb88c2fb1e1d98d1;
    stim[23] = 66'h3cad2eece1561795b;
    stim[24] = 66'h226a4520709e9fb03;
    stim[25] = 66'h2cdff7961e1d9c3dd;
    stim[26] = 66'h3f270a23a1315cc9b;
    stim[27] = 66'h2c113bef1533a9309;
    stim[28] = 66'h3d9216a150541eb67;
    stim[29] = 66'h16612edcfc8a88d85;
    stim[30] = 66'h29859c8cfe26566cf;
    stim[31] = 66'h0fdce16f4aed79d99;
    stim[32] = 66'h039c817d98b6cb349;
    stim[33] = 66'h3655195bd3f97bd81;
    stim[34] = 66'h0de6854b9c1c122a3;
    stim[35] = 66'h1bff12df64f1b0211;
    stim[36] = 66'h0cab568595c080439;
    stim[37] = 66'h3a8540f0857507981;
    stim[38] = 66'h1648c8f6731ab1589;
    stim[39] = 66'h2c824ed603a3eb933;
    stim[40] = 66'h06191d6c0a981c0fb;
    stim[41] = 66'h142e9dba85f3514f7;
    stim[42] = 66'h3c12cb8f608b09a45;
    stim[43] = 66'h2fba8a6b7df9df5e7;
    stim[44] = 66'h3ef967fa71fb2f91d;
    stim[45] = 66'h2d0502e23ec625bd3;
    stim[46] = 66'h3b47589982f497687;
    stim[47] = 66'h0e97adb60523384d1;
    stim[48] = 66'h345818e6043106105;
    stim[49] = 66'h259c5ab265b8c4cc3;
    stim[50] = 66'h3790d358643381925;
    stim[51] = 66'h219f02df7b654a235;
    stim[52] = 66'h380f9717f6c8931ad;
    stim[53] = 66'h3a6561ba539b32497;
    stim[54] = 66'h13be8d98a47deacd7;
    stim[55] = 66'h04378c1899e4d77c3;
    stim[56] = 66'h2d4e971b8aa2485df;
    stim[57] = 66'h3b15529fd806334ed;
    stim[58] = 66'h31b102780c2f95e0d;
    stim[59] = 66'h25f70ecd090792426;
    stim[60] = 66'h20bed60d4eb08b1d1;
    stim[61] = 66'h071b0ce5e45375e67;
    stim[62] = 66'h31d55eb4642cbfac9;
    stim[63] = 66'h2785d569739b6796f;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h000000000000000000000000;
      expv[4] = 96'h000000000000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'ha677b1ea1fb23f7c0e89f97b;
      expv[7] = 96'ha677b1ea1fb23f7c0e89f97b;
      expv[8] = 96'h229126261870d24f5dfb6112;
      expv[9] = 96'h99b97e3604a2dfbc9149557b;
      expv[10] = 96'h4f5272beb8981dfa3ca61ae0;
      expv[11] = 96'h03b497d41a643960010229ac;
      expv[12] = 96'h03b497d41a643960010229ac;
      expv[13] = 96'h1bb9c4d2835d40601c34efc9;
      expv[14] = 96'h1bb9c4d2835d40601c34efc9;
      expv[15] = 96'h1bb9c4d2835d40601c34efc9;
      expv[16] = 96'h1bb9c4d2835d40601c34efc9;
      expv[17] = 96'h1bb9c4d2835d40601c34efc9;
      expv[18] = 96'h0052c05300b3460602d4985a;
      expv[19] = 96'h1d107260295491f040e863d2;
      expv[20] = 96'h1d107260295491f040e863d2;
      expv[21] = 96'h1d107260295491f040e863d2;
      expv[22] = 96'h0a7eab580a03f3314544f560;
      expv[23] = 96'h0a7eab580a03f3314544f560;
      expv[24] = 96'h452ac82261c48488596fa078;
      expv[25] = 96'h0a26dec00f93877a44286cc0;
      expv[26] = 96'h0a26dec00f93877a44286cc0;
      expv[27] = 96'h123dcf1415086d46719f9328;
      expv[28] = 96'h123dcf1415086d46719f9328;
      expv[29] = 96'h2b701cbd17180e90762f1308;
      expv[30] = 96'h2b701cbd17180e90762f1308;
      expv[31] = 96'h280394a96ee5a87b3a31c762;
      expv[32] = 96'h280394a96ee5a87b3a31c762;
      expv[33] = 96'h280394a96ee5a87b3a31c762;
      expv[34] = 96'h280394a96ee5a87b3a31c762;
      expv[35] = 96'h0602d630094d64200fc7cd10;
      expv[36] = 96'h0602d630094d64200fc7cd10;
      expv[37] = 96'h0602d630094d64200fc7cd10;
      expv[38] = 96'h0602d630094d64200fc7cd10;
      expv[39] = 96'h0602d630094d64200fc7cd10;
      expv[40] = 96'h28676e20035ff6287936f8ac;
      expv[41] = 96'h339980a0137b02000ab1a838;
      expv[42] = 96'h202967c20b0e3f6215d55e52;
      expv[43] = 96'h202967c20b0e3f6215d55e52;
      expv[44] = 96'h146d2bc5285b861b5d927e9a;
      expv[45] = 96'h146d2bc5285b861b5d927e9a;
      expv[46] = 96'h06ccada00b4f6cc06a2f5b10;
      expv[47] = 96'h23fcf026048b19ac56b8a83d;
      expv[48] = 96'h23fcf026048b19ac56b8a83d;
      expv[49] = 96'h23fcf026048b19ac56b8a83d;
      expv[50] = 96'h0800f0b03ef0763b0b469830;
      expv[51] = 96'h0800f0b03ef0763b0b469830;
      expv[52] = 96'h0800f0b03ef0763b0b469830;
      expv[53] = 96'h0800f0b03ef0763b0b469830;
      expv[54] = 96'h6a0070ad2953e84cb787bf89;
      expv[55] = 96'h245eb84a1f01fa8e34d157c2;
      expv[56] = 96'h11c0f5e01393364606307620;
      expv[57] = 96'h0c1525220f5b82de17b0b7f6;
      expv[58] = 96'h0c1525220f5b82de17b0b7f6;
      expv[59] = 96'h000000000000000000000000;
      expv[60] = 96'h000000000000000000000000;
      expv[61] = 96'h000000000000000000000000;
      expv[62] = 96'h2b72a63f1d480b6b17efb08c;
      expv[63] = 96'h2b72a63f1d480b6b17efb08c;
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
