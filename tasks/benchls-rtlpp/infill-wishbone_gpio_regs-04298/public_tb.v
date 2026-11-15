// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 83;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04298 dut (
    .WBs_CLK_i(clk),
    .WBs_ADR_i(in_vec[54:48]),
    .WBs_CYC_i(in_vec[47:47]),
    .WBs_BYTE_STB_i(in_vec[46:43]),
    .WBs_WE_i(in_vec[42:42]),
    .WBs_STB_i(in_vec[41:41]),
    .WBs_DAT_i(in_vec[40:9]),
    .WBs_RST_i(in_vec[8:8]),
    .GPIO_IN_i(in_vec[7:0]),
    .WBs_DAT_o(out_vec[82:51]),
    .WBs_ACK_o(out_vec[50:50]),
    .CLK_4M_CNTL_o(out_vec[49:49]),
    .CLK_1M_CNTL_o(out_vec[48:48]),
    .Device_ID_o(out_vec[47:16]),
    .GPIO_OUT_o(out_vec[15:8]),
    .GPIO_OE_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h4cf4446b548b0d;
    stim[1] = 55'h743ff68db787e6;
    stim[2] = 55'h3ac301ce4dfc50;
    stim[3] = 55'h6095435f8b9644;
    stim[4] = 55'h003b3165405494;
    stim[5] = 55'h4320ab937c3e6c;
    stim[6] = 55'h72e06963d23439;
    stim[7] = 55'h168c874ca9723f;
    stim[8] = 55'h1ab2de717c4621;
    stim[9] = 55'h6e336d0eb4e40f;
    stim[10] = 55'h22c55b8eea00e2;
    stim[11] = 55'h72fd0fa8b4963c;
    stim[12] = 55'h7bf53d0e237071;
    stim[13] = 55'h42284caf2f5c14;
    stim[14] = 55'h19f2c99bc31879;
    stim[15] = 55'h44b1fcaf57a48d;
    stim[16] = 55'h2c1acc09145ca5;
    stim[17] = 55'h502003fce6240d;
    stim[18] = 55'h62b86fab8f4c8d;
    stim[19] = 55'h462bc2248f38c5;
    stim[20] = 55'h5c8aa08355facd;
    stim[21] = 55'h7f0ae542e5fc7d;
    stim[22] = 55'h49c7bf11a95c06;
    stim[23] = 55'h57a8c6d509c016;
    stim[24] = 55'h0e641c3b5aceb2;
    stim[25] = 55'h4991bb316be0c5;
    stim[26] = 55'h0981405969a812;
    stim[27] = 55'h5bc60966fcb6bd;
    stim[28] = 55'h47d69402fdf23b;
    stim[29] = 55'h4c2c042b05eae6;
    stim[30] = 55'h15028bf8c2a864;
    stim[31] = 55'h44a1dd2e82246a;
    stim[32] = 55'h549e003f06885e;
    stim[33] = 55'h7efb350bbb1c33;
    stim[34] = 55'h5d6453feef9a58;
    stim[35] = 55'h03f95c3da0dc7b;
    stim[36] = 55'h5ebc15d4e7ea12;
    stim[37] = 55'h1a58116b699afe;
    stim[38] = 55'h177b49948e3af3;
    stim[39] = 55'h7595dc7180e292;
    stim[40] = 55'h262e05ea005807;
    stim[41] = 55'h156e15e887b8ae;
    stim[42] = 55'h20a5095d1ed62c;
    stim[43] = 55'h474f49e038946d;
    stim[44] = 55'h53037009afc658;
    stim[45] = 55'h3ee763afecefef;
    stim[46] = 55'h6391a3c48bfe86;
    stim[47] = 55'h7397d495235855;
    stim[48] = 55'h6bf7bb49cbe2d1;
    stim[49] = 55'h700ea9c1457645;
    stim[50] = 55'h2c993a225e9c81;
    stim[51] = 55'h0d51d7c28b6674;
    stim[52] = 55'h67ce24c7bf84a5;
    stim[53] = 55'h10e1a392108c64;
    stim[54] = 55'h43e2f5808a221a;
    stim[55] = 55'h3f3a15d8890ea9;
    stim[56] = 55'h25145754e9a675;
    stim[57] = 55'h502340981efec7;
    stim[58] = 55'h6c31ec98320612;
    stim[59] = 55'h1a5f8c7919d8d0;
    stim[60] = 55'h73bc815fa494fb;
    stim[61] = 55'h347b54fcfbaad3;
    stim[62] = 55'h4aa28dfff9a205;
    stim[63] = 55'h48478befa1324f;
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
      expv[0] = 83'h7d5ef7d6056a37e570000;
      expv[1] = 83'h7d5ef7d6056a37e570000;
      expv[2] = 83'h7d5ef7d6056a37e570000;
      expv[3] = 83'h7d5ef7d6456a37e570000;
      expv[4] = 83'h2b51bf2b856a37e570000;
      expv[5] = 83'h7d5ef7d6056a37e570000;
      expv[6] = 83'h7d5ef7d6056a37e570000;
      expv[7] = 83'h7d5ef7d6056a37e570000;
      expv[8] = 83'h7d5ef7d6056a37e570000;
      expv[9] = 83'h7d5ef7d6456a37e570000;
      expv[10] = 83'h7d5ef7d6056a37e570000;
      expv[11] = 83'h7d5ef7d6056a37e570000;
      expv[12] = 83'h7d5ef7d6056a37e570000;
      expv[13] = 83'h7d5ef7d6056a37e570000;
      expv[14] = 83'h7d5ef7d6056a37e570000;
      expv[15] = 83'h7d5ef7d6456a37e570000;
      expv[16] = 83'h7d5ef7d6056a37e570000;
      expv[17] = 83'h7d5ef7d6056a37e570000;
      expv[18] = 83'h7d5ef7d6056a37e570000;
      expv[19] = 83'h7d5ef7d6056a37e570000;
      expv[20] = 83'h7d5ef7d6056a37e570000;
      expv[21] = 83'h7d5ef7d6456a37e570000;
      expv[22] = 83'h7d5ef7d6056a37e570000;
      expv[23] = 83'h7d5ef7d6456a37e570000;
      expv[24] = 83'h7d5ef7d6056a37e570000;
      expv[25] = 83'h7d5ef7d6056a37e570000;
      expv[26] = 83'h7d5ef7d6056a37e570000;
      expv[27] = 83'h7d5ef7d6056a37e570000;
      expv[28] = 83'h7d5ef7d6456a37e570000;
      expv[29] = 83'h7d5ef7d6056a37e570000;
      expv[30] = 83'h7d5ef7d6056a37e570000;
      expv[31] = 83'h7d5ef7d6056a37e570000;
      expv[32] = 83'h7d5ef7d6056a37e570000;
      expv[33] = 83'h7d5ef7d6456a37e570000;
      expv[34] = 83'h7d5ef7d6056a37e570000;
      expv[35] = 83'h00000000056a37e570000;
      expv[36] = 83'h7d5ef7d6056a37e570000;
      expv[37] = 83'h7d5ef7d6056a37e570000;
      expv[38] = 83'h7d5ef7d6056a37e570000;
      expv[39] = 83'h7d5ef7d6056a37e570000;
      expv[40] = 83'h7d5ef7d6056a37e570000;
      expv[41] = 83'h7d5ef7d6056a37e570000;
      expv[42] = 83'h7d5ef7d6056a37e570000;
      expv[43] = 83'h7d5ef7d6056a37e570000;
      expv[44] = 83'h7d5ef7d6056a37e570000;
      expv[45] = 83'h7d5ef7d6056a37e570000;
      expv[46] = 83'h7d5ef7d6056a37e570000;
      expv[47] = 83'h7d5ef7d6056a37e570000;
      expv[48] = 83'h7d5ef7d6456a37e570000;
      expv[49] = 83'h7d5ef7d6056a37e570000;
      expv[50] = 83'h7d5ef7d6056a37e570000;
      expv[51] = 83'h7d5ef7d6056a37e570000;
      expv[52] = 83'h7d5ef7d6056a37e570000;
      expv[53] = 83'h7d5ef7d6456a37e570000;
      expv[54] = 83'h7d5ef7d6056a37e570000;
      expv[55] = 83'h7d5ef7d6456a37e570000;
      expv[56] = 83'h7d5ef7d6056a37e570000;
      expv[57] = 83'h7d5ef7d6056a37e570000;
      expv[58] = 83'h7d5ef7d6056a37e570000;
      expv[59] = 83'h7d5ef7d6056a37e570000;
      expv[60] = 83'h7d5ef7d6056a37e570000;
      expv[61] = 83'h7d5ef7d6056a37e570000;
      expv[62] = 83'h7d5ef7d6056a37e570000;
      expv[63] = 83'h7d5ef7d6456a37e570000;
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
