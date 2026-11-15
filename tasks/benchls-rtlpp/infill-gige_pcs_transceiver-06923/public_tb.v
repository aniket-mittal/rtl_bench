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

  rtlpp_06923 dut (
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
    stim[0] = 44'h6a827e0ef9d;
    stim[1] = 44'h2497a2a7de5;
    stim[2] = 44'hfbff624b67b;
    stim[3] = 44'hb7eeac73cce;
    stim[4] = 44'h5c47bea2220;
    stim[5] = 44'h61da0751a06;
    stim[6] = 44'h04e7350ca4d;
    stim[7] = 44'h4d0fc4ac8ba;
    stim[8] = 44'hdde0c29c472;
    stim[9] = 44'h481c1c4cc8c;
    stim[10] = 44'h0ec3e7a0c69;
    stim[11] = 44'h46ff5bddecc;
    stim[12] = 44'h6b1c554c4c7;
    stim[13] = 44'h297b8456e37;
    stim[14] = 44'hb74677b8e4f;
    stim[15] = 44'h53f875d9246;
    stim[16] = 44'h9718e77c83b;
    stim[17] = 44'h344ed3ea0c7;
    stim[18] = 44'hd850434f2ae;
    stim[19] = 44'h057a1feb8cf;
    stim[20] = 44'had5eaba80ce;
    stim[21] = 44'h969e9a15ae7;
    stim[22] = 44'h47202d848ec;
    stim[23] = 44'h1a95bb32ebc;
    stim[24] = 44'hfbb49b524df;
    stim[25] = 44'h584a32db6e2;
    stim[26] = 44'hfe1e28b6aca;
    stim[27] = 44'h77b552be585;
    stim[28] = 44'h85d45b28063;
    stim[29] = 44'h0faf418063e;
    stim[30] = 44'hd2664b536e8;
    stim[31] = 44'hd4b4c75b413;
    stim[32] = 44'h2290d6c64e1;
    stim[33] = 44'hc7730c84254;
    stim[34] = 44'h7dcdfa1aeb5;
    stim[35] = 44'h5a978249498;
    stim[36] = 44'hb76d3e8c6c0;
    stim[37] = 44'h84ddbd5489f;
    stim[38] = 44'had31ae0f4d8;
    stim[39] = 44'h766a6cd9467;
    stim[40] = 44'h48f2be404f9;
    stim[41] = 44'h204bb781a5e;
    stim[42] = 44'h390d381a0e5;
    stim[43] = 44'h83db0680031;
    stim[44] = 44'hd090eb4f85c;
    stim[45] = 44'h9fb0fd128b7;
    stim[46] = 44'h36740eab621;
    stim[47] = 44'h5aec910b059;
    stim[48] = 44'h70f460ef66d;
    stim[49] = 44'hf95cb5a4e63;
    stim[50] = 44'h0d9c8123a9a;
    stim[51] = 44'ha77c95af032;
    stim[52] = 44'hc8e6d396a73;
    stim[53] = 44'he86a460c4d6;
    stim[54] = 44'h8d79a6170ae;
    stim[55] = 44'h83a09f0c03f;
    stim[56] = 44'h69c0111cae4;
    stim[57] = 44'he8b2ec7fe53;
    stim[58] = 44'he2993e4bae6;
    stim[59] = 44'hd63e3ff4a57;
    stim[60] = 44'hb4c3ab11a02;
    stim[61] = 44'h2fffc138ac2;
    stim[62] = 44'hac9d9c3365d;
    stim[63] = 44'ha908ea8b430;
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
      expv[0] = 51'h0000000000000;
      expv[1] = 51'h0000000000000;
      expv[2] = 51'h0000000000000;
      expv[3] = 51'h0000000000000;
      expv[4] = 51'h0000000000000;
      expv[5] = 51'h0000000000000;
      expv[6] = 51'h0000000000000;
      expv[7] = 51'h0000000000000;
      expv[8] = 51'h0000000000000;
      expv[9] = 51'h0000000000000;
      expv[10] = 51'h0000000000000;
      expv[11] = 51'h0000000000000;
      expv[12] = 51'h0000000000000;
      expv[13] = 51'h0000000000000;
      expv[14] = 51'h0000000000000;
      expv[15] = 51'h0000000000000;
      expv[16] = 51'h0000000000000;
      expv[17] = 51'h0000000000000;
      expv[18] = 51'h0000000000000;
      expv[19] = 51'h0000000000000;
      expv[20] = 51'h0000000000000;
      expv[21] = 51'h0000000000000;
      expv[22] = 51'h0000000000000;
      expv[23] = 51'h0000000000000;
      expv[24] = 51'h0000000000000;
      expv[25] = 51'h0000000000000;
      expv[26] = 51'h0000000000000;
      expv[27] = 51'h0000000000000;
      expv[28] = 51'h0000000000000;
      expv[29] = 51'h0000000000000;
      expv[30] = 51'h0000000000000;
      expv[31] = 51'h0000000000000;
      expv[32] = 51'h0000000000000;
      expv[33] = 51'h0000000000000;
      expv[34] = 51'h0000000000000;
      expv[35] = 51'h0000000000000;
      expv[36] = 51'h0000000000000;
      expv[37] = 51'h0000000000000;
      expv[38] = 51'h0000000000000;
      expv[39] = 51'h0000000000000;
      expv[40] = 51'h0000000000000;
      expv[41] = 51'h0000000000000;
      expv[42] = 51'h0000000000000;
      expv[43] = 51'h0000000000000;
      expv[44] = 51'h0000000000000;
      expv[45] = 51'h0000000000000;
      expv[46] = 51'h0000000000000;
      expv[47] = 51'h0000000000000;
      expv[48] = 51'h0000000000000;
      expv[49] = 51'h0000000000000;
      expv[50] = 51'h0000000000000;
      expv[51] = 51'h0000000000000;
      expv[52] = 51'h0000000000000;
      expv[53] = 51'h0000000000000;
      expv[54] = 51'h0000000000000;
      expv[55] = 51'h0000000000000;
      expv[56] = 51'h0000000000000;
      expv[57] = 51'h0000000000000;
      expv[58] = 51'h0000000000000;
      expv[59] = 51'h0000000000000;
      expv[60] = 51'h0000000000000;
      expv[61] = 51'h0000000000000;
      expv[62] = 51'h0000000000000;
      expv[63] = 51'h0000000000000;
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
