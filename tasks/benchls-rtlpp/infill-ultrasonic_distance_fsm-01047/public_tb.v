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

  rtlpp_01047 dut (
    .clock(clk),
    .reset(in_vec[3:3]),
    .medir(in_vec[2:2]),
    .echo(in_vec[1:1]),
    .fim_medida(in_vec[0:0]),
    .zera(out_vec[7:7]),
    .gera(out_vec[6:6]),
    .registra(out_vec[5:5]),
    .pronto(out_vec[4:4]),
    .db_estado(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'hf;
    stim[2] = 4'h2;
    stim[3] = 4'h1;
    stim[4] = 4'h7;
    stim[5] = 4'h3;
    stim[6] = 4'h7;
    stim[7] = 4'h0;
    stim[8] = 4'h5;
    stim[9] = 4'h3;
    stim[10] = 4'h1;
    stim[11] = 4'h0;
    stim[12] = 4'h6;
    stim[13] = 4'h1;
    stim[14] = 4'h2;
    stim[15] = 4'h6;
    stim[16] = 4'h0;
    stim[17] = 4'h2;
    stim[18] = 4'h4;
    stim[19] = 4'h0;
    stim[20] = 4'h4;
    stim[21] = 4'h4;
    stim[22] = 4'h1;
    stim[23] = 4'h1;
    stim[24] = 4'h4;
    stim[25] = 4'h7;
    stim[26] = 4'h5;
    stim[27] = 4'h4;
    stim[28] = 4'h4;
    stim[29] = 4'h5;
    stim[30] = 4'h3;
    stim[31] = 4'h3;
    stim[32] = 4'h1;
    stim[33] = 4'h4;
    stim[34] = 4'h4;
    stim[35] = 4'h0;
    stim[36] = 4'h5;
    stim[37] = 4'h4;
    stim[38] = 4'h7;
    stim[39] = 4'h7;
    stim[40] = 4'h2;
    stim[41] = 4'h7;
    stim[42] = 4'h4;
    stim[43] = 4'h3;
    stim[44] = 4'h0;
    stim[45] = 4'h6;
    stim[46] = 4'h2;
    stim[47] = 4'h5;
    stim[48] = 4'h7;
    stim[49] = 4'h1;
    stim[50] = 4'hc;
    stim[51] = 4'hc;
    stim[52] = 4'h0;
    stim[53] = 4'h4;
    stim[54] = 4'h7;
    stim[55] = 4'h6;
    stim[56] = 4'h0;
    stim[57] = 4'h1;
    stim[58] = 4'h0;
    stim[59] = 4'h1;
    stim[60] = 4'h1;
    stim[61] = 4'h0;
    stim[62] = 4'h5;
    stim[63] = 4'h2;
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
      expv[5] = 8'h81;
      expv[6] = 8'h42;
      expv[7] = 8'h03;
      expv[8] = 8'h03;
      expv[9] = 8'h03;
      expv[10] = 8'h04;
      expv[11] = 8'h25;
      expv[12] = 8'h1f;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h81;
      expv[17] = 8'h42;
      expv[18] = 8'h03;
      expv[19] = 8'h03;
      expv[20] = 8'h03;
      expv[21] = 8'h03;
      expv[22] = 8'h03;
      expv[23] = 8'h03;
      expv[24] = 8'h03;
      expv[25] = 8'h03;
      expv[26] = 8'h04;
      expv[27] = 8'h25;
      expv[28] = 8'h1f;
      expv[29] = 8'h00;
      expv[30] = 8'h81;
      expv[31] = 8'h42;
      expv[32] = 8'h03;
      expv[33] = 8'h03;
      expv[34] = 8'h03;
      expv[35] = 8'h03;
      expv[36] = 8'h03;
      expv[37] = 8'h03;
      expv[38] = 8'h03;
      expv[39] = 8'h04;
      expv[40] = 8'h25;
      expv[41] = 8'h1f;
      expv[42] = 8'h00;
      expv[43] = 8'h81;
      expv[44] = 8'h42;
      expv[45] = 8'h03;
      expv[46] = 8'h04;
      expv[47] = 8'h04;
      expv[48] = 8'h25;
      expv[49] = 8'h1f;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h81;
      expv[55] = 8'h42;
      expv[56] = 8'h03;
      expv[57] = 8'h03;
      expv[58] = 8'h03;
      expv[59] = 8'h03;
      expv[60] = 8'h03;
      expv[61] = 8'h03;
      expv[62] = 8'h03;
      expv[63] = 8'h03;
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
