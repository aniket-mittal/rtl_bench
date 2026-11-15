// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10893 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h098a2df9144;
    stim[1] = 42'h2441d0b20b6;
    stim[2] = 42'h24a61137763;
    stim[3] = 42'h062a7f306de;
    stim[4] = 42'h1073f384cb6;
    stim[5] = 42'h31290bcbdd4;
    stim[6] = 42'h019b5a6a630;
    stim[7] = 42'h1bd4a329cec;
    stim[8] = 42'h31a08b28760;
    stim[9] = 42'h12efc5f6add;
    stim[10] = 42'h269b4b7fab1;
    stim[11] = 42'h22842538735;
    stim[12] = 42'h22b24622e74;
    stim[13] = 42'h08a09752578;
    stim[14] = 42'h3e7244dd3c1;
    stim[15] = 42'h1d771a27b27;
    stim[16] = 42'h251058f9a5b;
    stim[17] = 42'h1be806dc52c;
    stim[18] = 42'h3b9d1c70a0d;
    stim[19] = 42'h24448116268;
    stim[20] = 42'h2be1725318d;
    stim[21] = 42'h23f7b02428a;
    stim[22] = 42'h15d768cc42b;
    stim[23] = 42'h1dae469bf56;
    stim[24] = 42'h23c5ba8c91b;
    stim[25] = 42'h06c2a10cb87;
    stim[26] = 42'h0c67f627a91;
    stim[27] = 42'h1bd85345152;
    stim[28] = 42'h142721b78d3;
    stim[29] = 42'h0d54483e04c;
    stim[30] = 42'h28d71300233;
    stim[31] = 42'h0f72f833ffd;
    stim[32] = 42'h267561419b4;
    stim[33] = 42'h34ad56d8fb4;
    stim[34] = 42'h3dc8a7eafb6;
    stim[35] = 42'h304b14fca53;
    stim[36] = 42'h0c488559532;
    stim[37] = 42'h13784fd8937;
    stim[38] = 42'h18db35ec2d5;
    stim[39] = 42'h3b760909b82;
    stim[40] = 42'h013546e3b8e;
    stim[41] = 42'h3cc7bc9db4c;
    stim[42] = 42'h051ee0911a7;
    stim[43] = 42'h2d93b2cf0f3;
    stim[44] = 42'h3772dd81538;
    stim[45] = 42'h2486913bd58;
    stim[46] = 42'h0b0542884ce;
    stim[47] = 42'h3328633a16f;
    stim[48] = 42'h25d41af4a54;
    stim[49] = 42'h2cc1338c8b8;
    stim[50] = 42'h0697ef1a32d;
    stim[51] = 42'h37e9b0bc104;
    stim[52] = 42'h259b76f1027;
    stim[53] = 42'h02e519ec821;
    stim[54] = 42'h16122f5d6bf;
    stim[55] = 42'h2d8f3444521;
    stim[56] = 42'h3af4965ce12;
    stim[57] = 42'h3e95cd0efd6;
    stim[58] = 42'h3c10ccd9ea9;
    stim[59] = 42'h3bfce469bd2;
    stim[60] = 42'h282a90600d0;
    stim[61] = 42'h28c3f7f7ecb;
    stim[62] = 42'h37027e92f9d;
    stim[63] = 42'h2759110c642;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'h039f9c265a0xx;
      expv[6] = 51'h039f9c265a000;
      expv[7] = 51'h039f9c265a000;
      expv[8] = 51'h039f9c265a000;
      expv[9] = 51'h039f9c265a000;
      expv[10] = 51'h039f9c265a000;
      expv[11] = 51'h039f9c265a000;
      expv[12] = 51'h039f9c265a000;
      expv[13] = 51'h039f9c265a000;
      expv[14] = 51'h039f9c265a000;
      expv[15] = 51'h039f9c265a000;
      expv[16] = 51'h039f9c265a000;
      expv[17] = 51'h039f9c265a000;
      expv[18] = 51'h039f9c265a000;
      expv[19] = 51'h5ce8e38506020;
      expv[20] = 51'h5ce8e38506000;
      expv[21] = 51'h5ce8e38506000;
      expv[22] = 51'h5ce8e38506000;
      expv[23] = 51'h5ce8e38506000;
      expv[24] = 51'h5ce8e38506000;
      expv[25] = 51'h1e2dd4648c001;
      expv[26] = 51'h1e2dd4648c000;
      expv[27] = 51'h1e2dd4648c000;
      expv[28] = 51'h1e2dd4648c000;
      expv[29] = 51'h1e2dd4648c000;
      expv[30] = 51'h1e2dd4648c000;
      expv[31] = 51'h46b8980118020;
      expv[32] = 51'h46b8980118000;
      expv[33] = 51'h46b8980118000;
      expv[34] = 51'h256ab6c7da000;
      expv[35] = 51'h256ab6c7da000;
      expv[36] = 51'h256ab6c7da000;
      expv[37] = 51'h256ab6c7da000;
      expv[38] = 51'h1bc27ec49a000;
      expv[39] = 51'h1bc27ec49a000;
      expv[40] = 51'h1bc27ec49a000;
      expv[41] = 51'h1bc27ec49a000;
      expv[42] = 51'h1bc27ec49a000;
      expv[43] = 51'h28f70488d2200;
      expv[44] = 51'h28f70488d2000;
      expv[45] = 51'h28f70488d2000;
      expv[46] = 51'h243489deac008;
      expv[47] = 51'h243489deac000;
      expv[48] = 51'h243489deac000;
      expv[49] = 51'h243489deac000;
      expv[50] = 51'h66099c645c800;
      expv[51] = 51'h66099c645c000;
      expv[52] = 51'h66099c645c000;
      expv[53] = 51'h66099c645c000;
      expv[54] = 51'h66099c645c000;
      expv[55] = 51'h66099c645c000;
      expv[56] = 51'h6c79a22290800;
      expv[57] = 51'h6c79a22290000;
      expv[58] = 51'h74ae6877ea400;
      expv[59] = 51'h74ae6877ea000;
      expv[60] = 51'h5fe7234de9000;
      expv[61] = 51'h5fe7234de8000;
      expv[62] = 51'h5fe7234de8000;
      expv[63] = 51'h3813f497ce004;
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
