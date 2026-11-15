// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 79;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_122222 dut (
    .BCLK(clk),
    .BRESET(in_vec[78:78]),
    .I_IOA(in_vec[77:46]),
    .D_IOA(in_vec[45:14]),
    .I_IORD(in_vec[13:13]),
    .D_IORD(in_vec[12:12]),
    .D_IOWR(in_vec[11:11]),
    .IO_READY(in_vec[10:10]),
    .GENSTAT(in_vec[9:7]),
    .D_IOBE(in_vec[6:3]),
    .ILO_SIG(in_vec[2:2]),
    .DCWACC(in_vec[1:0]),
    .IO_A(out_vec[44:13]),
    .IO_RD(out_vec[12:12]),
    .IO_WR(out_vec[11:11]),
    .IO_BE(out_vec[10:7]),
    .I_IORDY(out_vec[6:6]),
    .D_IORDY(out_vec[5:5]),
    .STATUS(out_vec[4:1]),
    .ILO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 79'h4ef845cc96c6a0adea87;
    stim[1] = 79'h56383760f16272e19ff4;
    stim[2] = 79'h3f6161fe26a8ca7c6bd4;
    stim[3] = 79'h26e5adeab311f359f854;
    stim[4] = 79'h13d9a88331c4b15eb61f;
    stim[5] = 79'h3f9960fb6a4624fbba80;
    stim[6] = 79'h1b917b530e62268f1b7c;
    stim[7] = 79'h23a18da21882249fa734;
    stim[8] = 79'h2043200fbeeccb48e0ef;
    stim[9] = 79'h2a5d02a19d4dda25c120;
    stim[10] = 79'h0bbef349148296f42a37;
    stim[11] = 79'h197b6b7751c083e81ddc;
    stim[12] = 79'h0d66653b215d51a5561a;
    stim[13] = 79'h38bf86278f6a9470e6b1;
    stim[14] = 79'h3d3459bf96bec7a35cb3;
    stim[15] = 79'h1b61440958815e182890;
    stim[16] = 79'h0d0ac4b6bc46f41eba1e;
    stim[17] = 79'h262790aa00e4cd70541e;
    stim[18] = 79'h1d2b32545d98473f2a63;
    stim[19] = 79'h28df373cb77557c8f0cc;
    stim[20] = 79'h0e2272553bf5ae918229;
    stim[21] = 79'h0e63b582dce167382d26;
    stim[22] = 79'h09f45f32fd291b7a6593;
    stim[23] = 79'h38816822b91e8e7ef419;
    stim[24] = 79'h1933d2eb885aebcdf994;
    stim[25] = 79'h32cd216ebb0840934b77;
    stim[26] = 79'h2fa0dbd1c1320ce50da6;
    stim[27] = 79'h0fb6835ef52ee953fbf9;
    stim[28] = 79'h0b97e02373b44eb0ee26;
    stim[29] = 79'h0e0596b914ec9d3febfd;
    stim[30] = 79'h3b93ad7df82fd86b861d;
    stim[31] = 79'h07625894b01b2e9be22c;
    stim[32] = 79'h327722539eb47f52b6d7;
    stim[33] = 79'h3fcd534286f75f950d00;
    stim[34] = 79'h0fc88d27d9f877cacbec;
    stim[35] = 79'h31fe5c538ecb67cd3ccd;
    stim[36] = 79'h070427df4b8143fd763c;
    stim[37] = 79'h3af449768f5fcdf5751e;
    stim[38] = 79'h0ca9b0bc7487c8663c00;
    stim[39] = 79'h3fe4b2cb0f0a4a9565fc;
    stim[40] = 79'h17a812b17924f4e733b5;
    stim[41] = 79'h33b45f0b767879db8aeb;
    stim[42] = 79'h27e52c63ff5cb48612a7;
    stim[43] = 79'h0b646863b7ed652f7b7c;
    stim[44] = 79'h1249bd9087118fda172c;
    stim[45] = 79'h36058d65faefdd37d5f3;
    stim[46] = 79'h013b474a14b9f47fdd5f;
    stim[47] = 79'h20d809fb295eea2f6064;
    stim[48] = 79'h18fd08ef3a1505e26f0f;
    stim[49] = 79'h064c13aa743064ed63a8;
    stim[50] = 79'h09c0fb754e4319697cb3;
    stim[51] = 79'h1033c94aa9409288d2d7;
    stim[52] = 79'h28003c221038223b993d;
    stim[53] = 79'h308b8c8ab0bdac8a62ae;
    stim[54] = 79'h2638910ae2ba720612e0;
    stim[55] = 79'h32b4751eeb27f0f74100;
    stim[56] = 79'h6ae9243d6f076b21611e;
    stim[57] = 79'h2f2043baf48e78d41efa;
    stim[58] = 79'h1be018441ac5f5141b7f;
    stim[59] = 79'h32e028099d3eea2560d2;
    stim[60] = 79'h16f447f1437f8d4b062e;
    stim[61] = 79'h1766b841ab804558c96e;
    stim[62] = 79'h3d7e4e13ac711e4d6961;
    stim[63] = 79'h0334be4d3b885c95c640;
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
      expv[0] = 45'h0b635056e80d;
      expv[1] = 45'h18b13970df29;
      expv[2] = 45'h1354653e2d09;
      expv[3] = 45'h1988f9acfd15;
      expv[4] = 45'h18e258af51b5;
      expv[5] = 45'h1523127dd80c;
      expv[6] = 45'h073113479f89;
      expv[7] = 45'h11d0c6d117d1;
      expv[8] = 45'h10219007d791;
      expv[9] = 45'h152e8150c780;
      expv[10] = 45'h0a414b7a0b15;
      expv[11] = 45'h08e041f41da9;
      expv[12] = 45'h10aea8d2b1b4;
      expv[13] = 45'h1c5fc313d7d0;
      expv[14] = 45'h0b5f63d1bb2c;
      expv[15] = 45'h0c40af0c090c;
      expv[16] = 45'h1e237a0f5995;
      expv[17] = 45'h007266b831b5;
      expv[18] = 45'h0ecc239f8e14;
      expv[19] = 45'h1bbaabe4748d;
      expv[20] = 45'h0711392a8782;
      expv[21] = 45'h0e70b39c0a29;
      expv[22] = 45'h04fa2f9977d0;
      expv[23] = 45'h1c8f473f71b4;
      expv[24] = 45'h042d75e6f909;
      expv[25] = 45'h1d842049af09;
      expv[26] = 45'h009906728a29;
      expv[27] = 45'h1a9774a9ff88;
      expv[28] = 45'h19da27586a35;
      expv[29] = 45'h0a764e9fef89;
      expv[30] = 45'h1dc9d6bee783;
      expv[31] = 45'h03b12c4a5791;
      expv[32] = 45'h0f5a3fa9552d;
      expv[33] = 45'h037bafca8828;
      expv[34] = 45'h0cfc3be56e89;
      expv[35] = 45'h0765b3e69cad;
      expv[36] = 45'h05c0a1feb3b5;
      expv[37] = 45'h07afe6fab1a9;
      expv[38] = 45'h1a43e4331834;
      expv[39] = 45'h1ff2596597d0;
      expv[40] = 45'h1c927a739309;
      expv[41] = 45'h1b3c3cedce8c;
      expv[42] = 45'h1fae5a43120d;
      expv[43] = 45'h1bf6b297bf89;
      expv[44] = 45'h0388c7ed12a9;
      expv[45] = 45'h1d77ee9bf728;
      expv[46] = 45'h0a5cfa3ffda9;
      expv[47] = 45'h106c04fd9791;
      expv[48] = 45'h1d0a82f128a9;
      expv[49] = 45'h032609d53790;
      expv[50] = 45'h07218cb4bb2c;
      expv[51] = 45'h14a04944750d;
      expv[52] = 45'h081c111ddb89;
      expv[53] = 45'h1845c6455791;
      expv[54] = 45'h115d3903160c;
      expv[55] = 45'h195a3a8f6780;
      expv[56] = 45'h1574921eb791;
      expv[57] = 45'h1a473c6a1fac;
      expv[58] = 45'h0d62fa8a1f89;
      expv[59] = 45'h19701404d790;
      expv[60] = 45'h0b7a23f8a783;
      expv[61] = 45'h15c022ac6e89;
      expv[62] = 45'h16388f26ae08;
      expv[63] = 45'h019a5f268782;
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
