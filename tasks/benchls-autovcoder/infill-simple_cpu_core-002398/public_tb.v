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

  autovcoder_002398 dut (
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
    stim[0] = 33'h104a67955;
    stim[1] = 33'h121518296;
    stim[2] = 33'h0870737ba;
    stim[3] = 33'h004cbe1e7;
    stim[4] = 33'h0e4e05651;
    stim[5] = 33'h07070d714;
    stim[6] = 33'h0bf12f1ab;
    stim[7] = 33'h0b9b002c8;
    stim[8] = 33'h008318c7f;
    stim[9] = 33'h00c1af4a2;
    stim[10] = 33'h0421e5798;
    stim[11] = 33'h0cad33368;
    stim[12] = 33'h0275ad032;
    stim[13] = 33'h0009c2548;
    stim[14] = 33'h098594c68;
    stim[15] = 33'h0ad99cfa9;
    stim[16] = 33'h072e41f29;
    stim[17] = 33'h0fc5237ab;
    stim[18] = 33'h082984000;
    stim[19] = 33'h0538505db;
    stim[20] = 33'h0b7cae025;
    stim[21] = 33'h052139ec0;
    stim[22] = 33'h076e52d84;
    stim[23] = 33'h0b2f91390;
    stim[24] = 33'h074fd338a;
    stim[25] = 33'h0256897b9;
    stim[26] = 33'h082d56983;
    stim[27] = 33'h0bbb082fc;
    stim[28] = 33'h0c1fc2e0c;
    stim[29] = 33'h02a40d934;
    stim[30] = 33'h0446a6cef;
    stim[31] = 33'h0c4cc15bc;
    stim[32] = 33'h0623b68c7;
    stim[33] = 33'h041900fa6;
    stim[34] = 33'h00c3a3373;
    stim[35] = 33'h0d4a4b08b;
    stim[36] = 33'h013b0f8cb;
    stim[37] = 33'h07de89c14;
    stim[38] = 33'h0c500efdb;
    stim[39] = 33'h0785b26f4;
    stim[40] = 33'h088cba3e0;
    stim[41] = 33'h08485b919;
    stim[42] = 33'h0db9996f7;
    stim[43] = 33'h07c98776e;
    stim[44] = 33'h0ea034e05;
    stim[45] = 33'h028354e80;
    stim[46] = 33'h0a62dd808;
    stim[47] = 33'h019db34d7;
    stim[48] = 33'h0aec0a125;
    stim[49] = 33'h0bbe6cb41;
    stim[50] = 33'h05126312c;
    stim[51] = 33'h096f87913;
    stim[52] = 33'h01a7cc30a;
    stim[53] = 33'h0b181c36e;
    stim[54] = 33'h09b44d5d4;
    stim[55] = 33'h0df5963b8;
    stim[56] = 33'h0631371b6;
    stim[57] = 33'h0f3eae2ed;
    stim[58] = 33'h0f11d4097;
    stim[59] = 33'h0c84744ed;
    stim[60] = 33'h012f8fe72;
    stim[61] = 33'h09f849075;
    stim[62] = 33'h06b919a8b;
    stim[63] = 33'h096f28c9d;
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
      expv[2] = 74'h00000000xxxxxxxxx96;
      expv[3] = 74'h00000000xxxxxxxxxba;
      expv[4] = 74'h00000000xxxxxxxxxba;
      expv[5] = 74'h00000000000000000ba;
      expv[6] = 74'h00000000000000000ba;
      expv[7] = 74'h00000000400000001ba;
      expv[8] = 74'h00000000000000000c8;
      expv[9] = 74'h00000000000000000c8;
      expv[10] = 74'h00000000000000000c8;
      expv[11] = 74'h00000000000000000c8;
      expv[12] = 74'h00000000800000001c8;
      expv[13] = 74'h0000000000000000032;
      expv[14] = 74'h0000000000000000032;
      expv[15] = 74'h0000000000000000032;
      expv[16] = 74'h0000000000000000032;
      expv[17] = 74'h00000000c0000000132;
      expv[18] = 74'h00000000000000000ab;
      expv[19] = 74'h00000000000000000ab;
      expv[20] = 74'h00000000000000000ab;
      expv[21] = 74'h00000000000000000ab;
      expv[22] = 74'h00000001000000001ab;
      expv[23] = 74'h0000000000000000084;
      expv[24] = 74'h0000000000000000084;
      expv[25] = 74'h0000000000000000084;
      expv[26] = 74'h0000000000000000084;
      expv[27] = 74'h0000000140000000184;
      expv[28] = 74'h00000000000000000fc;
      expv[29] = 74'h00000000000000000fc;
      expv[30] = 74'h00000000000000000fc;
      expv[31] = 74'h00000000000000000fc;
      expv[32] = 74'h00000001800000001fc;
      expv[33] = 74'h00000000000000000c7;
      expv[34] = 74'h00000000000000000c7;
      expv[35] = 74'h00000000000000000c7;
      expv[36] = 74'h00000000000000000c7;
      expv[37] = 74'h00000001c00000001c7;
      expv[38] = 74'h0000000000000000014;
      expv[39] = 74'h0000000000000000014;
      expv[40] = 74'h0000000000000000014;
      expv[41] = 74'h0000000000000000014;
      expv[42] = 74'h0000000200000000114;
      expv[43] = 74'h00000000000000000f7;
      expv[44] = 74'h00000000000000000f7;
      expv[45] = 74'h00000000000000000f7;
      expv[46] = 74'h00000000000000000f7;
      expv[47] = 74'h00000002400000001f7;
      expv[48] = 74'h00000000000000000d7;
      expv[49] = 74'h00000000000000000d7;
      expv[50] = 74'h00000000000000000d7;
      expv[51] = 74'h00000000000000000d7;
      expv[52] = 74'h00000002800000001d7;
      expv[53] = 74'h000000000000000000a;
      expv[54] = 74'h000000000000000000a;
      expv[55] = 74'h000000000000000000a;
      expv[56] = 74'h000000000000000000a;
      expv[57] = 74'h00000002c000000010a;
      expv[58] = 74'h00000000000000000ed;
      expv[59] = 74'h00000000000000000ed;
      expv[60] = 74'h00000000000000000ed;
      expv[61] = 74'h00000000000000000ed;
      expv[62] = 74'h00000003000000001ed;
      expv[63] = 74'h000000000000000008b;
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
