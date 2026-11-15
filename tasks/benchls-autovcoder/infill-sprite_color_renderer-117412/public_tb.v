// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117412 dut (
    .clock_25(clk),
    .v0(in_vec[110:95]),
    .v1(in_vec[94:79]),
    .v2(in_vec[78:63]),
    .v3(in_vec[62:47]),
    .sp0(in_vec[46:42]),
    .sp1(in_vec[41:37]),
    .sp2(in_vec[36:32]),
    .sp3(in_vec[31:27]),
    .clock_maior(in_vec[26:26]),
    .rst(in_vec[25:25]),
    .att_color(in_vec[24:24]),
    .data_color(in_vec[23:0]),
    .blue(out_vec[23:16]),
    .green(out_vec[15:8]),
    .red(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h124594da956fd938792f0a522db9;
    stim[1] = 111'h12720206380e8d6e5b798e059923;
    stim[2] = 111'h6c6d93abb4cb7a0bd2bc194d00fb;
    stim[3] = 111'h6808e946888f7d08c67f2c786f6d;
    stim[4] = 111'h0817f97f4ecb85de3c9a0cca3ace;
    stim[5] = 111'h53b1ef3d9478089a5d2b950d5b15;
    stim[6] = 111'h3a62cf8e6057e03374bd70bd6930;
    stim[7] = 111'h7eddbe410c6fdf00b2dae068d2d5;
    stim[8] = 111'h1c7cacfd129d7e2957a3acc505b4;
    stim[9] = 111'h3060a221f0974fdeb8531dbf2c14;
    stim[10] = 111'h6c6c8db575e33e0cb7df406563db;
    stim[11] = 111'h2cdc01477be4349e136e290c19ee;
    stim[12] = 111'h447389b6dbcd3ceb653a9443850e;
    stim[13] = 111'h2f8c89917897d30aadbf788c1112;
    stim[14] = 111'h66fa2f617d6c1eb58123752c507b;
    stim[15] = 111'h44ab40f2da3affdcb4dd81d0a363;
    stim[16] = 111'h4198ea92d8109d7480f6ac3e3344;
    stim[17] = 111'h5edc3eb7e514bb6b3c1c4d62382e;
    stim[18] = 111'h5ff1aea2349538caa05378091dac;
    stim[19] = 111'h6a1fefc419b0a99538e1c059d64c;
    stim[20] = 111'h43571de56919945f207b54dc39db;
    stim[21] = 111'h09407b65649a40ce3364c860e2ec;
    stim[22] = 111'h1eb2265b48fbfbfced8a9de4a8ea;
    stim[23] = 111'h07a965be911479bce346c01fc9b3;
    stim[24] = 111'h05685bd6f6439cac69960932b931;
    stim[25] = 111'h326f3947af7f954fd69d85152b03;
    stim[26] = 111'h62752c54a10c7d7237f4b02380b6;
    stim[27] = 111'h475090c37ab113306c159095ffea;
    stim[28] = 111'h763c428ff00454a9ed3ca42980d7;
    stim[29] = 111'h23b73b6bc978b17b516e15ef903f;
    stim[30] = 111'h77911f1edd556ac067aba9455afd;
    stim[31] = 111'h06d33cd31e2dbbe8896db44f9f4c;
    stim[32] = 111'h2102c2e439163ba3e5bbdc0c1e82;
    stim[33] = 111'h0e5a143ca3322fd1d090c11daf60;
    stim[34] = 111'h48b2323af237078da5599483c25d;
    stim[35] = 111'h520432e7027d189cbe39e4380373;
    stim[36] = 111'h0bf10d0d0d0f36cb519e4d3ffd87;
    stim[37] = 111'h6f6180ceb3537388ee8509219ecf;
    stim[38] = 111'h7f1d1e3455fbae374df4504dc7b4;
    stim[39] = 111'h22f28881f4588c52a029ad284fb7;
    stim[40] = 111'h67fdbf51f619b9939ea014fc36fd;
    stim[41] = 111'h1f9dd2841d90dd76eac5c57a3d2e;
    stim[42] = 111'h0cc1f97753849ba397df6d6dbb40;
    stim[43] = 111'h753b80158c9183854b44981308c2;
    stim[44] = 111'h18385ac05af51301981ee06ad0e0;
    stim[45] = 111'h16cc8e41e99c9603f791319dcd45;
    stim[46] = 111'h22786d838231b633b0cb11bfac31;
    stim[47] = 111'h7ed6eb72cd9b7d156b883800500d;
    stim[48] = 111'h2ee5e9d37ff545a4754af1799ef2;
    stim[49] = 111'h351ea0a6bb120a6d0d19c53e311d;
    stim[50] = 111'h70c4edaea5ac9e3fa80845f32baf;
    stim[51] = 111'h3d675b76a6c091183c36543f8369;
    stim[52] = 111'h4f08c633ec0ebeee8dc041b622b3;
    stim[53] = 111'h4f01720f425246d516038015d372;
    stim[54] = 111'h3d292b656367abb6b6ed01daec4f;
    stim[55] = 111'h7966701d8bd39dc4a3a6a0e3abd6;
    stim[56] = 111'h31e5004b8d6026d487ab74a721ca;
    stim[57] = 111'h33fd74eb1dad25afe82df1c4a380;
    stim[58] = 111'h4ae54b4c26ad396e76b2794c960d;
    stim[59] = 111'h608b84d149fb543e5bfa19b40350;
    stim[60] = 111'h207fb4cc9f54377c502330361919;
    stim[61] = 111'h1aedee3bcfea3bc56b37a1d59ad5;
    stim[62] = 111'h01bebb22b3a15c639bb9f5c44b91;
    stim[63] = 111'h0b1539d363e79a640c6d5d50764c;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
