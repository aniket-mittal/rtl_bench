// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01257 dut (
    .clk_i(clk),
    .rst_i(in_vec[44:44]),
    .parport_i(in_vec[43:12]),
    .writestrobe_i(in_vec[11:11]),
    .readstrobe_i(in_vec[10:10]),
    .data_i(in_vec[9:2]),
    .address_i(in_vec[1:0]),
    .parport_o(out_vec[41:10]),
    .data_o(out_vec[9:2]),
    .parport_readstrobe_o(out_vec[1:1]),
    .parport_writestrobe_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1a0b5ac9b1c9;
    stim[1] = 45'h15b728ecfe06;
    stim[2] = 45'h00f5fd2d7e0c;
    stim[3] = 45'h04db9ddf3207;
    stim[4] = 45'h0dfbf9b79768;
    stim[5] = 45'h0429a5c56b2c;
    stim[6] = 45'h0d74303ffa96;
    stim[7] = 45'h09726c4a6170;
    stim[8] = 45'h04442233693e;
    stim[9] = 45'h052b9cf5b545;
    stim[10] = 45'h0d8657a53ea1;
    stim[11] = 45'h0b60c48060d9;
    stim[12] = 45'h003cbbadfe82;
    stim[13] = 45'h0e5fe018e506;
    stim[14] = 45'h0aaa3f138ff5;
    stim[15] = 45'h00b77d4ea2e7;
    stim[16] = 45'h0f663b847c5a;
    stim[17] = 45'h09ef838b890f;
    stim[18] = 45'h08378e5244df;
    stim[19] = 45'h09e357d13160;
    stim[20] = 45'h0255830896ca;
    stim[21] = 45'h0c65eda107ff;
    stim[22] = 45'h024d7d8d2702;
    stim[23] = 45'h0c84c7294e29;
    stim[24] = 45'h04dad0d030b7;
    stim[25] = 45'h0ae0dfc368e0;
    stim[26] = 45'h05bb819d0a15;
    stim[27] = 45'h04f5aa02c0cb;
    stim[28] = 45'h00da8bcc8f9e;
    stim[29] = 45'h028bf92ac465;
    stim[30] = 45'h0866ed329b9c;
    stim[31] = 45'h0d30bdb92cf4;
    stim[32] = 45'h081e42338b9f;
    stim[33] = 45'h0a20f1aaa6ae;
    stim[34] = 45'h0a003163d303;
    stim[35] = 45'h0961c9f69929;
    stim[36] = 45'h04cede34f460;
    stim[37] = 45'h03fc80828fd3;
    stim[38] = 45'h012e72175df5;
    stim[39] = 45'h006d21eb6af9;
    stim[40] = 45'h078661d58307;
    stim[41] = 45'h0f27a2eaf67e;
    stim[42] = 45'h04e7b9e595ce;
    stim[43] = 45'h0b1b45f59207;
    stim[44] = 45'h0dd4fb5ef907;
    stim[45] = 45'h05adab182fed;
    stim[46] = 45'h07b6d7b71f19;
    stim[47] = 45'h0b8c46585060;
    stim[48] = 45'h023927140396;
    stim[49] = 45'h000f928a4d53;
    stim[50] = 45'h02d0d090c7b1;
    stim[51] = 45'h0a5931f2813c;
    stim[52] = 45'h04cb2027fff5;
    stim[53] = 45'h0e4a396c7601;
    stim[54] = 45'h03367d6da9af;
    stim[55] = 45'h03639ade8c46;
    stim[56] = 45'h059a96ae429a;
    stim[57] = 45'h040ff4cc3b7e;
    stim[58] = 45'h0d1121c2f4b6;
    stim[59] = 45'h058c467ec06c;
    stim[60] = 45'h0bbd0f26ff8a;
    stim[61] = 45'h0fb1e9794274;
    stim[62] = 45'h0af2c13875e4;
    stim[63] = 45'h00c3e28b5920;
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
      expv[0] = 42'hxxxxxxxxxxx;
      expv[1] = 42'h00000000xxx;
      expv[2] = 42'h0000000035e;
      expv[3] = 42'h00000000xxx;
      expv[4] = 42'h000000001e6;
      expv[5] = 42'h00000000158;
      expv[6] = 42'h000000002fc;
      expv[7] = 42'h00000000298;
      expv[8] = 42'h000000002fc;
      expv[9] = 42'h0000000026c;
      expv[10] = 42'h0000000026c;
      expv[11] = 42'h0000000026c;
      expv[12] = 42'h000000002fc;
      expv[13] = 42'h000000002fc;
      expv[14] = 42'h0000000026c;
      expv[15] = 42'h0000000037c;
      expv[16] = 42'h000000002fc;
      expv[17] = 42'h0000000037c;
      expv[18] = 42'h10c5bf72f7d;
      expv[19] = 42'h10c5bf72c4c;
      expv[20] = 42'h10c5bf72efc;
      expv[21] = 42'h10c5bf72f7c;
      expv[22] = 42'h10c5bf72efc;
      expv[23] = 42'h10c5bf72e6c;
      expv[24] = 42'h10c5bf72f7c;
      expv[25] = 42'h10c5bf72cd8;
      expv[26] = 42'h10c5bf72e6c;
      expv[27] = 42'h10c5bf72f7c;
      expv[28] = 42'h10c5bf72efc;
      expv[29] = 42'h10c5bf72e6c;
      expv[30] = 42'h10c5bf72ca4;
      expv[31] = 42'h10c5bf72e4a;
      expv[32] = 42'h10c5bf72f7c;
      expv[33] = 42'h39f9e14f6fd;
      expv[34] = 42'h39f9e14f77c;
      expv[35] = 42'h39f9e14f66c;
      expv[36] = 42'h39f9e14f53e;
      expv[37] = 42'h39f9e14f530;
      expv[38] = 42'h3d39d28f78d;
      expv[39] = 42'h3d39d28f78c;
      expv[40] = 42'h3d39d28f530;
      expv[41] = 42'h3d39d28f7b4;
      expv[42] = 42'h3d39d28f7b4;
      expv[43] = 42'h3d39d28f530;
      expv[44] = 42'h3d39d28f530;
      expv[45] = 42'h1079ef8f78d;
      expv[46] = 42'h1079ef8f78c;
      expv[47] = 42'h1079ef8f614;
      expv[48] = 42'h1079ef8f7b4;
      expv[49] = 42'h1079ef8f530;
      expv[50] = 42'h1539f18f78d;
      expv[51] = 42'h1539f18f4a0;
      expv[52] = 42'h1539f18f78c;
      expv[53] = 42'h1539f18f78c;
      expv[54] = 42'h1539f18f530;
      expv[55] = 42'h1af9ff4f7b5;
      expv[56] = 42'h1af9ff4f7b4;
      expv[57] = 42'h1af9ff4f7b4;
      expv[58] = 42'h1af9ff4f7b4;
      expv[59] = 42'h1af9ff4f7b0;
      expv[60] = 42'h1af9ff4f7b4;
      expv[61] = 42'h1af9ff4f650;
      expv[62] = 42'h1af9ff4f61e;
      expv[63] = 42'h1af9ff4f6d4;
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
