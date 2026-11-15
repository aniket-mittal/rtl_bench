// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024102 dut (
    .CLK(clk),
    .RST_N(in_vec[3:3]),
    .START(in_vec[2:2]),
    .STOP(in_vec[1:1]),
    .FRAME(in_vec[0:0]),
    .STARTED(out_vec[7:7]),
    .STOPPED(out_vec[6:6]),
    .STATE(out_vec[5:4]),
    .FETCH_EN(out_vec[3:3]),
    .LCD_ENABLE(out_vec[2:2]),
    .SYNC_ENABLE(out_vec[1:1]),
    .BL_ENABLE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h2;
    stim[1] = 4'h1;
    stim[2] = 4'h9;
    stim[3] = 4'hf;
    stim[4] = 4'h9;
    stim[5] = 4'hc;
    stim[6] = 4'hb;
    stim[7] = 4'hf;
    stim[8] = 4'hf;
    stim[9] = 4'ha;
    stim[10] = 4'he;
    stim[11] = 4'he;
    stim[12] = 4'hc;
    stim[13] = 4'he;
    stim[14] = 4'hb;
    stim[15] = 4'h0;
    stim[16] = 4'hf;
    stim[17] = 4'hb;
    stim[18] = 4'hf;
    stim[19] = 4'hb;
    stim[20] = 4'hb;
    stim[21] = 4'hd;
    stim[22] = 4'hb;
    stim[23] = 4'ha;
    stim[24] = 4'hc;
    stim[25] = 4'he;
    stim[26] = 4'ha;
    stim[27] = 4'hb;
    stim[28] = 4'hb;
    stim[29] = 4'hb;
    stim[30] = 4'hb;
    stim[31] = 4'he;
    stim[32] = 4'h8;
    stim[33] = 4'hf;
    stim[34] = 4'hc;
    stim[35] = 4'hd;
    stim[36] = 4'he;
    stim[37] = 4'h9;
    stim[38] = 4'ha;
    stim[39] = 4'hb;
    stim[40] = 4'hf;
    stim[41] = 4'hb;
    stim[42] = 4'hc;
    stim[43] = 4'hc;
    stim[44] = 4'hc;
    stim[45] = 4'h8;
    stim[46] = 4'hc;
    stim[47] = 4'hc;
    stim[48] = 4'hd;
    stim[49] = 4'hb;
    stim[50] = 4'hf;
    stim[51] = 4'he;
    stim[52] = 4'ha;
    stim[53] = 4'ha;
    stim[54] = 4'h8;
    stim[55] = 4'hb;
    stim[56] = 4'hf;
    stim[57] = 4'hc;
    stim[58] = 4'hd;
    stim[59] = 4'hc;
    stim[60] = 4'ha;
    stim[61] = 4'h9;
    stim[62] = 4'h9;
    stim[63] = 4'he;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h1e;
      expv[6] = 8'h1e;
      expv[7] = 8'h1f;
      expv[8] = 8'h1f;
      expv[9] = 8'haf;
      expv[10] = 8'hbe;
      expv[11] = 8'hbe;
      expv[12] = 8'hbe;
      expv[13] = 8'hbe;
      expv[14] = 8'hbe;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h1e;
      expv[19] = 8'h1e;
      expv[20] = 8'h1f;
      expv[21] = 8'h1f;
      expv[22] = 8'haf;
      expv[23] = 8'haf;
      expv[24] = 8'hbe;
      expv[25] = 8'hbe;
      expv[26] = 8'hbe;
      expv[27] = 8'hbe;
      expv[28] = 8'hbe;
      expv[29] = 8'hbe;
      expv[30] = 8'hbe;
      expv[31] = 8'hbe;
      expv[32] = 8'hb0;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h1e;
      expv[36] = 8'h1e;
      expv[37] = 8'h1e;
      expv[38] = 8'h1f;
      expv[39] = 8'h1f;
      expv[40] = 8'haf;
      expv[41] = 8'hbe;
      expv[42] = 8'hbe;
      expv[43] = 8'hbe;
      expv[44] = 8'hbe;
      expv[45] = 8'hbe;
      expv[46] = 8'hbe;
      expv[47] = 8'hbe;
      expv[48] = 8'hbe;
      expv[49] = 8'hbe;
      expv[50] = 8'hbe;
      expv[51] = 8'hb0;
      expv[52] = 8'h00;
      expv[53] = 8'h1e;
      expv[54] = 8'h1e;
      expv[55] = 8'h1e;
      expv[56] = 8'h1e;
      expv[57] = 8'h1e;
      expv[58] = 8'h1e;
      expv[59] = 8'h1f;
      expv[60] = 8'h1f;
      expv[61] = 8'haf;
      expv[62] = 8'hbe;
      expv[63] = 8'hbe;
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
