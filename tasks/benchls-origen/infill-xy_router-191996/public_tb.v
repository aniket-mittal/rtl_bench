// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_191996 dut (
    .Destino(in_vec[15:8]),
    .Actual(in_vec[7:0]),
    .Norte(out_vec[4:4]),
    .Este(out_vec[3:3]),
    .Oeste(out_vec[2:2]),
    .Sur(out_vec[1:1]),
    .Local(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hfe80;
    stim[1] = 16'h2425;
    stim[2] = 16'h9f48;
    stim[3] = 16'hd4c9;
    stim[4] = 16'hce12;
    stim[5] = 16'h1acb;
    stim[6] = 16'h9774;
    stim[7] = 16'h1cc0;
    stim[8] = 16'h3e84;
    stim[9] = 16'h4358;
    stim[10] = 16'hb6a6;
    stim[11] = 16'hf072;
    stim[12] = 16'h51d2;
    stim[13] = 16'h5b5b;
    stim[14] = 16'hbe48;
    stim[15] = 16'h8739;
    stim[16] = 16'hd184;
    stim[17] = 16'hdacf;
    stim[18] = 16'hb51b;
    stim[19] = 16'hbeae;
    stim[20] = 16'hd84a;
    stim[21] = 16'h44f3;
    stim[22] = 16'h8ae5;
    stim[23] = 16'hcd1d;
    stim[24] = 16'hd529;
    stim[25] = 16'h9813;
    stim[26] = 16'h1b3b;
    stim[27] = 16'h4bb8;
    stim[28] = 16'h5740;
    stim[29] = 16'h914d;
    stim[30] = 16'hdccd;
    stim[31] = 16'h8791;
    stim[32] = 16'h3129;
    stim[33] = 16'h7ef8;
    stim[34] = 16'h5803;
    stim[35] = 16'h3111;
    stim[36] = 16'h5d87;
    stim[37] = 16'h271e;
    stim[38] = 16'h6ccb;
    stim[39] = 16'h3096;
    stim[40] = 16'h474d;
    stim[41] = 16'he773;
    stim[42] = 16'h033c;
    stim[43] = 16'h2df7;
    stim[44] = 16'h6c58;
    stim[45] = 16'hbb82;
    stim[46] = 16'h8b28;
    stim[47] = 16'h6463;
    stim[48] = 16'h3520;
    stim[49] = 16'hbe4d;
    stim[50] = 16'h9e41;
    stim[51] = 16'hfe60;
    stim[52] = 16'h84cc;
    stim[53] = 16'h5be2;
    stim[54] = 16'hcb43;
    stim[55] = 16'h45a2;
    stim[56] = 16'h6c50;
    stim[57] = 16'ha5cc;
    stim[58] = 16'h5182;
    stim[59] = 16'hb127;
    stim[60] = 16'hb7e9;
    stim[61] = 16'hea5c;
    stim[62] = 16'h900e;
    stim[63] = 16'hb24c;
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
      expv[0] = 5'h02;
      expv[1] = 5'h01;
      expv[2] = 5'h02;
      expv[3] = 5'h08;
      expv[4] = 5'h02;
      expv[5] = 5'h10;
      expv[6] = 5'h02;
      expv[7] = 5'h10;
      expv[8] = 5'h10;
      expv[9] = 5'h04;
      expv[10] = 5'h08;
      expv[11] = 5'h02;
      expv[12] = 5'h10;
      expv[13] = 5'h01;
      expv[14] = 5'h02;
      expv[15] = 5'h02;
      expv[16] = 5'h02;
      expv[17] = 5'h08;
      expv[18] = 5'h02;
      expv[19] = 5'h08;
      expv[20] = 5'h02;
      expv[21] = 5'h10;
      expv[22] = 5'h10;
      expv[23] = 5'h02;
      expv[24] = 5'h02;
      expv[25] = 5'h02;
      expv[26] = 5'h10;
      expv[27] = 5'h10;
      expv[28] = 5'h08;
      expv[29] = 5'h02;
      expv[30] = 5'h08;
      expv[31] = 5'h04;
      expv[32] = 5'h08;
      expv[33] = 5'h10;
      expv[34] = 5'h02;
      expv[35] = 5'h02;
      expv[36] = 5'h10;
      expv[37] = 5'h02;
      expv[38] = 5'h10;
      expv[39] = 5'h10;
      expv[40] = 5'h04;
      expv[41] = 5'h02;
      expv[42] = 5'h10;
      expv[43] = 5'h10;
      expv[44] = 5'h02;
      expv[45] = 5'h02;
      expv[46] = 5'h02;
      expv[47] = 5'h08;
      expv[48] = 5'h08;
      expv[49] = 5'h02;
      expv[50] = 5'h02;
      expv[51] = 5'h02;
      expv[52] = 5'h10;
      expv[53] = 5'h10;
      expv[54] = 5'h02;
      expv[55] = 5'h10;
      expv[56] = 5'h02;
      expv[57] = 5'h10;
      expv[58] = 5'h10;
      expv[59] = 5'h02;
      expv[60] = 5'h10;
      expv[61] = 5'h02;
      expv[62] = 5'h02;
      expv[63] = 5'h02;
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
