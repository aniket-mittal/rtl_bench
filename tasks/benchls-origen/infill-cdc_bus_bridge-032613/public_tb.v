// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 102;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_032613 dut (
    .clk_a(clk),
    .clk_b(in_vec[103:103]),
    .rst_n(in_vec[102:102]),
    .mem_valid_a(in_vec[101:101]),
    .mem_addr_a(in_vec[100:69]),
    .mem_wdata_a(in_vec[68:37]),
    .mem_wstrb_a(in_vec[36:33]),
    .mem_ready_b(in_vec[32:32]),
    .mem_rdata_b(in_vec[31:0]),
    .mem_ready_a(out_vec[101:101]),
    .mem_rdata_a(out_vec[100:69]),
    .mem_valid_b(out_vec[68:68]),
    .mem_addr_b(out_vec[67:36]),
    .mem_wdata_b(out_vec[35:4]),
    .mem_wstrb_b(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'h3d2854e360eaf4cdee2387f41e;
    stim[1] = 104'h191d44a3ef20fd9cc73560511f;
    stim[2] = 104'hf2fa211cece2443ccb74f9228d;
    stim[3] = 104'hc89376fe2d897485bb28b6b4f4;
    stim[4] = 104'hceba90ebed0ceacf994f5d7d64;
    stim[5] = 104'h5fc9671d9573d57a5611029815;
    stim[6] = 104'hc397c8c6fd5927501055553ce8;
    stim[7] = 104'h421423d8fdc65c423ce44bef5b;
    stim[8] = 104'h730cbed477ca4c66734b4bed71;
    stim[9] = 104'hff773688ebf545145989b35f3c;
    stim[10] = 104'hf67d14dc978d12629f19fc7701;
    stim[11] = 104'h6f20bdb7adcde73b26383e6959;
    stim[12] = 104'hfeb46fbfe420ba0a02b3ef0c0b;
    stim[13] = 104'he6b5567a11b37bfd6ffde81ece;
    stim[14] = 104'h60595ddbad86d7bcd884ac1b7c;
    stim[15] = 104'hebcf11d0cf5f1f77562763cfd4;
    stim[16] = 104'h57a8aa67dfece3b0d86a1d19ec;
    stim[17] = 104'h497cb149fcb729984fe750fc08;
    stim[18] = 104'hf648ee1408b8eba315b69814ac;
    stim[19] = 104'h5dc7c89406ade49aa822d7b753;
    stim[20] = 104'h47bd6d5b9aa4a7491b7c280930;
    stim[21] = 104'hcf01f6339618121106f8bf87d8;
    stim[22] = 104'h4ac33e176479f5bd33a7be39e8;
    stim[23] = 104'h55f819720f27e991d8495ded47;
    stim[24] = 104'hd09f29033d35b09bad410ed44a;
    stim[25] = 104'h6f8a537aeea29e9912ca908c2d;
    stim[26] = 104'h4dce41dbdb00d7ebde85bd55c4;
    stim[27] = 104'h742facd973736c824a456c8c98;
    stim[28] = 104'heed3d6d5112a7ed8eb40bd2739;
    stim[29] = 104'hcb082b313a1cab5b1d81f931bc;
    stim[30] = 104'hd47d57f52a8ac68c5ce06a9083;
    stim[31] = 104'he7a9fb7534cc35dd53fceb205e;
    stim[32] = 104'hd2def673d2102e547962c99715;
    stim[33] = 104'h7f1a6fe7466a1a8f4bc55d63cd;
    stim[34] = 104'h7cf28d546475c2f14946caa675;
    stim[35] = 104'h4674d7b29d5210e73d251a9b23;
    stim[36] = 104'hcc4b6cccbefa320dc5df8cc843;
    stim[37] = 104'h6e6f540787ff16a09b8c86fe1a;
    stim[38] = 104'he459b05fa172e46b644c3cbb59;
    stim[39] = 104'h4cb6b4cac77a1e09d66edd8324;
    stim[40] = 104'he2252226e5325b49873d81631d;
    stim[41] = 104'h61482ef006f2fbb9b03ba51dd0;
    stim[42] = 104'hfcadc14005bac3a60b03b1d581;
    stim[43] = 104'he0642fd462841fca1cae06bfd6;
    stim[44] = 104'hf1a69429631a40b0ed755a19cc;
    stim[45] = 104'hf4649decb97302b4b177170579;
    stim[46] = 104'h6b8ab9489544b5631fd7966ce0;
    stim[47] = 104'hff309cb73b89dbac636ca2a579;
    stim[48] = 104'hc19a1c3e484ef968e7b6a65ab9;
    stim[49] = 104'h74f17df7e093a5cb5a1f90eafa;
    stim[50] = 104'h4fbcb4b08610306d1586de8eec;
    stim[51] = 104'hf2da90493b90d8f6f50445f8ba;
    stim[52] = 104'hea087c0c9936b6512a5e32b486;
    stim[53] = 104'hfe846de2e57b08ee97e3a23b74;
    stim[54] = 104'he8e76c870b5942e34c4255cf5d;
    stim[55] = 104'h6ab9149e246a30876f4dc94c5d;
    stim[56] = 104'he1bc3a81f88fb8e30ef11e9036;
    stim[57] = 104'h5f077552ba24cf18a14764d8b5;
    stim[58] = 104'hfb57a8d05d31f08e0b8835d0f8;
    stim[59] = 104'h55b35fea987a349e4686685abf;
    stim[60] = 104'h6fc3882d9bbd20c0255e309970;
    stim[61] = 104'h5a3aa4a1d9a40c2b4325f1e0fd;
    stim[62] = 104'h7e3810156649c7cde1918e63e8;
    stim[63] = 104'hd370a49e65c4d68ab6cb1e6a54;
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
      expv[0] = 102'h00000000000000000000000000;
      expv[1] = 102'h00000000000000000000000000;
      expv[2] = 102'h00000000000000000000000000;
      expv[3] = 102'h00000000000000000000000000;
      expv[4] = 102'h00000000000000000000000000;
      expv[5] = 102'h00000000000000000000000000;
      expv[6] = 102'h00000000000000000000000000;
      expv[7] = 102'h00000000000000000000000000;
      expv[8] = 102'h00000000000000000000000000;
      expv[9] = 102'h00000000000000000000000000;
      expv[10] = 102'h00000000000000000000000000;
      expv[11] = 102'h00000000000000000000000000;
      expv[12] = 102'h00000000000000000000000000;
      expv[13] = 102'h00000000000000000000000000;
      expv[14] = 102'h00000000000000000000000000;
      expv[15] = 102'h00000000000000000000000000;
      expv[16] = 102'h00000000000000000000000000;
      expv[17] = 102'h00000000000000000000000000;
      expv[18] = 102'h00000000000000000000000000;
      expv[19] = 102'h00000000000000000000000000;
      expv[20] = 102'h00000000000000000000000000;
      expv[21] = 102'h00000000000000000000000000;
      expv[22] = 102'h00000000000000000000000000;
      expv[23] = 102'h00000000000000000000000000;
      expv[24] = 102'h00000000000000000000000000;
      expv[25] = 102'h00000000000000000000000000;
      expv[26] = 102'h00000000000000000000000000;
      expv[27] = 102'h00000000000000000000000000;
      expv[28] = 102'h00000000000000000000000000;
      expv[29] = 102'h00000000000000000000000000;
      expv[30] = 102'h00000000000000000000000000;
      expv[31] = 102'h00000000000000000000000000;
      expv[32] = 102'h00000000000000000000000000;
      expv[33] = 102'h00000000000000000000000000;
      expv[34] = 102'h00000000000000000000000000;
      expv[35] = 102'h00000000000000000000000000;
      expv[36] = 102'h00000000000000000000000000;
      expv[37] = 102'h00000000000000000000000000;
      expv[38] = 102'h00000000000000000000000000;
      expv[39] = 102'h00000000000000000000000000;
      expv[40] = 102'h00000000000000000000000000;
      expv[41] = 102'h00000000000000000000000000;
      expv[42] = 102'h00000000000000000000000000;
      expv[43] = 102'h20763ab0200000000000000000;
      expv[44] = 102'h00763ab0200000000000000000;
      expv[45] = 102'h00763ab0200000000000000000;
      expv[46] = 102'h00763ab0200000000000000000;
      expv[47] = 102'h00763ab0200000000000000000;
      expv[48] = 102'h00763ab0200000000000000000;
      expv[49] = 102'h00763ab0200000000000000000;
      expv[50] = 102'h00763ab0200000000000000000;
      expv[51] = 102'h00763ab03112911372992da4c3;
      expv[52] = 102'h00763ab03112911372992da4c3;
      expv[53] = 102'h00763ab03112911372992da4c3;
      expv[54] = 102'h00763ab03112911372992da4c3;
      expv[55] = 102'h00763ab03112911372992da4c3;
      expv[56] = 102'h00763ab03112911372992da4c3;
      expv[57] = 102'h00763ab03112911372992da4c3;
      expv[58] = 102'h00763ab02112911372992da4c3;
      expv[59] = 102'h00763ab02112911372992da4c3;
      expv[60] = 102'h00763ab02112911372992da4c3;
      expv[61] = 102'h00763ab02112911372992da4c3;
      expv[62] = 102'h00763ab02112911372992da4c3;
      expv[63] = 102'h00763ab02112911372992da4c3;
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
