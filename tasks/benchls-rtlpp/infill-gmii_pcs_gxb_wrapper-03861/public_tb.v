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

  rtlpp_03861 dut (
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
    stim[0] = 44'h0d9ba7a1903;
    stim[1] = 44'h38b05af67b6;
    stim[2] = 44'hb50679714dc;
    stim[3] = 44'ha7a95ddd250;
    stim[4] = 44'h0f60878ea99;
    stim[5] = 44'hc92617274fd;
    stim[6] = 44'h5d8a154a07d;
    stim[7] = 44'hb6c5b216801;
    stim[8] = 44'h502afd24cfe;
    stim[9] = 44'h7b0ea907cd2;
    stim[10] = 44'hf2b89118cf9;
    stim[11] = 44'hdc11a219a94;
    stim[12] = 44'hb5641bc1e28;
    stim[13] = 44'he2cb64ff400;
    stim[14] = 44'heba193f0085;
    stim[15] = 44'he76c8f0e41c;
    stim[16] = 44'h0c389c6da73;
    stim[17] = 44'hfb54e35841f;
    stim[18] = 44'h46be9dccc80;
    stim[19] = 44'hff865fbbd5a;
    stim[20] = 44'h8c01dc0b479;
    stim[21] = 44'h231a59d5266;
    stim[22] = 44'h4475a5732df;
    stim[23] = 44'h9a63425cc8a;
    stim[24] = 44'h7e0417b763c;
    stim[25] = 44'hdcbf856f842;
    stim[26] = 44'h97bfad9be5c;
    stim[27] = 44'h2ad4f963af1;
    stim[28] = 44'h7c11ff23016;
    stim[29] = 44'h2f0ed141c70;
    stim[30] = 44'hb0820bba45f;
    stim[31] = 44'h0226301ac77;
    stim[32] = 44'h2b9545a38b4;
    stim[33] = 44'h3203210e4ce;
    stim[34] = 44'h8bf833a52b2;
    stim[35] = 44'hcd80f5f7cf0;
    stim[36] = 44'h12e75aa3413;
    stim[37] = 44'hc51be364833;
    stim[38] = 44'h482b3254a54;
    stim[39] = 44'h02c54b9fe75;
    stim[40] = 44'hd859325ce43;
    stim[41] = 44'h5925ba282ba;
    stim[42] = 44'ha041c9e9879;
    stim[43] = 44'h93336043431;
    stim[44] = 44'h72dd955be97;
    stim[45] = 44'h222bbcbf048;
    stim[46] = 44'hd70fcbcb64a;
    stim[47] = 44'hc7630a18a61;
    stim[48] = 44'hc1f51076250;
    stim[49] = 44'h4a600766e05;
    stim[50] = 44'h0de6b3a04a9;
    stim[51] = 44'h3227d8174c4;
    stim[52] = 44'hdb135c7d44e;
    stim[53] = 44'h1ba6789d62b;
    stim[54] = 44'h690f30d48b0;
    stim[55] = 44'hb120c13c6e2;
    stim[56] = 44'hf3298735408;
    stim[57] = 44'h740c9b9323b;
    stim[58] = 44'h749771330f0;
    stim[59] = 44'h23dc286066c;
    stim[60] = 44'h3ba717de65b;
    stim[61] = 44'h82713680e47;
    stim[62] = 44'h4a62cd51611;
    stim[63] = 44'h6c003f4564d;
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
      expv[0] = 51'h06c4f43000000;
      expv[1] = 51'h1c435ec800000;
      expv[2] = 51'h5a872e2800000;
      expv[3] = 51'h53c3bba000000;
      expv[4] = 51'h07a0f1d000000;
      expv[5] = 51'h6482e4e800000;
      expv[6] = 51'h2ec2a94000000;
      expv[7] = 51'h5b6642d000000;
      expv[8] = 51'h2807a49800000;
      expv[9] = 51'h3d8520f800000;
      expv[10] = 51'h7942231800000;
      expv[11] = 51'h6e04433000000;
      expv[12] = 51'h5aa3783800000;
      expv[13] = 51'h71649fe800000;
      expv[14] = 51'h75c27e0000000;
      expv[15] = 51'h73a1e1c800000;
      expv[16] = 51'h06038db000000;
      expv[17] = 51'h7da46b0800000;
      expv[18] = 51'h2343b99800000;
      expv[19] = 51'h7fc3f77800000;
      expv[20] = 51'h4603816800000;
      expv[21] = 51'h11833aa000000;
      expv[22] = 51'h2224ae6000000;
      expv[23] = 51'h4d204b9800000;
      expv[24] = 51'h3f02f6e800000;
      expv[25] = 51'h6e40adf000000;
      expv[26] = 51'h4bc5b37800000;
      expv[27] = 51'h15672c7000000;
      expv[28] = 51'h3e07e46000000;
      expv[29] = 51'h1782283800000;
      expv[30] = 51'h5841774800000;
      expv[31] = 51'h0106035800000;
      expv[32] = 51'h15c0b47000000;
      expv[33] = 51'h190421c800000;
      expv[34] = 51'h45e674a000000;
      expv[35] = 51'h66c6bef800000;
      expv[36] = 51'h0963546800000;
      expv[37] = 51'h62846c9000000;
      expv[38] = 51'h24064a9000000;
      expv[39] = 51'h016173f800000;
      expv[40] = 51'h6c264b9800000;
      expv[41] = 51'h2c87450000000;
      expv[42] = 51'h50213d3000000;
      expv[43] = 51'h4984086800000;
      expv[44] = 51'h3962ab7800000;
      expv[45] = 51'h110797e000000;
      expv[46] = 51'h6b81796800000;
      expv[47] = 51'h63a1431000000;
      expv[48] = 51'h60e20ec000000;
      expv[49] = 51'h2520ecd800000;
      expv[50] = 51'h06e6740800000;
      expv[51] = 51'h190302e800000;
      expv[52] = 51'h6d838fa800000;
      expv[53] = 51'h0dc713a800000;
      expv[54] = 51'h34861a9000000;
      expv[55] = 51'h5880278800000;
      expv[56] = 51'h7980e6a800000;
      expv[57] = 51'h3a03726000000;
      expv[58] = 51'h3a46266000000;
      expv[59] = 51'h11e50c0800000;
      expv[60] = 51'h1dc2fbc800000;
      expv[61] = 51'h4126d01800000;
      expv[62] = 51'h2521aa2800000;
      expv[63] = 51'h3607e8a800000;
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
