// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072441 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h95b;
    stim[1] = 12'hf88;
    stim[2] = 12'h0cf;
    stim[3] = 12'h2d2;
    stim[4] = 12'h687;
    stim[5] = 12'h49a;
    stim[6] = 12'h6a1;
    stim[7] = 12'h2e5;
    stim[8] = 12'h223;
    stim[9] = 12'h06b;
    stim[10] = 12'h4f4;
    stim[11] = 12'h105;
    stim[12] = 12'h5cf;
    stim[13] = 12'h217;
    stim[14] = 12'h2c3;
    stim[15] = 12'h254;
    stim[16] = 12'h0f5;
    stim[17] = 12'h60a;
    stim[18] = 12'h323;
    stim[19] = 12'h5e3;
    stim[20] = 12'h798;
    stim[21] = 12'h403;
    stim[22] = 12'h2be;
    stim[23] = 12'h156;
    stim[24] = 12'h484;
    stim[25] = 12'h287;
    stim[26] = 12'h051;
    stim[27] = 12'h699;
    stim[28] = 12'h055;
    stim[29] = 12'h342;
    stim[30] = 12'h46f;
    stim[31] = 12'h1a5;
    stim[32] = 12'h59b;
    stim[33] = 12'h00e;
    stim[34] = 12'h612;
    stim[35] = 12'h4fe;
    stim[36] = 12'h05f;
    stim[37] = 12'h453;
    stim[38] = 12'h4d0;
    stim[39] = 12'h79d;
    stim[40] = 12'h279;
    stim[41] = 12'h4ae;
    stim[42] = 12'h586;
    stim[43] = 12'h5f5;
    stim[44] = 12'h6fa;
    stim[45] = 12'h517;
    stim[46] = 12'h152;
    stim[47] = 12'h565;
    stim[48] = 12'h022;
    stim[49] = 12'h1a3;
    stim[50] = 12'h687;
    stim[51] = 12'h157;
    stim[52] = 12'h708;
    stim[53] = 12'h413;
    stim[54] = 12'h45b;
    stim[55] = 12'h3dc;
    stim[56] = 12'h6ca;
    stim[57] = 12'h45f;
    stim[58] = 12'h560;
    stim[59] = 12'h19e;
    stim[60] = 12'h603;
    stim[61] = 12'h3ab;
    stim[62] = 12'h76f;
    stim[63] = 12'h534;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h188;
      expv[6] = 10'h188;
      expv[7] = 10'h188;
      expv[8] = 10'h188;
      expv[9] = 10'h188;
      expv[10] = 10'h188;
      expv[11] = 10'h188;
      expv[12] = 10'h188;
      expv[13] = 10'h188;
      expv[14] = 10'h188;
      expv[15] = 10'h188;
      expv[16] = 10'h188;
      expv[17] = 10'h188;
      expv[18] = 10'h3cf;
      expv[19] = 10'h3cf;
      expv[20] = 10'h3cf;
      expv[21] = 10'h3e3;
      expv[22] = 10'h3e3;
      expv[23] = 10'h3e3;
      expv[24] = 10'h3e3;
      expv[25] = 10'h3e3;
      expv[26] = 10'h3e3;
      expv[27] = 10'h3e3;
      expv[28] = 10'h398;
      expv[29] = 10'h398;
      expv[30] = 10'h398;
      expv[31] = 10'h398;
      expv[32] = 10'h398;
      expv[33] = 10'h398;
      expv[34] = 10'h398;
      expv[35] = 10'h39b;
      expv[36] = 10'h39b;
      expv[37] = 10'h39b;
      expv[38] = 10'h39b;
      expv[39] = 10'h39b;
      expv[40] = 10'h19b;
      expv[41] = 10'h19b;
      expv[42] = 10'h39d;
      expv[43] = 10'h39d;
      expv[44] = 10'h39d;
      expv[45] = 10'h386;
      expv[46] = 10'h386;
      expv[47] = 10'h386;
      expv[48] = 10'h386;
      expv[49] = 10'h386;
      expv[50] = 10'h386;
      expv[51] = 10'h3f5;
      expv[52] = 10'h3f5;
      expv[53] = 10'h317;
      expv[54] = 10'h317;
      expv[55] = 10'h317;
      expv[56] = 10'h317;
      expv[57] = 10'h365;
      expv[58] = 10'h365;
      expv[59] = 10'h365;
      expv[60] = 10'h365;
      expv[61] = 10'h308;
      expv[62] = 10'h308;
      expv[63] = 10'h360;
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
