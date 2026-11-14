// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .i_clk(clk),
    .i_en(in_vec[45:45]),
    .i_init(in_vec[44:44]),
    .i_cnt7(in_vec[43:43]),
    .i_cnt_done(in_vec[42:42]),
    .i_sh_right(in_vec[41:41]),
    .i_lsb(in_vec[40:39]),
    .i_bytecnt(in_vec[38:37]),
    .i_op_b_sel(in_vec[36:36]),
    .i_shift_op(in_vec[35:35]),
    .i_rs2(in_vec[34:34]),
    .i_imm(in_vec[33:33]),
    .i_load(in_vec[32:32]),
    .i_dat(in_vec[31:0]),
    .o_sh_done(out_vec[34:34]),
    .o_op_b(out_vec[33:33]),
    .o_q(out_vec[32:32]),
    .o_dat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h05b3312e5cb2;
    stim[1] = 46'h395d850cb40e;
    stim[2] = 46'h2042931b0c02;
    stim[3] = 46'h3ad4f6c59444;
    stim[4] = 46'h1548b84ba652;
    stim[5] = 46'h1f8c1b983a44;
    stim[6] = 46'h16e8c2f8d38a;
    stim[7] = 46'h15f67d3fcde0;
    stim[8] = 46'h07021a749450;
    stim[9] = 46'h39c17d5f077c;
    stim[10] = 46'h05ac52394ac5;
    stim[11] = 46'h3a08ea23c902;
    stim[12] = 46'h094f31c6e591;
    stim[13] = 46'h3871a487707b;
    stim[14] = 46'h0fa5833d40a6;
    stim[15] = 46'h346c97e58b22;
    stim[16] = 46'h37ef84189e39;
    stim[17] = 46'h3117bcd2587a;
    stim[18] = 46'h3e54e0516315;
    stim[19] = 46'h123bff97554e;
    stim[20] = 46'h18d938c3e313;
    stim[21] = 46'h04817e69f7fe;
    stim[22] = 46'h28c9c794dcad;
    stim[23] = 46'h0ccc74e7fea9;
    stim[24] = 46'h247dd2313ab2;
    stim[25] = 46'h139520a7c3d3;
    stim[26] = 46'h0497e713b615;
    stim[27] = 46'h04f8d2cdb78d;
    stim[28] = 46'h1857da9430a2;
    stim[29] = 46'h05ed88e6306f;
    stim[30] = 46'h37d94144b984;
    stim[31] = 46'h1e79c2bf6b8b;
    stim[32] = 46'h1f6628b0817c;
    stim[33] = 46'h31582df5bce1;
    stim[34] = 46'h2fdd070f2285;
    stim[35] = 46'h17fa33a6d26d;
    stim[36] = 46'h2b04e8fd6be0;
    stim[37] = 46'h1b21213c16a5;
    stim[38] = 46'h23c66f667311;
    stim[39] = 46'h3133a39f2d80;
    stim[40] = 46'h268cc7b72325;
    stim[41] = 46'h3bc2583fee95;
    stim[42] = 46'h1e00058803bc;
    stim[43] = 46'h1cef80bf570a;
    stim[44] = 46'h39a1e6ef1c9e;
    stim[45] = 46'h070894566397;
    stim[46] = 46'h24a7eccb7b25;
    stim[47] = 46'h2e7c2db9ec19;
    stim[48] = 46'h35c756857bbd;
    stim[49] = 46'h11e8d00f74bb;
    stim[50] = 46'h39e2a05fb23f;
    stim[51] = 46'h30e52be591b9;
    stim[52] = 46'h002c92dd6016;
    stim[53] = 46'h1e27c1865ebb;
    stim[54] = 46'h2304ff41bda0;
    stim[55] = 46'h356bc51b49fb;
    stim[56] = 46'h1334e4f7b785;
    stim[57] = 46'h17deda4d601e;
    stim[58] = 46'h148b77c1e752;
    stim[59] = 46'h269f48fb1d7e;
    stim[60] = 46'h041628bd8ad3;
    stim[61] = 46'h2c93bf777212;
    stim[62] = 46'h17b14d483f28;
    stim[63] = 46'h00765269d335;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h2312e5cb2;
      expv[2] = 35'h2850cb40e;
      expv[3] = 35'h2c2865a07;
      expv[4] = 35'h1c1432d03;
      expv[5] = 35'h440432d03;
      expv[6] = 35'h53f432d03;
      expv[7] = 35'h23e432d03;
      expv[8] = 35'h73e432d03;
      expv[9] = 35'h1bd432d03;
      expv[10] = 35'h57d5f077c;
      expv[11] = 35'h43c5f077c;
      expv[12] = 35'h73b2f83be;
      expv[13] = 35'h131c6e591;
      expv[14] = 35'h4a487707b;
      expv[15] = 35'h0833d40a6;
      expv[16] = 35'h2423d40a6;
      expv[17] = 35'h284189e39;
      expv[18] = 35'h6bcd2587a;
      expv[19] = 35'h5fb692c3d;
      expv[20] = 35'h5ff97554e;
      expv[21] = 35'h138c3e313;
      expv[22] = 35'h57e69f7fe;
      expv[23] = 35'h0c794dcad;
      expv[24] = 35'h34694dcad;
      expv[25] = 35'h2d2313ab2;
      expv[26] = 35'h320a7c3d3;
      expv[27] = 35'h4e713b615;
      expv[28] = 35'h76613b615;
      expv[29] = 35'h0da9430a2;
      expv[30] = 35'h088e6306f;
      expv[31] = 35'h04144b984;
      expv[32] = 35'h3c2bf6b8b;
      expv[33] = 35'h5c1bf6b8b;
      expv[34] = 35'h3c1bf6b8b;
      expv[35] = 35'h1070f2285;
      expv[36] = 35'h1060f2285;
      expv[37] = 35'h105079142;
      expv[38] = 35'h7213c16a5;
      expv[39] = 35'h0a03c16a5;
      expv[40] = 35'h5a39f2d80;
      expv[41] = 35'h6629f2d80;
      expv[42] = 35'h4a19f2d80;
      expv[43] = 35'h3609f2d80;
      expv[44] = 35'h080bf570a;
      expv[45] = 35'h5e6ef1c9e;
      expv[46] = 35'h665ef1c9e;
      expv[47] = 35'h7eccb7b25;
      expv[48] = 35'h7ebcb7b25;
      expv[49] = 35'h456857bbd;
      expv[50] = 35'h656857bbd;
      expv[51] = 35'h556857bbd;
      expv[52] = 35'h52be591b9;
      expv[53] = 35'h72ae591b9;
      expv[54] = 35'h0c1865ebb;
      expv[55] = 35'h740c32f5d;
      expv[56] = 35'h3c51b49fb;
      expv[57] = 35'h2c41b49fb;
      expv[58] = 35'h3c31b49fb;
      expv[59] = 35'h777c1e752;
      expv[60] = 35'h648fb1d7e;
      expv[61] = 35'h548fb1d7e;
      expv[62] = 35'h5bf777212;
      expv[63] = 35'h64d483f28;
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
