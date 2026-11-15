// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_083487 dut (
    .num(in_vec[33:12]),
    .weight(in_vec[11:0]),
    .out(out_vec[21:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0dff19b6a;
    stim[1] = 34'h20ef1a9db;
    stim[2] = 34'h143d8a29f;
    stim[3] = 34'h09b4a14ee;
    stim[4] = 34'h33b887118;
    stim[5] = 34'h0a97ff307;
    stim[6] = 34'h1eed75d94;
    stim[7] = 34'h3dad09642;
    stim[8] = 34'h1570827c4;
    stim[9] = 34'h34c16e857;
    stim[10] = 34'h274497d22;
    stim[11] = 34'h259284993;
    stim[12] = 34'h0459f2fec;
    stim[13] = 34'h1cf992415;
    stim[14] = 34'h019ceb902;
    stim[15] = 34'h104ddef48;
    stim[16] = 34'h0cbd5ea79;
    stim[17] = 34'h0faab2785;
    stim[18] = 34'h0c6651b4a;
    stim[19] = 34'h23714eecb;
    stim[20] = 34'h3a35abc93;
    stim[21] = 34'h0ad253091;
    stim[22] = 34'h2f824e3e1;
    stim[23] = 34'h122bd1580;
    stim[24] = 34'h14ff30c88;
    stim[25] = 34'h28e8ec2da;
    stim[26] = 34'h118777638;
    stim[27] = 34'h261718a3c;
    stim[28] = 34'h046b62ebd;
    stim[29] = 34'h1cb03afce;
    stim[30] = 34'h272b56d83;
    stim[31] = 34'h2437fd7aa;
    stim[32] = 34'h2629c8ead;
    stim[33] = 34'h2b45128e8;
    stim[34] = 34'h157cda8db;
    stim[35] = 34'h01b0fc5ce;
    stim[36] = 34'h06f7008fb;
    stim[37] = 34'h28fbb8215;
    stim[38] = 34'h21af61885;
    stim[39] = 34'h19dd7eb6c;
    stim[40] = 34'h2e2258629;
    stim[41] = 34'h1d342c219;
    stim[42] = 34'h312553d22;
    stim[43] = 34'h2d8c3f053;
    stim[44] = 34'h2cd54c010;
    stim[45] = 34'h3c4a17f81;
    stim[46] = 34'h0239645cd;
    stim[47] = 34'h38c1bf917;
    stim[48] = 34'h381dad54a;
    stim[49] = 34'h36afb2576;
    stim[50] = 34'h2fb1c0564;
    stim[51] = 34'h3214b91e2;
    stim[52] = 34'h071e6b38b;
    stim[53] = 34'h3ed0e1629;
    stim[54] = 34'h058a4e4c6;
    stim[55] = 34'h31b798657;
    stim[56] = 34'h2dd0d68b0;
    stim[57] = 34'h0547b1f85;
    stim[58] = 34'h261d30813;
    stim[59] = 34'h2575a8181;
    stim[60] = 34'h1161ed982;
    stim[61] = 34'h28ab69d14;
    stim[62] = 34'h2faf4cf4c;
    stim[63] = 34'h27555e3d1;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h000000;
      expv[8] = 22'h000000;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h000000;
      expv[12] = 22'h000000;
      expv[13] = 22'h000000;
      expv[14] = 22'h000000;
      expv[15] = 22'h000000;
      expv[16] = 22'h000000;
      expv[17] = 22'h000000;
      expv[18] = 22'h000000;
      expv[19] = 22'h000000;
      expv[20] = 22'h000000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h000000;
      expv[24] = 22'h000000;
      expv[25] = 22'h000000;
      expv[26] = 22'h000000;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h000000;
      expv[30] = 22'h000000;
      expv[31] = 22'h000000;
      expv[32] = 22'h000000;
      expv[33] = 22'h000000;
      expv[34] = 22'h000000;
      expv[35] = 22'h000000;
      expv[36] = 22'h000000;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h000000;
      expv[43] = 22'h000000;
      expv[44] = 22'h000000;
      expv[45] = 22'h000000;
      expv[46] = 22'h000000;
      expv[47] = 22'h000000;
      expv[48] = 22'h000000;
      expv[49] = 22'h000000;
      expv[50] = 22'h000000;
      expv[51] = 22'h000000;
      expv[52] = 22'h000000;
      expv[53] = 22'h000000;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h000000;
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
