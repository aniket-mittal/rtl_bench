// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00031 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .phy_tx_mode(in_vec[13:13]),
    .rxd(in_vec[12:12]),
    .rxdp(in_vec[11:11]),
    .rxdn(in_vec[10:10]),
    .LineCtrl_i(in_vec[9:9]),
    .DataOut_i(in_vec[8:1]),
    .TxValid_i(in_vec[0:0]),
    .usb_rst(out_vec[21:21]),
    .txdp(out_vec[20:20]),
    .txdn(out_vec[19:19]),
    .txoe(out_vec[18:18]),
    .ce_o(out_vec[17:17]),
    .sync_err_o(out_vec[16:16]),
    .bit_stuff_err_o(out_vec[15:15]),
    .byte_err_o(out_vec[14:14]),
    .TxReady_o(out_vec[13:13]),
    .DataIn_o(out_vec[12:5]),
    .RxValid_o(out_vec[4:4]),
    .RxActive_o(out_vec[3:3]),
    .RxError_o(out_vec[2:2]),
    .LineState_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h6f15;
    stim[1] = 15'h6ea0;
    stim[2] = 15'h35cc;
    stim[3] = 15'h11c7;
    stim[4] = 15'h04a0;
    stim[5] = 15'h0561;
    stim[6] = 15'h3160;
    stim[7] = 15'h151a;
    stim[8] = 15'h0702;
    stim[9] = 15'h1ad0;
    stim[10] = 15'h2903;
    stim[11] = 15'h2c17;
    stim[12] = 15'h2ea9;
    stim[13] = 15'h3c20;
    stim[14] = 15'h35e3;
    stim[15] = 15'h0b2d;
    stim[16] = 15'h399c;
    stim[17] = 15'h3a5f;
    stim[18] = 15'h24fe;
    stim[19] = 15'h1cfe;
    stim[20] = 15'h2c87;
    stim[21] = 15'h2b80;
    stim[22] = 15'h2e1c;
    stim[23] = 15'h2613;
    stim[24] = 15'h16d5;
    stim[25] = 15'h214f;
    stim[26] = 15'h2036;
    stim[27] = 15'h1f67;
    stim[28] = 15'h3460;
    stim[29] = 15'h1c66;
    stim[30] = 15'h1dd3;
    stim[31] = 15'h3318;
    stim[32] = 15'h1629;
    stim[33] = 15'h3098;
    stim[34] = 15'h0bd3;
    stim[35] = 15'h0a99;
    stim[36] = 15'h2d5b;
    stim[37] = 15'h2c29;
    stim[38] = 15'h35fc;
    stim[39] = 15'h117e;
    stim[40] = 15'h1866;
    stim[41] = 15'h2149;
    stim[42] = 15'h3aed;
    stim[43] = 15'h0cc6;
    stim[44] = 15'h1c50;
    stim[45] = 15'h10d3;
    stim[46] = 15'h2c75;
    stim[47] = 15'h26e9;
    stim[48] = 15'h0800;
    stim[49] = 15'h2a67;
    stim[50] = 15'h33bb;
    stim[51] = 15'h2e5c;
    stim[52] = 15'h23d1;
    stim[53] = 15'h3f7d;
    stim[54] = 15'h0db0;
    stim[55] = 15'h35dc;
    stim[56] = 15'h0eda;
    stim[57] = 15'h17b3;
    stim[58] = 15'h39b4;
    stim[59] = 15'h097f;
    stim[60] = 15'h3774;
    stim[61] = 15'h10c8;
    stim[62] = 15'h3f99;
    stim[63] = 15'h2910;
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
      expv[0] = 22'h040003;
      expv[1] = 22'h04181b;
      expv[2] = 22'h040001;
      expv[3] = 22'h000000;
      expv[4] = 22'h002001;
      expv[5] = 22'h000001;
      expv[6] = 22'h042000;
      expv[7] = 22'h000001;
      expv[8] = 22'h000001;
      expv[9] = 22'h000002;
      expv[10] = 22'h040002;
      expv[11] = 22'h042003;
      expv[12] = 22'h042003;
      expv[13] = 22'h142003;
      expv[14] = 22'h140001;
      expv[15] = 22'h002002;
      expv[16] = 22'h042002;
      expv[17] = 22'h040002;
      expv[18] = 22'h042001;
      expv[19] = 22'h000003;
      expv[20] = 22'h040003;
      expv[21] = 22'h042002;
      expv[22] = 22'h040003;
      expv[23] = 22'h040001;
      expv[24] = 22'h002001;
      expv[25] = 22'h0c2000;
      expv[26] = 22'h042000;
      expv[27] = 22'h000003;
      expv[28] = 22'h042001;
      expv[29] = 22'h000003;
      expv[30] = 22'h000003;
      expv[31] = 22'h042000;
      expv[32] = 22'h000001;
      expv[33] = 22'h042000;
      expv[34] = 22'h000002;
      expv[35] = 22'h002002;
      expv[36] = 22'h042003;
      expv[37] = 22'h042003;
      expv[38] = 22'h042001;
      expv[39] = 22'h000000;
      expv[40] = 22'h000002;
      expv[41] = 22'h040000;
      expv[42] = 22'h042002;
      expv[43] = 22'h002003;
      expv[44] = 22'h000003;
      expv[45] = 22'h000000;
      expv[46] = 22'h042003;
      expv[47] = 22'h0c2001;
      expv[48] = 22'h002002;
      expv[49] = 22'h040002;
      expv[50] = 22'h042000;
      expv[51] = 22'h042003;
      expv[52] = 22'h040000;
      expv[53] = 22'h042003;
      expv[54] = 22'h002003;
      expv[55] = 22'h040001;
      expv[56] = 22'h000003;
      expv[57] = 22'h000001;
      expv[58] = 22'h042002;
      expv[59] = 22'h000002;
      expv[60] = 22'h042001;
      expv[61] = 22'h000000;
      expv[62] = 22'h040003;
      expv[63] = 22'h042002;
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
