// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072296 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h901;
    stim[1] = 12'heb0;
    stim[2] = 12'h74a;
    stim[3] = 12'h426;
    stim[4] = 12'h191;
    stim[5] = 12'h4e7;
    stim[6] = 12'h690;
    stim[7] = 12'h34d;
    stim[8] = 12'h1ac;
    stim[9] = 12'h3df;
    stim[10] = 12'h4a2;
    stim[11] = 12'h291;
    stim[12] = 12'h083;
    stim[13] = 12'h4e6;
    stim[14] = 12'h6df;
    stim[15] = 12'h78c;
    stim[16] = 12'h0a2;
    stim[17] = 12'h394;
    stim[18] = 12'h6a7;
    stim[19] = 12'h578;
    stim[20] = 12'h601;
    stim[21] = 12'h5ae;
    stim[22] = 12'h559;
    stim[23] = 12'h734;
    stim[24] = 12'h528;
    stim[25] = 12'h10f;
    stim[26] = 12'h340;
    stim[27] = 12'h320;
    stim[28] = 12'h5d4;
    stim[29] = 12'h556;
    stim[30] = 12'h444;
    stim[31] = 12'h4d7;
    stim[32] = 12'h080;
    stim[33] = 12'h29b;
    stim[34] = 12'h3f7;
    stim[35] = 12'h45c;
    stim[36] = 12'h2a2;
    stim[37] = 12'h3b2;
    stim[38] = 12'h33c;
    stim[39] = 12'h095;
    stim[40] = 12'h69c;
    stim[41] = 12'h649;
    stim[42] = 12'h527;
    stim[43] = 12'h18a;
    stim[44] = 12'h02f;
    stim[45] = 12'h361;
    stim[46] = 12'h29d;
    stim[47] = 12'h5cb;
    stim[48] = 12'h27d;
    stim[49] = 12'h2e6;
    stim[50] = 12'h15e;
    stim[51] = 12'h448;
    stim[52] = 12'h296;
    stim[53] = 12'h39c;
    stim[54] = 12'h756;
    stim[55] = 12'h3f9;
    stim[56] = 12'h2e9;
    stim[57] = 12'h114;
    stim[58] = 12'h3be;
    stim[59] = 12'h3c1;
    stim[60] = 12'h5e2;
    stim[61] = 12'h1d7;
    stim[62] = 12'h423;
    stim[63] = 12'h634;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h34a;
      expv[5] = 10'h34a;
      expv[6] = 10'h34a;
      expv[7] = 10'h14a;
      expv[8] = 10'h14a;
      expv[9] = 10'h14a;
      expv[10] = 10'h14a;
      expv[11] = 10'h14a;
      expv[12] = 10'h14a;
      expv[13] = 10'h14a;
      expv[14] = 10'h14a;
      expv[15] = 10'h14a;
      expv[16] = 10'h14a;
      expv[17] = 10'h14a;
      expv[18] = 10'h14a;
      expv[19] = 10'h38c;
      expv[20] = 10'h38c;
      expv[21] = 10'h378;
      expv[22] = 10'h378;
      expv[23] = 10'h378;
      expv[24] = 10'h3ae;
      expv[25] = 10'h3ae;
      expv[26] = 10'h3ae;
      expv[27] = 10'h3ae;
      expv[28] = 10'h3ae;
      expv[29] = 10'h3ae;
      expv[30] = 10'h3ae;
      expv[31] = 10'h3ae;
      expv[32] = 10'h3ae;
      expv[33] = 10'h3ae;
      expv[34] = 10'h3ae;
      expv[35] = 10'h3ae;
      expv[36] = 10'h3ae;
      expv[37] = 10'h3ae;
      expv[38] = 10'h3ae;
      expv[39] = 10'h3ae;
      expv[40] = 10'h3ae;
      expv[41] = 10'h359;
      expv[42] = 10'h334;
      expv[43] = 10'h334;
      expv[44] = 10'h334;
      expv[45] = 10'h334;
      expv[46] = 10'h334;
      expv[47] = 10'h334;
      expv[48] = 10'h334;
      expv[49] = 10'h334;
      expv[50] = 10'h334;
      expv[51] = 10'h334;
      expv[52] = 10'h334;
      expv[53] = 10'h334;
      expv[54] = 10'h334;
      expv[55] = 10'h328;
      expv[56] = 10'h328;
      expv[57] = 10'h328;
      expv[58] = 10'h328;
      expv[59] = 10'h328;
      expv[60] = 10'h328;
      expv[61] = 10'h328;
      expv[62] = 10'h328;
      expv[63] = 10'h328;
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
