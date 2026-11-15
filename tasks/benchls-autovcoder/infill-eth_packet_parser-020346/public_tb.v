// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020346 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[10:10]),
    .rx_dout(in_vec[9:1]),
    .rx_empty(in_vec[0:0]),
    .rx_rd_en(out_vec[17:17]),
    .cmd_fwd_port(out_vec[16:1]),
    .cmd_mode(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6c5;
    stim[1] = 11'h76e;
    stim[2] = 11'h2a5;
    stim[3] = 11'h018;
    stim[4] = 11'h1d4;
    stim[5] = 11'h121;
    stim[6] = 11'h3f6;
    stim[7] = 11'h2aa;
    stim[8] = 11'h1d1;
    stim[9] = 11'h2ce;
    stim[10] = 11'h04c;
    stim[11] = 11'h009;
    stim[12] = 11'h1b3;
    stim[13] = 11'h27f;
    stim[14] = 11'h2b9;
    stim[15] = 11'h7f9;
    stim[16] = 11'h3ca;
    stim[17] = 11'h369;
    stim[18] = 11'h088;
    stim[19] = 11'h3a8;
    stim[20] = 11'h37e;
    stim[21] = 11'h145;
    stim[22] = 11'h3c2;
    stim[23] = 11'h1c2;
    stim[24] = 11'h361;
    stim[25] = 11'h1f9;
    stim[26] = 11'h12d;
    stim[27] = 11'h35b;
    stim[28] = 11'h278;
    stim[29] = 11'h0c2;
    stim[30] = 11'h098;
    stim[31] = 11'h2b1;
    stim[32] = 11'h12f;
    stim[33] = 11'h16d;
    stim[34] = 11'h09d;
    stim[35] = 11'h38c;
    stim[36] = 11'h087;
    stim[37] = 11'h04e;
    stim[38] = 11'h250;
    stim[39] = 11'h2bf;
    stim[40] = 11'h0d1;
    stim[41] = 11'h355;
    stim[42] = 11'h3b3;
    stim[43] = 11'h0e0;
    stim[44] = 11'h202;
    stim[45] = 11'h187;
    stim[46] = 11'h201;
    stim[47] = 11'h0a4;
    stim[48] = 11'h1b8;
    stim[49] = 11'h3c3;
    stim[50] = 11'h0e6;
    stim[51] = 11'h3ec;
    stim[52] = 11'h3a5;
    stim[53] = 11'h072;
    stim[54] = 11'h3e4;
    stim[55] = 11'h220;
    stim[56] = 11'h309;
    stim[57] = 11'h0f8;
    stim[58] = 11'h13c;
    stim[59] = 11'h33e;
    stim[60] = 11'h356;
    stim[61] = 11'h221;
    stim[62] = 11'h09b;
    stim[63] = 11'h0c2;
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
      expv[0] = 18'hxfxxx;
      expv[1] = 18'h0f00x;
      expv[2] = 18'h0f00x;
      expv[3] = 18'h0f00x;
      expv[4] = 18'h2f00x;
      expv[5] = 18'h2f00x;
      expv[6] = 18'h0f00x;
      expv[7] = 18'h2f00x;
      expv[8] = 18'h2f00x;
      expv[9] = 18'h0f00x;
      expv[10] = 18'h2f00x;
      expv[11] = 18'h2f00x;
      expv[12] = 18'h0f00x;
      expv[13] = 18'h0f00x;
      expv[14] = 18'h0f00x;
      expv[15] = 18'h0f00x;
      expv[16] = 18'h0f00x;
      expv[17] = 18'h2f00x;
      expv[18] = 18'h0f00x;
      expv[19] = 18'h2f00x;
      expv[20] = 18'h2f00x;
      expv[21] = 18'h2f00x;
      expv[22] = 18'h0f00x;
      expv[23] = 18'h2f00x;
      expv[24] = 18'h2f00x;
      expv[25] = 18'h0f00x;
      expv[26] = 18'h0f00x;
      expv[27] = 18'h0f00x;
      expv[28] = 18'h0f00x;
      expv[29] = 18'h2f00x;
      expv[30] = 18'h2f00x;
      expv[31] = 18'h2f00x;
      expv[32] = 18'h0f00x;
      expv[33] = 18'h0f00x;
      expv[34] = 18'h0f00x;
      expv[35] = 18'h0f00x;
      expv[36] = 18'h2f00x;
      expv[37] = 18'h0f00x;
      expv[38] = 18'h2f00x;
      expv[39] = 18'h2f00x;
      expv[40] = 18'h0f00x;
      expv[41] = 18'h0f00x;
      expv[42] = 18'h0f00x;
      expv[43] = 18'h0f00x;
      expv[44] = 18'h2f00x;
      expv[45] = 18'h2f00x;
      expv[46] = 18'h0f00x;
      expv[47] = 18'h0f00x;
      expv[48] = 18'h2f00x;
      expv[49] = 18'h2f00x;
      expv[50] = 18'h0f00x;
      expv[51] = 18'h2f00x;
      expv[52] = 18'h2f00x;
      expv[53] = 18'h0f00x;
      expv[54] = 18'h2f00x;
      expv[55] = 18'h2f00x;
      expv[56] = 18'h2f00x;
      expv[57] = 18'h0f00x;
      expv[58] = 18'h2f00x;
      expv[59] = 18'h2f00x;
      expv[60] = 18'h2f00x;
      expv[61] = 18'h2f00x;
      expv[62] = 18'h0f00x;
      expv[63] = 18'h0f00x;
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
