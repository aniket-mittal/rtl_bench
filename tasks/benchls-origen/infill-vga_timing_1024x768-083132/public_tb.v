// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083132 dut (
    .CLK(clk),
    .i_rst(in_vec[1:1]),
    .i_pix_stb(in_vec[0:0]),
    .o_hs(out_vec[27:27]),
    .o_vs(out_vec[26:26]),
    .o_is_blanking(out_vec[25:25]),
    .o_is_active(out_vec[24:24]),
    .o_screened_tick(out_vec[23:23]),
    .o_animate_tick(out_vec[22:22]),
    .o_x(out_vec[21:11]),
    .o_y(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h3;
    stim[2] = 2'h1;
    stim[3] = 2'h0;
    stim[4] = 2'h1;
    stim[5] = 2'h0;
    stim[6] = 2'h1;
    stim[7] = 2'h1;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h0;
    stim[11] = 2'h2;
    stim[12] = 2'h1;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h1;
    stim[20] = 2'h0;
    stim[21] = 2'h1;
    stim[22] = 2'h1;
    stim[23] = 2'h0;
    stim[24] = 2'h1;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h0;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h1;
    stim[33] = 2'h1;
    stim[34] = 2'h1;
    stim[35] = 2'h0;
    stim[36] = 2'h0;
    stim[37] = 2'h1;
    stim[38] = 2'h1;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h1;
    stim[42] = 2'h1;
    stim[43] = 2'h0;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h0;
    stim[48] = 2'h0;
    stim[49] = 2'h1;
    stim[50] = 2'h1;
    stim[51] = 2'h1;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h1;
    stim[55] = 2'h0;
    stim[56] = 2'h1;
    stim[57] = 2'h1;
    stim[58] = 2'h1;
    stim[59] = 2'h0;
    stim[60] = 2'h1;
    stim[61] = 2'h0;
    stim[62] = 2'h1;
    stim[63] = 2'h0;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'hd000000;
      expv[2] = 28'hd000000;
      expv[3] = 28'hd000800;
      expv[4] = 28'hd000800;
      expv[5] = 28'hd001000;
      expv[6] = 28'hd001000;
      expv[7] = 28'hd001800;
      expv[8] = 28'hd002000;
      expv[9] = 28'hd002000;
      expv[10] = 28'hd002800;
      expv[11] = 28'hd002800;
      expv[12] = 28'hd000000;
      expv[13] = 28'hd000800;
      expv[14] = 28'hd000800;
      expv[15] = 28'hd000800;
      expv[16] = 28'hd001000;
      expv[17] = 28'hd001800;
      expv[18] = 28'hd001800;
      expv[19] = 28'hd001800;
      expv[20] = 28'hd002000;
      expv[21] = 28'hd002000;
      expv[22] = 28'hd002800;
      expv[23] = 28'hd003000;
      expv[24] = 28'hd003000;
      expv[25] = 28'hd003800;
      expv[26] = 28'hd003800;
      expv[27] = 28'hd003800;
      expv[28] = 28'hd003800;
      expv[29] = 28'hd003800;
      expv[30] = 28'hd003800;
      expv[31] = 28'hd004000;
      expv[32] = 28'hd004800;
      expv[33] = 28'hd005000;
      expv[34] = 28'hd005800;
      expv[35] = 28'hd006000;
      expv[36] = 28'hd006000;
      expv[37] = 28'hd006000;
      expv[38] = 28'hd006800;
      expv[39] = 28'hd007000;
      expv[40] = 28'hd007000;
      expv[41] = 28'hd007000;
      expv[42] = 28'hd007800;
      expv[43] = 28'hd008000;
      expv[44] = 28'hd008000;
      expv[45] = 28'hd008800;
      expv[46] = 28'hd008800;
      expv[47] = 28'hd008800;
      expv[48] = 28'hd008800;
      expv[49] = 28'hd008800;
      expv[50] = 28'hd009000;
      expv[51] = 28'hd009800;
      expv[52] = 28'hd00a000;
      expv[53] = 28'hd00a000;
      expv[54] = 28'hd00a000;
      expv[55] = 28'hd00a800;
      expv[56] = 28'hd00a800;
      expv[57] = 28'hd00b000;
      expv[58] = 28'hd00b800;
      expv[59] = 28'hd00c000;
      expv[60] = 28'hd00c000;
      expv[61] = 28'hd00c800;
      expv[62] = 28'hd00c800;
      expv[63] = 28'hd00d000;
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
