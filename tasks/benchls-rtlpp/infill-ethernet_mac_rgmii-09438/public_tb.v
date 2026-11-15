// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 94;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09438 dut (
    .clk(clk),
    .ff_tx_data(in_vec[93:62]),
    .ff_tx_eop(in_vec[61:61]),
    .ff_tx_err(in_vec[60:60]),
    .ff_tx_mod(in_vec[59:58]),
    .ff_tx_sop(in_vec[57:57]),
    .ff_tx_wren(in_vec[56:56]),
    .ff_tx_clk(in_vec[55:55]),
    .ff_rx_rdy(in_vec[54:54]),
    .ff_rx_clk(in_vec[53:53]),
    .address(in_vec[52:45]),
    .read(in_vec[44:44]),
    .writedata(in_vec[43:12]),
    .write(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .rgmii_in(in_vec[9:6]),
    .rx_control(in_vec[5:5]),
    .tx_clk(in_vec[4:4]),
    .rx_clk(in_vec[3:3]),
    .set_10(in_vec[2:2]),
    .set_1000(in_vec[1:1]),
    .mdio_in(in_vec[0:0]),
    .ff_tx_rdy(out_vec[86:86]),
    .ff_rx_data(out_vec[85:54]),
    .ff_rx_dval(out_vec[53:53]),
    .ff_rx_eop(out_vec[52:52]),
    .ff_rx_mod(out_vec[51:50]),
    .ff_rx_sop(out_vec[49:49]),
    .rx_err(out_vec[48:43]),
    .readdata(out_vec[42:11]),
    .waitrequest(out_vec[10:10]),
    .rgmii_out(out_vec[9:6]),
    .tx_control(out_vec[5:5]),
    .ena_10(out_vec[4:4]),
    .eth_mode(out_vec[3:3]),
    .mdio_out(out_vec[2:2]),
    .mdio_oen(out_vec[1:1]),
    .mdc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 94'h097d36ac4c4cc656189fc766;
    stim[1] = 94'h0cd75e92d54774d5daa16748;
    stim[2] = 94'h28d8c4d6cbb71ba61dba4186;
    stim[3] = 94'h3ae702883479262f0c292356;
    stim[4] = 94'h1e13230ef1a01d1f50380026;
    stim[5] = 94'h0d8084ab7856fc3546536ac0;
    stim[6] = 94'h3223f3e5562bd4f31fb59ab9;
    stim[7] = 94'h2e8d40502fc60f446218302e;
    stim[8] = 94'h127deb28a686f9fe8701431b;
    stim[9] = 94'h23db25162e88013d0d4b284d;
    stim[10] = 94'h1f1f6969a7b539c3319ba05b;
    stim[11] = 94'h134eed1c81031723cc17fa14;
    stim[12] = 94'h0438cec3cab50197e5f5a217;
    stim[13] = 94'h0b3a8c8f1d3f743ebf593b78;
    stim[14] = 94'h0c3bd6a028e1076782274189;
    stim[15] = 94'h2df89c1ca2d926665448db24;
    stim[16] = 94'h3401143aee411c891f58d9c5;
    stim[17] = 94'h326f5b792daa3c8166934ad1;
    stim[18] = 94'h1a3ae0d9e53a7346b86b9aa9;
    stim[19] = 94'h2d801a946e7b46dff582c2ea;
    stim[20] = 94'h0715c069d27ecf0becfe8067;
    stim[21] = 94'h1a3b1a9e5c4ee474f7be3038;
    stim[22] = 94'h305f5afebc09c8d9bb369899;
    stim[23] = 94'h20c214c222bf0bbee37e702b;
    stim[24] = 94'h36f444ac68ab744ff241d2f1;
    stim[25] = 94'h1c8d432bfa1f5b26a6ba836a;
    stim[26] = 94'h16a38d8b36c38be69dc7c85c;
    stim[27] = 94'h24c24054b61fc4a2713f318c;
    stim[28] = 94'h34a6f198429fbc34c381a056;
    stim[29] = 94'h3e88dc8d302e46be32e041bb;
    stim[30] = 94'h104c7c8af1b1bdea90ece392;
    stim[31] = 94'h0398baafda91661ebee463cd;
    stim[32] = 94'h00f4212c9e8a2bf25e53e3c5;
    stim[33] = 94'h26344a0eab64a9433fb3213c;
    stim[34] = 94'h2913962a4ba86fffc9c98833;
    stim[35] = 94'h096d3b8e15186c23988e238c;
    stim[36] = 94'h099f39cab3e6ed5fe8ba9221;
    stim[37] = 94'h24d486d6d6aa2ba219798b3f;
    stim[38] = 94'h0f2c11374cc6bdaa11ae3035;
    stim[39] = 94'h30b60e0b8da9ddb3e40182e5;
    stim[40] = 94'h245123d08f9ca7e2ea7de028;
    stim[41] = 94'h0b923ff634005c1a2072a95e;
    stim[42] = 94'h0d8c80641b6342fce0f9d340;
    stim[43] = 94'h12bcd9b6f2689df9edbdb8c8;
    stim[44] = 94'h1b48548cfcccbc7d8793c3f4;
    stim[45] = 94'h3e5720e40896b4060cf6804c;
    stim[46] = 94'h1dde408b72c72d822d49fa35;
    stim[47] = 94'h3e4f4a52506f7f5ba8db3a00;
    stim[48] = 94'h0458dd34ee206c9b1d62d172;
    stim[49] = 94'h10b93afd418176bc6223392f;
    stim[50] = 94'h19dab1bea493a08124bc720a;
    stim[51] = 94'h027fdb4f8d35d4949db52a44;
    stim[52] = 94'h1dc8cc165bfa51547456da43;
    stim[53] = 94'h184c9d2f50f7e817fd393343;
    stim[54] = 94'h12e477d7f1c7324f7d93ba9e;
    stim[55] = 94'h17fa44fa47296fc285f8b83d;
    stim[56] = 94'h3f2d8140ae43b544bed02900;
    stim[57] = 94'h02bee41cea7d9b6847d41042;
    stim[58] = 94'h221b5e5a4c2d900c941a0050;
    stim[59] = 94'h32640df70b8b148b07ecca68;
    stim[60] = 94'h3c49b2389680c186869af996;
    stim[61] = 94'h167eb7ab91bd4b4502b3a631;
    stim[62] = 94'h3849ca7fd67588fb6750a965;
    stim[63] = 94'h04e5c529a97ac3dc8ecc31e5;
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
      expv[0] = 87'h4000000000000000000000;
      expv[1] = 87'h4000000000000000000000;
      expv[2] = 87'h4000000000000000000000;
      expv[3] = 87'h4000000000000000000000;
      expv[4] = 87'h4000000000000000000000;
      expv[5] = 87'h4000000000000000000000;
      expv[6] = 87'h4000000000000000000000;
      expv[7] = 87'h4000000000000000000000;
      expv[8] = 87'h4000000000000000000000;
      expv[9] = 87'h4000000000000000000000;
      expv[10] = 87'h4000000000000000000000;
      expv[11] = 87'h4000000000000000000000;
      expv[12] = 87'h4000000000000000000000;
      expv[13] = 87'h4000000000000000000000;
      expv[14] = 87'h4000000000000000000000;
      expv[15] = 87'h4000000000000000000000;
      expv[16] = 87'h4000000000000000000000;
      expv[17] = 87'h4000000000000000000000;
      expv[18] = 87'h4000000000000000000000;
      expv[19] = 87'h4000000000000000000000;
      expv[20] = 87'h4000000000000000000000;
      expv[21] = 87'h4000000000000000000000;
      expv[22] = 87'h4000000000000000000000;
      expv[23] = 87'h4000000000000000000000;
      expv[24] = 87'h4000000000000000000000;
      expv[25] = 87'h4000000000000000000000;
      expv[26] = 87'h4000000000000000000000;
      expv[27] = 87'h4000000000000000000000;
      expv[28] = 87'h4000000000000000000000;
      expv[29] = 87'h4000000000000000000000;
      expv[30] = 87'h4000000000000000000000;
      expv[31] = 87'h4000000000000000000000;
      expv[32] = 87'h4000000000000000000000;
      expv[33] = 87'h4000000000000000000000;
      expv[34] = 87'h4000000000000000000000;
      expv[35] = 87'h4000000000000000000000;
      expv[36] = 87'h4000000000000000000000;
      expv[37] = 87'h4000000000000000000000;
      expv[38] = 87'h4000000000000000000000;
      expv[39] = 87'h4000000000000000000000;
      expv[40] = 87'h4000000000000000000000;
      expv[41] = 87'h4000000000000000000000;
      expv[42] = 87'h4000000000000000000000;
      expv[43] = 87'h4000000000000000000000;
      expv[44] = 87'h4000000000000000000000;
      expv[45] = 87'h4000000000000000000000;
      expv[46] = 87'h4000000000000000000000;
      expv[47] = 87'h4000000000000000000000;
      expv[48] = 87'h4000000000000000000000;
      expv[49] = 87'h4000000000000000000000;
      expv[50] = 87'h4000000000000000000000;
      expv[51] = 87'h4000000000000000000000;
      expv[52] = 87'h4000000000000000000000;
      expv[53] = 87'h4000000000000000000000;
      expv[54] = 87'h4000000000000000000000;
      expv[55] = 87'h4000000000000000000000;
      expv[56] = 87'h4000000000000000000000;
      expv[57] = 87'h4000000000000000000000;
      expv[58] = 87'h4000000000000000000000;
      expv[59] = 87'h4000000000000000000000;
      expv[60] = 87'h4000000000000000000000;
      expv[61] = 87'h4000000000000000000000;
      expv[62] = 87'h4000000000000000000000;
      expv[63] = 87'h4000000000000000000000;
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
