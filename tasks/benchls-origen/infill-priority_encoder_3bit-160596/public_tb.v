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

  origen_160596 dut (
    .D(in_vec[7:0]),
    .X(out_vec[2:2]),
    .Y(out_vec[1:1]),
    .Z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hd4;
    stim[1] = 8'he1;
    stim[2] = 8'h06;
    stim[3] = 8'h6f;
    stim[4] = 8'ha0;
    stim[5] = 8'h30;
    stim[6] = 8'h3e;
    stim[7] = 8'h95;
    stim[8] = 8'hbb;
    stim[9] = 8'h02;
    stim[10] = 8'hdb;
    stim[11] = 8'h6b;
    stim[12] = 8'hf5;
    stim[13] = 8'h07;
    stim[14] = 8'h46;
    stim[15] = 8'hde;
    stim[16] = 8'he5;
    stim[17] = 8'h56;
    stim[18] = 8'hb3;
    stim[19] = 8'h86;
    stim[20] = 8'h6b;
    stim[21] = 8'h90;
    stim[22] = 8'h29;
    stim[23] = 8'h0c;
    stim[24] = 8'h91;
    stim[25] = 8'he2;
    stim[26] = 8'h42;
    stim[27] = 8'h96;
    stim[28] = 8'h3a;
    stim[29] = 8'h97;
    stim[30] = 8'hd6;
    stim[31] = 8'he1;
    stim[32] = 8'ha7;
    stim[33] = 8'h4d;
    stim[34] = 8'hc8;
    stim[35] = 8'h0b;
    stim[36] = 8'h27;
    stim[37] = 8'h13;
    stim[38] = 8'hab;
    stim[39] = 8'hd3;
    stim[40] = 8'hf2;
    stim[41] = 8'h2e;
    stim[42] = 8'hc9;
    stim[43] = 8'h44;
    stim[44] = 8'h01;
    stim[45] = 8'h0e;
    stim[46] = 8'hd6;
    stim[47] = 8'hab;
    stim[48] = 8'h5d;
    stim[49] = 8'h5a;
    stim[50] = 8'h4c;
    stim[51] = 8'h34;
    stim[52] = 8'hef;
    stim[53] = 8'h6b;
    stim[54] = 8'h23;
    stim[55] = 8'h0a;
    stim[56] = 8'h41;
    stim[57] = 8'h27;
    stim[58] = 8'h7f;
    stim[59] = 8'hac;
    stim[60] = 8'h1a;
    stim[61] = 8'h8f;
    stim[62] = 8'he8;
    stim[63] = 8'h6f;
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
      expv[0] = 3'h5;
      expv[1] = 3'h7;
      expv[2] = 3'h6;
      expv[3] = 3'h7;
      expv[4] = 3'h2;
      expv[5] = 3'h3;
      expv[6] = 3'h6;
      expv[7] = 3'h7;
      expv[8] = 3'h7;
      expv[9] = 3'h6;
      expv[10] = 3'h7;
      expv[11] = 3'h7;
      expv[12] = 3'h7;
      expv[13] = 3'h7;
      expv[14] = 3'h6;
      expv[15] = 3'h6;
      expv[16] = 3'h7;
      expv[17] = 3'h6;
      expv[18] = 3'h7;
      expv[19] = 3'h6;
      expv[20] = 3'h7;
      expv[21] = 3'h3;
      expv[22] = 3'h7;
      expv[23] = 3'h5;
      expv[24] = 3'h7;
      expv[25] = 3'h6;
      expv[26] = 3'h6;
      expv[27] = 3'h6;
      expv[28] = 3'h6;
      expv[29] = 3'h7;
      expv[30] = 3'h6;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h7;
      expv[34] = 3'h4;
      expv[35] = 3'h7;
      expv[36] = 3'h7;
      expv[37] = 3'h7;
      expv[38] = 3'h7;
      expv[39] = 3'h7;
      expv[40] = 3'h6;
      expv[41] = 3'h6;
      expv[42] = 3'h7;
      expv[43] = 3'h5;
      expv[44] = 3'h7;
      expv[45] = 3'h6;
      expv[46] = 3'h6;
      expv[47] = 3'h7;
      expv[48] = 3'h7;
      expv[49] = 3'h6;
      expv[50] = 3'h5;
      expv[51] = 3'h5;
      expv[52] = 3'h7;
      expv[53] = 3'h7;
      expv[54] = 3'h7;
      expv[55] = 3'h6;
      expv[56] = 3'h7;
      expv[57] = 3'h7;
      expv[58] = 3'h7;
      expv[59] = 3'h5;
      expv[60] = 3'h6;
      expv[61] = 3'h7;
      expv[62] = 3'h4;
      expv[63] = 3'h7;
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
