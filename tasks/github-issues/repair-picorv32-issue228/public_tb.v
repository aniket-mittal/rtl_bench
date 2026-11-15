// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 307;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  picorv32 dut (
    .clk(clk),
    .resetn(in_vec[100:100]),
    .mem_ready(in_vec[99:99]),
    .mem_rdata(in_vec[98:67]),
    .pcpi_wr(in_vec[66:66]),
    .pcpi_rd(in_vec[65:34]),
    .pcpi_wait(in_vec[33:33]),
    .pcpi_ready(in_vec[32:32]),
    .irq(in_vec[31:0]),
    .trap(out_vec[306:306]),
    .mem_valid(out_vec[305:305]),
    .mem_instr(out_vec[304:304]),
    .mem_addr(out_vec[303:272]),
    .mem_wdata(out_vec[271:240]),
    .mem_wstrb(out_vec[239:236]),
    .mem_la_read(out_vec[235:235]),
    .mem_la_write(out_vec[234:234]),
    .mem_la_addr(out_vec[233:202]),
    .mem_la_wdata(out_vec[201:170]),
    .mem_la_wstrb(out_vec[169:166]),
    .pcpi_valid(out_vec[165:165]),
    .pcpi_insn(out_vec[164:133]),
    .pcpi_rs1(out_vec[132:101]),
    .pcpi_rs2(out_vec[100:69]),
    .eoi(out_vec[68:37]),
    .trace_valid(out_vec[36:36]),
    .trace_data(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h036073641dba52d34bf4eb8081;
    stim[1] = 101'h0767a886bb456c05d7531cee99;
    stim[2] = 101'h16a4528e7d1d82e4572769b793;
    stim[3] = 101'h18e17c240c75b4f823671d501e;
    stim[4] = 101'h142fe74f8bb086adb593915aed;
    stim[5] = 101'h1ed5e3947b38f24bcc59ec83a4;
    stim[6] = 101'h190771587203dce969be6f58a3;
    stim[7] = 101'h16266a33361c14ed870bf0c236;
    stim[8] = 101'h1f0760204f8b2de545602dd678;
    stim[9] = 101'h125d80aba51bc84864087532e2;
    stim[10] = 101'h1b731175999b8a47f535fd837c;
    stim[11] = 101'h1c0dcbe1c2252cbb07192750b1;
    stim[12] = 101'h12a602ef44c744d34cf209122a;
    stim[13] = 101'h133505dc19a154cbce56c6a6a0;
    stim[14] = 101'h1e9c24c9256fe816a4702a4aa6;
    stim[15] = 101'h1ee2529bf85701c70355269b05;
    stim[16] = 101'h1e223fcef48f9e8f3fa0bf2d7c;
    stim[17] = 101'h17fd183994201d213bbacb2262;
    stim[18] = 101'h1af9e815728017a0daeed8644d;
    stim[19] = 101'h1515dfed871a94f8112e273bbb;
    stim[20] = 101'h1565af174297c042a59864c5c2;
    stim[21] = 101'h12bfa29ea2c0a00dcf7dfb29e8;
    stim[22] = 101'h1faef78df36049ada47beb17f5;
    stim[23] = 101'h1f754ba0f1286401e7d6cd79b0;
    stim[24] = 101'h17b40c3e98f4fafd311ba08e3b;
    stim[25] = 101'h14794087acb13e02314570097b;
    stim[26] = 101'h17cef4e1d518878651d91e9d19;
    stim[27] = 101'h1eccfa616bb31b88e452f38709;
    stim[28] = 101'h1de3be75f4001129c10675d4d3;
    stim[29] = 101'h18f84a78f061bf3c9bda180179;
    stim[30] = 101'h161d80a6c9f3b443fd2d48e1d4;
    stim[31] = 101'h15ed85cc38f5f2a953c6fbd858;
    stim[32] = 101'h1dc298b802392244f58c1ffeaf;
    stim[33] = 101'h107fe579f1555a45d5b574a2c5;
    stim[34] = 101'h1a1360a7792a30908b4c52a5e4;
    stim[35] = 101'h176a7be2e65948b32f7f205734;
    stim[36] = 101'h1e98820fa4ea5feb184d6ffff0;
    stim[37] = 101'h1203677d0659c20915327e236e;
    stim[38] = 101'h1c38b42a17074f5e041a833511;
    stim[39] = 101'h10f97436bf1d1a7e6253603c3b;
    stim[40] = 101'h12ba8706a02a10b7b92c744924;
    stim[41] = 101'h1e9aa2f6f32d4b041b567b3ded;
    stim[42] = 101'h1de13328eca7a023a5ac608628;
    stim[43] = 101'h16fda8a86a9ed9c3fd1cf0a359;
    stim[44] = 101'h11d26d091234bf7890a1481863;
    stim[45] = 101'h1b6a6fa4d9d95f6883c2d993d7;
    stim[46] = 101'h1169bc8cc803b9a2b8dcbfab1e;
    stim[47] = 101'h1fc0dc4adb6d666c9e27c1f14f;
    stim[48] = 101'h1cef7f0e1bc01ce81a498afef9;
    stim[49] = 101'h144309cfda43c3d2238a58aa1b;
    stim[50] = 101'h1c45145562e92f31b52e8956b9;
    stim[51] = 101'h12f713fa6f6f98e2f38c8a05a2;
    stim[52] = 101'h14423bc46c7b5e09ce889c62c7;
    stim[53] = 101'h10920abc1c8ee171fcc8bf8bba;
    stim[54] = 101'h1b64721bf87b0d8da24edce1cd;
    stim[55] = 101'h1380557eae5f2a3b1522fbd61f;
    stim[56] = 101'h1ff0f043ccd65d7dfe7c5ae9c1;
    stim[57] = 101'h120b9478c1635de431be51e42d;
    stim[58] = 101'h1e48c9704c066e215e1e04825a;
    stim[59] = 101'h1f8d0096e28f9652f2726fd0e9;
    stim[60] = 101'h132476574d07fa40302e7c35fb;
    stim[61] = 101'h1357ae91d5d2785734f19f6ab9;
    stim[62] = 101'h1df37f807b49f5954089746b68;
    stim[63] = 101'h1ab48569ef68a8f1a505041842;
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
      expv[0] = 307'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 307'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[2] = 307'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[3] = 307'hxxxxxxxxxxxxxxxxxx80000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[4] = 307'h300000000xxxxxxxx000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[5] = 307'h300000000xxxxxxxx000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[6] = 307'h100000000xxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[7] = 307'h100000000xxxxxxxx080000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[8] = 307'h300000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[9] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[10] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[11] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[12] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[13] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[14] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[15] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[16] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[17] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[18] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[19] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[20] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[21] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[22] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[23] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[24] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[25] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[26] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[27] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[28] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[29] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[30] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[31] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[32] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[33] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[34] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[35] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[36] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[37] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[38] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[39] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[40] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[41] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[42] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[43] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[44] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[45] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[46] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[47] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[48] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[49] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[50] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[51] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[52] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[53] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[54] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[55] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[56] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[57] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[58] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[59] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[60] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[61] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[62] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
      expv[63] = 307'h500000004xxxxxxxx000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00000000xxxxxxxxx;
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
