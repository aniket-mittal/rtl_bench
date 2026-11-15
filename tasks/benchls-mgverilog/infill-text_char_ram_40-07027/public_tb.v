// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07027 dut (
    .Clock(clk),
    .Address(in_vec[14:9]),
    .Din(in_vec[8:2]),
    .Reset(in_vec[1:1]),
    .WriteEnabled(in_vec[0:0]),
    .Dout(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h6ffa;
    stim[1] = 15'h2c7a;
    stim[2] = 15'h75d4;
    stim[3] = 15'h7a0c;
    stim[4] = 15'h3b9c;
    stim[5] = 15'h254d;
    stim[6] = 15'h29bd;
    stim[7] = 15'h7c58;
    stim[8] = 15'h5610;
    stim[9] = 15'h3351;
    stim[10] = 15'h07e9;
    stim[11] = 15'h7814;
    stim[12] = 15'h7c58;
    stim[13] = 15'h41ad;
    stim[14] = 15'h41a5;
    stim[15] = 15'h3e5c;
    stim[16] = 15'h13c5;
    stim[17] = 15'h0629;
    stim[18] = 15'h6f69;
    stim[19] = 15'h37b1;
    stim[20] = 15'h0ba8;
    stim[21] = 15'h4c6c;
    stim[22] = 15'h5ce0;
    stim[23] = 15'h537d;
    stim[24] = 15'h7ed5;
    stim[25] = 15'h1f01;
    stim[26] = 15'h37b9;
    stim[27] = 15'h1965;
    stim[28] = 15'h4e34;
    stim[29] = 15'h4098;
    stim[30] = 15'h7e8d;
    stim[31] = 15'h4635;
    stim[32] = 15'h7acd;
    stim[33] = 15'h0c88;
    stim[34] = 15'h4ef4;
    stim[35] = 15'h16e1;
    stim[36] = 15'h1991;
    stim[37] = 15'h77e9;
    stim[38] = 15'h74c0;
    stim[39] = 15'h46c9;
    stim[40] = 15'h0064;
    stim[41] = 15'h5ed8;
    stim[42] = 15'h4f2c;
    stim[43] = 15'h2c64;
    stim[44] = 15'h4089;
    stim[45] = 15'h603d;
    stim[46] = 15'h42ec;
    stim[47] = 15'h69d5;
    stim[48] = 15'h6d8d;
    stim[49] = 15'h59b9;
    stim[50] = 15'h796d;
    stim[51] = 15'h6709;
    stim[52] = 15'h0760;
    stim[53] = 15'h3b00;
    stim[54] = 15'h2601;
    stim[55] = 15'h7dcc;
    stim[56] = 15'h6681;
    stim[57] = 15'h70e1;
    stim[58] = 15'h3c14;
    stim[59] = 15'h0de0;
    stim[60] = 15'h7cb0;
    stim[61] = 15'h4ce0;
    stim[62] = 15'h292d;
    stim[63] = 15'h3398;
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
      expv[0] = 7'hxx;
      expv[1] = 7'h61;
      expv[2] = 7'hxx;
      expv[3] = 7'hxx;
      expv[4] = 7'h65;
      expv[5] = 7'h69;
      expv[6] = 7'h69;
      expv[7] = 7'hxx;
      expv[8] = 7'hxx;
      expv[9] = 7'h53;
      expv[10] = 7'h33;
      expv[11] = 7'hxx;
      expv[12] = 7'hxx;
      expv[13] = 7'h0a;
      expv[14] = 7'h6b;
      expv[15] = 7'h73;
      expv[16] = 7'h6c;
      expv[17] = 7'h7a;
      expv[18] = 7'hxx;
      expv[19] = 7'h73;
      expv[20] = 7'h33;
      expv[21] = 7'hxx;
      expv[22] = 7'hxx;
      expv[23] = 7'hxx;
      expv[24] = 7'hxx;
      expv[25] = 7'h35;
      expv[26] = 7'h6c;
      expv[27] = 7'h32;
      expv[28] = 7'hxx;
      expv[29] = 7'h69;
      expv[30] = 7'hxx;
      expv[31] = 7'hxx;
      expv[32] = 7'hxx;
      expv[33] = 7'h20;
      expv[34] = 7'hxx;
      expv[35] = 7'h20;
      expv[36] = 7'h59;
      expv[37] = 7'hxx;
      expv[38] = 7'hxx;
      expv[39] = 7'h0d;
      expv[40] = 7'h45;
      expv[41] = 7'hxx;
      expv[42] = 7'hxx;
      expv[43] = 7'h61;
      expv[44] = 7'h69;
      expv[45] = 7'hxx;
      expv[46] = 7'h72;
      expv[47] = 7'hxx;
      expv[48] = 7'hxx;
      expv[49] = 7'hxx;
      expv[50] = 7'hxx;
      expv[51] = 7'hxx;
      expv[52] = 7'h0a;
      expv[53] = 7'h65;
      expv[54] = 7'h67;
      expv[55] = 7'hxx;
      expv[56] = 7'hxx;
      expv[57] = 7'hxx;
      expv[58] = 7'h6d;
      expv[59] = 7'h20;
      expv[60] = 7'hxx;
      expv[61] = 7'hxx;
      expv[62] = 7'h6f;
      expv[63] = 7'h54;
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
