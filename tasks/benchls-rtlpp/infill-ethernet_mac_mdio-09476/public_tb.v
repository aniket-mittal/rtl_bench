// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09476 dut (
    .clk(clk),
    .ff_tx_data(in_vec[86:55]),
    .ff_tx_eop(in_vec[54:54]),
    .ff_tx_err(in_vec[53:53]),
    .ff_tx_mod(in_vec[52:51]),
    .ff_tx_sop(in_vec[50:50]),
    .ff_tx_wren(in_vec[49:49]),
    .ff_tx_clk(in_vec[48:48]),
    .ff_rx_rdy(in_vec[47:47]),
    .ff_rx_clk(in_vec[46:46]),
    .address(in_vec[45:38]),
    .read(in_vec[37:37]),
    .writedata(in_vec[36:5]),
    .write(in_vec[4:4]),
    .reset(in_vec[3:3]),
    .mdio_in(in_vec[2:2]),
    .rxp(in_vec[1:1]),
    .ref_clk(in_vec[0:0]),
    .ff_tx_rdy(out_vec[87:87]),
    .ff_rx_data(out_vec[86:55]),
    .ff_rx_dval(out_vec[54:54]),
    .ff_rx_eop(out_vec[53:53]),
    .ff_rx_mod(out_vec[52:51]),
    .ff_rx_sop(out_vec[50:50]),
    .rx_err(out_vec[49:44]),
    .readdata(out_vec[43:12]),
    .waitrequest(out_vec[11:11]),
    .mdio_out(out_vec[10:10]),
    .mdio_oen(out_vec[9:9]),
    .mdc(out_vec[8:8]),
    .led_an(out_vec[7:7]),
    .led_char_err(out_vec[6:6]),
    .led_link(out_vec[5:5]),
    .led_disp_err(out_vec[4:4]),
    .led_crs(out_vec[3:3]),
    .led_col(out_vec[2:2]),
    .txp(out_vec[1:1]),
    .rx_recovclkout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h79205b4e2831b8da0eb7ab;
    stim[1] = 87'h3ac4d72eeadb13f916b53d;
    stim[2] = 87'h03f3f1e488b3aee9d1ae85;
    stim[3] = 87'h27bf64a38ef9110e4fd026;
    stim[4] = 87'h35addd41c231c2b192bf03;
    stim[5] = 87'h1a1f05583afc887b5636f4;
    stim[6] = 87'h775ac75d7d1ff156b12245;
    stim[7] = 87'h11f3a5b531216c2daff0d2;
    stim[8] = 87'h79e220c8f89bec2a213601;
    stim[9] = 87'h558ede5b759053e1d39ae7;
    stim[10] = 87'h425bee9d9be81bfb7eed92;
    stim[11] = 87'h4b8798873eb15b128b6701;
    stim[12] = 87'h590cc6098f1de4643b6ba7;
    stim[13] = 87'h32b381e0fcdc735aeb15a2;
    stim[14] = 87'h1a30be956da6b81fcc8ea1;
    stim[15] = 87'h61b6d4259a73a8b1c2f1f4;
    stim[16] = 87'h31f671cb15ddf0e251eeb1;
    stim[17] = 87'h6a415e22db3014d9e39042;
    stim[18] = 87'h4ae359e11ce38cac9461a1;
    stim[19] = 87'h18d3f61660fbe12ab1b365;
    stim[20] = 87'h7bfeb59c2fa25caa2c7193;
    stim[21] = 87'h1201aae2d2d7531b740b66;
    stim[22] = 87'h60d9e60c48c0d39cb00ad3;
    stim[23] = 87'h1782a2b4c79d361ab4f5c6;
    stim[24] = 87'h4123b6da1b8f6ce31ab864;
    stim[25] = 87'h4c0895c1e7d6208e8b8e94;
    stim[26] = 87'h6c55047a4ea6a7f2d43092;
    stim[27] = 87'h5c996d14959b4501890eef;
    stim[28] = 87'h7099c0e0b65e729a973c20;
    stim[29] = 87'h4d8347b574a5cad777e037;
    stim[30] = 87'h0366fcc4f9ed1a00acfa14;
    stim[31] = 87'h79921277ea796013d1d432;
    stim[32] = 87'h2016bbeb67c318716d0844;
    stim[33] = 87'h48f6faaa600c5fdfc70ad7;
    stim[34] = 87'h5d087375d932e479fffaa2;
    stim[35] = 87'h15aa57fdbe1a40c565c687;
    stim[36] = 87'h3ea0068b5a304ed2ef1a20;
    stim[37] = 87'h2598a4d2d3e3aad6f085f1;
    stim[38] = 87'h0c1acde1346a07b75a9b54;
    stim[39] = 87'h59a1c6a3aa30c23817c153;
    stim[40] = 87'h423204a333ee98b17c5db2;
    stim[41] = 87'h75d5ae97dbae20f2d301d5;
    stim[42] = 87'h72ade9d44787e366b308ed;
    stim[43] = 87'h1e6b3727128fa22027cae7;
    stim[44] = 87'h3351cb05735b6402c82344;
    stim[45] = 87'h5552d29b44a290596d5774;
    stim[46] = 87'h5d83bfe56e8adfe3245475;
    stim[47] = 87'h226b6b7dfaea4c59d83302;
    stim[48] = 87'h4179e749cec1d2f76acf11;
    stim[49] = 87'h62a77f02cdec8a41ce5d63;
    stim[50] = 87'h43f0934b191d5e8eee2da1;
    stim[51] = 87'h1f98e343684e3657361962;
    stim[52] = 87'h63342a100e1c467b96cf16;
    stim[53] = 87'h000743f07909c309cebfa7;
    stim[54] = 87'h674fd5a4e779ffa97748d2;
    stim[55] = 87'h62106958c5b46b7e63bd82;
    stim[56] = 87'h60bd757fa72585ea5640b7;
    stim[57] = 87'h0ef015eb02a51740a5c953;
    stim[58] = 87'h14994ba076938cc70a43c1;
    stim[59] = 87'h0a78aa2e087b30e55e89c2;
    stim[60] = 87'h08b5770293cb478b397ac6;
    stim[61] = 87'h2726b27789a83efc2c92b1;
    stim[62] = 87'h7a099682bc75e6ed884f41;
    stim[63] = 87'h3aa9d79a2384767de59db3;
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
      expv[0] = 88'h0000000000000000000000;
      expv[1] = 88'h0000000000000000000000;
      expv[2] = 88'h0000000000000000000000;
      expv[3] = 88'h0000000000000000000000;
      expv[4] = 88'h0000000000000000000000;
      expv[5] = 88'h0000000000000000000000;
      expv[6] = 88'h0000000000000000000000;
      expv[7] = 88'h0000000000000000000000;
      expv[8] = 88'h0000000000000000000000;
      expv[9] = 88'h0000000000000000000000;
      expv[10] = 88'h0000000000000000000000;
      expv[11] = 88'h0000000000000000000000;
      expv[12] = 88'h0000000000000000000000;
      expv[13] = 88'h0000000000000000000000;
      expv[14] = 88'h0000000000000000000000;
      expv[15] = 88'h0000000000000000000000;
      expv[16] = 88'h0000000000000000000000;
      expv[17] = 88'h0000000000000000000000;
      expv[18] = 88'h0000000000000000000000;
      expv[19] = 88'h0000000000000000000000;
      expv[20] = 88'h0000000000000000000000;
      expv[21] = 88'h0000000000000000000000;
      expv[22] = 88'h0000000000000000000000;
      expv[23] = 88'h0000000000000000000000;
      expv[24] = 88'h0000000000000000000000;
      expv[25] = 88'h0000000000000000000000;
      expv[26] = 88'h0000000000000000000000;
      expv[27] = 88'h0000000000000000000000;
      expv[28] = 88'h0000000000000000000000;
      expv[29] = 88'h0000000000000000000000;
      expv[30] = 88'h0000000000000000000000;
      expv[31] = 88'h0000000000000000000000;
      expv[32] = 88'h0000000000000000000000;
      expv[33] = 88'h0000000000000000000000;
      expv[34] = 88'h0000000000000000000000;
      expv[35] = 88'h0000000000000000000000;
      expv[36] = 88'h0000000000000000000000;
      expv[37] = 88'h0000000000000000000000;
      expv[38] = 88'h0000000000000000000000;
      expv[39] = 88'h0000000000000000000000;
      expv[40] = 88'h0000000000000000000000;
      expv[41] = 88'h0000000000000000000000;
      expv[42] = 88'h0000000000000000000000;
      expv[43] = 88'h0000000000000000000000;
      expv[44] = 88'h0000000000000000000000;
      expv[45] = 88'h0000000000000000000000;
      expv[46] = 88'h0000000000000000000000;
      expv[47] = 88'h0000000000000000000000;
      expv[48] = 88'h0000000000000000000000;
      expv[49] = 88'h0000000000000000000000;
      expv[50] = 88'h0000000000000000000000;
      expv[51] = 88'h0000000000000000000000;
      expv[52] = 88'h0000000000000000000000;
      expv[53] = 88'h0000000000000000000000;
      expv[54] = 88'h0000000000000000000000;
      expv[55] = 88'h0000000000000000000000;
      expv[56] = 88'h0000000000000000000000;
      expv[57] = 88'h0000000000000000000000;
      expv[58] = 88'h0000000000000000000000;
      expv[59] = 88'h0000000000000000000000;
      expv[60] = 88'h0000000000000000000000;
      expv[61] = 88'h0000000000000000000000;
      expv[62] = 88'h0000000000000000000000;
      expv[63] = 88'h0000000000000000000000;
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
