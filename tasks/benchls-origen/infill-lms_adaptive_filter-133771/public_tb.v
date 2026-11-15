// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133771 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .x(in_vec[31:16]),
    .d(in_vec[15:0]),
    .y(out_vec[31:16]),
    .e(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1cd225044;
    stim[1] = 33'h10eb039de;
    stim[2] = 33'h0da83f32c;
    stim[3] = 33'h07c36c7f1;
    stim[4] = 33'h0d4fec8eb;
    stim[5] = 33'h0ff7b0680;
    stim[6] = 33'h0d76149e0;
    stim[7] = 33'h04763901f;
    stim[8] = 33'h0d4a5c8a8;
    stim[9] = 33'h0a07821b9;
    stim[10] = 33'h0fca09538;
    stim[11] = 33'h01f6b978c;
    stim[12] = 33'h0e73bb11a;
    stim[13] = 33'h011d39c71;
    stim[14] = 33'h0a40f4d9f;
    stim[15] = 33'h0d58d512c;
    stim[16] = 33'h0a5e291d1;
    stim[17] = 33'h02ec31b87;
    stim[18] = 33'h0396f6191;
    stim[19] = 33'h0127215f4;
    stim[20] = 33'h0fe22b285;
    stim[21] = 33'h0243bffe7;
    stim[22] = 33'h0e46cf40d;
    stim[23] = 33'h06f4db2ab;
    stim[24] = 33'h0e207f699;
    stim[25] = 33'h0f6cffd84;
    stim[26] = 33'h0fbf71967;
    stim[27] = 33'h0236e621e;
    stim[28] = 33'h0cc2454fb;
    stim[29] = 33'h0e74af993;
    stim[30] = 33'h05b0bc19f;
    stim[31] = 33'h08cfc9ddd;
    stim[32] = 33'h00f0e3c56;
    stim[33] = 33'h0fb87f7c0;
    stim[34] = 33'h1fea0dec5;
    stim[35] = 33'h0cb689626;
    stim[36] = 33'h00f0781d5;
    stim[37] = 33'h0e5c0d321;
    stim[38] = 33'h0f181d2e0;
    stim[39] = 33'h05db60a43;
    stim[40] = 33'h0ae615203;
    stim[41] = 33'h08e6b05dc;
    stim[42] = 33'h039156340;
    stim[43] = 33'h02149ba15;
    stim[44] = 33'h0903edb71;
    stim[45] = 33'h0970ad50e;
    stim[46] = 33'h00f01ce80;
    stim[47] = 33'h03ca15eee;
    stim[48] = 33'h03859f6d5;
    stim[49] = 33'h07b14bab5;
    stim[50] = 33'h093d8faf2;
    stim[51] = 33'h0f236a5f1;
    stim[52] = 33'h052c9ccff;
    stim[53] = 33'h004f34824;
    stim[54] = 33'h08762f95d;
    stim[55] = 33'h0a69c3fc1;
    stim[56] = 33'h08e88e71e;
    stim[57] = 33'h04a6db293;
    stim[58] = 33'h0b22a3f16;
    stim[59] = 33'h0b9885408;
    stim[60] = 33'h01bbab729;
    stim[61] = 33'h007fafcc4;
    stim[62] = 33'h0b1f765c1;
    stim[63] = 33'h03c9e87a6;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h0000f32c;
      expv[4] = 32'h0000c7f1;
      expv[5] = 32'h0000c8eb;
      expv[6] = 32'h00000680;
      expv[7] = 32'h000049e0;
      expv[8] = 32'h0000901f;
      expv[9] = 32'h0000c8a8;
      expv[10] = 32'h000021b9;
      expv[11] = 32'h00009538;
      expv[12] = 32'h0000978c;
      expv[13] = 32'hffffb11a;
      expv[14] = 32'hfffe9c72;
      expv[15] = 32'hffff4da1;
      expv[16] = 32'hffff512d;
      expv[17] = 32'hfffe91d2;
      expv[18] = 32'hffff1b89;
      expv[19] = 32'hfffe6192;
      expv[20] = 32'hfffe15f6;
      expv[21] = 32'hfffdb287;
      expv[22] = 32'hfffcffea;
      expv[23] = 32'hfffdf411;
      expv[24] = 32'hfffbb2ae;
      expv[25] = 32'hfffcf69e;
      expv[26] = 32'hfffdfd88;
      expv[27] = 32'hfffb196a;
      expv[28] = 32'hfff96223;
      expv[29] = 32'hfff85502;
      expv[30] = 32'hfff9f99b;
      expv[31] = 32'hfffac1a6;
      expv[32] = 32'hfffb9de3;
      expv[33] = 32'hfff93c5b;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00009626;
      expv[37] = 32'h000081d5;
      expv[38] = 32'h0000d321;
      expv[39] = 32'h0000d2e0;
      expv[40] = 32'h00000a43;
      expv[41] = 32'h00005203;
      expv[42] = 32'h000005dc;
      expv[43] = 32'h00006340;
      expv[44] = 32'h0000ba15;
      expv[45] = 32'h0000db71;
      expv[46] = 32'hffffd50e;
      expv[47] = 32'hfffece81;
      expv[48] = 32'hffff5ef0;
      expv[49] = 32'hfffff6d6;
      expv[50] = 32'hfffebab6;
      expv[51] = 32'hfffdfaf4;
      expv[52] = 32'hfffda5f4;
      expv[53] = 32'hfffdcd02;
      expv[54] = 32'hfffd4827;
      expv[55] = 32'hfffcf960;
      expv[56] = 32'hfffb3fc5;
      expv[57] = 32'hfff9e723;
      expv[58] = 32'hfff9b29a;
      expv[59] = 32'hfffa3f1d;
      expv[60] = 32'hfff9540e;
      expv[61] = 32'hfff9b730;
      expv[62] = 32'hfffafccb;
      expv[63] = 32'hfffb65c7;
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
