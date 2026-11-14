// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  comparator_4bit dut (
    .A(in_vec[7:4]),
    .B(in_vec[3:0]),
    .A_greater(out_vec[2:2]),
    .A_equal(out_vec[1:1]),
    .A_less(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h9e;
    stim[1] = 8'hbe;
    stim[2] = 8'h7f;
    stim[3] = 8'h99;
    stim[4] = 8'h84;
    stim[5] = 8'h24;
    stim[6] = 8'hbf;
    stim[7] = 8'ha2;
    stim[8] = 8'h54;
    stim[9] = 8'h04;
    stim[10] = 8'h8f;
    stim[11] = 8'h94;
    stim[12] = 8'hea;
    stim[13] = 8'h72;
    stim[14] = 8'h40;
    stim[15] = 8'h5f;
    stim[16] = 8'h93;
    stim[17] = 8'h3c;
    stim[18] = 8'h26;
    stim[19] = 8'h36;
    stim[20] = 8'h22;
    stim[21] = 8'h5c;
    stim[22] = 8'h80;
    stim[23] = 8'h9a;
    stim[24] = 8'hca;
    stim[25] = 8'h3c;
    stim[26] = 8'h72;
    stim[27] = 8'hdc;
    stim[28] = 8'h97;
    stim[29] = 8'h69;
    stim[30] = 8'h89;
    stim[31] = 8'h4e;
    stim[32] = 8'hdb;
    stim[33] = 8'h7f;
    stim[34] = 8'hf7;
    stim[35] = 8'h2c;
    stim[36] = 8'hf1;
    stim[37] = 8'h17;
    stim[38] = 8'h19;
    stim[39] = 8'hc9;
    stim[40] = 8'hf5;
    stim[41] = 8'h78;
    stim[42] = 8'h2a;
    stim[43] = 8'hc2;
    stim[44] = 8'hf6;
    stim[45] = 8'h15;
    stim[46] = 8'he0;
    stim[47] = 8'hcc;
    stim[48] = 8'hd8;
    stim[49] = 8'h6b;
    stim[50] = 8'h0b;
    stim[51] = 8'h50;
    stim[52] = 8'hc5;
    stim[53] = 8'h0e;
    stim[54] = 8'h10;
    stim[55] = 8'h66;
    stim[56] = 8'h63;
    stim[57] = 8'h5c;
    stim[58] = 8'h0d;
    stim[59] = 8'h07;
    stim[60] = 8'h55;
    stim[61] = 8'h63;
    stim[62] = 8'h96;
    stim[63] = 8'h25;
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
      expv[0] = 3'h1;
      expv[1] = 3'h1;
      expv[2] = 3'h1;
      expv[3] = 3'h2;
      expv[4] = 3'h4;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h1;
      expv[10] = 3'h1;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h1;
      expv[16] = 3'h4;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h2;
      expv[21] = 3'h1;
      expv[22] = 3'h4;
      expv[23] = 3'h1;
      expv[24] = 3'h4;
      expv[25] = 3'h1;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h1;
      expv[30] = 3'h1;
      expv[31] = 3'h1;
      expv[32] = 3'h4;
      expv[33] = 3'h1;
      expv[34] = 3'h4;
      expv[35] = 3'h1;
      expv[36] = 3'h4;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h1;
      expv[46] = 3'h4;
      expv[47] = 3'h2;
      expv[48] = 3'h4;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h1;
      expv[54] = 3'h4;
      expv[55] = 3'h2;
      expv[56] = 3'h4;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h2;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h1;
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
