// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04302 dut (
    .out_0r(in_vec[35:35]),
    .inp_0a(in_vec[34:34]),
    .inp_0d(in_vec[33:0]),
    .out_0a(out_vec[2:2]),
    .out_0d(out_vec[1:1]),
    .inp_0r(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hf7d7fac72;
    stim[1] = 36'h6e842608a;
    stim[2] = 36'ha5f79ccb4;
    stim[3] = 36'hcd41ef47c;
    stim[4] = 36'hf9d53ead0;
    stim[5] = 36'h26c77a6c5;
    stim[6] = 36'hb182aa94a;
    stim[7] = 36'h18428eeae;
    stim[8] = 36'h0ecf2ede9;
    stim[9] = 36'hba6694297;
    stim[10] = 36'h3a626d65c;
    stim[11] = 36'heba54094c;
    stim[12] = 36'hfd87ce8e9;
    stim[13] = 36'he73d30bab;
    stim[14] = 36'h16fd8bb0d;
    stim[15] = 36'h5d967e6a7;
    stim[16] = 36'ha762b1d6d;
    stim[17] = 36'h107bc428c;
    stim[18] = 36'h1ed6e5798;
    stim[19] = 36'h1ee454ca2;
    stim[20] = 36'h2b247bb64;
    stim[21] = 36'h1f3e0c9c6;
    stim[22] = 36'h3649bf6d3;
    stim[23] = 36'hac0a995d9;
    stim[24] = 36'hb02811732;
    stim[25] = 36'heb85af3e9;
    stim[26] = 36'hea2239ebe;
    stim[27] = 36'ha893caa39;
    stim[28] = 36'hc05e22be0;
    stim[29] = 36'h638d50c51;
    stim[30] = 36'h947651a37;
    stim[31] = 36'h6514f45ee;
    stim[32] = 36'h2cd195391;
    stim[33] = 36'h8d1beb270;
    stim[34] = 36'hb65502e0f;
    stim[35] = 36'h58b9f1a0a;
    stim[36] = 36'h1c07adef3;
    stim[37] = 36'he7ac8ea12;
    stim[38] = 36'he08c5a27d;
    stim[39] = 36'h5e4252644;
    stim[40] = 36'h3798e454b;
    stim[41] = 36'h7be173d2f;
    stim[42] = 36'h109d4cea4;
    stim[43] = 36'h10aa28dab;
    stim[44] = 36'h253ce8766;
    stim[45] = 36'h792c4428d;
    stim[46] = 36'h498a51310;
    stim[47] = 36'hb26ab8a11;
    stim[48] = 36'h382cc50b9;
    stim[49] = 36'h080cc05bb;
    stim[50] = 36'he483a1ea9;
    stim[51] = 36'h5e10c0671;
    stim[52] = 36'hc17c52893;
    stim[53] = 36'h220975095;
    stim[54] = 36'hfa10500bd;
    stim[55] = 36'h7909c8984;
    stim[56] = 36'hb6ad625c5;
    stim[57] = 36'hdfa597bf7;
    stim[58] = 36'hbd49c63ab;
    stim[59] = 36'h8dde0379a;
    stim[60] = 36'h2dda59ffe;
    stim[61] = 36'hc928a1196;
    stim[62] = 36'h2cd483461;
    stim[63] = 36'h03c590ba8;
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
      expv[0] = 3'h7;
      expv[1] = 3'h4;
      expv[2] = 3'h1;
      expv[3] = 3'h5;
      expv[4] = 3'h7;
      expv[5] = 3'h0;
      expv[6] = 3'h3;
      expv[7] = 3'h2;
      expv[8] = 3'h0;
      expv[9] = 3'h3;
      expv[10] = 3'h2;
      expv[11] = 3'h5;
      expv[12] = 3'h7;
      expv[13] = 3'h5;
      expv[14] = 3'h2;
      expv[15] = 3'h6;
      expv[16] = 3'h1;
      expv[17] = 3'h2;
      expv[18] = 3'h2;
      expv[19] = 3'h2;
      expv[20] = 3'h0;
      expv[21] = 3'h2;
      expv[22] = 3'h2;
      expv[23] = 3'h1;
      expv[24] = 3'h3;
      expv[25] = 3'h5;
      expv[26] = 3'h5;
      expv[27] = 3'h1;
      expv[28] = 3'h5;
      expv[29] = 3'h4;
      expv[30] = 3'h3;
      expv[31] = 3'h4;
      expv[32] = 3'h0;
      expv[33] = 3'h1;
      expv[34] = 3'h3;
      expv[35] = 3'h6;
      expv[36] = 3'h2;
      expv[37] = 3'h5;
      expv[38] = 3'h5;
      expv[39] = 3'h6;
      expv[40] = 3'h2;
      expv[41] = 3'h6;
      expv[42] = 3'h2;
      expv[43] = 3'h2;
      expv[44] = 3'h0;
      expv[45] = 3'h6;
      expv[46] = 3'h4;
      expv[47] = 3'h3;
      expv[48] = 3'h2;
      expv[49] = 3'h0;
      expv[50] = 3'h5;
      expv[51] = 3'h6;
      expv[52] = 3'h5;
      expv[53] = 3'h0;
      expv[54] = 3'h7;
      expv[55] = 3'h6;
      expv[56] = 3'h3;
      expv[57] = 3'h7;
      expv[58] = 3'h3;
      expv[59] = 3'h1;
      expv[60] = 3'h0;
      expv[61] = 3'h5;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
