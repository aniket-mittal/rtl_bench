// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09019 dut (
    .clk_i(clk),
    .rstn_i(in_vec[70:70]),
    .sys_addr(in_vec[69:38]),
    .sys_wdata(in_vec[37:6]),
    .sys_sel(in_vec[5:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[129:106]),
    .dac_b_o(out_vec[105:82]),
    .dac_c_o(out_vec[81:58]),
    .dac_d_o(out_vec[57:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h63b9bafebb1ff9990b;
    stim[1] = 71'h5fd900c7f3151e36f9;
    stim[2] = 71'h28ebb2a5ed2024db3d;
    stim[3] = 71'h08b7b4c2b18e7daeaa;
    stim[4] = 71'h18b0a69b4825e44d38;
    stim[5] = 71'h3af5e286c06439c019;
    stim[6] = 71'h3e25f2a68e9e373598;
    stim[7] = 71'h032a19d4d7af72dee1;
    stim[8] = 71'h351c39108004c701b8;
    stim[9] = 71'h102e85e2efdad6fd17;
    stim[10] = 71'h05bdb86892403be281;
    stim[11] = 71'h07e7409e82cae29b94;
    stim[12] = 71'h2c6a5b3616911418f6;
    stim[13] = 71'h24e18e5f04a2a3d266;
    stim[14] = 71'h26ae03d82cef3989b3;
    stim[15] = 71'h01c6a4b848801f315d;
    stim[16] = 71'h1bd55a2ce842ce6d2c;
    stim[17] = 71'h331dc20a1a4b0fb048;
    stim[18] = 71'h146c92be89ad8c11be;
    stim[19] = 71'h2bfb3528daf3ce9995;
    stim[20] = 71'h327d274d109cf639c9;
    stim[21] = 71'h241ddde08fe4a393e7;
    stim[22] = 71'h198aff3a943710d8e4;
    stim[23] = 71'h390af955048d53285a;
    stim[24] = 71'h339c0e53465ab9069b;
    stim[25] = 71'h3981693adea29920ec;
    stim[26] = 71'h3ac65151a64b67d11c;
    stim[27] = 71'h30c1bb152728427aa5;
    stim[28] = 71'h4757d09f95dd5a7b85;
    stim[29] = 71'h0279167abcde1d0a3a;
    stim[30] = 71'h0fe72ff746dc627298;
    stim[31] = 71'h0c7f08d7bb03af2578;
    stim[32] = 71'h0835f636cfae1f06aa;
    stim[33] = 71'h09d76569d2a73e8310;
    stim[34] = 71'h2cba7d462711046b8d;
    stim[35] = 71'h1bdcbeb183f93235aa;
    stim[36] = 71'h2157f5fdce0ed00797;
    stim[37] = 71'h07b4c9e9579c9accbb;
    stim[38] = 71'h1a9a1709a7bd7f400c;
    stim[39] = 71'h1eada54bb3da334a67;
    stim[40] = 71'h1c4b7068af88b18768;
    stim[41] = 71'h106f49910806ee7441;
    stim[42] = 71'h013e2545dc4c0cfea3;
    stim[43] = 71'h2a3a2c75f6f769165d;
    stim[44] = 71'h2332ac2bd7da132aac;
    stim[45] = 71'h283a27a92c467cbcc5;
    stim[46] = 71'h3ff2e391ae04fcb04c;
    stim[47] = 71'h0fa0d11ba2c31239bb;
    stim[48] = 71'h175228aa5facee0bbd;
    stim[49] = 71'h31e10a8ca6f210ffdc;
    stim[50] = 71'h1874cf658ad0afe945;
    stim[51] = 71'h0705938f4bf6ea83e5;
    stim[52] = 71'h156240e071b4d0dee5;
    stim[53] = 71'h3bd96001b78c92a621;
    stim[54] = 71'h1b3a879583764cc9eb;
    stim[55] = 71'h7a0f7e926402b5be2f;
    stim[56] = 71'h2adf7c4fd76fd40caa;
    stim[57] = 71'h1ca43e0148bfa5344e;
    stim[58] = 71'h0113e9d8b4e42e03eb;
    stim[59] = 71'h23bfecdbc1b286aa61;
    stim[60] = 71'h30624e898bafe4c0e5;
    stim[61] = 71'h127f290b32491d6453;
    stim[62] = 71'h2fc77dad34e11d32b7;
    stim[63] = 71'h2c6a5213d751e023ae;
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
      expv[0] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxx00000001;
      expv[2] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxx00000001;
      expv[3] = 130'h03c0001380001d4000270000000000000;
      expv[4] = 130'h03c0001380001d4000270000000000000;
      expv[5] = 130'h03c0001380001d4000270000000000000;
      expv[6] = 130'h03c0001380001d4000270000000000000;
      expv[7] = 130'h03c0001380001d4000270000000000000;
      expv[8] = 130'h03c0001380001d4000270000000000000;
      expv[9] = 130'h03c0001380001d4000270000000000000;
      expv[10] = 130'h03c0001380001d4000270000000000000;
      expv[11] = 130'h03c0001380001d4000270000000000000;
      expv[12] = 130'h03c0001380001d4000270000000000000;
      expv[13] = 130'h03c0001380001d4000270000000000000;
      expv[14] = 130'h03c0001380001d4000270000000000000;
      expv[15] = 130'h03c0001380001d4000270000000000000;
      expv[16] = 130'h03c0001380001d4000270000000000000;
      expv[17] = 130'h03c0001380001d4000270000000000000;
      expv[18] = 130'h03c0001380001d4000270000000000000;
      expv[19] = 130'h03c0001380001d4000270000000000000;
      expv[20] = 130'h03c0001380001d4000270000000000000;
      expv[21] = 130'h03c0001380001d4000270000000000000;
      expv[22] = 130'h03c0001380001d4000270000000000000;
      expv[23] = 130'h03c0001380001d4000270000000000000;
      expv[24] = 130'h03c0001380001d4000270000000000000;
      expv[25] = 130'h03c0001380001d4000270000000000000;
      expv[26] = 130'h03c0001380001d4000270000000000000;
      expv[27] = 130'h03c0001380001d4000270000000000000;
      expv[28] = 130'h03c0001380001d4000270000000000000;
      expv[29] = 130'h03c0001380001d4000270000000000001;
      expv[30] = 130'h03c0001380001d4000270000000000000;
      expv[31] = 130'h03c0001380001d4000270000000000000;
      expv[32] = 130'h03c0001380001d4000270000000000000;
      expv[33] = 130'h03c0001380001d4000270000000000000;
      expv[34] = 130'h03c0001380001d4000270000000000000;
      expv[35] = 130'h03c0001380001d4000270000000000000;
      expv[36] = 130'h03c0001380001d4000270000000000000;
      expv[37] = 130'h03c0001380001d4000270000000000000;
      expv[38] = 130'h03c0001380001d4000270000000000000;
      expv[39] = 130'h03c0001380001d4000270000000000000;
      expv[40] = 130'h03c0001380001d4000270000000000000;
      expv[41] = 130'h03c0001380001d4000270000000000000;
      expv[42] = 130'h03c0001380001d4000270000000000000;
      expv[43] = 130'h03c0001380001d4000270000000000000;
      expv[44] = 130'h03c0001380001d4000270000000000000;
      expv[45] = 130'h03c0001380001d4000270000000000000;
      expv[46] = 130'h03c0001380001d4000270000000000000;
      expv[47] = 130'h03c0001380001d4000270000000000000;
      expv[48] = 130'h03c0001380001d4000270000000000000;
      expv[49] = 130'h03c0001380001d4000270000000000000;
      expv[50] = 130'h03c0001380001d4000270000000000000;
      expv[51] = 130'h03c0001380001d4000270000000000000;
      expv[52] = 130'h03c0001380001d4000270000000000000;
      expv[53] = 130'h03c0001380001d4000270000000000000;
      expv[54] = 130'h03c0001380001d4000270000000000000;
      expv[55] = 130'h03c0001380001d4000270000000000000;
      expv[56] = 130'h03c0001380001d4000270000000000001;
      expv[57] = 130'h03c0001380001d4000270000000000000;
      expv[58] = 130'h03c0001380001d4000270000000000000;
      expv[59] = 130'h03c0001380001d4000270000000000000;
      expv[60] = 130'h03c0001380001d4000270000000000000;
      expv[61] = 130'h03c0001380001d4000270000000000000;
      expv[62] = 130'h03c0001380001d4000270000000000000;
      expv[63] = 130'h03c0001380001d4000270000000000000;
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
