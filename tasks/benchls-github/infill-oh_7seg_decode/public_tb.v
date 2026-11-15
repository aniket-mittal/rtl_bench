// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  oh_7seg_decode dut (
    .bcd(in_vec[3:0]),
    .a(out_vec[6:6]),
    .b(out_vec[5:5]),
    .c(out_vec[4:4]),
    .d(out_vec[3:3]),
    .e(out_vec[2:2]),
    .f(out_vec[1:1]),
    .g(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'he;
    stim[1] = 4'hb;
    stim[2] = 4'h1;
    stim[3] = 4'h6;
    stim[4] = 4'ha;
    stim[5] = 4'he;
    stim[6] = 4'ha;
    stim[7] = 4'h4;
    stim[8] = 4'h6;
    stim[9] = 4'h5;
    stim[10] = 4'h3;
    stim[11] = 4'hc;
    stim[12] = 4'h9;
    stim[13] = 4'hb;
    stim[14] = 4'h4;
    stim[15] = 4'he;
    stim[16] = 4'h8;
    stim[17] = 4'h6;
    stim[18] = 4'ha;
    stim[19] = 4'h5;
    stim[20] = 4'h8;
    stim[21] = 4'h0;
    stim[22] = 4'h8;
    stim[23] = 4'h7;
    stim[24] = 4'h0;
    stim[25] = 4'he;
    stim[26] = 4'h2;
    stim[27] = 4'h0;
    stim[28] = 4'ha;
    stim[29] = 4'h7;
    stim[30] = 4'h9;
    stim[31] = 4'h3;
    stim[32] = 4'h5;
    stim[33] = 4'h2;
    stim[34] = 4'h3;
    stim[35] = 4'h9;
    stim[36] = 4'h9;
    stim[37] = 4'hd;
    stim[38] = 4'h9;
    stim[39] = 4'hc;
    stim[40] = 4'hc;
    stim[41] = 4'ha;
    stim[42] = 4'he;
    stim[43] = 4'hc;
    stim[44] = 4'hf;
    stim[45] = 4'hf;
    stim[46] = 4'h8;
    stim[47] = 4'hd;
    stim[48] = 4'h5;
    stim[49] = 4'h4;
    stim[50] = 4'hc;
    stim[51] = 4'h4;
    stim[52] = 4'h8;
    stim[53] = 4'h9;
    stim[54] = 4'h4;
    stim[55] = 4'h2;
    stim[56] = 4'ha;
    stim[57] = 4'h8;
    stim[58] = 4'ha;
    stim[59] = 4'h1;
    stim[60] = 4'hc;
    stim[61] = 4'h4;
    stim[62] = 4'h9;
    stim[63] = 4'h0;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h4f;
      expv[3] = 7'h20;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h4c;
      expv[8] = 7'h20;
      expv[9] = 7'h24;
      expv[10] = 7'h06;
      expv[11] = 7'h00;
      expv[12] = 7'h0c;
      expv[13] = 7'h00;
      expv[14] = 7'h4c;
      expv[15] = 7'h00;
      expv[16] = 7'h00;
      expv[17] = 7'h20;
      expv[18] = 7'h00;
      expv[19] = 7'h24;
      expv[20] = 7'h00;
      expv[21] = 7'h01;
      expv[22] = 7'h00;
      expv[23] = 7'h0f;
      expv[24] = 7'h01;
      expv[25] = 7'h00;
      expv[26] = 7'h12;
      expv[27] = 7'h01;
      expv[28] = 7'h00;
      expv[29] = 7'h0f;
      expv[30] = 7'h0c;
      expv[31] = 7'h06;
      expv[32] = 7'h24;
      expv[33] = 7'h12;
      expv[34] = 7'h06;
      expv[35] = 7'h0c;
      expv[36] = 7'h0c;
      expv[37] = 7'h00;
      expv[38] = 7'h0c;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h00;
      expv[42] = 7'h00;
      expv[43] = 7'h00;
      expv[44] = 7'h00;
      expv[45] = 7'h00;
      expv[46] = 7'h00;
      expv[47] = 7'h00;
      expv[48] = 7'h24;
      expv[49] = 7'h4c;
      expv[50] = 7'h00;
      expv[51] = 7'h4c;
      expv[52] = 7'h00;
      expv[53] = 7'h0c;
      expv[54] = 7'h4c;
      expv[55] = 7'h12;
      expv[56] = 7'h00;
      expv[57] = 7'h00;
      expv[58] = 7'h00;
      expv[59] = 7'h4f;
      expv[60] = 7'h00;
      expv[61] = 7'h4c;
      expv[62] = 7'h0c;
      expv[63] = 7'h01;
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
