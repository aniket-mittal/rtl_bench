// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01915 dut (
    .clock(clk),
    .reset(in_vec[4:4]),
    .medir(in_vec[3:3]),
    .echo(in_vec[2:2]),
    .fim_medida(in_vec[1:1]),
    .fim_timeout(in_vec[0:0]),
    .zera_timeout(out_vec[9:9]),
    .conta_timeout(out_vec[8:8]),
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
    stim[0] = 5'h11;
    stim[1] = 5'h1b;
    stim[2] = 5'h0f;
    stim[3] = 5'h07;
    stim[4] = 5'h0c;
    stim[5] = 5'h04;
    stim[6] = 5'h00;
    stim[7] = 5'h07;
    stim[8] = 5'h07;
    stim[9] = 5'h00;
    stim[10] = 5'h0b;
    stim[11] = 5'h0c;
    stim[12] = 5'h0d;
    stim[13] = 5'h03;
    stim[14] = 5'h06;
    stim[15] = 5'h08;
    stim[16] = 5'h0d;
    stim[17] = 5'h09;
    stim[18] = 5'h07;
    stim[19] = 5'h0b;
    stim[20] = 5'h1f;
    stim[21] = 5'h0e;
    stim[22] = 5'h01;
    stim[23] = 5'h08;
    stim[24] = 5'h07;
    stim[25] = 5'h0a;
    stim[26] = 5'h08;
    stim[27] = 5'h0d;
    stim[28] = 5'h05;
    stim[29] = 5'h0a;
    stim[30] = 5'h0a;
    stim[31] = 5'h02;
    stim[32] = 5'h06;
    stim[33] = 5'h0d;
    stim[34] = 5'h03;
    stim[35] = 5'h04;
    stim[36] = 5'h05;
    stim[37] = 5'h0f;
    stim[38] = 5'h01;
    stim[39] = 5'h0d;
    stim[40] = 5'h01;
    stim[41] = 5'h00;
    stim[42] = 5'h0b;
    stim[43] = 5'h06;
    stim[44] = 5'h06;
    stim[45] = 5'h04;
    stim[46] = 5'h0c;
    stim[47] = 5'h08;
    stim[48] = 5'h0f;
    stim[49] = 5'h03;
    stim[50] = 5'h0e;
    stim[51] = 5'h09;
    stim[52] = 5'h02;
    stim[53] = 5'h03;
    stim[54] = 5'h03;
    stim[55] = 5'h04;
    stim[56] = 5'h0e;
    stim[57] = 5'h02;
    stim[58] = 5'h05;
    stim[59] = 5'h0e;
    stim[60] = 5'h09;
    stim[61] = 5'h02;
    stim[62] = 5'h02;
    stim[63] = 5'h08;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h081;
      expv[4] = 10'h242;
      expv[5] = 10'h103;
      expv[6] = 10'h004;
      expv[7] = 10'h004;
      expv[8] = 10'h025;
      expv[9] = 10'h01f;
      expv[10] = 10'h000;
      expv[11] = 10'h081;
      expv[12] = 10'h242;
      expv[13] = 10'h103;
      expv[14] = 10'h242;
      expv[15] = 10'h103;
      expv[16] = 10'h103;
      expv[17] = 10'h242;
      expv[18] = 10'h103;
      expv[19] = 10'h242;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h081;
      expv[23] = 10'h242;
      expv[24] = 10'h103;
      expv[25] = 10'h242;
      expv[26] = 10'h103;
      expv[27] = 10'h103;
      expv[28] = 10'h242;
      expv[29] = 10'h103;
      expv[30] = 10'h103;
      expv[31] = 10'h103;
      expv[32] = 10'h103;
      expv[33] = 10'h004;
      expv[34] = 10'h004;
      expv[35] = 10'h025;
      expv[36] = 10'h01f;
      expv[37] = 10'h000;
      expv[38] = 10'h081;
      expv[39] = 10'h242;
      expv[40] = 10'h103;
      expv[41] = 10'h242;
      expv[42] = 10'h103;
      expv[43] = 10'h242;
      expv[44] = 10'h103;
      expv[45] = 10'h004;
      expv[46] = 10'h004;
      expv[47] = 10'h004;
      expv[48] = 10'h004;
      expv[49] = 10'h025;
      expv[50] = 10'h01f;
      expv[51] = 10'h000;
      expv[52] = 10'h081;
      expv[53] = 10'h242;
      expv[54] = 10'h103;
      expv[55] = 10'h242;
      expv[56] = 10'h103;
      expv[57] = 10'h004;
      expv[58] = 10'h025;
      expv[59] = 10'h01f;
      expv[60] = 10'h000;
      expv[61] = 10'h081;
      expv[62] = 10'h242;
      expv[63] = 10'h103;
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
