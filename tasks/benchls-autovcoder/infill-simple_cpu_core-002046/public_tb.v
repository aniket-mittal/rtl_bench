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

  autovcoder_002046 dut (
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
    stim[0] = 33'h19ca590b7;
    stim[1] = 33'h137b982b4;
    stim[2] = 33'h06c2e2caf;
    stim[3] = 33'h0ee6488ac;
    stim[4] = 33'h0fb7286e9;
    stim[5] = 33'h0170b16aa;
    stim[6] = 33'h0bbb2f922;
    stim[7] = 33'h02d4213d5;
    stim[8] = 33'h0e9d2f905;
    stim[9] = 33'h0a12c14e4;
    stim[10] = 33'h00125c59c;
    stim[11] = 33'h040f79de9;
    stim[12] = 33'h04b787046;
    stim[13] = 33'h0efcec97f;
    stim[14] = 33'h0e010c3ba;
    stim[15] = 33'h039a14ab6;
    stim[16] = 33'h03f16da45;
    stim[17] = 33'h0a6203933;
    stim[18] = 33'h0c5308d30;
    stim[19] = 33'h0b105816d;
    stim[20] = 33'h07175c05e;
    stim[21] = 33'h0133f9be7;
    stim[22] = 33'h024571cfd;
    stim[23] = 33'h0a0805a73;
    stim[24] = 33'h0cde7bb7a;
    stim[25] = 33'h0d979559e;
    stim[26] = 33'h05d99bf59;
    stim[27] = 33'h04bbe2a02;
    stim[28] = 33'h014c5cb8c;
    stim[29] = 33'h065ae41e2;
    stim[30] = 33'h0a5eb721f;
    stim[31] = 33'h0b7972a64;
    stim[32] = 33'h09748cd85;
    stim[33] = 33'h0ae8cba6a;
    stim[34] = 33'h08461c797;
    stim[35] = 33'h08cb5ee8c;
    stim[36] = 33'h0de14c4ea;
    stim[37] = 33'h0e728887c;
    stim[38] = 33'h01df8a5de;
    stim[39] = 33'h033338182;
    stim[40] = 33'h0b2789e9e;
    stim[41] = 33'h04cf4f231;
    stim[42] = 33'h0435fa033;
    stim[43] = 33'h040206045;
    stim[44] = 33'h02b65794d;
    stim[45] = 33'h09db168ec;
    stim[46] = 33'h013588659;
    stim[47] = 33'h08aa6fbeb;
    stim[48] = 33'h090181fe8;
    stim[49] = 33'h0e8c8b33c;
    stim[50] = 33'h081181c06;
    stim[51] = 33'h0ff3467b7;
    stim[52] = 33'h067980484;
    stim[53] = 33'h0bc9eb5a6;
    stim[54] = 33'h049baf981;
    stim[55] = 33'h1b942863b;
    stim[56] = 33'h0fc5ace13;
    stim[57] = 33'h0063a5899;
    stim[58] = 33'h07cc92248;
    stim[59] = 33'h1e174b495;
    stim[60] = 33'h0b895e32d;
    stim[61] = 33'h022a721e9;
    stim[62] = 33'h0cd131337;
    stim[63] = 33'h0bc9eeedf;
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
      expv[2] = 74'h00000000xxxxxxxxxb4;
      expv[3] = 74'h00000000xxxxxxxxxaf;
      expv[4] = 74'h00000000xxxxxxxxxaf;
      expv[5] = 74'h00000000000000000af;
      expv[6] = 74'h00000000000000000af;
      expv[7] = 74'h00000000000000001af;
      expv[8] = 74'h00000000000000000d5;
      expv[9] = 74'h00000000000000000d5;
      expv[10] = 74'h00000000000000000d5;
      expv[11] = 74'h00000000000000000d5;
      expv[12] = 74'h00000000000000001d5;
      expv[13] = 74'h0000000000000000046;
      expv[14] = 74'h0000000000000000046;
      expv[15] = 74'h0000000000000000046;
      expv[16] = 74'h0000000000000000046;
      expv[17] = 74'h0000000000000000146;
      expv[18] = 74'h0000000000000000033;
      expv[19] = 74'h0000000000000000033;
      expv[20] = 74'h0000000000000000033;
      expv[21] = 74'h0000000000000000033;
      expv[22] = 74'h0000000000000000133;
      expv[23] = 74'h00000000000000000fd;
      expv[24] = 74'h00000000000000000fd;
      expv[25] = 74'h00000000000000000fd;
      expv[26] = 74'h00000000000000000fd;
      expv[27] = 74'h00000000000000001fd;
      expv[28] = 74'h0000000000000000002;
      expv[29] = 74'h0000000000000000002;
      expv[30] = 74'h0000000000000000002;
      expv[31] = 74'h0000000000000000002;
      expv[32] = 74'h0000000000000000102;
      expv[33] = 74'h0000000000000000085;
      expv[34] = 74'h0000000000000000085;
      expv[35] = 74'h0000000000000000085;
      expv[36] = 74'h0000000000000000085;
      expv[37] = 74'h0000000000000000185;
      expv[38] = 74'h000000000000000007c;
      expv[39] = 74'h000000000000000007c;
      expv[40] = 74'h000000000000000007c;
      expv[41] = 74'h000000000000000007c;
      expv[42] = 74'h000000000000000017c;
      expv[43] = 74'h0000000000000000033;
      expv[44] = 74'h0000000000000000033;
      expv[45] = 74'h0000000000000000033;
      expv[46] = 74'h0000000000000000033;
      expv[47] = 74'h0000000000000000133;
      expv[48] = 74'h00000000000000000eb;
      expv[49] = 74'h00000000000000000eb;
      expv[50] = 74'h00000000000000000eb;
      expv[51] = 74'h00000000000000000eb;
      expv[52] = 74'h00000000000000001eb;
      expv[53] = 74'h0000000000000000084;
      expv[54] = 74'h0000000000000000084;
      expv[55] = 74'h0000000000000000084;
      expv[56] = 74'h0000000000000000184;
      expv[57] = 74'h0000000000000000013;
      expv[58] = 74'h0000000000000000013;
      expv[59] = 74'h0000000000000000013;
      expv[60] = 74'h0000000000000000113;
      expv[61] = 74'h000000000000000002d;
      expv[62] = 74'h000000000000000002d;
      expv[63] = 74'h000000000000000002d;
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
