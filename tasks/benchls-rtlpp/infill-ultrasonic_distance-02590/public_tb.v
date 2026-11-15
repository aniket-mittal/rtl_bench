// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02590 dut (
    .clock(clk),
    .reset(in_vec[2:2]),
    .medir(in_vec[1:1]),
    .echo(in_vec[0:0]),
    .medida(out_vec[46:35]),
    .trigger(out_vec[34:34]),
    .hex0(out_vec[33:27]),
    .hex1(out_vec[26:20]),
    .hex2(out_vec[19:13]),
    .pronto(out_vec[12:12]),
    .saida_serial(out_vec[11:11]),
    .db_medir(out_vec[10:10]),
    .db_echo(out_vec[9:9]),
    .db_trigger(out_vec[8:8]),
    .db_estado(out_vec[7:1]),
    .db_saida_serial(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h6;
    stim[2] = 3'h3;
    stim[3] = 3'h3;
    stim[4] = 3'h2;
    stim[5] = 3'h1;
    stim[6] = 3'h0;
    stim[7] = 3'h3;
    stim[8] = 3'h0;
    stim[9] = 3'h2;
    stim[10] = 3'h0;
    stim[11] = 3'h1;
    stim[12] = 3'h1;
    stim[13] = 3'h0;
    stim[14] = 3'h3;
    stim[15] = 3'h1;
    stim[16] = 3'h2;
    stim[17] = 3'h1;
    stim[18] = 3'h2;
    stim[19] = 3'h2;
    stim[20] = 3'h3;
    stim[21] = 3'h0;
    stim[22] = 3'h1;
    stim[23] = 3'h0;
    stim[24] = 3'h1;
    stim[25] = 3'h1;
    stim[26] = 3'h0;
    stim[27] = 3'h3;
    stim[28] = 3'h3;
    stim[29] = 3'h3;
    stim[30] = 3'h0;
    stim[31] = 3'h1;
    stim[32] = 3'h0;
    stim[33] = 3'h0;
    stim[34] = 3'h2;
    stim[35] = 3'h2;
    stim[36] = 3'h0;
    stim[37] = 3'h1;
    stim[38] = 3'h1;
    stim[39] = 3'h2;
    stim[40] = 3'h1;
    stim[41] = 3'h3;
    stim[42] = 3'h2;
    stim[43] = 3'h3;
    stim[44] = 3'h3;
    stim[45] = 3'h3;
    stim[46] = 3'h0;
    stim[47] = 3'h2;
    stim[48] = 3'h2;
    stim[49] = 3'h3;
    stim[50] = 3'h1;
    stim[51] = 3'h0;
    stim[52] = 3'h3;
    stim[53] = 3'h0;
    stim[54] = 3'h3;
    stim[55] = 3'h3;
    stim[56] = 3'h0;
    stim[57] = 3'h3;
    stim[58] = 3'h0;
    stim[59] = 3'h2;
    stim[60] = 3'h3;
    stim[61] = 3'h1;
    stim[62] = 3'h0;
    stim[63] = 3'h7;
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
      expv[0] = 47'hxxxxffffxxfx;
      expv[1] = 47'hxxxxffffxxfx;
      expv[2] = 47'hxxxxffffxxfx;
      expv[3] = 47'hxxxxffffxxfx;
      expv[4] = 47'hxxxxffffxxfx;
      expv[5] = 47'hxxxxffffxxfx;
      expv[6] = 47'hxxxxffffxxfx;
      expv[7] = 47'hxxxxffffxxfx;
      expv[8] = 47'hxxxxffffxxfx;
      expv[9] = 47'hxxxxffffxxfx;
      expv[10] = 47'hxxxxffffxxfx;
      expv[11] = 47'hxxxxffffxxfx;
      expv[12] = 47'hxxxxffffxxfx;
      expv[13] = 47'hxxxxffffxxfx;
      expv[14] = 47'hxxxxffffxxfx;
      expv[15] = 47'hxxxxffffxxfx;
      expv[16] = 47'hxxxxffffxxfx;
      expv[17] = 47'hxxxxffffxxfx;
      expv[18] = 47'hxxxxffffxxfx;
      expv[19] = 47'hxxxxffffxxfx;
      expv[20] = 47'hxxxxffffxxfx;
      expv[21] = 47'hxxxxffffxxfx;
      expv[22] = 47'hxxxxffffxxfx;
      expv[23] = 47'hxxxxffffxxfx;
      expv[24] = 47'hxxxxffffxxfx;
      expv[25] = 47'hxxxxffffxxfx;
      expv[26] = 47'hxxxxffffxxfx;
      expv[27] = 47'hxxxxffffxxfx;
      expv[28] = 47'hxxxxffffxxfx;
      expv[29] = 47'hxxxxffffxxfx;
      expv[30] = 47'hxxxxffffxxfx;
      expv[31] = 47'hxxxxffffxxfx;
      expv[32] = 47'hxxxxffffxxfx;
      expv[33] = 47'hxxxxffffxxfx;
      expv[34] = 47'hxxxxffffxxfx;
      expv[35] = 47'hxxxxffffxxfx;
      expv[36] = 47'hxxxxffffxxfx;
      expv[37] = 47'hxxxxffffxxfx;
      expv[38] = 47'hxxxxffffxxfx;
      expv[39] = 47'hxxxxffffxxfx;
      expv[40] = 47'hxxxxffffxxfx;
      expv[41] = 47'hxxxxffffxxfx;
      expv[42] = 47'hxxxxffffxxfx;
      expv[43] = 47'hxxxxffffxxfx;
      expv[44] = 47'hxxxxffffxxfx;
      expv[45] = 47'hxxxxffffxxfx;
      expv[46] = 47'hxxxxffffxxfx;
      expv[47] = 47'hxxxxffffxxfx;
      expv[48] = 47'hxxxxffffxxfx;
      expv[49] = 47'hxxxxffffxxfx;
      expv[50] = 47'hxxxxffffxxfx;
      expv[51] = 47'hxxxxffffxxfx;
      expv[52] = 47'hxxxxffffxxfx;
      expv[53] = 47'hxxxxffffxxfx;
      expv[54] = 47'hxxxxffffxxfx;
      expv[55] = 47'hxxxxffffxxfx;
      expv[56] = 47'hxxxxffffxxfx;
      expv[57] = 47'hxxxxffffxxfx;
      expv[58] = 47'hxxxxffffxxfx;
      expv[59] = 47'hxxxxffffxxfx;
      expv[60] = 47'hxxxxffffxxfx;
      expv[61] = 47'hxxxxffffxxfx;
      expv[62] = 47'hxxxxffffxxfx;
      expv[63] = 47'hxxxxffffxxfx;
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
