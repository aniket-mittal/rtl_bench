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

  autovcoder_001986 dut (
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
    stim[0] = 33'h10f5cf7d0;
    stim[1] = 33'h1c0f55b50;
    stim[2] = 33'h01a889ce5;
    stim[3] = 33'h00edce82b;
    stim[4] = 33'h04fdde2f7;
    stim[5] = 33'h0b39de07d;
    stim[6] = 33'h044e49648;
    stim[7] = 33'h0068596bf;
    stim[8] = 33'h0015703e3;
    stim[9] = 33'h09dd4510c;
    stim[10] = 33'h08ff94564;
    stim[11] = 33'h0fdce9870;
    stim[12] = 33'h02cba00a6;
    stim[13] = 33'h042db9100;
    stim[14] = 33'h092705274;
    stim[15] = 33'h041a7ab66;
    stim[16] = 33'h0a7accdca;
    stim[17] = 33'h0ac17fac6;
    stim[18] = 33'h0af4e4bca;
    stim[19] = 33'h0c374dc8a;
    stim[20] = 33'h01a07e27d;
    stim[21] = 33'h0fd8740a9;
    stim[22] = 33'h0efb5e812;
    stim[23] = 33'h07f47a6ab;
    stim[24] = 33'h076ccc456;
    stim[25] = 33'h0d51bed36;
    stim[26] = 33'h0563d35a7;
    stim[27] = 33'h019f9452d;
    stim[28] = 33'h0ef9c94f4;
    stim[29] = 33'h029fbe772;
    stim[30] = 33'h0842380ac;
    stim[31] = 33'h0ac0b6e80;
    stim[32] = 33'h036e3dec5;
    stim[33] = 33'h0f9288eaa;
    stim[34] = 33'h08d9e34d5;
    stim[35] = 33'h00dc70367;
    stim[36] = 33'h025e34215;
    stim[37] = 33'h0dcfd0f00;
    stim[38] = 33'h04a1a3f18;
    stim[39] = 33'h0167efb3b;
    stim[40] = 33'h0e82c1d6e;
    stim[41] = 33'h02f86b9cc;
    stim[42] = 33'h0c413dfcb;
    stim[43] = 33'h073ad95b2;
    stim[44] = 33'h049f2fb07;
    stim[45] = 33'h07cf73d63;
    stim[46] = 33'h0e5a656da;
    stim[47] = 33'h0f09a042e;
    stim[48] = 33'h0326c688b;
    stim[49] = 33'h0291047db;
    stim[50] = 33'h0a639fb8a;
    stim[51] = 33'h0b53c83c6;
    stim[52] = 33'h0079ef0a4;
    stim[53] = 33'h058998f30;
    stim[54] = 33'h0e34394f0;
    stim[55] = 33'h0755beaf5;
    stim[56] = 33'h0c895fa47;
    stim[57] = 33'h0074c27a4;
    stim[58] = 33'h040413e95;
    stim[59] = 33'h0e29c02fb;
    stim[60] = 33'h0fab381b5;
    stim[61] = 33'h0e7b163d8;
    stim[62] = 33'h0f3d8f61a;
    stim[63] = 33'h0a48968e0;
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
      expv[2] = 74'h00000000xxxxxxxxx50;
      expv[3] = 74'h00000000xxxxxxxxxe5;
      expv[4] = 74'h00000000xxxxxxxxxe5;
      expv[5] = 74'h00000000000000000e5;
      expv[6] = 74'h00000000000000000e5;
      expv[7] = 74'h00000000400000001e5;
      expv[8] = 74'h00000000000000000bf;
      expv[9] = 74'h00000000000000000bf;
      expv[10] = 74'h00000000000000000bf;
      expv[11] = 74'h00000000000000000bf;
      expv[12] = 74'h00000000800000001bf;
      expv[13] = 74'h00000000000000000a6;
      expv[14] = 74'h00000000000000000a6;
      expv[15] = 74'h00000000000000000a6;
      expv[16] = 74'h00000000000000000a6;
      expv[17] = 74'h00000000c00000001a6;
      expv[18] = 74'h00000000000000000c6;
      expv[19] = 74'h00000000000000000c6;
      expv[20] = 74'h00000000000000000c6;
      expv[21] = 74'h00000000000000000c6;
      expv[22] = 74'h00000001000000001c6;
      expv[23] = 74'h0000000000000000012;
      expv[24] = 74'h0000000000000000012;
      expv[25] = 74'h0000000000000000012;
      expv[26] = 74'h0000000000000000012;
      expv[27] = 74'h0000000140000000112;
      expv[28] = 74'h000000000000000002d;
      expv[29] = 74'h000000000000000002d;
      expv[30] = 74'h000000000000000002d;
      expv[31] = 74'h000000000000000002d;
      expv[32] = 74'h000000018000000012d;
      expv[33] = 74'h00000000000000000c5;
      expv[34] = 74'h00000000000000000c5;
      expv[35] = 74'h00000000000000000c5;
      expv[36] = 74'h00000000000000000c5;
      expv[37] = 74'h00000001c00000001c5;
      expv[38] = 74'h0000000000000000000;
      expv[39] = 74'h0000000000000000000;
      expv[40] = 74'h0000000000000000000;
      expv[41] = 74'h0000000000000000000;
      expv[42] = 74'h0000000200000000100;
      expv[43] = 74'h00000000000000000cb;
      expv[44] = 74'h00000000000000000cb;
      expv[45] = 74'h00000000000000000cb;
      expv[46] = 74'h00000000000000000cb;
      expv[47] = 74'h00000002400000001cb;
      expv[48] = 74'h000000000000000002e;
      expv[49] = 74'h000000000000000002e;
      expv[50] = 74'h000000000000000002e;
      expv[51] = 74'h000000000000000002e;
      expv[52] = 74'h000000028000000012e;
      expv[53] = 74'h00000000000000000a4;
      expv[54] = 74'h00000000000000000a4;
      expv[55] = 74'h00000000000000000a4;
      expv[56] = 74'h00000000000000000a4;
      expv[57] = 74'h00000002c00000001a4;
      expv[58] = 74'h00000000000000000a4;
      expv[59] = 74'h00000000000000000a4;
      expv[60] = 74'h00000000000000000a4;
      expv[61] = 74'h00000000000000000a4;
      expv[62] = 74'h00000003000000001a4;
      expv[63] = 74'h000000000000000001a;
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
