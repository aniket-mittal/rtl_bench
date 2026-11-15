// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02598 dut (
    .Clock(clk),
    .Reset(in_vec[44:44]),
    .Red(in_vec[43:36]),
    .Green(in_vec[35:28]),
    .Blue(in_vec[27:20]),
    .VScrollOffset(in_vec[19:10]),
    .HScrollOffset(in_vec[9:0]),
    .H_Sync_out(out_vec[46:46]),
    .V_Sync_out(out_vec[45:45]),
    .VideoBlanking_L(out_vec[44:44]),
    .Red_out(out_vec[43:36]),
    .Green_out(out_vec[35:28]),
    .Blue_out(out_vec[27:20]),
    .Column_out(out_vec[19:10]),
    .Row_out(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1f993d3ea787;
    stim[1] = 45'h1c909fa7017e;
    stim[2] = 45'h08a343bb2e87;
    stim[3] = 45'h060345585e7a;
    stim[4] = 45'h0d9e1ed9e23d;
    stim[5] = 45'h0b4471afada4;
    stim[6] = 45'h17a27a8a2ca2;
    stim[7] = 45'h0cfac04aa424;
    stim[8] = 45'h066a13b129e9;
    stim[9] = 45'h03e29549eee2;
    stim[10] = 45'h0a8beb8069d6;
    stim[11] = 45'h0722ff935697;
    stim[12] = 45'h08c887252f40;
    stim[13] = 45'h0b9e868a674f;
    stim[14] = 45'h02bfdeb64d8b;
    stim[15] = 45'h0a9ad13cf4ad;
    stim[16] = 45'h0dabc6c62f70;
    stim[17] = 45'h0abdf614b0c9;
    stim[18] = 45'h002c81b3bd92;
    stim[19] = 45'h0c14f2fae6c4;
    stim[20] = 45'h01c850191792;
    stim[21] = 45'h0de22b06bfc1;
    stim[22] = 45'h05428075b975;
    stim[23] = 45'h03f2abd73019;
    stim[24] = 45'h039c54144805;
    stim[25] = 45'h0f3b4f8e7f4c;
    stim[26] = 45'h087a1b1588d4;
    stim[27] = 45'h0238e6c6565f;
    stim[28] = 45'h042f8d51051c;
    stim[29] = 45'h08c29a683b57;
    stim[30] = 45'h0d55b43a33a4;
    stim[31] = 45'h054e56ece77d;
    stim[32] = 45'h09067e8a88a1;
    stim[33] = 45'h02784c8931cd;
    stim[34] = 45'h00d2a983e409;
    stim[35] = 45'h0452f914579b;
    stim[36] = 45'h0aeb48079b45;
    stim[37] = 45'h0e3608016a83;
    stim[38] = 45'h00200d9b4653;
    stim[39] = 45'h0801178cd240;
    stim[40] = 45'h08173ac73e9f;
    stim[41] = 45'h00ac95cd9cd6;
    stim[42] = 45'h0b26847d1208;
    stim[43] = 45'h0d96582545f9;
    stim[44] = 45'h097546819391;
    stim[45] = 45'h054ae5e4e201;
    stim[46] = 45'h099c938b1692;
    stim[47] = 45'h0972b4364654;
    stim[48] = 45'h001d85e5b2e1;
    stim[49] = 45'h09dae1a1776a;
    stim[50] = 45'h0d44fcc0642d;
    stim[51] = 45'h0b7abf5fe7c8;
    stim[52] = 45'h06dbcc571238;
    stim[53] = 45'h012b023a2cb4;
    stim[54] = 45'h07024f1d8c14;
    stim[55] = 45'h01294c7571f8;
    stim[56] = 45'h0f3c4d6f525f;
    stim[57] = 45'h021b9086d2b3;
    stim[58] = 45'h08e901b1d620;
    stim[59] = 45'h0180a5ac3f1f;
    stim[60] = 45'h02f40410efe9;
    stim[61] = 45'h013f48b45dcc;
    stim[62] = 45'h073f1d93be82;
    stim[63] = 45'h00cc93221981;
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
      expv[0] = 47'hxxxxxxxxxxxx;
      expv[1] = 47'hxxx0xxxxxxxx;
      expv[2] = 47'hxxxxxxxxxxxx;
      expv[3] = 47'hx000000a1xxx;
      expv[4] = 47'hx0000009exxx;
      expv[5] = 47'hx0000008fxxx;
      expv[6] = 47'hx00000069xxx;
      expv[7] = 47'hx00000069xxx;
      expv[8] = 47'hx00000009xxx;
      expv[9] = 47'hx0000007axxx;
      expv[10] = 47'hx000000b8xxx;
      expv[11] = 47'hx00000075xxx;
      expv[12] = 47'hx000000a5xxx;
      expv[13] = 47'hx000000d0xxx;
      expv[14] = 47'hx000000d3xxx;
      expv[15] = 47'hx00000062xxx;
      expv[16] = 47'hx0000002bxxx;
      expv[17] = 47'hx000000dcxxx;
      expv[18] = 47'hx00000032xxx;
      expv[19] = 47'hx00000064xxx;
      expv[20] = 47'hx000000b1xxx;
      expv[21] = 47'hx000000e4xxx;
      expv[22] = 47'hx000000f0xxx;
      expv[23] = 47'hx0000005dxxx;
      expv[24] = 47'hx00000006xxx;
      expv[25] = 47'hx00000001xxx;
      expv[26] = 47'hx000000d3xxx;
      expv[27] = 47'hx00000035xxx;
      expv[28] = 47'hx00000097xxx;
      expv[29] = 47'hx00000047xxx;
      expv[30] = 47'hx000000d5xxx;
      expv[31] = 47'hx000000e9xxx;
      expv[32] = 47'hx000000dfxxx;
      expv[33] = 47'hx00000028xxx;
      expv[34] = 47'hx00000073xxx;
      expv[35] = 47'hx00000002xxx;
      expv[36] = 47'hx000000e6xxx;
      expv[37] = 47'hx000000d1xxx;
      expv[38] = 47'hx000000a0xxx;
      expv[39] = 47'hx00000094xxx;
      expv[40] = 47'hx00000090xxx;
      expv[41] = 47'hx000000a7xxx;
      expv[42] = 47'hx00000035xxx;
      expv[43] = 47'hx00000082xxx;
      expv[44] = 47'hx0000007exxx;
      expv[45] = 47'hx000000e4xxx;
      expv[46] = 47'hx00000080xxx;
      expv[47] = 47'hx000000a4xxx;
      expv[48] = 47'hx00000095xxx;
      expv[49] = 47'hx000000b8xxx;
      expv[50] = 47'hx000000daxxx;
      expv[51] = 47'hx0000000bxxx;
      expv[52] = 47'hx000000f2xxx;
      expv[53] = 47'hx0000008exxx;
      expv[54] = 47'hx0000002dxxx;
      expv[55] = 47'hx00000005xxx;
      expv[56] = 47'hx0000007exxx;
      expv[57] = 47'hx00000097xxx;
      expv[58] = 47'hx000000acxxx;
      expv[59] = 47'hx00000088xxx;
      expv[60] = 47'hx000000c7xxx;
      expv[61] = 47'hx000000faxxx;
      expv[62] = 47'hx00000073xxx;
      expv[63] = 47'hx000000a0xxx;
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
