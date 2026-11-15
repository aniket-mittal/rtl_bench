// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07014 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h1ccf7f61f81;
    stim[1] = 42'h111d9b67c34;
    stim[2] = 42'h0ea26e47a46;
    stim[3] = 42'h2ad8f996d59;
    stim[4] = 42'h05604e7c59d;
    stim[5] = 42'h1b234f3b1ce;
    stim[6] = 42'h3d2d54cec5a;
    stim[7] = 42'h0d14c304f93;
    stim[8] = 42'h2edff7e8ea2;
    stim[9] = 42'h3e9d52fc66c;
    stim[10] = 42'h36b1f7b56ef;
    stim[11] = 42'h137a366005d;
    stim[12] = 42'h2053a3281f0;
    stim[13] = 42'h08d9787c7fe;
    stim[14] = 42'h057954d32a2;
    stim[15] = 42'h29544497e90;
    stim[16] = 42'h1c3d80b5a27;
    stim[17] = 42'h1726ed12416;
    stim[18] = 42'h20fdb972d10;
    stim[19] = 42'h38bcd5fb2f2;
    stim[20] = 42'h3022bea2c7e;
    stim[21] = 42'h29c673e8e47;
    stim[22] = 42'h3e3b754a36b;
    stim[23] = 42'h24ec5460a33;
    stim[24] = 42'h15f9879afb0;
    stim[25] = 42'h3e87551a6f7;
    stim[26] = 42'h0fe785901dc;
    stim[27] = 42'h21032d9b7ec;
    stim[28] = 42'h33e6fe3e530;
    stim[29] = 42'h35c6434bc05;
    stim[30] = 42'h1dec3453d6c;
    stim[31] = 42'h276bf7eeebf;
    stim[32] = 42'h2ea0e162d24;
    stim[33] = 42'h1b9cb86f878;
    stim[34] = 42'h3864cd37a2a;
    stim[35] = 42'h28b2525a7f5;
    stim[36] = 42'h309e805b43d;
    stim[37] = 42'h0134cc7573e;
    stim[38] = 42'h1086fa7fdd5;
    stim[39] = 42'h04a5f4f90f6;
    stim[40] = 42'h3604dbf9ac4;
    stim[41] = 42'h2f3018490e7;
    stim[42] = 42'h2fb644b6b9f;
    stim[43] = 42'h0b24d3e0a52;
    stim[44] = 42'h3d5dc9dfc90;
    stim[45] = 42'h30002ad99bf;
    stim[46] = 42'h198acd8ed09;
    stim[47] = 42'h364998a39c2;
    stim[48] = 42'h192010cc536;
    stim[49] = 42'h19a4dc7e7f5;
    stim[50] = 42'h191cd3f5b30;
    stim[51] = 42'h26b37feb459;
    stim[52] = 42'h2fd4cbc62f1;
    stim[53] = 42'h134689bf24e;
    stim[54] = 42'h05a3839b4aa;
    stim[55] = 42'h2e95c325c67;
    stim[56] = 42'h38b6f8a7d16;
    stim[57] = 42'h30239a2de4c;
    stim[58] = 42'h22f61d480c0;
    stim[59] = 42'h2a4b558daf2;
    stim[60] = 42'h3b95d563cf9;
    stim[61] = 42'h3974e63d7b8;
    stim[62] = 42'h33621dd6e12;
    stim[63] = 42'h1acc3c65f45;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxx00;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hb234f3b1cxx0;
      expv[7] = 48'hb234f3b1cc00;
      expv[8] = 48'hb234f3b1cc00;
      expv[9] = 48'hedff7e8ea010;
      expv[10] = 48'hedff7e8ea000;
      expv[11] = 48'hedff7e8ea000;
      expv[12] = 48'hedff7e8ea000;
      expv[13] = 48'hedff7e8ea000;
      expv[14] = 48'h8d9787c7fc01;
      expv[15] = 48'h8d9787c7fc00;
      expv[16] = 48'h8d9787c7fc00;
      expv[17] = 48'hc3d80b5a2401;
      expv[18] = 48'hc3d80b5a2400;
      expv[19] = 48'hc3d80b5a2400;
      expv[20] = 48'h8bcd5fb2f010;
      expv[21] = 48'h8bcd5fb2f000;
      expv[22] = 48'h8bcd5fb2f000;
      expv[23] = 48'he3b754a36800;
      expv[24] = 48'he3b754a36800;
      expv[25] = 48'he3b754a36800;
      expv[26] = 48'he3b754a36800;
      expv[27] = 48'he3b754a36800;
      expv[28] = 48'he3b754a36800;
      expv[29] = 48'h3e6fe3e53010;
      expv[30] = 48'h3e6fe3e53000;
      expv[31] = 48'h3e6fe3e53000;
      expv[32] = 48'h3e6fe3e53000;
      expv[33] = 48'h3e6fe3e53000;
      expv[34] = 48'h3e6fe3e53000;
      expv[35] = 48'h864cd37a2810;
      expv[36] = 48'h864cd37a2800;
      expv[37] = 48'h864cd37a2800;
      expv[38] = 48'h134cc7573c10;
      expv[39] = 48'h134cc7573c00;
      expv[40] = 48'h134cc7573c00;
      expv[41] = 48'h604dbf9ac400;
      expv[42] = 48'h604dbf9ac400;
      expv[43] = 48'hfb644b6b9c80;
      expv[44] = 48'hfb644b6b9c00;
      expv[45] = 48'hd5dc9dfc9000;
      expv[46] = 48'hd5dc9dfc9000;
      expv[47] = 48'hd5dc9dfc9000;
      expv[48] = 48'hd5dc9dfc9000;
      expv[49] = 48'h92010cc53400;
      expv[50] = 48'h92010cc53400;
      expv[51] = 48'h91cd3f5b3000;
      expv[52] = 48'h91cd3f5b3000;
      expv[53] = 48'h91cd3f5b3000;
      expv[54] = 48'h91cd3f5b3000;
      expv[55] = 48'h91cd3f5b3000;
      expv[56] = 48'h91cd3f5b3000;
      expv[57] = 48'h8b6f8a7d1401;
      expv[58] = 48'h8b6f8a7d1400;
      expv[59] = 48'h8b6f8a7d1400;
      expv[60] = 48'h8b6f8a7d1400;
      expv[61] = 48'h8b6f8a7d1400;
      expv[62] = 48'h8b6f8a7d1400;
      expv[63] = 48'h3621dd6e1008;
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
