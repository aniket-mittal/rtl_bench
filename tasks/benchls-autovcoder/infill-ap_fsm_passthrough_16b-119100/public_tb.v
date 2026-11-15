// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119100 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[18:18]),
    .ap_start(in_vec[17:17]),
    .ap_continue(in_vec[16:16]),
    .tmp_436(in_vec[15:0]),
    .ap_done(out_vec[18:18]),
    .ap_idle(out_vec[17:17]),
    .ap_ready(out_vec[16:16]),
    .ap_return(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h58066;
    stim[1] = 19'h66542;
    stim[2] = 19'h2c1b3;
    stim[3] = 19'h155cb;
    stim[4] = 19'h2b60c;
    stim[5] = 19'h36ee7;
    stim[6] = 19'h186d0;
    stim[7] = 19'h0859a;
    stim[8] = 19'h09e5f;
    stim[9] = 19'h02301;
    stim[10] = 19'h23202;
    stim[11] = 19'h21aa2;
    stim[12] = 19'h0bbcc;
    stim[13] = 19'h14171;
    stim[14] = 19'h31d49;
    stim[15] = 19'h23e71;
    stim[16] = 19'h24255;
    stim[17] = 19'h11f30;
    stim[18] = 19'h2542d;
    stim[19] = 19'h058cf;
    stim[20] = 19'h149eb;
    stim[21] = 19'h3f9da;
    stim[22] = 19'h2d603;
    stim[23] = 19'h2ffd6;
    stim[24] = 19'h2dc97;
    stim[25] = 19'h09999;
    stim[26] = 19'h29a7a;
    stim[27] = 19'h0c97e;
    stim[28] = 19'h1e995;
    stim[29] = 19'h3666b;
    stim[30] = 19'h3c7be;
    stim[31] = 19'h21e7b;
    stim[32] = 19'h0be86;
    stim[33] = 19'h14ee1;
    stim[34] = 19'h17bc4;
    stim[35] = 19'h081e9;
    stim[36] = 19'h30fb8;
    stim[37] = 19'h1c748;
    stim[38] = 19'h3af3f;
    stim[39] = 19'h0dbc3;
    stim[40] = 19'h00837;
    stim[41] = 19'h06c87;
    stim[42] = 19'h3cfea;
    stim[43] = 19'h1fc6e;
    stim[44] = 19'h320c2;
    stim[45] = 19'h0f0bd;
    stim[46] = 19'h17d0f;
    stim[47] = 19'h2997e;
    stim[48] = 19'h3debc;
    stim[49] = 19'h31f08;
    stim[50] = 19'h13edb;
    stim[51] = 19'h05ccf;
    stim[52] = 19'h0296b;
    stim[53] = 19'h038af;
    stim[54] = 19'h0ad19;
    stim[55] = 19'h256c9;
    stim[56] = 19'h10142;
    stim[57] = 19'h3accf;
    stim[58] = 19'h127df;
    stim[59] = 19'h099b7;
    stim[60] = 19'h162a0;
    stim[61] = 19'h003eb;
    stim[62] = 19'h681bc;
    stim[63] = 19'h2871f;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h56542;
      expv[2] = 19'h5c1b3;
      expv[3] = 19'h6c1b3;
      expv[4] = 19'h5b60c;
      expv[5] = 19'h4b60c;
      expv[6] = 19'h2b60c;
      expv[7] = 19'h2b60c;
      expv[8] = 19'h2b60c;
      expv[9] = 19'h2b60c;
      expv[10] = 19'h53202;
      expv[11] = 19'h43202;
      expv[12] = 19'h63202;
      expv[13] = 19'h63202;
      expv[14] = 19'h51d49;
      expv[15] = 19'h53e71;
      expv[16] = 19'h43e71;
      expv[17] = 19'h63e71;
      expv[18] = 19'h5542d;
      expv[19] = 19'h6542d;
      expv[20] = 19'h6542d;
      expv[21] = 19'h5f9da;
      expv[22] = 19'h5d603;
      expv[23] = 19'h4d603;
      expv[24] = 19'h4d603;
      expv[25] = 19'h6d603;
      expv[26] = 19'h4d603;
      expv[27] = 19'h6d603;
      expv[28] = 19'h6d603;
      expv[29] = 19'h5666b;
      expv[30] = 19'h5c7be;
      expv[31] = 19'h51e7b;
      expv[32] = 19'h61e7b;
      expv[33] = 19'h61e7b;
      expv[34] = 19'h21e7b;
      expv[35] = 19'h21e7b;
      expv[36] = 19'h50fb8;
      expv[37] = 19'h20fb8;
      expv[38] = 19'h5af3f;
      expv[39] = 19'h2af3f;
      expv[40] = 19'h2af3f;
      expv[41] = 19'h2af3f;
      expv[42] = 19'h5cfea;
      expv[43] = 19'h2cfea;
      expv[44] = 19'h520c2;
      expv[45] = 19'h220c2;
      expv[46] = 19'h220c2;
      expv[47] = 19'h5997e;
      expv[48] = 19'h4997e;
      expv[49] = 19'h51f08;
      expv[50] = 19'h21f08;
      expv[51] = 19'h21f08;
      expv[52] = 19'h21f08;
      expv[53] = 19'h21f08;
      expv[54] = 19'h21f08;
      expv[55] = 19'h556c9;
      expv[56] = 19'h656c9;
      expv[57] = 19'h5accf;
      expv[58] = 19'h2accf;
      expv[59] = 19'h2accf;
      expv[60] = 19'h2accf;
      expv[61] = 19'h2accf;
      expv[62] = 19'h581bc;
      expv[63] = 19'h5871f;
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
