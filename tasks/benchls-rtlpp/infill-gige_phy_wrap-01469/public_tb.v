// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01469 dut (
    .clk(clk),
    .gmii_tx_d(in_vec[43:36]),
    .gmii_tx_en(in_vec[35:35]),
    .gmii_tx_err(in_vec[34:34]),
    .reset_tx_clk(in_vec[33:33]),
    .reset_rx_clk(in_vec[32:32]),
    .address(in_vec[31:27]),
    .read(in_vec[26:26]),
    .writedata(in_vec[25:10]),
    .write(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .rxp(in_vec[7:7]),
    .ref_clk(in_vec[6:6]),
    .reconfig_clk(in_vec[5:5]),
    .reconfig_togxb(in_vec[4:1]),
    .gxb_cal_blk_clk(in_vec[0:0]),
    .gmii_rx_d(out_vec[50:43]),
    .gmii_rx_dv(out_vec[42:42]),
    .gmii_rx_err(out_vec[41:41]),
    .tx_clk(out_vec[40:40]),
    .rx_clk(out_vec[39:39]),
    .readdata(out_vec[38:23]),
    .waitrequest(out_vec[22:22]),
    .txp(out_vec[21:21]),
    .reconfig_fromgxb(out_vec[20:4]),
    .led_an(out_vec[3:3]),
    .led_disp_err(out_vec[2:2]),
    .led_char_err(out_vec[1:1]),
    .led_link(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h280ce5881bf;
    stim[1] = 44'hed05b4245a3;
    stim[2] = 44'h2f06a7e3ea6;
    stim[3] = 44'ha961b003c30;
    stim[4] = 44'h0cb965d5831;
    stim[5] = 44'h85fc80066e4;
    stim[6] = 44'h909dbd76084;
    stim[7] = 44'hfc91ccb1e2e;
    stim[8] = 44'h4cc46cc5ec1;
    stim[9] = 44'he47799148a4;
    stim[10] = 44'h08e3bd5a8e1;
    stim[11] = 44'h7e347cc8204;
    stim[12] = 44'hc95d9aec82a;
    stim[13] = 44'ha7f0686a089;
    stim[14] = 44'h51b11b98e35;
    stim[15] = 44'h59f95c2a87e;
    stim[16] = 44'h4ca1ce0b67d;
    stim[17] = 44'h77ab0286a96;
    stim[18] = 44'h7811d768abf;
    stim[19] = 44'hd4b45f886e2;
    stim[20] = 44'h5bf2459806a;
    stim[21] = 44'h32dd3248c17;
    stim[22] = 44'h19efb1106f1;
    stim[23] = 44'h0035ede0e70;
    stim[24] = 44'h72506a6fcfb;
    stim[25] = 44'h0dec8c614c0;
    stim[26] = 44'h4b508932237;
    stim[27] = 44'h5dd867e1486;
    stim[28] = 44'h2b1bd898e42;
    stim[29] = 44'h066b733c090;
    stim[30] = 44'h06d7b3e504d;
    stim[31] = 44'hb6c161e043e;
    stim[32] = 44'h7c9eebc8a97;
    stim[33] = 44'h7ed6e2e8af7;
    stim[34] = 44'ha4dd466b060;
    stim[35] = 44'hf58fac91af9;
    stim[36] = 44'he845a1faec8;
    stim[37] = 44'h6fdec719018;
    stim[38] = 44'hb4ecb9588b5;
    stim[39] = 44'h6266d4b4830;
    stim[40] = 44'h98fa7d4b694;
    stim[41] = 44'h42a16495f69;
    stim[42] = 44'h8de8d124af7;
    stim[43] = 44'h6a24a17f2f5;
    stim[44] = 44'h9d7103b40b9;
    stim[45] = 44'h2f57541c282;
    stim[46] = 44'hd416d0d986d;
    stim[47] = 44'h57637e9d0a2;
    stim[48] = 44'haf392f578fb;
    stim[49] = 44'he4c67f5189b;
    stim[50] = 44'h81f594fc230;
    stim[51] = 44'hc6de4ea5a9d;
    stim[52] = 44'h2fd44f7a81e;
    stim[53] = 44'ha0eb47620cd;
    stim[54] = 44'hd272a701005;
    stim[55] = 44'h73f5a035cb2;
    stim[56] = 44'h7bf6ad51ef5;
    stim[57] = 44'ha6e970570b5;
    stim[58] = 44'h799d35248e1;
    stim[59] = 44'h8ea4bb54c7f;
    stim[60] = 44'h28110a33c33;
    stim[61] = 44'hc9ce842bcb3;
    stim[62] = 44'h23848076898;
    stim[63] = 44'h5c74b53c6db;
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
      expv[0] = 51'h1404b100000f9;
      expv[1] = 51'h7686848800019;
      expv[2] = 51'h1784fc7c00031;
      expv[3] = 51'h54a6007800084;
      expv[4] = 51'h0644bab200086;
      expv[5] = 51'h42e000ce00027;
      expv[6] = 51'h4847aec200023;
      expv[7] = 51'h7e41963e00072;
      expv[8] = 51'h266598be00001;
      expv[9] = 51'h7223229000027;
      expv[10] = 51'h0467ab5200005;
      expv[11] = 51'h3f07990400026;
      expv[12] = 51'h64a35d9000052;
      expv[13] = 51'h53e50d4200047;
      expv[14] = 51'h28c3731e000a6;
      expv[15] = 51'h2ce38552000f6;
      expv[16] = 51'h2641c16e000e4;
      expv[17] = 51'h3bc050d6000b5;
      expv[18] = 51'h3c02ed14000f3;
      expv[19] = 51'h6a43f10e00017;
      expv[20] = 51'h2de0b30200056;
      expv[21] = 51'h1966491a000b2;
      expv[22] = 51'h0ce6220e00085;
      expv[23] = 51'h0005bc1c00086;
      expv[24] = 51'h39254df8000d3;
      expv[25] = 51'h06e18c2a00005;
      expv[26] = 51'h25a12644000b2;
      expv[27] = 51'h2ee4fc2a00033;
      expv[28] = 51'h1583131c00012;
      expv[29] = 51'h0326678000085;
      expv[30] = 51'h03667ca200062;
      expv[31] = 51'h5b643c0a000f0;
      expv[32] = 51'h3e457916000b3;
      expv[33] = 51'h3f645d16000b3;
      expv[34] = 51'h5260cd6200002;
      expv[35] = 51'h7ac59236000c1;
      expv[36] = 51'h74243f5c00041;
      expv[37] = 51'h37e0e322000c2;
      expv[38] = 51'h5a672b12000a5;
      expv[39] = 51'h3122969000084;
      expv[40] = 51'h4c67a96e000a7;
      expv[41] = 51'h214492be0004c;
      expv[42] = 51'h46e22496000b5;
      expv[43] = 51'h35042fe4000a5;
      expv[44] = 51'h4ea07680000c7;
      expv[45] = 51'h17a2838400013;
      expv[46] = 51'h6a021b3000062;
      expv[47] = 51'h2ba7d3a000015;
      expv[48] = 51'h5785eaf0000d7;
      expv[49] = 51'h7267ea32000d1;
      expv[50] = 51'h40e29f8600086;
      expv[51] = 51'h6361d4b6000e3;
      expv[52] = 51'h17e1ef52000f2;
      expv[53] = 51'h5060ec4200065;
      expv[54] = 51'h6924e02000026;
      expv[55] = 51'h39e406ba00097;
      expv[56] = 51'h3de5aa3e000a7;
      expv[57] = 51'h53660ae2000a5;
      expv[58] = 51'h3cc6a49200003;
      expv[59] = 51'h47476a9a000f4;
      expv[60] = 51'h1401467800092;
      expv[61] = 51'h64e0857a00091;
      expv[62] = 51'h11c00ed2000c1;
      expv[63] = 51'h2e26a78c000d7;
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
