// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mor1kx_pcu dut (
    .clk(clk),
    .rst(in_vec[63:63]),
    .spr_access_i(in_vec[62:62]),
    .spr_we_i(in_vec[61:61]),
    .spr_re_i(in_vec[60:60]),
    .spr_addr_i(in_vec[59:44]),
    .spr_dat_i(in_vec[43:12]),
    .spr_sys_mode_i(in_vec[11:11]),
    .pcu_event_load_i(in_vec[10:10]),
    .pcu_event_store_i(in_vec[9:9]),
    .pcu_event_ifetch_i(in_vec[8:8]),
    .pcu_event_dcache_miss_i(in_vec[7:7]),
    .pcu_event_icache_miss_i(in_vec[6:6]),
    .pcu_event_ifetch_stall_i(in_vec[5:5]),
    .pcu_event_lsu_stall_i(in_vec[4:4]),
    .pcu_event_brn_stall_i(in_vec[3:3]),
    .pcu_event_dtlb_miss_i(in_vec[2:2]),
    .pcu_event_itlb_miss_i(in_vec[1:1]),
    .pcu_event_datadep_stall_i(in_vec[0:0]),
    .spr_bus_ack(out_vec[32:32]),
    .spr_dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hc4c0b7111a8f3ecf;
    stim[1] = 64'hf85d7ed353280e86;
    stim[2] = 64'h440c69cab7d20fac;
    stim[3] = 64'h06d5a358d52e8662;
    stim[4] = 64'h06d7ed3e44ee528d;
    stim[5] = 64'h6d14170b24a54054;
    stim[6] = 64'h3c69656ab121cb4c;
    stim[7] = 64'h1b5617e4509bc59a;
    stim[8] = 64'h46c1ce3fdc8285de;
    stim[9] = 64'h6161a18b97c38adf;
    stim[10] = 64'h3a787cfe5d1cc9db;
    stim[11] = 64'h01a45d013a373e9c;
    stim[12] = 64'h0752da455cfde386;
    stim[13] = 64'h548f2f40ab4ed53e;
    stim[14] = 64'h07d540a674842b39;
    stim[15] = 64'h24c353e42d987113;
    stim[16] = 64'h67a3b2c9f875239b;
    stim[17] = 64'h63bf9350c652a2da;
    stim[18] = 64'h5b565611c217a6b4;
    stim[19] = 64'h5fc12426e9498fbe;
    stim[20] = 64'h4c54ed9ab7b2a6d4;
    stim[21] = 64'h7c7939e1c5e08de1;
    stim[22] = 64'h22379d48b07b1c29;
    stim[23] = 64'h7dd25bd301b44b78;
    stim[24] = 64'h1f1111d1d28baf46;
    stim[25] = 64'h101c45b9b476f19f;
    stim[26] = 64'h45800d42f6a2a9a8;
    stim[27] = 64'h423c10a75380b261;
    stim[28] = 64'h56900bd62148e832;
    stim[29] = 64'h2cfc0439f7ef874e;
    stim[30] = 64'h22387f6eed94da2a;
    stim[31] = 64'h4d0b68091b63a092;
    stim[32] = 64'h6e8a6f760c1085dd;
    stim[33] = 64'h1239834df620562a;
    stim[34] = 64'h4027a1087422c1de;
    stim[35] = 64'h44d39e0939b6baef;
    stim[36] = 64'h385cb399b611c6f6;
    stim[37] = 64'h240bd56873f7171f;
    stim[38] = 64'h103d22de59dec824;
    stim[39] = 64'h6bee085064d3d346;
    stim[40] = 64'h4ce119d23f30a409;
    stim[41] = 64'h165b998d557ed817;
    stim[42] = 64'h78ecaa307f0700fc;
    stim[43] = 64'ha41a5cc4e35304bd;
    stim[44] = 64'h4b40da102591ca7a;
    stim[45] = 64'h16cabe344c2b4bb9;
    stim[46] = 64'h4317fc48b983771c;
    stim[47] = 64'h2019d978e80353bf;
    stim[48] = 64'h4ad54ffe2a7ac5bf;
    stim[49] = 64'h30275d7cd54c7e2e;
    stim[50] = 64'h023587e8109d90e9;
    stim[51] = 64'h3ef203642ef5bab8;
    stim[52] = 64'h5af93f6e26fd7c85;
    stim[53] = 64'h78de1964bd3ed542;
    stim[54] = 64'h14a56bbc62b538a2;
    stim[55] = 64'h278cb88a4be7fdc4;
    stim[56] = 64'h618d2d64b19656cb;
    stim[57] = 64'h7a18fa66f67869d2;
    stim[58] = 64'h0f4ebec44c5233f6;
    stim[59] = 64'h6fceb61b27f38c36;
    stim[60] = 64'h4e6e7ca20cfeb2c3;
    stim[61] = 64'h0a347a1d1f490d83;
    stim[62] = 64'h08f9408b7edeee04;
    stim[63] = 64'h5df1014cc18aedf8;
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
      expv[0] = 33'h100000000;
      expv[1] = 33'h100000000;
      expv[2] = 33'h100000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h100000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h100000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h100000000;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h100000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h100000000;
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
