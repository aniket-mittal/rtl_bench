// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00038 dut (
    .scache3_cpx_req_bufpt_cq_l(in_vec[25:18]),
    .scache3_cpx_atom_bufpt_cq_l(in_vec[17:17]),
    .io_cpx_req_bufpt_cq_l(in_vec[16:9]),
    .cpx_scache3_grant_bufp3_ca_l(in_vec[8:1]),
    .cpx_spc7_data_rdy_bufp3_cx(in_vec[0:0]),
    .scache3_cpx_req_bufp4_cq(out_vec[25:18]),
    .scache3_cpx_atom_bufp4_cq(out_vec[17:17]),
    .io_cpx_req_bufp4_cq(out_vec[16:9]),
    .cpx_scache3_grant_bufp4_ca(out_vec[8:1]),
    .cpx_spc7_data_rdy_bufp4_cx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h170491e;
    stim[1] = 26'h14a5236;
    stim[2] = 26'h23c3e0d;
    stim[3] = 26'h2d59f25;
    stim[4] = 26'h16b457a;
    stim[5] = 26'h1093a45;
    stim[6] = 26'h0831a27;
    stim[7] = 26'h3bc8755;
    stim[8] = 26'h2860ca7;
    stim[9] = 26'h2f0fec8;
    stim[10] = 26'h13182e4;
    stim[11] = 26'h11b938b;
    stim[12] = 26'h0c4709b;
    stim[13] = 26'h1805632;
    stim[14] = 26'h202538e;
    stim[15] = 26'h127229f;
    stim[16] = 26'h3ab1f81;
    stim[17] = 26'h24b6efe;
    stim[18] = 26'h1944333;
    stim[19] = 26'h240bddb;
    stim[20] = 26'h24b5aa9;
    stim[21] = 26'h13958ac;
    stim[22] = 26'h1348a6d;
    stim[23] = 26'h22c84ff;
    stim[24] = 26'h2e02ba4;
    stim[25] = 26'h2aeeb58;
    stim[26] = 26'h20a8090;
    stim[27] = 26'h3d6ffe3;
    stim[28] = 26'h0350c07;
    stim[29] = 26'h12b7462;
    stim[30] = 26'h385da80;
    stim[31] = 26'h1ac763b;
    stim[32] = 26'h2fde0fd;
    stim[33] = 26'h3b4207c;
    stim[34] = 26'h22a5898;
    stim[35] = 26'h06df8f1;
    stim[36] = 26'h093fc48;
    stim[37] = 26'h3eefdb8;
    stim[38] = 26'h28d57bd;
    stim[39] = 26'h13404a0;
    stim[40] = 26'h241a2ce;
    stim[41] = 26'h1608d37;
    stim[42] = 26'h046cb2d;
    stim[43] = 26'h2a527c2;
    stim[44] = 26'h1b96fa3;
    stim[45] = 26'h327d4d0;
    stim[46] = 26'h05ae960;
    stim[47] = 26'h1d00b04;
    stim[48] = 26'h391a168;
    stim[49] = 26'h2382d92;
    stim[50] = 26'h2614caf;
    stim[51] = 26'h04d1966;
    stim[52] = 26'h31e6dbf;
    stim[53] = 26'h2858c25;
    stim[54] = 26'h2685d5d;
    stim[55] = 26'h2d43954;
    stim[56] = 26'h0eba81c;
    stim[57] = 26'h207619f;
    stim[58] = 26'h1e1cdf5;
    stim[59] = 26'h3bf5be5;
    stim[60] = 26'h0617ede;
    stim[61] = 26'h2f2091f;
    stim[62] = 26'h355a168;
    stim[63] = 26'h3a74889;
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
      expv[0] = 26'h28fb6e0;
      expv[1] = 26'h2b5adc8;
      expv[2] = 26'h1c3c1f3;
      expv[3] = 26'h12a60db;
      expv[4] = 26'h294ba84;
      expv[5] = 26'h2f6c5bb;
      expv[6] = 26'h37ce5d9;
      expv[7] = 26'h04378ab;
      expv[8] = 26'h179f359;
      expv[9] = 26'h10f0136;
      expv[10] = 26'h2ce7d1a;
      expv[11] = 26'h2e46c75;
      expv[12] = 26'h33b8f65;
      expv[13] = 26'h27fa9cc;
      expv[14] = 26'h1fdac70;
      expv[15] = 26'h2d8dd61;
      expv[16] = 26'h054e07f;
      expv[17] = 26'h1b49100;
      expv[18] = 26'h26bbccd;
      expv[19] = 26'h1bf4225;
      expv[20] = 26'h1b4a557;
      expv[21] = 26'h2c6a752;
      expv[22] = 26'h2cb7593;
      expv[23] = 26'h1d37b01;
      expv[24] = 26'h11fd45a;
      expv[25] = 26'h15114a6;
      expv[26] = 26'h1f57f6e;
      expv[27] = 26'h029001d;
      expv[28] = 26'h3caf3f9;
      expv[29] = 26'h2d48b9c;
      expv[30] = 26'h07a257e;
      expv[31] = 26'h25389c5;
      expv[32] = 26'h1021f03;
      expv[33] = 26'h04bdf82;
      expv[34] = 26'h1d5a766;
      expv[35] = 26'h392070f;
      expv[36] = 26'h36c03b6;
      expv[37] = 26'h0110246;
      expv[38] = 26'h172a843;
      expv[39] = 26'h2cbfb5e;
      expv[40] = 26'h1be5d30;
      expv[41] = 26'h29f72c9;
      expv[42] = 26'h3b934d3;
      expv[43] = 26'h15ad83c;
      expv[44] = 26'h246905d;
      expv[45] = 26'h0d82b2e;
      expv[46] = 26'h3a5169e;
      expv[47] = 26'h22ff4fa;
      expv[48] = 26'h06e5e96;
      expv[49] = 26'h1c7d26c;
      expv[50] = 26'h19eb351;
      expv[51] = 26'h3b2e698;
      expv[52] = 26'h0e19241;
      expv[53] = 26'h17a73db;
      expv[54] = 26'h197a2a3;
      expv[55] = 26'h12bc6aa;
      expv[56] = 26'h31457e2;
      expv[57] = 26'h1f89e61;
      expv[58] = 26'h21e320b;
      expv[59] = 26'h040a41b;
      expv[60] = 26'h39e8120;
      expv[61] = 26'h10df6e1;
      expv[62] = 26'h0aa5e96;
      expv[63] = 26'h058b777;
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
