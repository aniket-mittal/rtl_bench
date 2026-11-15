// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_019089 dut (
    .rs1(in_vec[21:17]),
    .rs2(in_vec[16:12]),
    .equal(in_vec[11:11]),
    .rd_Ex(in_vec[10:6]),
    .reg_write_Ex(in_vec[5:5]),
    .jal(in_vec[4:4]),
    .jalr(in_vec[3:3]),
    .beq(in_vec[2:2]),
    .bneq(in_vec[1:1]),
    .mem_read_(in_vec[0:0]),
    .pc_mux(out_vec[4:3]),
    .IF_mux(out_vec[2:1]),
    .control_mux(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0e1732;
    stim[1] = 22'h2f8d84;
    stim[2] = 22'h11e6f5;
    stim[3] = 22'h01b021;
    stim[4] = 22'h182035;
    stim[5] = 22'h0ecb3b;
    stim[6] = 22'h20b22b;
    stim[7] = 22'h0dc9cf;
    stim[8] = 22'h353d39;
    stim[9] = 22'h20c031;
    stim[10] = 22'h3a5285;
    stim[11] = 22'h39b3e4;
    stim[12] = 22'h2c012c;
    stim[13] = 22'h092528;
    stim[14] = 22'h0b420b;
    stim[15] = 22'h3ee3f4;
    stim[16] = 22'h195a65;
    stim[17] = 22'h08506a;
    stim[18] = 22'h1056a9;
    stim[19] = 22'h3e176d;
    stim[20] = 22'h0ec958;
    stim[21] = 22'h234771;
    stim[22] = 22'h149bbb;
    stim[23] = 22'h32b3cf;
    stim[24] = 22'h3a1155;
    stim[25] = 22'h17659f;
    stim[26] = 22'h1c1715;
    stim[27] = 22'h025cc1;
    stim[28] = 22'h1e4b3a;
    stim[29] = 22'h1bbcf5;
    stim[30] = 22'h2ac2de;
    stim[31] = 22'h3a0e23;
    stim[32] = 22'h1a1be2;
    stim[33] = 22'h100293;
    stim[34] = 22'h0e008d;
    stim[35] = 22'h21f430;
    stim[36] = 22'h279c48;
    stim[37] = 22'h282479;
    stim[38] = 22'h1080a3;
    stim[39] = 22'h29acd6;
    stim[40] = 22'h0b306d;
    stim[41] = 22'h17f0c9;
    stim[42] = 22'h2b971e;
    stim[43] = 22'h138439;
    stim[44] = 22'h050487;
    stim[45] = 22'h368bd3;
    stim[46] = 22'h279c92;
    stim[47] = 22'h185017;
    stim[48] = 22'h370a08;
    stim[49] = 22'h256d5b;
    stim[50] = 22'h1b6ebc;
    stim[51] = 22'h0b6a12;
    stim[52] = 22'h184d78;
    stim[53] = 22'h1a4420;
    stim[54] = 22'h0ea554;
    stim[55] = 22'h1c8561;
    stim[56] = 22'h1672d0;
    stim[57] = 22'h1f9c9d;
    stim[58] = 22'h1de05f;
    stim[59] = 22'h2a4935;
    stim[60] = 22'h07ba2f;
    stim[61] = 22'h15d7dc;
    stim[62] = 22'h14c7ea;
    stim[63] = 22'h22ef8d;
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
      expv[0] = 5'h14;
      expv[1] = 5'h14;
      expv[2] = 5'h14;
      expv[3] = 5'h0b;
      expv[4] = 5'h14;
      expv[5] = 5'h0b;
      expv[6] = 5'h1c;
      expv[7] = 5'h1c;
      expv[8] = 5'h1c;
      expv[9] = 5'h14;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h1c;
      expv[13] = 5'h1c;
      expv[14] = 5'h1c;
      expv[15] = 5'h14;
      expv[16] = 5'h14;
      expv[17] = 5'h1c;
      expv[18] = 5'h1c;
      expv[19] = 5'h1c;
      expv[20] = 5'h1c;
      expv[21] = 5'h14;
      expv[22] = 5'h1c;
      expv[23] = 5'h1c;
      expv[24] = 5'h14;
      expv[25] = 5'h1c;
      expv[26] = 5'h14;
      expv[27] = 5'h00;
      expv[28] = 5'h1c;
      expv[29] = 5'h14;
      expv[30] = 5'h1c;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h14;
      expv[34] = 5'h1c;
      expv[35] = 5'h00;
      expv[36] = 5'h1c;
      expv[37] = 5'h1c;
      expv[38] = 5'h14;
      expv[39] = 5'h14;
      expv[40] = 5'h1c;
      expv[41] = 5'h1c;
      expv[42] = 5'h1c;
      expv[43] = 5'h1c;
      expv[44] = 5'h14;
      expv[45] = 5'h14;
      expv[46] = 5'h14;
      expv[47] = 5'h14;
      expv[48] = 5'h1c;
      expv[49] = 5'h1c;
      expv[50] = 5'h1c;
      expv[51] = 5'h14;
      expv[52] = 5'h1c;
      expv[53] = 5'h00;
      expv[54] = 5'h14;
      expv[55] = 5'h00;
      expv[56] = 5'h14;
      expv[57] = 5'h1c;
      expv[58] = 5'h1c;
      expv[59] = 5'h0b;
      expv[60] = 5'h1c;
      expv[61] = 5'h1c;
      expv[62] = 5'h1c;
      expv[63] = 5'h1c;
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
