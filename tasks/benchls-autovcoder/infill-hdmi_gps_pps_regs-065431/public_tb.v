// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_065431 dut (
    .i_hclk(clk),
    .i_wb_clk(in_vec[68:68]),
    .i_pps(in_vec[67:67]),
    .i_hdmi_r(in_vec[66:57]),
    .i_hdmi_g(in_vec[56:47]),
    .i_hdmi_b(in_vec[46:37]),
    .i_wb_cyc(in_vec[36:36]),
    .i_wb_stb(in_vec[35:35]),
    .i_wb_we(in_vec[34:34]),
    .i_wb_addr(in_vec[33:32]),
    .i_wb_data(in_vec[31:0]),
    .o_wb_ack(out_vec[33:33]),
    .o_wb_stall(out_vec[32:32]),
    .o_wb_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1d39526c6306961300;
    stim[1] = 69'h0760c3380623473255;
    stim[2] = 69'h16c15bbd7ff4d5a5b5;
    stim[3] = 69'h1c08b720cd44b17b19;
    stim[4] = 69'h13a9ab022ff3354a62;
    stim[5] = 69'h1c491792c730cfb099;
    stim[6] = 69'h1a259df56f247702ee;
    stim[7] = 69'h19d7372bff55e5abbb;
    stim[8] = 69'h043832e8520841893a;
    stim[9] = 69'h1f3e9eefe8da7b48f9;
    stim[10] = 69'h18eed94ff5d47c68f3;
    stim[11] = 69'h0747e04ae8ce6b88ba;
    stim[12] = 69'h0bd13798aa2ce81598;
    stim[13] = 69'h157c1d206ffc379f12;
    stim[14] = 69'h00f150c379675f6730;
    stim[15] = 69'h0d70f2efc1b67bdbca;
    stim[16] = 69'h1b5bd154df9e03043b;
    stim[17] = 69'h00e177da622724e727;
    stim[18] = 69'h0ee4a47e4d5df94825;
    stim[19] = 69'h17c11abbe0c3ed24ae;
    stim[20] = 69'h02188cc2eaa24e6534;
    stim[21] = 69'h013a06261e3aaba77c;
    stim[22] = 69'h0b06c372984526d67e;
    stim[23] = 69'h16d838077e10db5334;
    stim[24] = 69'h16e904addb1af861be;
    stim[25] = 69'h0446ae805d54d9304f;
    stim[26] = 69'h1b336c3a23d05a2e2c;
    stim[27] = 69'h0d18ae41509b06e488;
    stim[28] = 69'h0cf55bc0d5b2119447;
    stim[29] = 69'h09bcb01af64c6689e0;
    stim[30] = 69'h025b9ce5026040ef07;
    stim[31] = 69'h0f83c413e83dcd7e8b;
    stim[32] = 69'h1254a5da4af79a5e88;
    stim[33] = 69'h0abdb152cab6b7144a;
    stim[34] = 69'h11ddb920a97ae40918;
    stim[35] = 69'h066591ecb8bce3e824;
    stim[36] = 69'h0c217586a7c9fe7fca;
    stim[37] = 69'h112ea78eb025381015;
    stim[38] = 69'h03123bdad7437d54b4;
    stim[39] = 69'h0e368cb972a0a4af8d;
    stim[40] = 69'h1cc0c481cdb0dda9f5;
    stim[41] = 69'h0f84e8337e8870e53e;
    stim[42] = 69'h0844d3151b36919ab5;
    stim[43] = 69'h0c4ac0e178ca5fece2;
    stim[44] = 69'h0a6bfc219466b848be;
    stim[45] = 69'h1ae90664145504c68d;
    stim[46] = 69'h0183b0b4c153d54a60;
    stim[47] = 69'h10b889fe2b1e791c94;
    stim[48] = 69'h0832da45d63d79c324;
    stim[49] = 69'h0be593936d73a2a706;
    stim[50] = 69'h10d6257d1a0c8f7ed2;
    stim[51] = 69'h1e0221d1292ff72921;
    stim[52] = 69'h1485ac5dd7e44567ca;
    stim[53] = 69'h179d00f0e39d9af36d;
    stim[54] = 69'h0a18e5145c29a84423;
    stim[55] = 69'h06f1f99b88e019f438;
    stim[56] = 69'h154af86fbbd67a7e96;
    stim[57] = 69'h02383e53d3cc6fe1f8;
    stim[58] = 69'h112158408028f40d20;
    stim[59] = 69'h14a3b55f77ab2ba378;
    stim[60] = 69'h06093a05dd4a6fd477;
    stim[61] = 69'h1119d5b88698b7e801;
    stim[62] = 69'h02f0c09d35db803099;
    stim[63] = 69'h1cf1c46ccae692161c;
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
      expv[0] = 34'h0xxxxxxxx;
      expv[1] = 34'h0xxxxxxxx;
      expv[2] = 34'h2xxxxxxxx;
      expv[3] = 34'h2xxxxxxxx;
      expv[4] = 34'h2xxxxxxxx;
      expv[5] = 34'h2xxxxxxxx;
      expv[6] = 34'h2xxxxxxxx;
      expv[7] = 34'h2xxxxxxxx;
      expv[8] = 34'h2xxxxxxxx;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h2xxxxxxxx;
      expv[14] = 34'h2xxxxxxxx;
      expv[15] = 34'h2xxxxxxxx;
      expv[16] = 34'h2xxxxxxxx;
      expv[17] = 34'h2xxxxxxxx;
      expv[18] = 34'h2xxxxxxxx;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h2xxxxxxxx;
      expv[24] = 34'h2xxxxxxxx;
      expv[25] = 34'h2xxxxxxxx;
      expv[26] = 34'h0xxxxxxxx;
      expv[27] = 34'h0xxxxxxxx;
      expv[28] = 34'h0xxxxxxxx;
      expv[29] = 34'h0xxxxxxxx;
      expv[30] = 34'h0xxxxxxxx;
      expv[31] = 34'h0xxxxxxxx;
      expv[32] = 34'h2xxxxxxxx;
      expv[33] = 34'h2xxxxxxxx;
      expv[34] = 34'h2xxxxxxxx;
      expv[35] = 34'h2xxxxxxxx;
      expv[36] = 34'h2xxxxxxxx;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h2xxxxxxxx;
      expv[41] = 34'h2xxxxxxxx;
      expv[42] = 34'h2xxxxxxxx;
      expv[43] = 34'h2xxxxxxxx;
      expv[44] = 34'h2xxxxxxxx;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h2xxxxxxxx;
      expv[48] = 34'h2xxxxxxxx;
      expv[49] = 34'h2xxxxxxxx;
      expv[50] = 34'h2xxxxxxxx;
      expv[51] = 34'h2xxxxxxxx;
      expv[52] = 34'h2xxxxxxxx;
      expv[53] = 34'h2xxxxxxxx;
      expv[54] = 34'h2xxxxxxxx;
      expv[55] = 34'h2xxxxxxxx;
      expv[56] = 34'h2xxxxxxxx;
      expv[57] = 34'h2xxxxxxxx;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h0xxxxxxxx;
      expv[62] = 34'h0xxxxxxxx;
      expv[63] = 34'h2xxxxxxxx;
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
