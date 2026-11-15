// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059671 dut (
    .clk(clk),
    .reset(in_vec[76:76]),
    .if_write_ce(in_vec[75:75]),
    .if_write(in_vec[74:74]),
    .if_din(in_vec[73:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[73:73]),
    .if_empty_n(out_vec[72:72]),
    .if_dout(out_vec[71:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h13626f85cbe807824ad7;
    stim[1] = 77'h19198be67a95bb8ed386;
    stim[2] = 77'h05bdb92f49182389bb50;
    stim[3] = 77'h03b483cc547e4f1e66de;
    stim[4] = 77'h01e1918b84c94dfa6df9;
    stim[5] = 77'h0c4d1271596a79c34a7b;
    stim[6] = 77'h0980492e8daecaaf7ab2;
    stim[7] = 77'h0f57f394d727651f63a1;
    stim[8] = 77'h0eeda8eae46500c2e127;
    stim[9] = 77'h04288006989fcaf4c294;
    stim[10] = 77'h0d32cea8aed4546d1346;
    stim[11] = 77'h05a06c4e42ec489d1255;
    stim[12] = 77'h07481d8b75d5e2586137;
    stim[13] = 77'h0e784de183354eca48bc;
    stim[14] = 77'h0aa1fae26e0da956eb18;
    stim[15] = 77'h0b7c18a40735e107a619;
    stim[16] = 77'h08bb7d5f9fcdb06af9c1;
    stim[17] = 77'h02c2f09b462f40ffc367;
    stim[18] = 77'h07179152b16c8621513b;
    stim[19] = 77'h01ffe6dd6f5ee5dccc43;
    stim[20] = 77'h09c19563853fccb70875;
    stim[21] = 77'h043081de96af1b96755b;
    stim[22] = 77'h0456af2dac39197acfe5;
    stim[23] = 77'h007932f51a450818f272;
    stim[24] = 77'h03f93c6b2210b01653bc;
    stim[25] = 77'h07959473c6836c3f87c5;
    stim[26] = 77'h083da795af76a214f859;
    stim[27] = 77'h00a45e97d16b3d9bfd5b;
    stim[28] = 77'h0bb5426808ac541c236b;
    stim[29] = 77'h03af6ac0e0219996161c;
    stim[30] = 77'h0972b981b200853f9393;
    stim[31] = 77'h06aa5b1dbe8c588bfb76;
    stim[32] = 77'h04b2ba21601f75589ca8;
    stim[33] = 77'h08897cb79c9d3b450bf8;
    stim[34] = 77'h0a5b6ddac7b4c161360d;
    stim[35] = 77'h08d5ee856190897fb5fe;
    stim[36] = 77'h02ad054ad6c04c328a05;
    stim[37] = 77'h00af3f9a70b65f6de479;
    stim[38] = 77'h0e1ae7a6b1b00ce46f24;
    stim[39] = 77'h0bf7b5023ffd8f9edbf1;
    stim[40] = 77'h040ff28e98c46339dd2b;
    stim[41] = 77'h0175922af1fa3a8b2aac;
    stim[42] = 77'h09447a139d87a60b4eeb;
    stim[43] = 77'h0dafda52f5b667315e75;
    stim[44] = 77'h0bcf71ac81fe47a92354;
    stim[45] = 77'h0ec1d8cc22b4cf36bf50;
    stim[46] = 77'h0cfd3b0f4cd7a2e21e51;
    stim[47] = 77'h0bf35a6419030fa5295c;
    stim[48] = 77'h0b158b426fcf31ced3a4;
    stim[49] = 77'h0b7bdfa0760c93582f26;
    stim[50] = 77'h0fe5235ab222537873c6;
    stim[51] = 77'h0b2faefe327f3b36e377;
    stim[52] = 77'h06bf49556516e1f2ff77;
    stim[53] = 77'h0c2a7c0d102170632f7a;
    stim[54] = 77'h0750271df7a85c637f7a;
    stim[55] = 77'h09668091a762c41e6ffd;
    stim[56] = 77'h093e4d944d95296dba3d;
    stim[57] = 77'h0ac0b125422967554da1;
    stim[58] = 77'h06536df094f72a66f1c8;
    stim[59] = 77'h06143c0b374dd607d814;
    stim[60] = 77'h07585bec513406b6f011;
    stim[61] = 77'h075bbef6e61453f4acd9;
    stim[62] = 77'h0802f46e0761d42353ab;
    stim[63] = 77'h0d690bb64d196675e3f8;
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
      expv[0] = 74'h2000000000000000000;
      expv[1] = 74'h2000000000000000000;
      expv[2] = 74'h2000000000000000000;
      expv[3] = 74'h2000000000000000000;
      expv[4] = 74'h2000000000000000000;
      expv[5] = 74'h2000000000000000000;
      expv[6] = 74'h2000000000000000000;
      expv[7] = 74'h313449c565a9e70d29e;
      expv[8] = 74'h313449c565a9e70d29e;
      expv[9] = 74'h3d5fce535c9d947d8e8;
      expv[10] = 74'h3d5fce535c9d947d8e8;
      expv[11] = 74'h3d5fce535c9d947d8e8;
      expv[12] = 74'h3d5fce535c9d947d8e8;
      expv[13] = 74'h3bb6a3ab9194030b849;
      expv[14] = 74'h3bb6a3ab9194030b849;
      expv[15] = 74'h3bb6a3ab9194030b849;
      expv[16] = 74'h3bb6a3ab9194030b849;
      expv[17] = 74'h3bb6a3ab9194030b849;
      expv[18] = 74'h34cb3aa2bb5151b44d1;
      expv[19] = 74'h39e137860cd53b2922f;
      expv[20] = 74'h29e137860cd53b2922f;
      expv[21] = 74'h29e137860cd53b2922f;
      expv[22] = 74'h29e137860cd53b2922f;
      expv[23] = 74'h29e137860cd53b2922f;
      expv[24] = 74'h29e137860cd53b2922f;
      expv[25] = 74'h29e137860cd53b2922f;
      expv[26] = 74'h29e137860cd53b2922f;
      expv[27] = 74'h29e137860cd53b2922f;
      expv[28] = 74'h29e137860cd53b2922f;
      expv[29] = 74'h29e137860cd53b2922f;
      expv[30] = 74'h29e137860cd53b2922f;
      expv[31] = 74'h29e137860cd53b2922f;
      expv[32] = 74'h29e137860cd53b2922f;
      expv[33] = 74'h29e137860cd53b2922f;
      expv[34] = 74'h29e137860cd53b2922f;
      expv[35] = 74'h29e137860cd53b2922f;
      expv[36] = 74'h29e137860cd53b2922f;
      expv[37] = 74'h29e137860cd53b2922f;
      expv[38] = 74'h29e137860cd53b2922f;
      expv[39] = 74'h29e137860cd53b2922f;
      expv[40] = 74'h29e137860cd53b2922f;
      expv[41] = 74'h386b9e9ac6c03391bc9;
      expv[42] = 74'h386b9e9ac6c03391bc9;
      expv[43] = 74'h286b9e9ac6c03391bc9;
      expv[44] = 74'h286b9e9ac6c03391bc9;
      expv[45] = 74'h286b9e9ac6c03391bc9;
      expv[46] = 74'h286b9e9ac6c03391bc9;
      expv[47] = 74'h286b9e9ac6c03391bc9;
      expv[48] = 74'h286b9e9ac6c03391bc9;
      expv[49] = 74'h286b9e9ac6c03391bc9;
      expv[50] = 74'h36bf694bd6d99cc579d;
      expv[51] = 74'h36bf694bd6d99cc579d;
      expv[52] = 74'h3b0763308ad33cdafd4;
      expv[53] = 74'h33f4ec3d335e8b88794;
      expv[54] = 74'h33f4ec3d335e8b88794;
      expv[55] = 74'h33f4ec3d335e8b88794;
      expv[56] = 74'h33f4ec3d335e8b88794;
      expv[57] = 74'h33f4ec3d335e8b88794;
      expv[58] = 74'h33f4ec3d335e8b88794;
      expv[59] = 74'h33f4ec3d335e8b88794;
      expv[60] = 74'h33f4ec3d335e8b88794;
      expv[61] = 74'h33f4ec3d335e8b88794;
      expv[62] = 74'h33f4ec3d335e8b88794;
      expv[63] = 74'h3f948d6ac8894de1cf1;
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
