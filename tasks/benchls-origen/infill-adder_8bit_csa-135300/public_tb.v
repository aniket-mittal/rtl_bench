// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135300 dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h9e7d;
    stim[1] = 16'h8c54;
    stim[2] = 16'h6e92;
    stim[3] = 16'h294f;
    stim[4] = 16'hb985;
    stim[5] = 16'hf181;
    stim[6] = 16'hb4a7;
    stim[7] = 16'h0177;
    stim[8] = 16'h9322;
    stim[9] = 16'hf614;
    stim[10] = 16'h2166;
    stim[11] = 16'h8bc8;
    stim[12] = 16'hf0e2;
    stim[13] = 16'h9ff6;
    stim[14] = 16'h3119;
    stim[15] = 16'hbabb;
    stim[16] = 16'h043c;
    stim[17] = 16'h7dc9;
    stim[18] = 16'h3902;
    stim[19] = 16'h4e9c;
    stim[20] = 16'hdeb4;
    stim[21] = 16'h6936;
    stim[22] = 16'h7401;
    stim[23] = 16'h1d91;
    stim[24] = 16'hc868;
    stim[25] = 16'hb027;
    stim[26] = 16'h1322;
    stim[27] = 16'heb48;
    stim[28] = 16'h619c;
    stim[29] = 16'h57f9;
    stim[30] = 16'h8bef;
    stim[31] = 16'hc19d;
    stim[32] = 16'h9414;
    stim[33] = 16'ha410;
    stim[34] = 16'hb237;
    stim[35] = 16'hf9a0;
    stim[36] = 16'had72;
    stim[37] = 16'h9214;
    stim[38] = 16'he219;
    stim[39] = 16'h6fc1;
    stim[40] = 16'hc7b8;
    stim[41] = 16'hdfa7;
    stim[42] = 16'hbd02;
    stim[43] = 16'h3081;
    stim[44] = 16'h0f0e;
    stim[45] = 16'h08d5;
    stim[46] = 16'h326e;
    stim[47] = 16'h8dff;
    stim[48] = 16'h8007;
    stim[49] = 16'hca61;
    stim[50] = 16'h6a84;
    stim[51] = 16'heb41;
    stim[52] = 16'h81b4;
    stim[53] = 16'hdaec;
    stim[54] = 16'hfc41;
    stim[55] = 16'hff4c;
    stim[56] = 16'h7eb9;
    stim[57] = 16'h8ef8;
    stim[58] = 16'h54c3;
    stim[59] = 16'h3420;
    stim[60] = 16'h9118;
    stim[61] = 16'h9402;
    stim[62] = 16'h383d;
    stim[63] = 16'hf1a6;
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
      expv[0] = 9'h0x6;
      expv[1] = 9'h1x0;
      expv[2] = 9'hxx0;
      expv[3] = 9'h0x0;
      expv[4] = 9'h0xd;
      expv[5] = 9'hxxx;
      expv[6] = 9'h0x7;
      expv[7] = 9'hxxx;
      expv[8] = 9'h1xa;
      expv[9] = 9'h0x4;
      expv[10] = 9'h1xf;
      expv[11] = 9'h0x7;
      expv[12] = 9'h1x4;
      expv[13] = 9'h1xa;
      expv[14] = 9'h0x4;
      expv[15] = 9'h0xb;
      expv[16] = 9'h0x0;
      expv[17] = 9'h0xc;
      expv[18] = 9'h0x6;
      expv[19] = 9'h1x4;
      expv[20] = 9'h1x4;
      expv[21] = 9'h1xf;
      expv[22] = 9'hxxx;
      expv[23] = 9'h1xc;
      expv[24] = 9'h0x0;
      expv[25] = 9'h1xe;
      expv[26] = 9'h0xa;
      expv[27] = 9'h0x6;
      expv[28] = 9'hxxa;
      expv[29] = 9'h0x0;
      expv[30] = 9'h0x5;
      expv[31] = 9'h0xd;
      expv[32] = 9'h1x0;
      expv[33] = 9'h1x8;
      expv[34] = 9'h1x2;
      expv[35] = 9'h1x2;
      expv[36] = 9'h0xe;
      expv[37] = 9'h1xc;
      expv[38] = 9'hxx6;
      expv[39] = 9'h0x0;
      expv[40] = 9'hxxx;
      expv[41] = 9'hxxx;
      expv[42] = 9'h1xe;
      expv[43] = 9'h1x2;
      expv[44] = 9'h0xa;
      expv[45] = 9'h1xa;
      expv[46] = 9'h1x1;
      expv[47] = 9'hxxx;
      expv[48] = 9'h1xe;
      expv[49] = 9'h0x6;
      expv[50] = 9'h1xc;
      expv[51] = 9'h0x8;
      expv[52] = 9'h0xb;
      expv[53] = 9'h1xc;
      expv[54] = 9'h0xa;
      expv[55] = 9'h0x6;
      expv[56] = 9'h0xe;
      expv[57] = 9'hxxx;
      expv[58] = 9'h0xe;
      expv[59] = 9'h0x8;
      expv[60] = 9'h1x2;
      expv[61] = 9'h1xc;
      expv[62] = 9'h0xa;
      expv[63] = 9'h1xe;
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
