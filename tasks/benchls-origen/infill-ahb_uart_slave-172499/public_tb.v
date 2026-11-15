// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172499 dut (
    .HCLK(clk),
    .HRESETn(in_vec[85:85]),
    .HSEL(in_vec[84:84]),
    .HADDR(in_vec[83:52]),
    .HTRANS(in_vec[51:50]),
    .HSIZE(in_vec[49:47]),
    .HPROT(in_vec[46:43]),
    .HWRITE(in_vec[42:42]),
    .HWDATA(in_vec[41:10]),
    .HREADY(in_vec[9:9]),
    .UART_RX(in_vec[8:1]),
    .state(in_vec[0:0]),
    .HREADYOUT(out_vec[42:42]),
    .HRDATA(out_vec[41:10]),
    .HRESP(out_vec[9:9]),
    .tx_en(out_vec[8:8]),
    .UART_TX(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h1a015947aa1d62c47ab724;
    stim[1] = 86'h132e4ced8c2c5af2e749a4;
    stim[2] = 86'h32cc0ae94a95544ad61961;
    stim[3] = 86'h28800997bbd1c98a87b7bd;
    stim[4] = 86'h2da80fe1b75fe4bafdebc2;
    stim[5] = 86'h3111b073c1363c711ae24d;
    stim[6] = 86'h36d3454bb0910c52850e32;
    stim[7] = 86'h2c9d9a388c6a1e590587a4;
    stim[8] = 86'h2d268475d43357165786cc;
    stim[9] = 86'h2c18772169c2d701c59f24;
    stim[10] = 86'h332ea3570932eeaafad270;
    stim[11] = 86'h2633c8071d58c3493fa526;
    stim[12] = 86'h256a171ca75fb614775b00;
    stim[13] = 86'h2db079fb5637e48faead0d;
    stim[14] = 86'h25beed22d5543c6f0f9a02;
    stim[15] = 86'h27e125776b4ab2f96dd261;
    stim[16] = 86'h35289ba47b84cdf201e6aa;
    stim[17] = 86'h2e211310f79c577e493fba;
    stim[18] = 86'h37b7122a765482522fa172;
    stim[19] = 86'h26019eeffeefdc29fe8fe7;
    stim[20] = 86'h22828df9f03777ac0b40a1;
    stim[21] = 86'h275d6508657ceb3409ed6e;
    stim[22] = 86'h32abfd8444fab71cf589d1;
    stim[23] = 86'h3ff50c0cdf2e51f1cca969;
    stim[24] = 86'h2116f7d9c0b1334d8b239a;
    stim[25] = 86'h29cbb2e7b0bd7a5ca70af7;
    stim[26] = 86'h2a0fa90f73c7d1620dce67;
    stim[27] = 86'h3c5d79553bacfc5e7125eb;
    stim[28] = 86'h3493c7efc3a3c0dab2eb6b;
    stim[29] = 86'h27862ddbd8fa3739ede618;
    stim[30] = 86'h25b76d38345f0a6f8e0f5d;
    stim[31] = 86'h363db95b976ab59b7945a6;
    stim[32] = 86'h3f5f432cbca2bc7200b376;
    stim[33] = 86'h3321217c69a0bc5d18ac4d;
    stim[34] = 86'h36b85e7ba4f07532e657b1;
    stim[35] = 86'h2c11203f2926b3b4640485;
    stim[36] = 86'h344db9f9c9c17af4355071;
    stim[37] = 86'h3d1d18deb136e2c1a2503d;
    stim[38] = 86'h23ce9a488380ba1abdd862;
    stim[39] = 86'h2c5aac9ee363ec00850f3a;
    stim[40] = 86'h2d94063947c0805da5a95a;
    stim[41] = 86'h3325ee8461e9eba458cf9d;
    stim[42] = 86'h27dcee5ed9185532b91254;
    stim[43] = 86'h2fb11720980ca12eac2433;
    stim[44] = 86'h35e00f7e778314e1f66255;
    stim[45] = 86'h3aa51dcb48c1ea1e8f4b8a;
    stim[46] = 86'h320eeafc711b79bfab1034;
    stim[47] = 86'h31a62418996dcef3cac2ba;
    stim[48] = 86'h2c09329a7891c8aa65cc7b;
    stim[49] = 86'h309abae33a553342fe5208;
    stim[50] = 86'h39845caa6bc910a598045e;
    stim[51] = 86'h35c4339d68fd719ed053de;
    stim[52] = 86'h2403b813338907e65ecf29;
    stim[53] = 86'h362d825fecb4d8bf39816b;
    stim[54] = 86'h34047139678ec264f07e42;
    stim[55] = 86'h29acdd2cd2ce1c9d1353b0;
    stim[56] = 86'h3fe06a954ea45da4f33a56;
    stim[57] = 86'h3fbecc145d511f4666ab55;
    stim[58] = 86'h3df2c49de7c9db6cf2aa4a;
    stim[59] = 86'h2cb0e572cb2a31c774d6a1;
    stim[60] = 86'h34040f2b683081bd2d08ab;
    stim[61] = 86'h3d7512fc5f253be32ec9cc;
    stim[62] = 86'h2be51e52606efd3585c211;
    stim[63] = 86'h24853b03c4e0ed461b3da7;
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
      expv[0] = 43'h40000000000;
      expv[1] = 43'h40000000000;
      expv[2] = 43'h40000000000;
      expv[3] = 43'h40000000000;
      expv[4] = 43'h40000000000;
      expv[5] = 43'h40000000000;
      expv[6] = 43'h40000000000;
      expv[7] = 43'h40000000000;
      expv[8] = 43'h40000000000;
      expv[9] = 43'h40000000000;
      expv[10] = 43'h40000000000;
      expv[11] = 43'h4000000e000;
      expv[12] = 43'h4000000e000;
      expv[13] = 43'h4000000e000;
      expv[14] = 43'h4000000e000;
      expv[15] = 43'h4000000e000;
      expv[16] = 43'h4000000e000;
      expv[17] = 43'h4000000e179;
      expv[18] = 43'h4000000e179;
      expv[19] = 43'h4000000e179;
      expv[20] = 43'h4000000e179;
      expv[21] = 43'h4000000e179;
      expv[22] = 43'h4000000e179;
      expv[23] = 43'h4000000e179;
      expv[24] = 43'h4000000e179;
      expv[25] = 43'h4000000e179;
      expv[26] = 43'h4000000e179;
      expv[27] = 43'h4000000e179;
      expv[28] = 43'h4000000e179;
      expv[29] = 43'h4000000e179;
      expv[30] = 43'h4000000e179;
      expv[31] = 43'h4000000e179;
      expv[32] = 43'h4000000e179;
      expv[33] = 43'h4000000e179;
      expv[34] = 43'h4000000e179;
      expv[35] = 43'h4000000e179;
      expv[36] = 43'h4000000e179;
      expv[37] = 43'h4000000e179;
      expv[38] = 43'h4000000e179;
      expv[39] = 43'h4000000e179;
      expv[40] = 43'h4000000e179;
      expv[41] = 43'h4000000e179;
      expv[42] = 43'h4000000e179;
      expv[43] = 43'h4000000e179;
      expv[44] = 43'h4000000e179;
      expv[45] = 43'h4000000e179;
      expv[46] = 43'h40000000179;
      expv[47] = 43'h40000000179;
      expv[48] = 43'h400000001b0;
      expv[49] = 43'h400000001b0;
      expv[50] = 43'h40000000194;
      expv[51] = 43'h40000000194;
      expv[52] = 43'h40000000114;
      expv[53] = 43'h40000000114;
      expv[54] = 43'h40000000114;
      expv[55] = 43'h40000000114;
      expv[56] = 43'h40000000114;
      expv[57] = 43'h40000000114;
      expv[58] = 43'h40000000114;
      expv[59] = 43'h40000000114;
      expv[60] = 43'h40000000114;
      expv[61] = 43'h40000000114;
      expv[62] = 43'h40000000114;
      expv[63] = 43'h40000000114;
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
