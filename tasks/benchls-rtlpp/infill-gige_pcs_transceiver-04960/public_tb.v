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

  rtlpp_04960 dut (
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
    stim[0] = 44'h8fc6465afca;
    stim[1] = 44'hf6b611c8b21;
    stim[2] = 44'h1e45fe5eafe;
    stim[3] = 44'he4c05ee04d9;
    stim[4] = 44'h31c06f5348b;
    stim[5] = 44'h696cf680ca7;
    stim[6] = 44'h0c6fda9bc60;
    stim[7] = 44'h95a0ae26825;
    stim[8] = 44'h18a7c953256;
    stim[9] = 44'h8b54d04464e;
    stim[10] = 44'h28d67c5a0d1;
    stim[11] = 44'h37d66e5b27d;
    stim[12] = 44'h5405166be67;
    stim[13] = 44'h212e84e6717;
    stim[14] = 44'h0066f3abe7e;
    stim[15] = 44'h0fba25a6aca;
    stim[16] = 44'ha4e651d6442;
    stim[17] = 44'hd7e587fc85f;
    stim[18] = 44'h2fedfd1b0be;
    stim[19] = 44'hc0aca225e40;
    stim[20] = 44'hffa4294a6e3;
    stim[21] = 44'hdaa4d08189b;
    stim[22] = 44'h4a4283041fa;
    stim[23] = 44'h2e798784a71;
    stim[24] = 44'h0d967ad90d1;
    stim[25] = 44'h2109364cafd;
    stim[26] = 44'h68b40d7d664;
    stim[27] = 44'h70122120845;
    stim[28] = 44'haa93a41dccf;
    stim[29] = 44'hfe5a3b9264e;
    stim[30] = 44'h40e194b8e03;
    stim[31] = 44'h20fcd9380bb;
    stim[32] = 44'h173fdbfa241;
    stim[33] = 44'h46f8cbf06c8;
    stim[34] = 44'hb1986563087;
    stim[35] = 44'h3feafd4f08f;
    stim[36] = 44'h7b3784b2587;
    stim[37] = 44'h12b7721f20a;
    stim[38] = 44'h45e66dfea29;
    stim[39] = 44'h40e98110277;
    stim[40] = 44'h1ddca211a19;
    stim[41] = 44'h698c673bae9;
    stim[42] = 44'he4151522864;
    stim[43] = 44'h844adbb8a91;
    stim[44] = 44'hf47014364ca;
    stim[45] = 44'h86814fad8fc;
    stim[46] = 44'h80c09725637;
    stim[47] = 44'h2f90e591a7e;
    stim[48] = 44'he2db8caa870;
    stim[49] = 44'he393938c20d;
    stim[50] = 44'h54739b99e65;
    stim[51] = 44'hd0f44069855;
    stim[52] = 44'h66bbaadaa03;
    stim[53] = 44'h3028af5a4ad;
    stim[54] = 44'hafc4d3a728f;
    stim[55] = 44'hfee05b1d443;
    stim[56] = 44'h9761e9faa5d;
    stim[57] = 44'haafce183004;
    stim[58] = 44'ha82d13f0e5e;
    stim[59] = 44'he9e89b50aa0;
    stim[60] = 44'h72b23efacc7;
    stim[61] = 44'hd26f19ab4ac;
    stim[62] = 44'hd8f23821cd0;
    stim[63] = 44'h3e87ac13065;
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
