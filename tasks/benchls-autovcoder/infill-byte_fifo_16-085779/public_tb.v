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

  autovcoder_085779 dut (
    .sys_clk_i(clk),
    .d_i(in_vec[11:4]),
    .we_i(in_vec[3:3]),
    .wp_inc_i(in_vec[2:2]),
    .rp_inc_i(in_vec[1:1]),
    .sys_reset_i(in_vec[0:0]),
    .q_o(out_vec[9:2]),
    .full_o(out_vec[1:1]),
    .data_available_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h233;
    stim[1] = 12'hcb7;
    stim[2] = 12'ha70;
    stim[3] = 12'h9ec;
    stim[4] = 12'h2a6;
    stim[5] = 12'h52e;
    stim[6] = 12'h312;
    stim[7] = 12'he16;
    stim[8] = 12'h0d2;
    stim[9] = 12'h162;
    stim[10] = 12'h126;
    stim[11] = 12'h864;
    stim[12] = 12'h976;
    stim[13] = 12'hcb8;
    stim[14] = 12'h60c;
    stim[15] = 12'h72c;
    stim[16] = 12'h0d2;
    stim[17] = 12'he8c;
    stim[18] = 12'hb2a;
    stim[19] = 12'ha02;
    stim[20] = 12'hf10;
    stim[21] = 12'h9c2;
    stim[22] = 12'h4c4;
    stim[23] = 12'hd02;
    stim[24] = 12'h304;
    stim[25] = 12'h1fe;
    stim[26] = 12'hcc8;
    stim[27] = 12'h07a;
    stim[28] = 12'hfca;
    stim[29] = 12'hf4a;
    stim[30] = 12'h4ec;
    stim[31] = 12'h434;
    stim[32] = 12'h806;
    stim[33] = 12'h526;
    stim[34] = 12'hb9e;
    stim[35] = 12'he7e;
    stim[36] = 12'h030;
    stim[37] = 12'hf30;
    stim[38] = 12'h018;
    stim[39] = 12'h08c;
    stim[40] = 12'hc9e;
    stim[41] = 12'hfec;
    stim[42] = 12'he34;
    stim[43] = 12'h0fe;
    stim[44] = 12'h036;
    stim[45] = 12'h722;
    stim[46] = 12'h1d0;
    stim[47] = 12'ha7a;
    stim[48] = 12'he32;
    stim[49] = 12'h68e;
    stim[50] = 12'h196;
    stim[51] = 12'h75e;
    stim[52] = 12'hd22;
    stim[53] = 12'h5c0;
    stim[54] = 12'h6c4;
    stim[55] = 12'h89c;
    stim[56] = 12'hd0e;
    stim[57] = 12'hefa;
    stim[58] = 12'h65e;
    stim[59] = 12'h698;
    stim[60] = 12'hca8;
    stim[61] = 12'he2a;
    stim[62] = 12'h14c;
    stim[63] = 12'h8a4;
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
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'h279;
      expv[5] = 10'hxxx;
      expv[6] = 10'h149;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'hxxx;
      expv[19] = 10'h181;
      expv[20] = 10'h1c9;
      expv[21] = 10'h1c9;
      expv[22] = 10'h3a1;
      expv[23] = 10'h3a1;
      expv[24] = 10'h2c9;
      expv[25] = 10'h2c9;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'h07d;
      expv[29] = 10'h3f0;
      expv[30] = 10'h3d0;
      expv[31] = 10'h139;
      expv[32] = 10'h139;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'h279;
      expv[36] = 10'h2e5;
      expv[37] = 10'h2e5;
      expv[38] = 10'h2e5;
      expv[39] = 10'h2e5;
      expv[40] = 10'h2e5;
      expv[41] = 10'h39d;
      expv[42] = 10'h39d;
      expv[43] = 10'h39d;
      expv[44] = 10'h021;
      expv[45] = 10'h325;
      expv[46] = 10'h3f9;
      expv[47] = 10'h3f9;
      expv[48] = 10'hxxx;
      expv[49] = 10'h03d;
      expv[50] = 10'h1c9;
      expv[51] = 10'h1a1;
      expv[52] = 10'h2c9;
      expv[53] = 10'h1d5;
      expv[54] = 10'h1d5;
      expv[55] = 10'h1d5;
      expv[56] = 10'h1d5;
      expv[57] = 10'h07d;
      expv[58] = 10'h225;
      expv[59] = 10'h341;
      expv[60] = 10'h341;
      expv[61] = 10'h341;
      expv[62] = 10'h195;
      expv[63] = 10'h195;
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
