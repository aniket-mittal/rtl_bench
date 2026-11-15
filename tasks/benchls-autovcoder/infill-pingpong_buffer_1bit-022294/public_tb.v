// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022294 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[3:3]),
    .data_in(in_vec[2:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[3:3]),
    .data_out(out_vec[2:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h9;
    stim[1] = 4'hb;
    stim[2] = 4'h5;
    stim[3] = 4'h1;
    stim[4] = 4'h1;
    stim[5] = 4'h3;
    stim[6] = 4'h0;
    stim[7] = 4'h4;
    stim[8] = 4'h0;
    stim[9] = 4'h5;
    stim[10] = 4'h7;
    stim[11] = 4'h0;
    stim[12] = 4'h3;
    stim[13] = 4'h6;
    stim[14] = 4'h1;
    stim[15] = 4'h0;
    stim[16] = 4'h1;
    stim[17] = 4'h2;
    stim[18] = 4'h1;
    stim[19] = 4'h6;
    stim[20] = 4'h3;
    stim[21] = 4'h2;
    stim[22] = 4'h3;
    stim[23] = 4'h5;
    stim[24] = 4'h4;
    stim[25] = 4'h4;
    stim[26] = 4'h3;
    stim[27] = 4'h4;
    stim[28] = 4'h1;
    stim[29] = 4'h4;
    stim[30] = 4'h3;
    stim[31] = 4'h5;
    stim[32] = 4'h0;
    stim[33] = 4'h0;
    stim[34] = 4'h0;
    stim[35] = 4'hd;
    stim[36] = 4'h4;
    stim[37] = 4'h5;
    stim[38] = 4'h0;
    stim[39] = 4'ha;
    stim[40] = 4'h7;
    stim[41] = 4'h1;
    stim[42] = 4'h3;
    stim[43] = 4'h5;
    stim[44] = 4'h2;
    stim[45] = 4'h5;
    stim[46] = 4'ha;
    stim[47] = 4'h0;
    stim[48] = 4'h7;
    stim[49] = 4'h4;
    stim[50] = 4'h3;
    stim[51] = 4'h4;
    stim[52] = 4'h0;
    stim[53] = 4'h7;
    stim[54] = 4'h2;
    stim[55] = 4'h3;
    stim[56] = 4'h2;
    stim[57] = 4'h5;
    stim[58] = 4'h2;
    stim[59] = 4'h9;
    stim[60] = 4'h6;
    stim[61] = 4'h2;
    stim[62] = 4'h5;
    stim[63] = 4'h3;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'h0;
      expv[3] = 4'hc;
      expv[4] = 4'h8;
      expv[5] = 4'h8;
      expv[6] = 4'hb;
      expv[7] = 4'hb;
      expv[8] = 4'hb;
      expv[9] = 4'ha;
      expv[10] = 4'hc;
      expv[11] = 4'hf;
      expv[12] = 4'he;
      expv[13] = 4'hb;
      expv[14] = 4'h3;
      expv[15] = 4'hf;
      expv[16] = 4'he;
      expv[17] = 4'h8;
      expv[18] = 4'ha;
      expv[19] = 4'h8;
      expv[20] = 4'he;
      expv[21] = 4'hb;
      expv[22] = 4'h3;
      expv[23] = 4'ha;
      expv[24] = 4'hc;
      expv[25] = 4'hc;
      expv[26] = 4'hc;
      expv[27] = 4'hb;
      expv[28] = 4'ha;
      expv[29] = 4'h8;
      expv[30] = 4'hc;
      expv[31] = 4'ha;
      expv[32] = 4'hc;
      expv[33] = 4'h8;
      expv[34] = 4'h8;
      expv[35] = 4'h8;
      expv[36] = 4'h4;
      expv[37] = 4'hc;
      expv[38] = 4'hc;
      expv[39] = 4'h8;
      expv[40] = 4'h0;
      expv[41] = 4'hc;
      expv[42] = 4'h8;
      expv[43] = 4'ha;
      expv[44] = 4'hc;
      expv[45] = 4'ha;
      expv[46] = 4'hc;
      expv[47] = 4'h0;
      expv[48] = 4'h8;
      expv[49] = 4'hf;
      expv[50] = 4'he;
      expv[51] = 4'hb;
      expv[52] = 4'hb;
      expv[53] = 4'ha;
      expv[54] = 4'hf;
      expv[55] = 4'h7;
      expv[56] = 4'hb;
      expv[57] = 4'h3;
      expv[58] = 4'hb;
      expv[59] = 4'h3;
      expv[60] = 4'h0;
      expv[61] = 4'hc;
      expv[62] = 4'ha;
      expv[63] = 4'hc;
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
