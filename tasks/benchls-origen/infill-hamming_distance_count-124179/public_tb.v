// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124179 dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .count(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hc746;
    stim[1] = 16'h517b;
    stim[2] = 16'h4f03;
    stim[3] = 16'hb75f;
    stim[4] = 16'h2174;
    stim[5] = 16'he13e;
    stim[6] = 16'h24cb;
    stim[7] = 16'h72cc;
    stim[8] = 16'hd995;
    stim[9] = 16'he467;
    stim[10] = 16'h7fe1;
    stim[11] = 16'h99cf;
    stim[12] = 16'h1b6f;
    stim[13] = 16'h4479;
    stim[14] = 16'he36a;
    stim[15] = 16'hff80;
    stim[16] = 16'h53ca;
    stim[17] = 16'haeee;
    stim[18] = 16'hb5b1;
    stim[19] = 16'h7984;
    stim[20] = 16'h7695;
    stim[21] = 16'hb901;
    stim[22] = 16'h4c14;
    stim[23] = 16'h0b12;
    stim[24] = 16'h8315;
    stim[25] = 16'h43a7;
    stim[26] = 16'hfec6;
    stim[27] = 16'h1389;
    stim[28] = 16'hd0e7;
    stim[29] = 16'h335f;
    stim[30] = 16'ha0fb;
    stim[31] = 16'hffb1;
    stim[32] = 16'h8a48;
    stim[33] = 16'h7354;
    stim[34] = 16'h32d0;
    stim[35] = 16'hf868;
    stim[36] = 16'hfdf2;
    stim[37] = 16'h9b44;
    stim[38] = 16'h38f7;
    stim[39] = 16'h66d8;
    stim[40] = 16'h3c6b;
    stim[41] = 16'ha870;
    stim[42] = 16'h838a;
    stim[43] = 16'h078a;
    stim[44] = 16'hea9a;
    stim[45] = 16'h31a6;
    stim[46] = 16'heaea;
    stim[47] = 16'h0a02;
    stim[48] = 16'hc686;
    stim[49] = 16'h299f;
    stim[50] = 16'h98c6;
    stim[51] = 16'h59de;
    stim[52] = 16'hebc1;
    stim[53] = 16'h32b2;
    stim[54] = 16'hf9e7;
    stim[55] = 16'h2fc7;
    stim[56] = 16'hdd5d;
    stim[57] = 16'h7216;
    stim[58] = 16'hd249;
    stim[59] = 16'h4f1f;
    stim[60] = 16'hca9a;
    stim[61] = 16'hb7ca;
    stim[62] = 16'h67c4;
    stim[63] = 16'h7e4a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h01;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h01;
      expv[5] = 8'h01;
      expv[6] = 8'h01;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h01;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h01;
      expv[14] = 8'h01;
      expv[15] = 8'h01;
      expv[16] = 8'h01;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h01;
      expv[20] = 8'h01;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h01;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h01;
      expv[29] = 8'h00;
      expv[30] = 8'h01;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h01;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h01;
      expv[37] = 8'h01;
      expv[38] = 8'h01;
      expv[39] = 8'h00;
      expv[40] = 8'h01;
      expv[41] = 8'h00;
      expv[42] = 8'h01;
      expv[43] = 8'h01;
      expv[44] = 8'h00;
      expv[45] = 8'h01;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h01;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h01;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h01;
      expv[62] = 8'h01;
      expv[63] = 8'h00;
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
