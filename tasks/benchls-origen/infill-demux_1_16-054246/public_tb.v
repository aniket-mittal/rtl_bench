// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_054246 dut (
    .v(in_vec[16:1]),
    .s(in_vec[0:0]),
    .a0(out_vec[31:16]),
    .a1(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0e587;
    stim[1] = 17'h11d1a;
    stim[2] = 17'h1c657;
    stim[3] = 17'h05897;
    stim[4] = 17'h1f14f;
    stim[5] = 17'h1a325;
    stim[6] = 17'h0d452;
    stim[7] = 17'h0b7d0;
    stim[8] = 17'h106ab;
    stim[9] = 17'h1385b;
    stim[10] = 17'h00d81;
    stim[11] = 17'h0e97b;
    stim[12] = 17'h1b4e2;
    stim[13] = 17'h0f2de;
    stim[14] = 17'h020e8;
    stim[15] = 17'h1e8d3;
    stim[16] = 17'h05f23;
    stim[17] = 17'h1d6cf;
    stim[18] = 17'h03a10;
    stim[19] = 17'h0145d;
    stim[20] = 17'h09aa4;
    stim[21] = 17'h0d2ee;
    stim[22] = 17'h0a55e;
    stim[23] = 17'h0a7ef;
    stim[24] = 17'h1e123;
    stim[25] = 17'h18938;
    stim[26] = 17'h0ed69;
    stim[27] = 17'h0e31c;
    stim[28] = 17'h0aa96;
    stim[29] = 17'h0ff7c;
    stim[30] = 17'h01b23;
    stim[31] = 17'h1b9ea;
    stim[32] = 17'h03dde;
    stim[33] = 17'h1998c;
    stim[34] = 17'h03527;
    stim[35] = 17'h121a7;
    stim[36] = 17'h0b9e8;
    stim[37] = 17'h1b89f;
    stim[38] = 17'h194a3;
    stim[39] = 17'h00f86;
    stim[40] = 17'h00e27;
    stim[41] = 17'h059a2;
    stim[42] = 17'h1beb9;
    stim[43] = 17'h11bd7;
    stim[44] = 17'h092cc;
    stim[45] = 17'h03208;
    stim[46] = 17'h0d751;
    stim[47] = 17'h11fc2;
    stim[48] = 17'h14382;
    stim[49] = 17'h1e227;
    stim[50] = 17'h17256;
    stim[51] = 17'h18bb6;
    stim[52] = 17'h087ba;
    stim[53] = 17'h0fe8c;
    stim[54] = 17'h13605;
    stim[55] = 17'h11a9a;
    stim[56] = 17'h1d764;
    stim[57] = 17'h1f953;
    stim[58] = 17'h1376b;
    stim[59] = 17'h0c098;
    stim[60] = 17'h04fb0;
    stim[61] = 17'h02109;
    stim[62] = 17'h098f2;
    stim[63] = 17'h19bda;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'hxxxx72c3;
      expv[1] = 32'h8e8dxxxx;
      expv[2] = 32'hxxxxe32b;
      expv[3] = 32'hxxxx2c4b;
      expv[4] = 32'hxxxxf8a7;
      expv[5] = 32'hxxxxd192;
      expv[6] = 32'h6a29xxxx;
      expv[7] = 32'h5be8xxxx;
      expv[8] = 32'hxxxx8355;
      expv[9] = 32'hxxxx9c2d;
      expv[10] = 32'hxxxx06c0;
      expv[11] = 32'hxxxx74bd;
      expv[12] = 32'hda71xxxx;
      expv[13] = 32'h796fxxxx;
      expv[14] = 32'h1074xxxx;
      expv[15] = 32'hxxxxf469;
      expv[16] = 32'hxxxx2f91;
      expv[17] = 32'hxxxxeb67;
      expv[18] = 32'h1d08xxxx;
      expv[19] = 32'hxxxx0a2e;
      expv[20] = 32'h4d52xxxx;
      expv[21] = 32'h6977xxxx;
      expv[22] = 32'h52afxxxx;
      expv[23] = 32'hxxxx53f7;
      expv[24] = 32'hxxxxf091;
      expv[25] = 32'hc49cxxxx;
      expv[26] = 32'hxxxx76b4;
      expv[27] = 32'h718exxxx;
      expv[28] = 32'h554bxxxx;
      expv[29] = 32'h7fbexxxx;
      expv[30] = 32'hxxxx0d91;
      expv[31] = 32'hdcf5xxxx;
      expv[32] = 32'h1eefxxxx;
      expv[33] = 32'hccc6xxxx;
      expv[34] = 32'hxxxx1a93;
      expv[35] = 32'hxxxx90d3;
      expv[36] = 32'h5cf4xxxx;
      expv[37] = 32'hxxxxdc4f;
      expv[38] = 32'hxxxxca51;
      expv[39] = 32'h07c3xxxx;
      expv[40] = 32'hxxxx0713;
      expv[41] = 32'h2cd1xxxx;
      expv[42] = 32'hxxxxdf5c;
      expv[43] = 32'hxxxx8deb;
      expv[44] = 32'h4966xxxx;
      expv[45] = 32'h1904xxxx;
      expv[46] = 32'hxxxx6ba8;
      expv[47] = 32'h8fe1xxxx;
      expv[48] = 32'ha1c1xxxx;
      expv[49] = 32'hxxxxf113;
      expv[50] = 32'hb92bxxxx;
      expv[51] = 32'hc5dbxxxx;
      expv[52] = 32'h43ddxxxx;
      expv[53] = 32'h7f46xxxx;
      expv[54] = 32'hxxxx9b02;
      expv[55] = 32'h8d4dxxxx;
      expv[56] = 32'hebb2xxxx;
      expv[57] = 32'hxxxxfca9;
      expv[58] = 32'hxxxx9bb5;
      expv[59] = 32'h604cxxxx;
      expv[60] = 32'h27d8xxxx;
      expv[61] = 32'hxxxx1084;
      expv[62] = 32'h4c79xxxx;
      expv[63] = 32'hcdedxxxx;
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
