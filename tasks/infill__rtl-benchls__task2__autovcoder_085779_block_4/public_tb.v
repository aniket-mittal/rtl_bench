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
    stim[0] = 12'h3b9;
    stim[1] = 12'hb07;
    stim[2] = 12'he34;
    stim[3] = 12'h7a0;
    stim[4] = 12'h313;
    stim[5] = 12'ha60;
    stim[6] = 12'ha08;
    stim[7] = 12'h9e6;
    stim[8] = 12'h7e0;
    stim[9] = 12'ha4a;
    stim[10] = 12'h2cc;
    stim[11] = 12'h12e;
    stim[12] = 12'h67a;
    stim[13] = 12'h352;
    stim[14] = 12'he4c;
    stim[15] = 12'he50;
    stim[16] = 12'h610;
    stim[17] = 12'h36c;
    stim[18] = 12'h82a;
    stim[19] = 12'h4fe;
    stim[20] = 12'h52c;
    stim[21] = 12'h6fc;
    stim[22] = 12'h20e;
    stim[23] = 12'h0fa;
    stim[24] = 12'hef6;
    stim[25] = 12'h29a;
    stim[26] = 12'hd68;
    stim[27] = 12'h83e;
    stim[28] = 12'ha9a;
    stim[29] = 12'hcda;
    stim[30] = 12'h41e;
    stim[31] = 12'hf4a;
    stim[32] = 12'h622;
    stim[33] = 12'he18;
    stim[34] = 12'hbe2;
    stim[35] = 12'h0c4;
    stim[36] = 12'h4b8;
    stim[37] = 12'hf1a;
    stim[38] = 12'haf2;
    stim[39] = 12'h536;
    stim[40] = 12'h4de;
    stim[41] = 12'h09a;
    stim[42] = 12'hfd0;
    stim[43] = 12'h6cc;
    stim[44] = 12'h536;
    stim[45] = 12'h734;
    stim[46] = 12'hdc2;
    stim[47] = 12'h8c2;
    stim[48] = 12'h632;
    stim[49] = 12'h746;
    stim[50] = 12'h96c;
    stim[51] = 12'hf16;
    stim[52] = 12'h85e;
    stim[53] = 12'hafa;
    stim[54] = 12'hd76;
    stim[55] = 12'h6fc;
    stim[56] = 12'he2e;
    stim[57] = 12'h970;
    stim[58] = 12'he3e;
    stim[59] = 12'hf80;
    stim[60] = 12'h478;
    stim[61] = 12'hffc;
    stim[62] = 12'hb72;
    stim[63] = 12'h97c;
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
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'h280;
      expv[8] = 10'h281;
      expv[9] = 10'h281;
      expv[10] = 10'h290;
      expv[11] = 10'h0b1;
      expv[12] = 10'h049;
      expv[13] = 10'h19c;
      expv[14] = 10'h19c;
      expv[15] = 10'h391;
      expv[16] = 10'h391;
      expv[17] = 10'h391;
      expv[18] = 10'h391;
      expv[19] = 10'h0d9;
      expv[20] = 10'h13d;
      expv[21] = 10'h13d;
      expv[22] = 10'h13d;
      expv[23] = 10'h149;
      expv[24] = 10'h1bd;
      expv[25] = 10'h081;
      expv[26] = 10'h03d;
      expv[27] = 10'h03d;
      expv[28] = 10'h20d;
      expv[29] = 10'h2a4;
      expv[30] = 10'h334;
      expv[31] = 10'h105;
      expv[32] = 10'h3d0;
      expv[33] = 10'h3d0;
      expv[34] = 10'h384;
      expv[35] = 10'h384;
      expv[36] = 10'h385;
      expv[37] = 10'h385;
      expv[38] = 10'h3c4;
      expv[39] = 10'h3c4;
      expv[40] = 10'h3c5;
      expv[41] = 10'h135;
      expv[42] = 10'h024;
      expv[43] = 10'h024;
      expv[44] = 10'h1b1;
      expv[45] = 10'h281;
      expv[46] = 10'h281;
      expv[47] = 10'h0b1;
      expv[48] = 10'h048;
      expv[49] = 10'h048;
      expv[50] = 10'h049;
      expv[51] = 10'h049;
      expv[52] = 10'h259;
      expv[53] = 10'h0d9;
      expv[54] = 10'h215;
      expv[55] = 10'h2bd;
      expv[56] = 10'h2bd;
      expv[57] = 10'h1bd;
      expv[58] = 10'h1bd;
      expv[59] = 10'h389;
      expv[60] = 10'h389;
      expv[61] = 10'h389;
      expv[62] = 10'h389;
      expv[63] = 10'h38d;
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
