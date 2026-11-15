// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07643 dut (
    .state_V(in_vec[11:9]),
    .rate_V(in_vec[8:3]),
    .cnt_V(in_vec[2:0]),
    .step_V(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hfda;
    stim[1] = 12'he80;
    stim[2] = 12'hd8a;
    stim[3] = 12'h796;
    stim[4] = 12'h581;
    stim[5] = 12'h849;
    stim[6] = 12'hbc8;
    stim[7] = 12'h77c;
    stim[8] = 12'h98f;
    stim[9] = 12'ha15;
    stim[10] = 12'h0eb;
    stim[11] = 12'h4af;
    stim[12] = 12'hbdb;
    stim[13] = 12'ha93;
    stim[14] = 12'ha8d;
    stim[15] = 12'hc90;
    stim[16] = 12'h3c4;
    stim[17] = 12'h398;
    stim[18] = 12'hb86;
    stim[19] = 12'h847;
    stim[20] = 12'he15;
    stim[21] = 12'hc00;
    stim[22] = 12'h22a;
    stim[23] = 12'haf6;
    stim[24] = 12'h0a7;
    stim[25] = 12'h34e;
    stim[26] = 12'h80d;
    stim[27] = 12'hf1f;
    stim[28] = 12'h3f5;
    stim[29] = 12'h8ac;
    stim[30] = 12'h3ce;
    stim[31] = 12'h1d3;
    stim[32] = 12'h1b5;
    stim[33] = 12'h0ff;
    stim[34] = 12'hf64;
    stim[35] = 12'h880;
    stim[36] = 12'h0cf;
    stim[37] = 12'h4a9;
    stim[38] = 12'hacf;
    stim[39] = 12'h631;
    stim[40] = 12'hcad;
    stim[41] = 12'h36f;
    stim[42] = 12'h0a0;
    stim[43] = 12'hdbc;
    stim[44] = 12'hc32;
    stim[45] = 12'h747;
    stim[46] = 12'h16c;
    stim[47] = 12'hac7;
    stim[48] = 12'h31d;
    stim[49] = 12'he63;
    stim[50] = 12'h20b;
    stim[51] = 12'h5c8;
    stim[52] = 12'hcd5;
    stim[53] = 12'h1ee;
    stim[54] = 12'h905;
    stim[55] = 12'hda6;
    stim[56] = 12'haeb;
    stim[57] = 12'he37;
    stim[58] = 12'ha95;
    stim[59] = 12'h85c;
    stim[60] = 12'hd71;
    stim[61] = 12'h7c3;
    stim[62] = 12'hed1;
    stim[63] = 12'h3df;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
