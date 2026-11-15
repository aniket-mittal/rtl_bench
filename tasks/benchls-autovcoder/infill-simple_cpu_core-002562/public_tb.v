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

  autovcoder_002562 dut (
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
    stim[0] = 33'h1e6a1b2c7;
    stim[1] = 33'h1b748cee4;
    stim[2] = 33'h079b3020c;
    stim[3] = 33'h1a3e657fb;
    stim[4] = 33'h0a0eab2e5;
    stim[5] = 33'h0dc7df151;
    stim[6] = 33'h005c75a9b;
    stim[7] = 33'h0f1d3c6b7;
    stim[8] = 33'h098bf2aeb;
    stim[9] = 33'h03ce0e2b6;
    stim[10] = 33'h0d7266e4d;
    stim[11] = 33'h0cdb2efa0;
    stim[12] = 33'h0b400e6df;
    stim[13] = 33'h0a9071640;
    stim[14] = 33'h0b1cb5685;
    stim[15] = 33'h04b7f963e;
    stim[16] = 33'h0dbbecf8b;
    stim[17] = 33'h0dbbf7932;
    stim[18] = 33'h0f76ea93c;
    stim[19] = 33'h03087aa0e;
    stim[20] = 33'h0ed6ebad2;
    stim[21] = 33'h053404798;
    stim[22] = 33'h0674013c5;
    stim[23] = 33'h08fe79e6b;
    stim[24] = 33'h0a17dbad3;
    stim[25] = 33'h0b9bde32d;
    stim[26] = 33'h020382c28;
    stim[27] = 33'h16790aee2;
    stim[28] = 33'h0d0760102;
    stim[29] = 33'h0629be2de;
    stim[30] = 33'h01494906b;
    stim[31] = 33'h0cb4b529f;
    stim[32] = 33'h0e7ea4ba0;
    stim[33] = 33'h1b47934a5;
    stim[34] = 33'h061682f48;
    stim[35] = 33'h01079b4a7;
    stim[36] = 33'h086f90855;
    stim[37] = 33'h08148bf9f;
    stim[38] = 33'h01e7d8bc9;
    stim[39] = 33'h020156646;
    stim[40] = 33'h0ace1f270;
    stim[41] = 33'h0a3244adf;
    stim[42] = 33'h0edbb46f4;
    stim[43] = 33'h0a78c067a;
    stim[44] = 33'h084b52800;
    stim[45] = 33'h045ba7c0c;
    stim[46] = 33'h0275b4585;
    stim[47] = 33'h0646a2532;
    stim[48] = 33'h0da381005;
    stim[49] = 33'h017adf1c6;
    stim[50] = 33'h0796b7947;
    stim[51] = 33'h0850dd358;
    stim[52] = 33'h016a269a4;
    stim[53] = 33'h011bdae5f;
    stim[54] = 33'h0906f054b;
    stim[55] = 33'h07e2b4efa;
    stim[56] = 33'h1f90c2ea6;
    stim[57] = 33'h01aaf75c4;
    stim[58] = 33'h01532e31b;
    stim[59] = 33'h0d0aec8bd;
    stim[60] = 33'h0d9dfe974;
    stim[61] = 33'h0a8528857;
    stim[62] = 33'h023873577;
    stim[63] = 33'h0fbe76deb;
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
      expv[2] = 74'h00000000xxxxxxxxxe4;
      expv[3] = 74'h00000000xxxxxxxxx0c;
      expv[4] = 74'h00000000xxxxxxxxx0c;
      expv[5] = 74'h00000000xxxxxxxxxe5;
      expv[6] = 74'h00000000xxxxxxxxxe5;
      expv[7] = 74'h00000000000000000e5;
      expv[8] = 74'h00000000000000000e5;
      expv[9] = 74'h00000000400000001e5;
      expv[10] = 74'h00000000000000000b6;
      expv[11] = 74'h00000000000000000b6;
      expv[12] = 74'h00000000000000000b6;
      expv[13] = 74'h00000000000000000b6;
      expv[14] = 74'h00000000800000001b6;
      expv[15] = 74'h0000000000000000085;
      expv[16] = 74'h0000000000000000085;
      expv[17] = 74'h0000000000000000085;
      expv[18] = 74'h0000000000000000085;
      expv[19] = 74'h00000000c0000000185;
      expv[20] = 74'h000000000000000000e;
      expv[21] = 74'h000000000000000000e;
      expv[22] = 74'h000000000000000000e;
      expv[23] = 74'h000000000000000000e;
      expv[24] = 74'h000000010000000010e;
      expv[25] = 74'h00000000000000000d3;
      expv[26] = 74'h00000000000000000d3;
      expv[27] = 74'h00000000000000000d3;
      expv[28] = 74'h00000000000000001d3;
      expv[29] = 74'h0000000000000000002;
      expv[30] = 74'h0000000000000000002;
      expv[31] = 74'h0000000000000000002;
      expv[32] = 74'h0000000000000000002;
      expv[33] = 74'h0000000040000000102;
      expv[34] = 74'h00000000000000001a5;
      expv[35] = 74'h0000000000000000048;
      expv[36] = 74'h0000000000000000048;
      expv[37] = 74'h0000000000000000048;
      expv[38] = 74'h0000000000000000048;
      expv[39] = 74'h0000000040000000148;
      expv[40] = 74'h0000000000000000046;
      expv[41] = 74'h0000000000000000046;
      expv[42] = 74'h0000000000000000046;
      expv[43] = 74'h0000000000000000046;
      expv[44] = 74'h0000000080000000146;
      expv[45] = 74'h0000000000000000000;
      expv[46] = 74'h0000000000000000000;
      expv[47] = 74'h0000000000000000000;
      expv[48] = 74'h0000000000000000000;
      expv[49] = 74'h00000000c0000000100;
      expv[50] = 74'h00000000000000000c6;
      expv[51] = 74'h00000000000000000c6;
      expv[52] = 74'h00000000000000000c6;
      expv[53] = 74'h00000000000000000c6;
      expv[54] = 74'h00000001000000001c6;
      expv[55] = 74'h000000000000000004b;
      expv[56] = 74'h000000000000000004b;
      expv[57] = 74'h000000000000000014b;
      expv[58] = 74'h00000000000000000c4;
      expv[59] = 74'h00000000000000000c4;
      expv[60] = 74'h00000000000000000c4;
      expv[61] = 74'h00000000000000000c4;
      expv[62] = 74'h00000000400000001c4;
      expv[63] = 74'h0000000000000000077;
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
