// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09550 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h29b1aff314ef10e0a5;
    stim[1] = 70'h22177db23d6e208765;
    stim[2] = 70'h0218aafd29a0c9a093;
    stim[3] = 70'h1a77cfe8e044468c17;
    stim[4] = 70'h111acfd6ece631822e;
    stim[5] = 70'h1ecdd08c9377f8514b;
    stim[6] = 70'h0c256db3e6f951ddf1;
    stim[7] = 70'h0207679fdc574d9d9c;
    stim[8] = 70'h148b5ca44a9367e047;
    stim[9] = 70'h02b4e8f35d9aae3771;
    stim[10] = 70'h1c98e97f3e2c540b2e;
    stim[11] = 70'h0c1efccbd50bf6232b;
    stim[12] = 70'h1d47eb3a08f095b40a;
    stim[13] = 70'h0ba4e68cfc1dd936a9;
    stim[14] = 70'h191eb33aac50201db0;
    stim[15] = 70'h0f835a73e937d05bf2;
    stim[16] = 70'h005a651a0f1ee97adc;
    stim[17] = 70'h016cc98af576acc242;
    stim[18] = 70'h02cf431b6a470d0d88;
    stim[19] = 70'h31ab97781713a42d2e;
    stim[20] = 70'h0af23fc118fb1b8bb0;
    stim[21] = 70'h10aaac990ebb590255;
    stim[22] = 70'h0546ccf30de9a75070;
    stim[23] = 70'h0bcb528a88dd49f88e;
    stim[24] = 70'h028180826a6934b925;
    stim[25] = 70'h0b1be998325722b879;
    stim[26] = 70'h17afdab624a7efd4fe;
    stim[27] = 70'h1a258703fbc8566146;
    stim[28] = 70'h29d377a87ac4d20527;
    stim[29] = 70'h18deecd5ccb21d9d42;
    stim[30] = 70'h09238f53c12a08d642;
    stim[31] = 70'h07c3712dbab8aa5398;
    stim[32] = 70'h1de9406649ee6430c9;
    stim[33] = 70'h0f5a6d60423407e673;
    stim[34] = 70'h1a6581846b4404074e;
    stim[35] = 70'h1f2f30470833662af0;
    stim[36] = 70'h02b1a487d24c1e8c48;
    stim[37] = 70'h0513721f38bf5daa18;
    stim[38] = 70'h08de38872139703008;
    stim[39] = 70'h05857d65fc5ff16404;
    stim[40] = 70'h0d3070758c095156a1;
    stim[41] = 70'h0e2078da70f31f6fa6;
    stim[42] = 70'h36159840e8f258a4ec;
    stim[43] = 70'h0b00e0922df7f76a41;
    stim[44] = 70'h0843a2827abb8e59b6;
    stim[45] = 70'h06be16db36fce780f3;
    stim[46] = 70'h06b42453e5b217ae6d;
    stim[47] = 70'h1f0701c5958b556910;
    stim[48] = 70'h0e02755009491dddf8;
    stim[49] = 70'h0f90948887a687d35a;
    stim[50] = 70'h1832c6d21f0125265e;
    stim[51] = 70'h098bdcf107a80eeb45;
    stim[52] = 70'h1db8156938e0d57397;
    stim[53] = 70'h04db7ebe8898db05f2;
    stim[54] = 70'h0a4be28eb08112df5a;
    stim[55] = 70'h0ef613c8ba62fb3601;
    stim[56] = 70'h164b713debd615c3ce;
    stim[57] = 70'h0af1aad67a10091721;
    stim[58] = 70'h0381ababc7072fc89f;
    stim[59] = 70'h1e7b971cc53a9fd37d;
    stim[60] = 70'h049d5d0c6214fdba8e;
    stim[61] = 70'h13ad94af24b20b85f2;
    stim[62] = 70'h1634c4ccebb52ebbe0;
    stim[63] = 70'h10294ca689b5ee9296;
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
      expv[0] = 33'h0ef10e0a4;
      expv[1] = 33'h16e208764;
      expv[2] = 33'h1a0c9a092;
      expv[3] = 33'h044468c16;
      expv[4] = 33'h0e631822e;
      expv[5] = 33'h177f8514a;
      expv[6] = 33'h0f951ddf0;
      expv[7] = 33'h0574d9d9c;
      expv[8] = 33'h09367e046;
      expv[9] = 33'h19aae3770;
      expv[10] = 33'h02c540b2e;
      expv[11] = 33'h10bf6232a;
      expv[12] = 33'h0f095b40b;
      expv[13] = 33'h01dd936a8;
      expv[14] = 33'h050201db0;
      expv[15] = 33'h137d05bf2;
      expv[16] = 33'h11ee97adc;
      expv[17] = 33'h176acc242;
      expv[18] = 33'h0470d0d88;
      expv[19] = 33'h113a42d2e;
      expv[20] = 33'h0fb1b8bb0;
      expv[21] = 33'h0bb590254;
      expv[22] = 33'h1e9a75070;
      expv[23] = 33'h0dd49f88e;
      expv[24] = 33'h06934b924;
      expv[25] = 33'h05722b878;
      expv[26] = 33'h0a7efd4fe;
      expv[27] = 33'h1c8566146;
      expv[28] = 33'h0c4d20526;
      expv[29] = 33'h0b21d9d42;
      expv[30] = 33'h12a08d642;
      expv[31] = 33'h0b8aa5398;
      expv[32] = 33'h1ee6430c8;
      expv[33] = 33'h03407e672;
      expv[34] = 33'h14404074e;
      expv[35] = 33'h033662af1;
      expv[36] = 33'h04c1e8c48;
      expv[37] = 33'h0bf5daa18;
      expv[38] = 33'h139703008;
      expv[39] = 33'h05ff16404;
      expv[40] = 33'h0095156a0;
      expv[41] = 33'h0f31f6fa6;
      expv[42] = 33'h0f258a4ed;
      expv[43] = 33'h1f7f76a40;
      expv[44] = 33'h0bb8e59b6;
      expv[45] = 33'h0fce780f2;
      expv[46] = 33'h1b217ae6c;
      expv[47] = 33'h18b556910;
      expv[48] = 33'h1491dddf8;
      expv[49] = 33'h1a687d35a;
      expv[50] = 33'h10125265e;
      expv[51] = 33'h1a80eeb44;
      expv[52] = 33'h0e0d57396;
      expv[53] = 33'h098db05f2;
      expv[54] = 33'h08112df5a;
      expv[55] = 33'h062fb3600;
      expv[56] = 33'h1d615c3ce;
      expv[57] = 33'h010091720;
      expv[58] = 33'h1072fc89e;
      expv[59] = 33'h13a9fd37c;
      expv[60] = 33'h014fdba8e;
      expv[61] = 33'h0b20b85f2;
      expv[62] = 33'h1b52ebbe0;
      expv[63] = 33'h1b5ee9297;
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
