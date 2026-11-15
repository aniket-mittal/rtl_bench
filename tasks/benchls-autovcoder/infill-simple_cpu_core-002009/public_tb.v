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

  autovcoder_002009 dut (
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
    stim[0] = 33'h179090c66;
    stim[1] = 33'h145629c08;
    stim[2] = 33'h0ef74bb7c;
    stim[3] = 33'h0c5c00906;
    stim[4] = 33'h17cc82a08;
    stim[5] = 33'h0daf39792;
    stim[6] = 33'h0010127b7;
    stim[7] = 33'h0bb6fa895;
    stim[8] = 33'h010a6fca1;
    stim[9] = 33'h0cd9c3b97;
    stim[10] = 33'h06395a1a1;
    stim[11] = 33'h039f38734;
    stim[12] = 33'h02f59406d;
    stim[13] = 33'h076b00ed3;
    stim[14] = 33'h0843dbad8;
    stim[15] = 33'h0df57788b;
    stim[16] = 33'h06a5d0fd0;
    stim[17] = 33'h0e3316d55;
    stim[18] = 33'h04dad1fd2;
    stim[19] = 33'h065c8f3c3;
    stim[20] = 33'h012fde98b;
    stim[21] = 33'h0ebf08b13;
    stim[22] = 33'h02704db54;
    stim[23] = 33'h00aca1ee4;
    stim[24] = 33'h0184335f4;
    stim[25] = 33'h0f638cac6;
    stim[26] = 33'h0f876327e;
    stim[27] = 33'h0b6a476e5;
    stim[28] = 33'h0d6812719;
    stim[29] = 33'h0526bc4ce;
    stim[30] = 33'h0a30fa0ca;
    stim[31] = 33'h079ddcc93;
    stim[32] = 33'h0fef3efdf;
    stim[33] = 33'h07232dc4f;
    stim[34] = 33'h097b0ed3b;
    stim[35] = 33'h093fbeae8;
    stim[36] = 33'h1762d3ba5;
    stim[37] = 33'h044de4217;
    stim[38] = 33'h0c38502d8;
    stim[39] = 33'h071667e75;
    stim[40] = 33'h033dd5eb6;
    stim[41] = 33'h0a3bf062b;
    stim[42] = 33'h054f0402f;
    stim[43] = 33'h027191954;
    stim[44] = 33'h061784834;
    stim[45] = 33'h0f1d4f466;
    stim[46] = 33'h0e6fbfc64;
    stim[47] = 33'h0ae604323;
    stim[48] = 33'h00cc8afe2;
    stim[49] = 33'h08ee52681;
    stim[50] = 33'h0f9b69544;
    stim[51] = 33'h0590c32d8;
    stim[52] = 33'h05dde6f91;
    stim[53] = 33'h0132c7507;
    stim[54] = 33'h0ea56da68;
    stim[55] = 33'h08b35ea98;
    stim[56] = 33'h06fb737d9;
    stim[57] = 33'h00ec29449;
    stim[58] = 33'h06592fae9;
    stim[59] = 33'h07796f48c;
    stim[60] = 33'h0a207eae3;
    stim[61] = 33'h0df591534;
    stim[62] = 33'h0945f645e;
    stim[63] = 33'h0a8ec51e3;
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
      expv[2] = 74'h00000000xxxxxxxxx08;
      expv[3] = 74'h00000000xxxxxxxxx7c;
      expv[4] = 74'h00000000xxxxxxxxx7c;
      expv[5] = 74'h00000000xxxxxxxxx7c;
      expv[6] = 74'h00000000xxxxxxxxx92;
      expv[7] = 74'h00000000xxxxxxxxx92;
      expv[8] = 74'h0000000000000000092;
      expv[9] = 74'h0000000000000000092;
      expv[10] = 74'h0000000040000000192;
      expv[11] = 74'h00000000000000000a1;
      expv[12] = 74'h00000000000000000a1;
      expv[13] = 74'h00000000000000000a1;
      expv[14] = 74'h00000000000000000a1;
      expv[15] = 74'h00000000800000001a1;
      expv[16] = 74'h000000000000000008b;
      expv[17] = 74'h000000000000000008b;
      expv[18] = 74'h00000015c000000018b;
      expv[19] = 74'h000000000000000008b;
      expv[20] = 74'h000000014000000018b;
      expv[21] = 74'h000000000000000008b;
      expv[22] = 74'h000000000000000008b;
      expv[23] = 74'h000000000000000008b;
      expv[24] = 74'h000000000000000008b;
      expv[25] = 74'h000000018000000018b;
      expv[26] = 74'h00000000000000000c6;
      expv[27] = 74'h00000000000000000c6;
      expv[28] = 74'h00000000000000000c6;
      expv[29] = 74'h00000000000000000c6;
      expv[30] = 74'h00000001c00000001c6;
      expv[31] = 74'h00000000000000000ca;
      expv[32] = 74'h00000000000000000ca;
      expv[33] = 74'h00000000000000000ca;
      expv[34] = 74'h00000000000000000ca;
      expv[35] = 74'h00000002000000001ca;
      expv[36] = 74'h00000000000000000e8;
      expv[37] = 74'h00000000000000001e8;
      expv[38] = 74'h0000000000000000017;
      expv[39] = 74'h0000000000000000017;
      expv[40] = 74'h0000000000000000017;
      expv[41] = 74'h0000000000000000017;
      expv[42] = 74'h0000000040000000117;
      expv[43] = 74'h000000000000000002f;
      expv[44] = 74'h000000000000000002f;
      expv[45] = 74'h000000000000000002f;
      expv[46] = 74'h000000000000000002f;
      expv[47] = 74'h000000008000000012f;
      expv[48] = 74'h0000000000000000023;
      expv[49] = 74'h0000000000000000023;
      expv[50] = 74'h0000000000000000023;
      expv[51] = 74'h0000000000000000023;
      expv[52] = 74'h00000000c0000000123;
      expv[53] = 74'h0000000000000000091;
      expv[54] = 74'h0000000000000000091;
      expv[55] = 74'h0000000000000000091;
      expv[56] = 74'h0000000000000000091;
      expv[57] = 74'h0000000100000000191;
      expv[58] = 74'h0000000000000000049;
      expv[59] = 74'h0000000000000000049;
      expv[60] = 74'h0000000000000000049;
      expv[61] = 74'h0000000000000000049;
      expv[62] = 74'h0000000140000000149;
      expv[63] = 74'h000000000000000005e;
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
