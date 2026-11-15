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

  autovcoder_002559 dut (
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
    stim[0] = 33'h177c45377;
    stim[1] = 33'h1bdddfd65;
    stim[2] = 33'h02a2b120c;
    stim[3] = 33'h04b2a94ca;
    stim[4] = 33'h06684c30d;
    stim[5] = 33'h0c657ba18;
    stim[6] = 33'h03b568be6;
    stim[7] = 33'h0623b8753;
    stim[8] = 33'h04975dcd6;
    stim[9] = 33'h0eb441400;
    stim[10] = 33'h03d56a114;
    stim[11] = 33'h078954b1a;
    stim[12] = 33'h053211b9b;
    stim[13] = 33'h0b0046fdb;
    stim[14] = 33'h0c2cbe598;
    stim[15] = 33'h02b9d344a;
    stim[16] = 33'h034e30d46;
    stim[17] = 33'h031bbc75a;
    stim[18] = 33'h0c8ecd9f4;
    stim[19] = 33'h0fc8fa473;
    stim[20] = 33'h09b261f15;
    stim[21] = 33'h0c2f4ee1a;
    stim[22] = 33'h0b22201cc;
    stim[23] = 33'h0a9134f9a;
    stim[24] = 33'h01eb98886;
    stim[25] = 33'h0809c7940;
    stim[26] = 33'h0ba81fc10;
    stim[27] = 33'h1af60cef5;
    stim[28] = 33'h04a020c9b;
    stim[29] = 33'h0178b7963;
    stim[30] = 33'h09506095b;
    stim[31] = 33'h07d75e89c;
    stim[32] = 33'h0e8eecaa3;
    stim[33] = 33'h1ce9f148e;
    stim[34] = 33'h1862ce60c;
    stim[35] = 33'h084c58102;
    stim[36] = 33'h06dfa889f;
    stim[37] = 33'h1e671e193;
    stim[38] = 33'h0dd2b85f6;
    stim[39] = 33'h003a4771f;
    stim[40] = 33'h08974f6b3;
    stim[41] = 33'h0a450c879;
    stim[42] = 33'h06e32dfc5;
    stim[43] = 33'h1d71cefaa;
    stim[44] = 33'h04079494a;
    stim[45] = 33'h00b17a7b7;
    stim[46] = 33'h0b77398b7;
    stim[47] = 33'h03630ad4b;
    stim[48] = 33'h0c5493059;
    stim[49] = 33'h046055f92;
    stim[50] = 33'h0be41c68f;
    stim[51] = 33'h08373d269;
    stim[52] = 33'h098b65354;
    stim[53] = 33'h04d7ffff4;
    stim[54] = 33'h060796643;
    stim[55] = 33'h0ce63d338;
    stim[56] = 33'h0e28e1ecc;
    stim[57] = 33'h011ed9499;
    stim[58] = 33'h0ee1c8293;
    stim[59] = 33'h067ef8715;
    stim[60] = 33'h00b288057;
    stim[61] = 33'h0ee83728d;
    stim[62] = 33'h01f9210c0;
    stim[63] = 33'h03423c75e;
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
      expv[2] = 74'h00000000xxxxxxxxx65;
      expv[3] = 74'h00000000xxxxxxxxx0c;
      expv[4] = 74'h00000000xxxxxxxxx0c;
      expv[5] = 74'h000000000000000000c;
      expv[6] = 74'h000000000000000000c;
      expv[7] = 74'h000000004000000010c;
      expv[8] = 74'h0000000000000000053;
      expv[9] = 74'h0000000000000000053;
      expv[10] = 74'h0000000000000000053;
      expv[11] = 74'h0000000000000000053;
      expv[12] = 74'h0000000080000000153;
      expv[13] = 74'h000000000000000009b;
      expv[14] = 74'h000000000000000009b;
      expv[15] = 74'h000000000000000009b;
      expv[16] = 74'h000000000000000009b;
      expv[17] = 74'h00000000c000000019b;
      expv[18] = 74'h000000000000000005a;
      expv[19] = 74'h000000000000000005a;
      expv[20] = 74'h000000000000000005a;
      expv[21] = 74'h000000000000000005a;
      expv[22] = 74'h000000010000000015a;
      expv[23] = 74'h00000000000000000cc;
      expv[24] = 74'h00000000000000000cc;
      expv[25] = 74'h00000000000000000cc;
      expv[26] = 74'h00000000000000000cc;
      expv[27] = 74'h00000001400000001cc;
      expv[28] = 74'h00000000000000001f5;
      expv[29] = 74'h000000000000000009b;
      expv[30] = 74'h000000000000000009b;
      expv[31] = 74'h000000000000000009b;
      expv[32] = 74'h000000000000000009b;
      expv[33] = 74'h000000004000000019b;
      expv[34] = 74'h000000000000000018e;
      expv[35] = 74'h000000000000000010c;
      expv[36] = 74'h0000000000000000002;
      expv[37] = 74'h0000000000000000002;
      expv[38] = 74'h0000000000000000102;
      expv[39] = 74'h00000000000000000f6;
      expv[40] = 74'h00000000000000000f6;
      expv[41] = 74'h00000000000000000f6;
      expv[42] = 74'h00000000000000000f6;
      expv[43] = 74'h00000000400000001f6;
      expv[44] = 74'h00000000000000001aa;
      expv[45] = 74'h000000000000000004a;
      expv[46] = 74'h000000000000000004a;
      expv[47] = 74'h000000000000000004a;
      expv[48] = 74'h000000000000000004a;
      expv[49] = 74'h000000004000000014a;
      expv[50] = 74'h0000000000000000092;
      expv[51] = 74'h0000000000000000092;
      expv[52] = 74'h0000000000000000092;
      expv[53] = 74'h0000000000000000092;
      expv[54] = 74'h0000000080000000192;
      expv[55] = 74'h0000000000000000043;
      expv[56] = 74'h0000000000000000043;
      expv[57] = 74'h0000000000000000043;
      expv[58] = 74'h0000000000000000043;
      expv[59] = 74'h00000000c0000000143;
      expv[60] = 74'h0000000000000000015;
      expv[61] = 74'h0000000000000000015;
      expv[62] = 74'h0000000000000000015;
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
