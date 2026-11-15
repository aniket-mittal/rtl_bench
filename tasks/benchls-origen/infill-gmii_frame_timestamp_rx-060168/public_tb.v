// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060168 dut (
    .gmii_rx_clk(clk),
    .sys_rst(in_vec[75:75]),
    .global_counter(in_vec[74:11]),
    .gmii_rx_dv(in_vec[10:10]),
    .gmii_rxd(in_vec[9:2]),
    .data_full(in_vec[1:1]),
    .len_full(in_vec[0:0]),
    .data_din(out_vec[38:21]),
    .data_wr_en(out_vec[20:20]),
    .len_din(out_vec[19:2]),
    .len_wr_en(out_vec[1:1]),
    .wr_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'he57ca2c0b06b90e60c9;
    stim[1] = 76'hd3cb935859d57767b7c;
    stim[2] = 76'h27c8146b03a3edc4961;
    stim[3] = 76'h032d495db638c1dee67;
    stim[4] = 76'h0ca96d73a9c7cea12d7;
    stim[5] = 76'h399b8621f6abe7baa58;
    stim[6] = 76'h24911d13a58e2cd6c82;
    stim[7] = 76'h4be2b1e567a676ad02e;
    stim[8] = 76'h052000e5b46d8be8c83;
    stim[9] = 76'h587f6ae16ee5a57320c;
    stim[10] = 76'h6a4767d64d54cbe9d40;
    stim[11] = 76'h063770016eda13eddfd;
    stim[12] = 76'h3728295d035c85304a1;
    stim[13] = 76'h730be44bbd1b54c4b12;
    stim[14] = 76'h2bfcf11eb6c814b400e;
    stim[15] = 76'h0bd6201501f8af796cf;
    stim[16] = 76'h46c47e5ee9d526d84e8;
    stim[17] = 76'h2c4295fbcd4ec2b5d3d;
    stim[18] = 76'h505d4e2b8d7c38c8090;
    stim[19] = 76'h7ed0f38d55d5c3e82fd;
    stim[20] = 76'h63e25ed9d2b9c68724b;
    stim[21] = 76'h5b3daf9bc35d2f89b19;
    stim[22] = 76'h42ddabade596f56ad4f;
    stim[23] = 76'h504ecdeab54a18e85e9;
    stim[24] = 76'h3ed01b54e8743fc6d51;
    stim[25] = 76'h18ae0f884780fc5609b;
    stim[26] = 76'h0b70f8ba91eccd6ab83;
    stim[27] = 76'h3ec7af57832e47cedc4;
    stim[28] = 76'h1e70269efcd359ef9bd;
    stim[29] = 76'h3ded619ce09084b7586;
    stim[30] = 76'h4864d69f728d2a48688;
    stim[31] = 76'h056d82e42a9f8481c59;
    stim[32] = 76'h779a37d4302b27bfdd1;
    stim[33] = 76'h76ade34aabaf3b12c73;
    stim[34] = 76'h5c00c44b6536d9a6775;
    stim[35] = 76'h336015bbb3c68a2733c;
    stim[36] = 76'h052d715ad23b9d12dd8;
    stim[37] = 76'h5f0bdc553be51558dae;
    stim[38] = 76'h710f047fff851844f64;
    stim[39] = 76'h35980f827103cc491f8;
    stim[40] = 76'h728d75f6e2bfaab707b;
    stim[41] = 76'h40583ab1bd939e2c58a;
    stim[42] = 76'h37dea55be934abf7a78;
    stim[43] = 76'h424f774a842e9cfeef0;
    stim[44] = 76'h0e4e2367fdb2642400b;
    stim[45] = 76'h3d24ac6470d8100eb4b;
    stim[46] = 76'h509767e694e435f8858;
    stim[47] = 76'h14f54bbfe30f37b56ad;
    stim[48] = 76'h20a7a889bae348ecb98;
    stim[49] = 76'h7864fd088404d612542;
    stim[50] = 76'h413576b8e938459b03c;
    stim[51] = 76'h27c73a38fca609e2c68;
    stim[52] = 76'h6385dd764fa1e7267ab;
    stim[53] = 76'h73797ea862bd1e730ee;
    stim[54] = 76'h3ebecd0ecd4a3cfc68d;
    stim[55] = 76'h6ca367db13fce1d524d;
    stim[56] = 76'h5a72d014537604a731b;
    stim[57] = 76'h0b6c3fc5b30a46ff8bc;
    stim[58] = 76'h4bf0ccc9e143fbe5d06;
    stim[59] = 76'h440c2c09c28ed7f3c21;
    stim[60] = 76'h26ec78a227d49693375;
    stim[61] = 76'h6e6a2b19cd98a2df40a;
    stim[62] = 76'h6bba5695610a091869a;
    stim[63] = 76'h618f726f8a63df05fff;
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
      expv[0] = 39'h0000000000;
      expv[1] = 39'h0000000000;
      expv[2] = 39'h0000000000;
      expv[3] = 39'h0000000000;
      expv[4] = 39'h0000000000;
      expv[5] = 39'h0000000000;
      expv[6] = 39'h0000000000;
      expv[7] = 39'h0000000000;
      expv[8] = 39'h0000000000;
      expv[9] = 39'h0000000000;
      expv[10] = 39'h0000000000;
      expv[11] = 39'h0000000000;
      expv[12] = 39'h0000000000;
      expv[13] = 39'h0000000000;
      expv[14] = 39'h0000000000;
      expv[15] = 39'h0000000000;
      expv[16] = 39'h0000000000;
      expv[17] = 39'h0000000000;
      expv[18] = 39'h0000000000;
      expv[19] = 39'h0000000000;
      expv[20] = 39'h0000000000;
      expv[21] = 39'h0000000000;
      expv[22] = 39'h0000000000;
      expv[23] = 39'h0000000000;
      expv[24] = 39'h0000000000;
      expv[25] = 39'h0000000000;
      expv[26] = 39'h0000000000;
      expv[27] = 39'h0000000000;
      expv[28] = 39'h0000000000;
      expv[29] = 39'h0000000000;
      expv[30] = 39'h0000000000;
      expv[31] = 39'h0000000000;
      expv[32] = 39'h0000000000;
      expv[33] = 39'h0000000000;
      expv[34] = 39'h0000000000;
      expv[35] = 39'h0000000000;
      expv[36] = 39'h0000000000;
      expv[37] = 39'h0000000000;
      expv[38] = 39'h0000000000;
      expv[39] = 39'h0000000000;
      expv[40] = 39'h0000000000;
      expv[41] = 39'h0000000000;
      expv[42] = 39'h0000000000;
      expv[43] = 39'h0000000000;
      expv[44] = 39'h0000000000;
      expv[45] = 39'h0000000000;
      expv[46] = 39'h0000000000;
      expv[47] = 39'h0000000000;
      expv[48] = 39'h0000000000;
      expv[49] = 39'h0000000000;
      expv[50] = 39'h0000000000;
      expv[51] = 39'h0000000000;
      expv[52] = 39'h0000000000;
      expv[53] = 39'h0000000000;
      expv[54] = 39'h0000000000;
      expv[55] = 39'h0000000000;
      expv[56] = 39'h0000000000;
      expv[57] = 39'h0000000000;
      expv[58] = 39'h0000000000;
      expv[59] = 39'h0000000000;
      expv[60] = 39'h0000000000;
      expv[61] = 39'h0000000000;
      expv[62] = 39'h0000000000;
      expv[63] = 39'h0000000000;
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
