// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_016607 dut (
    .Q(in_vec[2:0]),
    .out(out_vec[159:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h1;
    stim[2] = 3'h3;
    stim[3] = 3'h6;
    stim[4] = 3'h4;
    stim[5] = 3'h6;
    stim[6] = 3'h1;
    stim[7] = 3'h2;
    stim[8] = 3'h4;
    stim[9] = 3'h6;
    stim[10] = 3'h2;
    stim[11] = 3'h7;
    stim[12] = 3'h5;
    stim[13] = 3'h0;
    stim[14] = 3'h6;
    stim[15] = 3'h7;
    stim[16] = 3'h7;
    stim[17] = 3'h2;
    stim[18] = 3'h5;
    stim[19] = 3'h2;
    stim[20] = 3'h6;
    stim[21] = 3'h6;
    stim[22] = 3'h5;
    stim[23] = 3'h5;
    stim[24] = 3'h7;
    stim[25] = 3'h0;
    stim[26] = 3'h7;
    stim[27] = 3'h5;
    stim[28] = 3'h1;
    stim[29] = 3'h7;
    stim[30] = 3'h7;
    stim[31] = 3'h7;
    stim[32] = 3'h0;
    stim[33] = 3'h6;
    stim[34] = 3'h7;
    stim[35] = 3'h7;
    stim[36] = 3'h2;
    stim[37] = 3'h6;
    stim[38] = 3'h0;
    stim[39] = 3'h3;
    stim[40] = 3'h5;
    stim[41] = 3'h6;
    stim[42] = 3'h4;
    stim[43] = 3'h1;
    stim[44] = 3'h3;
    stim[45] = 3'h2;
    stim[46] = 3'h4;
    stim[47] = 3'h5;
    stim[48] = 3'h3;
    stim[49] = 3'h1;
    stim[50] = 3'h4;
    stim[51] = 3'h3;
    stim[52] = 3'h4;
    stim[53] = 3'h0;
    stim[54] = 3'h0;
    stim[55] = 3'h2;
    stim[56] = 3'h6;
    stim[57] = 3'h7;
    stim[58] = 3'h2;
    stim[59] = 3'h0;
    stim[60] = 3'h7;
    stim[61] = 3'h3;
    stim[62] = 3'h1;
    stim[63] = 3'h5;
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
      expv[0] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 160'h0802008020080200802008020080200802008020;
      expv[2] = 160'h398a418820398a418820398a418820398a418820;
      expv[3] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 160'h7b9ac5a928398a4188207b9ac5a928398a418820;
      expv[5] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 160'h0802008020080200802008020080200802008020;
      expv[7] = 160'h1882018820188201882018820188201882018820;
      expv[8] = 160'h7b9ac5a928398a4188207b9ac5a928398a418820;
      expv[9] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 160'h1882018820188201882018820188201882018820;
      expv[11] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[13] = 160'h0000000000000000000000000000000000000000;
      expv[14] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 160'h1882018820188201882018820188201882018820;
      expv[18] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[19] = 160'h1882018820188201882018820188201882018820;
      expv[20] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[23] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[24] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 160'h0000000000000000000000000000000000000000;
      expv[26] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[28] = 160'h0802008020080200802008020080200802008020;
      expv[29] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 160'h0000000000000000000000000000000000000000;
      expv[33] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 160'h1882018820188201882018820188201882018820;
      expv[37] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 160'h0000000000000000000000000000000000000000;
      expv[39] = 160'h398a418820398a418820398a418820398a418820;
      expv[40] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[41] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 160'h7b9ac5a928398a4188207b9ac5a928398a418820;
      expv[43] = 160'h0802008020080200802008020080200802008020;
      expv[44] = 160'h398a418820398a418820398a418820398a418820;
      expv[45] = 160'h1882018820188201882018820188201882018820;
      expv[46] = 160'h7b9ac5a928398a4188207b9ac5a928398a418820;
      expv[47] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
      expv[48] = 160'h398a418820398a418820398a418820398a418820;
      expv[49] = 160'h0802008020080200802008020080200802008020;
      expv[50] = 160'h7b9ac5a928398a4188207b9ac5a928398a418820;
      expv[51] = 160'h398a418820398a418820398a418820398a418820;
      expv[52] = 160'h7b9ac5a928398a4188207b9ac5a928398a418820;
      expv[53] = 160'h0000000000000000000000000000000000000000;
      expv[54] = 160'h0000000000000000000000000000000000000000;
      expv[55] = 160'h1882018820188201882018820188201882018820;
      expv[56] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 160'h1882018820188201882018820188201882018820;
      expv[59] = 160'h0000000000000000000000000000000000000000;
      expv[60] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 160'h398a418820398a418820398a418820398a418820;
      expv[62] = 160'h0802008020080200802008020080200802008020;
      expv[63] = 160'hffbbcdeb38bdab49ca307b9ac5a928398a418820;
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
