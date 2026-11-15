// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 77;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10223 dut (
    .clk(clk),
    .rst(in_vec[77:77]),
    .branch(in_vec[76:76]),
    .mem_read(in_vec[75:75]),
    .mem_write(in_vec[74:74]),
    .ll_mem(in_vec[73:73]),
    .sc_mem(in_vec[72:72]),
    .reg_write(in_vec[71:71]),
    .memtoreg(in_vec[70:70]),
    .alu_zero(in_vec[69:69]),
    .alu_result(in_vec[68:37]),
    .reg_read2(in_vec[36:5]),
    .dest_reg(in_vec[4:0]),
    .mem_branch(out_vec[76:76]),
    .mem_mem_read(out_vec[75:75]),
    .mem_mem_write(out_vec[74:74]),
    .mem_ll_mem(out_vec[73:73]),
    .mem_sc_mem(out_vec[72:72]),
    .mem_reg_write(out_vec[71:71]),
    .mem_memtoreg(out_vec[70:70]),
    .mem_alu_zero(out_vec[69:69]),
    .mem_alu_result(out_vec[68:37]),
    .mem_reg_read2(out_vec[36:5]),
    .mem_dest_reg(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h24812f33eb9f5ab85f2a;
    stim[1] = 78'h30dce17200b6407ccfea;
    stim[2] = 78'h0ef53b00fb4b27a998e3;
    stim[3] = 78'h1bc3e71cf4b00098cb29;
    stim[4] = 78'h13752c2b9f03bcd24528;
    stim[5] = 78'h1634b54162fb03f643b8;
    stim[6] = 78'h09f124519b9367f498ae;
    stim[7] = 78'h1ea39ba863a8d8b0ae1f;
    stim[8] = 78'h139f3f5862028d0dcbdf;
    stim[9] = 78'h1f20c4caf83c88e3d61c;
    stim[10] = 78'h1a2bc5de373751f50206;
    stim[11] = 78'h0d8d04d32431e96fb075;
    stim[12] = 78'h0b7708c888bd2d249abb;
    stim[13] = 78'h0dfd4f058be77b639d2b;
    stim[14] = 78'h0e77afd13d438f44ca3a;
    stim[15] = 78'h0b56ae5dfc4136729dd6;
    stim[16] = 78'h1d151e4cebae4fcc6d0f;
    stim[17] = 78'h1d5fc310df0a8a83a0ad;
    stim[18] = 78'h037e59b4c963ef9380cb;
    stim[19] = 78'h1d9322b9a0d296292a38;
    stim[20] = 78'h0e1f90130f8d6f578844;
    stim[21] = 78'h00fa84bf7c7e1ed40402;
    stim[22] = 78'h13f134222bc9d35d5c5f;
    stim[23] = 78'h0394b00e9f0dfd51ae36;
    stim[24] = 78'h04ea7f91a73362f41c6b;
    stim[25] = 78'h00a70cea825011a340f4;
    stim[26] = 78'h009a75416b5e35417454;
    stim[27] = 78'h06e008e9b0cf9782efa1;
    stim[28] = 78'h17489a179ec8fdfc2fa2;
    stim[29] = 78'h19bcd012be7061e4988a;
    stim[30] = 78'h0c28f703f2b51417b13e;
    stim[31] = 78'h10ef926ed9b169665f6d;
    stim[32] = 78'h14a60d5f6fca7e77c8d2;
    stim[33] = 78'h1f95be5e7d39ecaaf0b6;
    stim[34] = 78'h015b03a233ea7e98ba06;
    stim[35] = 78'h1359c2b23813cdf7b4f4;
    stim[36] = 78'h0517d1c658915c47d77e;
    stim[37] = 78'h04356f2bcd635bdf4ba9;
    stim[38] = 78'h1dd8a308b8c61b5d013e;
    stim[39] = 78'h0a57e223ce5199dfc7fc;
    stim[40] = 78'h0e0226a6b71aa13d70cf;
    stim[41] = 78'h06e89f658e3863cc61d6;
    stim[42] = 78'h017b8ef58754b47a1b08;
    stim[43] = 78'h14bf5eea1ae6b1343d24;
    stim[44] = 78'h1e24af24e51e5d30b724;
    stim[45] = 78'h2caa2f4a3f61045c6163;
    stim[46] = 78'h139aec63164800d93114;
    stim[47] = 78'h1768647049cc82633df6;
    stim[48] = 78'h1268910df7dd65501e59;
    stim[49] = 78'h1313dcfd68421638f22f;
    stim[50] = 78'h011a8baee652a032a08f;
    stim[51] = 78'h149099dea63bcf59dcd0;
    stim[52] = 78'h19f20771e0db7ffae745;
    stim[53] = 78'h0875c680e40c5c43a4cb;
    stim[54] = 78'h0af6088c97ed7db99d67;
    stim[55] = 78'h0becb7bcaae833130a2e;
    stim[56] = 78'h01dc91aafe2d13144d4d;
    stim[57] = 78'h1a06a224057b7ac60b5f;
    stim[58] = 78'h1f6931cd1fa06ae227d9;
    stim[59] = 78'h0aa5f28b29ba3cd7ca9d;
    stim[60] = 78'h1198448557baffe777a6;
    stim[61] = 78'h1682acce67033f4fd515;
    stim[62] = 78'h13b24895c7c06c3df408;
    stim[63] = 78'h0592a80ce1927d7c387e;
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
      expv[0] = 77'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 77'h00000000000000000000;
      expv[2] = 77'h00000000000000000000;
      expv[3] = 77'h0ef53b00fb4b27a998e3;
      expv[4] = 77'h1bc3e71cf4b00098cb29;
      expv[5] = 77'h13752c2b9f03bcd24528;
      expv[6] = 77'h1634b54162fb03f643b8;
      expv[7] = 77'h09f124519b9367f498ae;
      expv[8] = 77'h1ea39ba863a8d8b0ae1f;
      expv[9] = 77'h139f3f5862028d0dcbdf;
      expv[10] = 77'h1f20c4caf83c88e3d61c;
      expv[11] = 77'h1a2bc5de373751f50206;
      expv[12] = 77'h0d8d04d32431e96fb075;
      expv[13] = 77'h0b7708c888bd2d249abb;
      expv[14] = 77'h0dfd4f058be77b639d2b;
      expv[15] = 77'h0e77afd13d438f44ca3a;
      expv[16] = 77'h0b56ae5dfc4136729dd6;
      expv[17] = 77'h1d151e4cebae4fcc6d0f;
      expv[18] = 77'h1d5fc310df0a8a83a0ad;
      expv[19] = 77'h037e59b4c963ef9380cb;
      expv[20] = 77'h1d9322b9a0d296292a38;
      expv[21] = 77'h0e1f90130f8d6f578844;
      expv[22] = 77'h00fa84bf7c7e1ed40402;
      expv[23] = 77'h13f134222bc9d35d5c5f;
      expv[24] = 77'h0394b00e9f0dfd51ae36;
      expv[25] = 77'h04ea7f91a73362f41c6b;
      expv[26] = 77'h00a70cea825011a340f4;
      expv[27] = 77'h009a75416b5e35417454;
      expv[28] = 77'h06e008e9b0cf9782efa1;
      expv[29] = 77'h17489a179ec8fdfc2fa2;
      expv[30] = 77'h19bcd012be7061e4988a;
      expv[31] = 77'h0c28f703f2b51417b13e;
      expv[32] = 77'h10ef926ed9b169665f6d;
      expv[33] = 77'h14a60d5f6fca7e77c8d2;
      expv[34] = 77'h1f95be5e7d39ecaaf0b6;
      expv[35] = 77'h015b03a233ea7e98ba06;
      expv[36] = 77'h1359c2b23813cdf7b4f4;
      expv[37] = 77'h0517d1c658915c47d77e;
      expv[38] = 77'h04356f2bcd635bdf4ba9;
      expv[39] = 77'h1dd8a308b8c61b5d013e;
      expv[40] = 77'h0a57e223ce5199dfc7fc;
      expv[41] = 77'h0e0226a6b71aa13d70cf;
      expv[42] = 77'h06e89f658e3863cc61d6;
      expv[43] = 77'h017b8ef58754b47a1b08;
      expv[44] = 77'h14bf5eea1ae6b1343d24;
      expv[45] = 77'h1e24af24e51e5d30b724;
      expv[46] = 77'h00000000000000000000;
      expv[47] = 77'h139aec63164800d93114;
      expv[48] = 77'h1768647049cc82633df6;
      expv[49] = 77'h1268910df7dd65501e59;
      expv[50] = 77'h1313dcfd68421638f22f;
      expv[51] = 77'h011a8baee652a032a08f;
      expv[52] = 77'h149099dea63bcf59dcd0;
      expv[53] = 77'h19f20771e0db7ffae745;
      expv[54] = 77'h0875c680e40c5c43a4cb;
      expv[55] = 77'h0af6088c97ed7db99d67;
      expv[56] = 77'h0becb7bcaae833130a2e;
      expv[57] = 77'h01dc91aafe2d13144d4d;
      expv[58] = 77'h1a06a224057b7ac60b5f;
      expv[59] = 77'h1f6931cd1fa06ae227d9;
      expv[60] = 77'h0aa5f28b29ba3cd7ca9d;
      expv[61] = 77'h1198448557baffe777a6;
      expv[62] = 77'h1682acce67033f4fd515;
      expv[63] = 77'h13b24895c7c06c3df408;
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
