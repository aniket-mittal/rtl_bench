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

  autovcoder_002268 dut (
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
    stim[0] = 33'h19106dff3;
    stim[1] = 33'h1e5a9318b;
    stim[2] = 33'h0c90a233b;
    stim[3] = 33'h0c2cef130;
    stim[4] = 33'h0b3a98a88;
    stim[5] = 33'h048f4f511;
    stim[6] = 33'h026c0587a;
    stim[7] = 33'h0e2672382;
    stim[8] = 33'h0ada91f76;
    stim[9] = 33'h0d8825735;
    stim[10] = 33'h0e816dc68;
    stim[11] = 33'h089bed29c;
    stim[12] = 33'h052442429;
    stim[13] = 33'h0638d95bd;
    stim[14] = 33'h02113a1e1;
    stim[15] = 33'h051b4bffd;
    stim[16] = 33'h0266d4c14;
    stim[17] = 33'h0f1d206c8;
    stim[18] = 33'h0919662f7;
    stim[19] = 33'h0615cc25b;
    stim[20] = 33'h063589db2;
    stim[21] = 33'h0d40b0e9b;
    stim[22] = 33'h0f6eda2b9;
    stim[23] = 33'h05961d494;
    stim[24] = 33'h0b1ab774a;
    stim[25] = 33'h0b820e986;
    stim[26] = 33'h04f65ccf6;
    stim[27] = 33'h06af6a95f;
    stim[28] = 33'h0e7163a60;
    stim[29] = 33'h0f085f2ce;
    stim[30] = 33'h06979b7f8;
    stim[31] = 33'h0b602e28a;
    stim[32] = 33'h0d5f4a1b9;
    stim[33] = 33'h072b0b386;
    stim[34] = 33'h05f625487;
    stim[35] = 33'h00c883ca7;
    stim[36] = 33'h098856ce1;
    stim[37] = 33'h01fd2e00e;
    stim[38] = 33'h005b667bd;
    stim[39] = 33'h06abb99e8;
    stim[40] = 33'h00218094c;
    stim[41] = 33'h0dfacdab1;
    stim[42] = 33'h06c2ebf75;
    stim[43] = 33'h03d886400;
    stim[44] = 33'h05e4f8a34;
    stim[45] = 33'h0dd8ed248;
    stim[46] = 33'h079c20f23;
    stim[47] = 33'h039cd8de6;
    stim[48] = 33'h05ffa8b5b;
    stim[49] = 33'h03c0b10fc;
    stim[50] = 33'h02ca3e5d7;
    stim[51] = 33'h06d4d8bd8;
    stim[52] = 33'h09c103a11;
    stim[53] = 33'h049e9e6d1;
    stim[54] = 33'h0cb2d01cf;
    stim[55] = 33'h059f9db5f;
    stim[56] = 33'h0080bd248;
    stim[57] = 33'h040c38352;
    stim[58] = 33'h058b73035;
    stim[59] = 33'h006103c38;
    stim[60] = 33'h05315948e;
    stim[61] = 33'h02223d3f7;
    stim[62] = 33'h06222d192;
    stim[63] = 33'h0572183e3;
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
      expv[3] = 74'h00000000xxxxxxxxx3b;
      expv[4] = 74'h00000000xxxxxxxxx3b;
      expv[5] = 74'h3fffffffc000000003b;
      expv[6] = 74'h000000000000000003b;
      expv[7] = 74'h000000004000000013b;
      expv[8] = 74'h0000000000000000082;
      expv[9] = 74'h0000000000000000082;
      expv[10] = 74'h3fffffffc0000000082;
      expv[11] = 74'h0000000000000000082;
      expv[12] = 74'h0000000080000000182;
      expv[13] = 74'h0000000000000000029;
      expv[14] = 74'h0000000000000000029;
      expv[15] = 74'h0000000000000000029;
      expv[16] = 74'h0000000000000000029;
      expv[17] = 74'h0000000100000000129;
      expv[18] = 74'h00000000000000000c8;
      expv[19] = 74'h00000000000000000c8;
      expv[20] = 74'h3fffffffc00000000c8;
      expv[21] = 74'h00000000000000000c8;
      expv[22] = 74'h00000001400000001c8;
      expv[23] = 74'h00000000000000000b9;
      expv[24] = 74'h00000000000000000b9;
      expv[25] = 74'h3fffffffc00000000b9;
      expv[26] = 74'h00000000000000000b9;
      expv[27] = 74'h00000001800000001b9;
      expv[28] = 74'h000000000000000005f;
      expv[29] = 74'h000000000000000005f;
      expv[30] = 74'h3fffffffc000000005f;
      expv[31] = 74'h000000000000000005f;
      expv[32] = 74'h00000001c000000015f;
      expv[33] = 74'h00000000000000000b9;
      expv[34] = 74'h00000000000000000b9;
      expv[35] = 74'h3fffffffc00000000b9;
      expv[36] = 74'h00000000000000000b9;
      expv[37] = 74'h00000002000000001b9;
      expv[38] = 74'h000000000000000000e;
      expv[39] = 74'h000000000000000000e;
      expv[40] = 74'h3fffffffc000000000e;
      expv[41] = 74'h000000000000000000e;
      expv[42] = 74'h000000024000000010e;
      expv[43] = 74'h0000000000000000075;
      expv[44] = 74'h0000000000000000075;
      expv[45] = 74'h3fffffffc0000000075;
      expv[46] = 74'h0000000000000000075;
      expv[47] = 74'h00000002c0000000175;
      expv[48] = 74'h00000000000000000e6;
      expv[49] = 74'h00000000000000000e6;
      expv[50] = 74'h3fffffffc00000000e6;
      expv[51] = 74'h00000000000000000e6;
      expv[52] = 74'h00000003000000001e6;
      expv[53] = 74'h0000000000000000011;
      expv[54] = 74'h0000000000000000011;
      expv[55] = 74'h3fffffffc0000000011;
      expv[56] = 74'h0000000000000000011;
      expv[57] = 74'h0000000340000000111;
      expv[58] = 74'h0000000000000000052;
      expv[59] = 74'h0000000000000000052;
      expv[60] = 74'h3fffffffc0000000052;
      expv[61] = 74'h0000000000000000052;
      expv[62] = 74'h0000000380000000152;
      expv[63] = 74'h0000000000000000092;
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
