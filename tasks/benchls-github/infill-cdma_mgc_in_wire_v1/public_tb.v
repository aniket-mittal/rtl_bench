// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  CDMA_mgc_in_wire_v1 dut (
    .z(in_vec[7:0]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'ha5;
    stim[1] = 8'h46;
    stim[2] = 8'h9f;
    stim[3] = 8'ha0;
    stim[4] = 8'hb2;
    stim[5] = 8'hfa;
    stim[6] = 8'he5;
    stim[7] = 8'h7e;
    stim[8] = 8'h7d;
    stim[9] = 8'h9c;
    stim[10] = 8'hd8;
    stim[11] = 8'h96;
    stim[12] = 8'h97;
    stim[13] = 8'h73;
    stim[14] = 8'h99;
    stim[15] = 8'h83;
    stim[16] = 8'hc2;
    stim[17] = 8'h66;
    stim[18] = 8'h26;
    stim[19] = 8'h9d;
    stim[20] = 8'he4;
    stim[21] = 8'hbf;
    stim[22] = 8'h72;
    stim[23] = 8'h72;
    stim[24] = 8'h88;
    stim[25] = 8'h7b;
    stim[26] = 8'hb7;
    stim[27] = 8'h52;
    stim[28] = 8'h78;
    stim[29] = 8'h1f;
    stim[30] = 8'h77;
    stim[31] = 8'he7;
    stim[32] = 8'h92;
    stim[33] = 8'h3b;
    stim[34] = 8'h64;
    stim[35] = 8'h3f;
    stim[36] = 8'hcc;
    stim[37] = 8'h0f;
    stim[38] = 8'h5c;
    stim[39] = 8'h28;
    stim[40] = 8'hbb;
    stim[41] = 8'h38;
    stim[42] = 8'h08;
    stim[43] = 8'had;
    stim[44] = 8'h98;
    stim[45] = 8'hb4;
    stim[46] = 8'h28;
    stim[47] = 8'ha6;
    stim[48] = 8'h9b;
    stim[49] = 8'hb5;
    stim[50] = 8'h2d;
    stim[51] = 8'hf2;
    stim[52] = 8'hde;
    stim[53] = 8'hb0;
    stim[54] = 8'h51;
    stim[55] = 8'h50;
    stim[56] = 8'h64;
    stim[57] = 8'h2d;
    stim[58] = 8'hc6;
    stim[59] = 8'he2;
    stim[60] = 8'hc4;
    stim[61] = 8'h41;
    stim[62] = 8'h6d;
    stim[63] = 8'h25;
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
      expv[0] = 8'ha5;
      expv[1] = 8'h46;
      expv[2] = 8'h9f;
      expv[3] = 8'ha0;
      expv[4] = 8'hb2;
      expv[5] = 8'hfa;
      expv[6] = 8'he5;
      expv[7] = 8'h7e;
      expv[8] = 8'h7d;
      expv[9] = 8'h9c;
      expv[10] = 8'hd8;
      expv[11] = 8'h96;
      expv[12] = 8'h97;
      expv[13] = 8'h73;
      expv[14] = 8'h99;
      expv[15] = 8'h83;
      expv[16] = 8'hc2;
      expv[17] = 8'h66;
      expv[18] = 8'h26;
      expv[19] = 8'h9d;
      expv[20] = 8'he4;
      expv[21] = 8'hbf;
      expv[22] = 8'h72;
      expv[23] = 8'h72;
      expv[24] = 8'h88;
      expv[25] = 8'h7b;
      expv[26] = 8'hb7;
      expv[27] = 8'h52;
      expv[28] = 8'h78;
      expv[29] = 8'h1f;
      expv[30] = 8'h77;
      expv[31] = 8'he7;
      expv[32] = 8'h92;
      expv[33] = 8'h3b;
      expv[34] = 8'h64;
      expv[35] = 8'h3f;
      expv[36] = 8'hcc;
      expv[37] = 8'h0f;
      expv[38] = 8'h5c;
      expv[39] = 8'h28;
      expv[40] = 8'hbb;
      expv[41] = 8'h38;
      expv[42] = 8'h08;
      expv[43] = 8'had;
      expv[44] = 8'h98;
      expv[45] = 8'hb4;
      expv[46] = 8'h28;
      expv[47] = 8'ha6;
      expv[48] = 8'h9b;
      expv[49] = 8'hb5;
      expv[50] = 8'h2d;
      expv[51] = 8'hf2;
      expv[52] = 8'hde;
      expv[53] = 8'hb0;
      expv[54] = 8'h51;
      expv[55] = 8'h50;
      expv[56] = 8'h64;
      expv[57] = 8'h2d;
      expv[58] = 8'hc6;
      expv[59] = 8'he2;
      expv[60] = 8'hc4;
      expv[61] = 8'h41;
      expv[62] = 8'h6d;
      expv[63] = 8'h25;
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
