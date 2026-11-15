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

  autovcoder_001568 dut (
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
    stim[0] = 33'h11695fbdf;
    stim[1] = 33'h18217a0be;
    stim[2] = 33'h05ac38b2b;
    stim[3] = 33'h0e7ba73f4;
    stim[4] = 33'h021ac59a6;
    stim[5] = 33'h038cddf5c;
    stim[6] = 33'h07da029ff;
    stim[7] = 33'h1044b1be7;
    stim[8] = 33'h03864ae0c;
    stim[9] = 33'h0e6c3a4d5;
    stim[10] = 33'h09854bab1;
    stim[11] = 33'h01eec6ce8;
    stim[12] = 33'h0aedea243;
    stim[13] = 33'h078ad58ed;
    stim[14] = 33'h008ed749d;
    stim[15] = 33'h0ae2e950e;
    stim[16] = 33'h0d00eafd8;
    stim[17] = 33'h09744ab5a;
    stim[18] = 33'h076ab438f;
    stim[19] = 33'h18b3d9f86;
    stim[20] = 33'h0a0d71fd5;
    stim[21] = 33'h05fdeda74;
    stim[22] = 33'h08157855d;
    stim[23] = 33'h02d624f15;
    stim[24] = 33'h08ff5790c;
    stim[25] = 33'h06de0dec8;
    stim[26] = 33'h0d8c8a837;
    stim[27] = 33'h01a385321;
    stim[28] = 33'h08db367bd;
    stim[29] = 33'h1ac6ddd31;
    stim[30] = 33'h01ebdf255;
    stim[31] = 33'h04a9e981d;
    stim[32] = 33'h06d412029;
    stim[33] = 33'h0fd11d060;
    stim[34] = 33'h028846fe3;
    stim[35] = 33'h05c9172f2;
    stim[36] = 33'h0e7ae3c03;
    stim[37] = 33'h0c84a8ba0;
    stim[38] = 33'h0a1a114ed;
    stim[39] = 33'h065435efe;
    stim[40] = 33'h0c7bdd4d9;
    stim[41] = 33'h0136bcdc3;
    stim[42] = 33'h075ca0e63;
    stim[43] = 33'h0cc970152;
    stim[44] = 33'h0da94f3e4;
    stim[45] = 33'h019e716e1;
    stim[46] = 33'h09455cc1f;
    stim[47] = 33'h097abf173;
    stim[48] = 33'h0b59e7b78;
    stim[49] = 33'h0d7eea7c4;
    stim[50] = 33'h0430c42fc;
    stim[51] = 33'h06a27086c;
    stim[52] = 33'h0910a1df9;
    stim[53] = 33'h04b0ae4c6;
    stim[54] = 33'h083db970b;
    stim[55] = 33'h06adc9317;
    stim[56] = 33'h00d4e2b93;
    stim[57] = 33'h00d74392a;
    stim[58] = 33'h033249d62;
    stim[59] = 33'h0e2825922;
    stim[60] = 33'h0f309d06c;
    stim[61] = 33'h05d5af8be;
    stim[62] = 33'h0b0e37e73;
    stim[63] = 33'h0c588fa72;
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
      expv[2] = 74'h00000000xxxxxxxxxbe;
      expv[3] = 74'h00000000xxxxxxxxx2b;
      expv[4] = 74'h00000000xxxxxxxxx2b;
      expv[5] = 74'h000000000000000002b;
      expv[6] = 74'h000000000000000002b;
      expv[7] = 74'h000000004000000012b;
      expv[8] = 74'h00000000000000001e7;
      expv[9] = 74'h000000000000000000c;
      expv[10] = 74'h000000000000000000c;
      expv[11] = 74'h000000000000000000c;
      expv[12] = 74'h000000000000000000c;
      expv[13] = 74'h000000004000000010c;
      expv[14] = 74'h00000000000000000ed;
      expv[15] = 74'h00000000000000000ed;
      expv[16] = 74'h00000000000000000ed;
      expv[17] = 74'h00000000000000000ed;
      expv[18] = 74'h00000000800000001ed;
      expv[19] = 74'h000000000000000008f;
      expv[20] = 74'h000000000000000018f;
      expv[21] = 74'h00000000000000000d5;
      expv[22] = 74'h00000000000000000d5;
      expv[23] = 74'h00000000000000000d5;
      expv[24] = 74'h00000000000000000d5;
      expv[25] = 74'h00000000400000001d5;
      expv[26] = 74'h00000000000000000c8;
      expv[27] = 74'h00000000000000000c8;
      expv[28] = 74'h00000000000000000c8;
      expv[29] = 74'h00000000000000000c8;
      expv[30] = 74'h00000000000000001c8;
      expv[31] = 74'h0000000000000000055;
      expv[32] = 74'h0000000000000000055;
      expv[33] = 74'h0000000000000000055;
      expv[34] = 74'h0000000000000000055;
      expv[35] = 74'h0000000040000000155;
      expv[36] = 74'h00000000000000000f2;
      expv[37] = 74'h00000000000000000f2;
      expv[38] = 74'h00000000000000000f2;
      expv[39] = 74'h00000000000000000f2;
      expv[40] = 74'h00000000800000001f2;
      expv[41] = 74'h00000000000000000d9;
      expv[42] = 74'h00000000000000000d9;
      expv[43] = 74'h00000000000000000d9;
      expv[44] = 74'h00000000000000000d9;
      expv[45] = 74'h00000000c00000001d9;
      expv[46] = 74'h00000000000000000e1;
      expv[47] = 74'h00000000000000000e1;
      expv[48] = 74'h00000000000000000e1;
      expv[49] = 74'h00000000000000000e1;
      expv[50] = 74'h00000001000000001e1;
      expv[51] = 74'h00000000000000000fc;
      expv[52] = 74'h00000000000000000fc;
      expv[53] = 74'h00000000000000000fc;
      expv[54] = 74'h00000000000000000fc;
      expv[55] = 74'h00000001400000001fc;
      expv[56] = 74'h0000000000000000017;
      expv[57] = 74'h0000000000000000017;
      expv[58] = 74'h0000000000000000017;
      expv[59] = 74'h0000000000000000017;
      expv[60] = 74'h0000000180000000117;
      expv[61] = 74'h000000000000000006c;
      expv[62] = 74'h000000000000000006c;
      expv[63] = 74'h000000000000000006c;
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
