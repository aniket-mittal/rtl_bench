// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002139 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h14b36df4c;
    stim[1] = 33'h18c254f8b;
    stim[2] = 33'h08ba322de;
    stim[3] = 33'h0e9c4d481;
    stim[4] = 33'h0fc53d1dd;
    stim[5] = 33'h062f29603;
    stim[6] = 33'h0f2ab8e7d;
    stim[7] = 33'h07a54f04f;
    stim[8] = 33'h02ac8c4b2;
    stim[9] = 33'h08ddad235;
    stim[10] = 33'h0b321f30a;
    stim[11] = 33'h0235933eb;
    stim[12] = 33'h0bf9a1e2c;
    stim[13] = 33'h0cbbd571a;
    stim[14] = 33'h089db0f4c;
    stim[15] = 33'h0daaf415d;
    stim[16] = 33'h0aa37d19b;
    stim[17] = 33'h07a87bd3c;
    stim[18] = 33'h03189f092;
    stim[19] = 33'h0ea3a7c02;
    stim[20] = 33'h032598fa0;
    stim[21] = 33'h0af3ec43d;
    stim[22] = 33'h066f33e5a;
    stim[23] = 33'h06e2ace40;
    stim[24] = 33'h0fa716df3;
    stim[25] = 33'h0c7b97f7f;
    stim[26] = 33'h06a2b0bfa;
    stim[27] = 33'h0c18e2641;
    stim[28] = 33'h0b527bcbe;
    stim[29] = 33'h0b4cd4bba;
    stim[30] = 33'h0ccc98966;
    stim[31] = 33'h0aa5970f6;
    stim[32] = 33'h0442315b6;
    stim[33] = 33'h031571198;
    stim[34] = 33'h02969557b;
    stim[35] = 33'h0a3bc66ee;
    stim[36] = 33'h1c3931318;
    stim[37] = 33'h05e65e168;
    stim[38] = 33'h0c0f1a1bb;
    stim[39] = 33'h05e4a77b3;
    stim[40] = 33'h0990a28b9;
    stim[41] = 33'h08aab0fae;
    stim[42] = 33'h005fa9675;
    stim[43] = 33'h0717bdb3b;
    stim[44] = 33'h06a2f436f;
    stim[45] = 33'h070a50a67;
    stim[46] = 33'h0d11d1802;
    stim[47] = 33'h01653ccc7;
    stim[48] = 33'h01adec2d3;
    stim[49] = 33'h0bcfabeeb;
    stim[50] = 33'h09402be39;
    stim[51] = 33'h0694a3ae0;
    stim[52] = 33'h0c7cace12;
    stim[53] = 33'h01f01b05d;
    stim[54] = 33'h06a435a28;
    stim[55] = 33'h0883fceb4;
    stim[56] = 33'h012850a75;
    stim[57] = 33'h0b2e31bc6;
    stim[58] = 33'h0cab4c85c;
    stim[59] = 33'h03c400780;
    stim[60] = 33'h0ded72405;
    stim[61] = 33'h1c954e9a2;
    stim[62] = 33'h05ec50f15;
    stim[63] = 33'h0502492ea;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx8b;
      expv[3] = 74'h00000000xxxxxxxxxde;
      expv[4] = 74'h00000000xxxxxxxxxde;
      expv[5] = 74'h00000000000000000de;
      expv[6] = 74'h00000000000000000de;
      expv[7] = 74'h00000000400000001de;
      expv[8] = 74'h000000000000000004f;
      expv[9] = 74'h000000000000000004f;
      expv[10] = 74'h000000000000000004f;
      expv[11] = 74'h000000000000000004f;
      expv[12] = 74'h000000000000000014f;
      expv[13] = 74'h000000000000000002c;
      expv[14] = 74'h000000000000000002c;
      expv[15] = 74'h000000000000000002c;
      expv[16] = 74'h000000000000000002c;
      expv[17] = 74'h000000004000000012c;
      expv[18] = 74'h000000000000000003c;
      expv[19] = 74'h000000000000000003c;
      expv[20] = 74'h000000000000000003c;
      expv[21] = 74'h000000000000000003c;
      expv[22] = 74'h000000000000000013c;
      expv[23] = 74'h000000000000000005a;
      expv[24] = 74'h000000000000000005a;
      expv[25] = 74'h000000000000000005a;
      expv[26] = 74'h000000000000000005a;
      expv[27] = 74'h000000004000000015a;
      expv[28] = 74'h0000000000000000041;
      expv[29] = 74'h0000000000000000041;
      expv[30] = 74'h0000000000000000041;
      expv[31] = 74'h0000000000000000041;
      expv[32] = 74'h0000000000000000141;
      expv[33] = 74'h00000000000000000b6;
      expv[34] = 74'h00000000000000000b6;
      expv[35] = 74'h00000000000000000b6;
      expv[36] = 74'h00000000000000000b6;
      expv[37] = 74'h00000000000000001b6;
      expv[38] = 74'h0000000000000000068;
      expv[39] = 74'h0000000000000000068;
      expv[40] = 74'h0000000000000000068;
      expv[41] = 74'h0000000000000000068;
      expv[42] = 74'h0000000040000000168;
      expv[43] = 74'h0000000000000000075;
      expv[44] = 74'h0000000000000000075;
      expv[45] = 74'h0000000000000000075;
      expv[46] = 74'h0000000000000000075;
      expv[47] = 74'h3fffffe5c0000000175;
      expv[48] = 74'h00000000000000000c7;
      expv[49] = 74'h00000000000000000c7;
      expv[50] = 74'h00000000000000000c7;
      expv[51] = 74'h00000000000000000c7;
      expv[52] = 74'h0000001a800000001c7;
      expv[53] = 74'h0000000000000000012;
      expv[54] = 74'h0000000000000000012;
      expv[55] = 74'h0000000000000000012;
      expv[56] = 74'h0000000000000000012;
      expv[57] = 74'h3fffffe5c0000000112;
      expv[58] = 74'h00000000000000000c6;
      expv[59] = 74'h00000000000000000c6;
      expv[60] = 74'h00000000000000000c6;
      expv[61] = 74'h00000000000000000c6;
      expv[62] = 74'h00000000000000001c6;
      expv[63] = 74'h0000000000000000015;
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
