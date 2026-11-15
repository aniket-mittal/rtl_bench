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

  autovcoder_001997 dut (
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
    stim[0] = 33'h14a464af7;
    stim[1] = 33'h183c8a8d3;
    stim[2] = 33'h0b905b7f3;
    stim[3] = 33'h0287be398;
    stim[4] = 33'h0d751657f;
    stim[5] = 33'h00eda6c66;
    stim[6] = 33'h0e9ac74a3;
    stim[7] = 33'h025dfb075;
    stim[8] = 33'h062821d29;
    stim[9] = 33'h0fba65392;
    stim[10] = 33'h0820a6fe5;
    stim[11] = 33'h0ffa5061c;
    stim[12] = 33'h0f38c2ecb;
    stim[13] = 33'h054864be1;
    stim[14] = 33'h02df0b8a8;
    stim[15] = 33'h13ca0669d;
    stim[16] = 33'h015b51e12;
    stim[17] = 33'h0910cbacb;
    stim[18] = 33'h02592617a;
    stim[19] = 33'h0633f76d9;
    stim[20] = 33'h0ce540e7d;
    stim[21] = 33'h0d11d41d4;
    stim[22] = 33'h0fdd9d8aa;
    stim[23] = 33'h0060714c6;
    stim[24] = 33'h01ba31ef5;
    stim[25] = 33'h0341d5676;
    stim[26] = 33'h08ab0b8b6;
    stim[27] = 33'h04d6478c6;
    stim[28] = 33'h0ee3d82ab;
    stim[29] = 33'h041f1d1b0;
    stim[30] = 33'h07204477f;
    stim[31] = 33'h0e98ee631;
    stim[32] = 33'h05a984903;
    stim[33] = 33'h04fb66ee4;
    stim[34] = 33'h0a1aa5035;
    stim[35] = 33'h18efcac80;
    stim[36] = 33'h091fd9b37;
    stim[37] = 33'h014d115b0;
    stim[38] = 33'h04a48372c;
    stim[39] = 33'h0eaac613a;
    stim[40] = 33'h0ee9f2636;
    stim[41] = 33'h0e23525bd;
    stim[42] = 33'h005a1a42b;
    stim[43] = 33'h04ed53cc4;
    stim[44] = 33'h0b436c000;
    stim[45] = 33'h16ffe2ad4;
    stim[46] = 33'h0f60a5444;
    stim[47] = 33'h0b0f61d8b;
    stim[48] = 33'h0eaa2758d;
    stim[49] = 33'h1ee0e3c3e;
    stim[50] = 33'h0c9b5ed80;
    stim[51] = 33'h0c18a2673;
    stim[52] = 33'h057872afb;
    stim[53] = 33'h0cd7535c5;
    stim[54] = 33'h0e5ea595c;
    stim[55] = 33'h0fe14ce5f;
    stim[56] = 33'h07f193bfe;
    stim[57] = 33'h0a312fc79;
    stim[58] = 33'h05b810976;
    stim[59] = 33'h00a8bf2e5;
    stim[60] = 33'h069b9912c;
    stim[61] = 33'h0918420a1;
    stim[62] = 33'h02f2d7a40;
    stim[63] = 33'h09eb4d5ab;
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
      expv[2] = 74'h00000000xxxxxxxxxd3;
      expv[3] = 74'h00000000xxxxxxxxxf3;
      expv[4] = 74'h00000000xxxxxxxxxf3;
      expv[5] = 74'h00000000000000000f3;
      expv[6] = 74'h00000000000000000f3;
      expv[7] = 74'h00000000400000001f3;
      expv[8] = 74'h0000000000000000075;
      expv[9] = 74'h0000000000000000075;
      expv[10] = 74'h0000000000000000075;
      expv[11] = 74'h0000000000000000075;
      expv[12] = 74'h3fffffecc0000000175;
      expv[13] = 74'h00000000000000000cb;
      expv[14] = 74'h00000000000000000cb;
      expv[15] = 74'h00000000000000000cb;
      expv[16] = 74'h00000000000000001cb;
      expv[17] = 74'h0000000000000000012;
      expv[18] = 74'h0000000000000000012;
      expv[19] = 74'h0000000000000000012;
      expv[20] = 74'h0000000000000000012;
      expv[21] = 74'h0000000040000000112;
      expv[22] = 74'h00000000000000000d4;
      expv[23] = 74'h00000000000000000d4;
      expv[24] = 74'h00000000000000000d4;
      expv[25] = 74'h00000000000000000d4;
      expv[26] = 74'h00000000800000001d4;
      expv[27] = 74'h00000000000000000b6;
      expv[28] = 74'h00000000000000000b6;
      expv[29] = 74'h00000000000000000b6;
      expv[30] = 74'h00000000000000000b6;
      expv[31] = 74'h00000000c00000001b6;
      expv[32] = 74'h0000000000000000031;
      expv[33] = 74'h0000000000000000031;
      expv[34] = 74'h0000000000000000031;
      expv[35] = 74'h0000000000000000031;
      expv[36] = 74'h0000000000000000131;
      expv[37] = 74'h0000000000000000037;
      expv[38] = 74'h0000000000000000037;
      expv[39] = 74'h0000000000000000037;
      expv[40] = 74'h0000000000000000037;
      expv[41] = 74'h0000000040000000137;
      expv[42] = 74'h00000000000000000bd;
      expv[43] = 74'h00000000000000000bd;
      expv[44] = 74'h00000000000000000bd;
      expv[45] = 74'h00000000000000000bd;
      expv[46] = 74'h00000000000000001bd;
      expv[47] = 74'h0000000000000000044;
      expv[48] = 74'h0000000000000000044;
      expv[49] = 74'h0000000000000000044;
      expv[50] = 74'h0000000000000000144;
      expv[51] = 74'h0000000000000000080;
      expv[52] = 74'h0000000000000000080;
      expv[53] = 74'h0000000000000000080;
      expv[54] = 74'h0000000000000000080;
      expv[55] = 74'h0000000040000000180;
      expv[56] = 74'h000000000000000005f;
      expv[57] = 74'h000000000000000005f;
      expv[58] = 74'h000000000000000005f;
      expv[59] = 74'h000000000000000005f;
      expv[60] = 74'h000000008000000015f;
      expv[61] = 74'h000000000000000002c;
      expv[62] = 74'h000000000000000002c;
      expv[63] = 74'h000000000000000002c;
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
