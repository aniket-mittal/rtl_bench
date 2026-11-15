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

  rtlpp_11107 dut (
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
    stim[0] = 44'ha183bf1335a;
    stim[1] = 44'hdb565e985fc;
    stim[2] = 44'h5dabf28fcbb;
    stim[3] = 44'h2bdabbbb8f5;
    stim[4] = 44'hb100ab9a4cd;
    stim[5] = 44'h9bdeaa546a9;
    stim[6] = 44'h5ebe0157c6a;
    stim[7] = 44'h6757c1e3481;
    stim[8] = 44'hd8c7e7d7edc;
    stim[9] = 44'h06b36457e0a;
    stim[10] = 44'h6f1c04bfab3;
    stim[11] = 44'ha5671730c70;
    stim[12] = 44'hf14ba99df46;
    stim[13] = 44'h9e8a7649ee3;
    stim[14] = 44'hf1961f5ae53;
    stim[15] = 44'hb787d807298;
    stim[16] = 44'h8a68221b6e5;
    stim[17] = 44'h31a8fa11e96;
    stim[18] = 44'hc4d21a6a8aa;
    stim[19] = 44'h2f4123640b1;
    stim[20] = 44'haae15bbe8b5;
    stim[21] = 44'hb8b7254c0c7;
    stim[22] = 44'h1e12df8b43b;
    stim[23] = 44'h94689f4f1b5;
    stim[24] = 44'hb41afb53ad2;
    stim[25] = 44'hbb2ee58ea8b;
    stim[26] = 44'h153c46fdc84;
    stim[27] = 44'hf382751c432;
    stim[28] = 44'h853272b047f;
    stim[29] = 44'h0a60e4ad858;
    stim[30] = 44'hfea039748a8;
    stim[31] = 44'h677209e70e3;
    stim[32] = 44'h74dad7afc87;
    stim[33] = 44'h079d9761410;
    stim[34] = 44'h2647995f690;
    stim[35] = 44'hbbca045d2ee;
    stim[36] = 44'h34b5accacb8;
    stim[37] = 44'h6de68b31c27;
    stim[38] = 44'hef727cfbe39;
    stim[39] = 44'h1a03ae4e236;
    stim[40] = 44'he2992a15f18;
    stim[41] = 44'h0890be390c5;
    stim[42] = 44'h88450df644d;
    stim[43] = 44'h17fb3d5b2d7;
    stim[44] = 44'hf713cbf6aa7;
    stim[45] = 44'h35015571684;
    stim[46] = 44'h169c0b3b288;
    stim[47] = 44'h8baea18c420;
    stim[48] = 44'h465086a567c;
    stim[49] = 44'h0cd07fa761b;
    stim[50] = 44'hff8c7f54c1d;
    stim[51] = 44'ha4a715e8436;
    stim[52] = 44'hbe815e0ba6a;
    stim[53] = 44'hd29e57b163f;
    stim[54] = 44'he18b556a437;
    stim[55] = 44'h869fe4cf515;
    stim[56] = 44'hefa58d3beeb;
    stim[57] = 44'ha02037a867f;
    stim[58] = 44'h6234347885b;
    stim[59] = 44'h4b5a716c6cd;
    stim[60] = 44'h206ed35205e;
    stim[61] = 44'h935ffca4ed7;
    stim[62] = 44'ha33cad4aaa3;
    stim[63] = 44'h2865690f211;
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
      expv[3] = 51'h0018000000000;
      expv[4] = 51'h0000000000000;
      expv[5] = 51'h0018000000000;
      expv[6] = 51'h0000000000000;
      expv[7] = 51'h0018000000000;
      expv[8] = 51'h0000000000000;
      expv[9] = 51'h0018000000000;
      expv[10] = 51'h0000000000000;
      expv[11] = 51'h0018000000000;
      expv[12] = 51'h0000000000000;
      expv[13] = 51'h0000000000000;
      expv[14] = 51'h0018000000000;
      expv[15] = 51'h0000000000000;
      expv[16] = 51'h0018000000000;
      expv[17] = 51'h0000000000000;
      expv[18] = 51'h0018000000000;
      expv[19] = 51'h0000000000000;
      expv[20] = 51'h0018000000000;
      expv[21] = 51'h0000000000000;
      expv[22] = 51'h0018000000000;
      expv[23] = 51'h0000000000000;
      expv[24] = 51'h0000000000000;
      expv[25] = 51'h0018000000000;
      expv[26] = 51'h0000000000000;
      expv[27] = 51'h0018000000000;
      expv[28] = 51'h0000000000000;
      expv[29] = 51'h0018000000000;
      expv[30] = 51'h0000000000000;
      expv[31] = 51'h0018000000000;
      expv[32] = 51'h0000000000000;
      expv[33] = 51'h0018000000000;
      expv[34] = 51'h0000000000000;
      expv[35] = 51'h0018000000000;
      expv[36] = 51'h0000000000000;
      expv[37] = 51'h0018000000000;
      expv[38] = 51'h0000000000000;
      expv[39] = 51'h0018000000000;
      expv[40] = 51'h0000000000000;
      expv[41] = 51'h0000000000000;
      expv[42] = 51'h0018000000000;
      expv[43] = 51'h0000000000000;
      expv[44] = 51'h0018000000000;
      expv[45] = 51'h0000000000000;
      expv[46] = 51'h0018000000000;
      expv[47] = 51'h0000000000000;
      expv[48] = 51'h0018000000000;
      expv[49] = 51'h0000000000000;
      expv[50] = 51'h0018000000000;
      expv[51] = 51'h0000000000000;
      expv[52] = 51'h0018000000000;
      expv[53] = 51'h0000000000000;
      expv[54] = 51'h0018000000000;
      expv[55] = 51'h0000000000000;
      expv[56] = 51'h0000000000000;
      expv[57] = 51'h0018000000000;
      expv[58] = 51'h0000000000000;
      expv[59] = 51'h0018000000000;
      expv[60] = 51'h0000000000000;
      expv[61] = 51'h0018000000000;
      expv[62] = 51'h0000000000000;
      expv[63] = 51'h0018000000000;
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
