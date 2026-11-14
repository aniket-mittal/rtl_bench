// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137432 dut (
    .dividend(in_vec[12:9]),
    .divisor(in_vec[8:5]),
    .A(in_vec[4:4]),
    .B(in_vec[3:3]),
    .C(in_vec[2:2]),
    .D(in_vec[1:1]),
    .select(in_vec[0:0]),
    .Y1(out_vec[3:2]),
    .Y0(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0ce8;
    stim[1] = 13'h06be;
    stim[2] = 13'h166e;
    stim[3] = 13'h0f96;
    stim[4] = 13'h194d;
    stim[5] = 13'h177e;
    stim[6] = 13'h080a;
    stim[7] = 13'h11fc;
    stim[8] = 13'h155e;
    stim[9] = 13'h1f8c;
    stim[10] = 13'h0a5c;
    stim[11] = 13'h1b27;
    stim[12] = 13'h018b;
    stim[13] = 13'h0a88;
    stim[14] = 13'h1c6a;
    stim[15] = 13'h077d;
    stim[16] = 13'h1c89;
    stim[17] = 13'h01da;
    stim[18] = 13'h1908;
    stim[19] = 13'h050c;
    stim[20] = 13'h0f07;
    stim[21] = 13'h0dd2;
    stim[22] = 13'h1af0;
    stim[23] = 13'h1653;
    stim[24] = 13'h1726;
    stim[25] = 13'h0b43;
    stim[26] = 13'h0c03;
    stim[27] = 13'h0bc8;
    stim[28] = 13'h1b54;
    stim[29] = 13'h1d7a;
    stim[30] = 13'h001d;
    stim[31] = 13'h1ab3;
    stim[32] = 13'h062a;
    stim[33] = 13'h1b57;
    stim[34] = 13'h0faf;
    stim[35] = 13'h1dbd;
    stim[36] = 13'h1254;
    stim[37] = 13'h0f55;
    stim[38] = 13'h17e3;
    stim[39] = 13'h0a5e;
    stim[40] = 13'h0467;
    stim[41] = 13'h1068;
    stim[42] = 13'h1004;
    stim[43] = 13'h1018;
    stim[44] = 13'h1a34;
    stim[45] = 13'h1a19;
    stim[46] = 13'h0ddf;
    stim[47] = 13'h160f;
    stim[48] = 13'h0d43;
    stim[49] = 13'h1b85;
    stim[50] = 13'h0e00;
    stim[51] = 13'h1237;
    stim[52] = 13'h17a7;
    stim[53] = 13'h0118;
    stim[54] = 13'h105b;
    stim[55] = 13'h1f67;
    stim[56] = 13'h0f84;
    stim[57] = 13'h0a42;
    stim[58] = 13'h06e2;
    stim[59] = 13'h0018;
    stim[60] = 13'h0334;
    stim[61] = 13'h09f5;
    stim[62] = 13'h0248;
    stim[63] = 13'h0e8a;
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
      expv[0] = 4'h4;
      expv[1] = 4'h1;
      expv[2] = 4'h6;
      expv[3] = 4'h2;
      expv[4] = 4'h6;
      expv[5] = 4'h1;
      expv[6] = 4'h7;
      expv[7] = 4'h1;
      expv[8] = 4'h1;
      expv[9] = 4'h6;
      expv[10] = 4'h1;
      expv[11] = 4'h6;
      expv[12] = 4'hc;
      expv[13] = 4'h4;
      expv[14] = 4'h7;
      expv[15] = 4'hb;
      expv[16] = 4'he;
      expv[17] = 4'h1;
      expv[18] = 4'h4;
      expv[19] = 4'h6;
      expv[20] = 4'h3;
      expv[21] = 4'h3;
      expv[22] = 4'h0;
      expv[23] = 4'h5;
      expv[24] = 4'hb;
      expv[25] = 4'h1;
      expv[26] = 4'he;
      expv[27] = 4'h4;
      expv[28] = 4'h2;
      expv[29] = 4'h1;
      expv[30] = 4'hc;
      expv[31] = 4'hb;
      expv[32] = 4'h7;
      expv[33] = 4'h7;
      expv[34] = 4'h6;
      expv[35] = 4'h1;
      expv[36] = 4'h2;
      expv[37] = 4'h3;
      expv[38] = 4'h4;
      expv[39] = 4'h1;
      expv[40] = 4'h2;
      expv[41] = 4'h4;
      expv[42] = 4'h8;
      expv[43] = 4'h1;
      expv[44] = 4'h2;
      expv[45] = 4'h9;
      expv[46] = 4'h2;
      expv[47] = 4'hb;
      expv[48] = 4'h2;
      expv[49] = 4'h1;
      expv[50] = 4'h0;
      expv[51] = 4'h4;
      expv[52] = 4'h1;
      expv[53] = 4'h1;
      expv[54] = 4'h0;
      expv[55] = 4'h1;
      expv[56] = 4'h8;
      expv[57] = 4'hc;
      expv[58] = 4'hc;
      expv[59] = 4'h1;
      expv[60] = 4'h2;
      expv[61] = 4'hb;
      expv[62] = 4'h4;
      expv[63] = 4'h7;
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
