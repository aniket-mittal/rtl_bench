// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03401 dut (
    .clk(clk),
    .rst(in_vec[42:42]),
    .ex_dst_reg(in_vec[41:37]),
    .mem_dst_reg(in_vec[36:32]),
    .id_rs(in_vec[31:27]),
    .id_rt(in_vec[26:22]),
    .wb_done_i(in_vec[21:21]),
    .mem_opcode(in_vec[20:15]),
    .ex_opcode(in_vec[14:9]),
    .id_opcode(in_vec[8:3]),
    .id_rt_is_source(in_vec[2:2]),
    .ex_reg_write(in_vec[1:1]),
    .mem_reg_write(in_vec[0:0]),
    .pstop_o(out_vec[3:3]),
    .pc_write(out_vec[2:2]),
    .if_id_write_en(out_vec[1:1]),
    .hazard_detected_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h474bd126a77;
    stim[1] = 43'h79ab8ed8ba4;
    stim[2] = 43'h15f44719b3f;
    stim[3] = 43'h1494e044879;
    stim[4] = 43'h1313478e347;
    stim[5] = 43'h1fb95b774a7;
    stim[6] = 43'h1e4fc067aae;
    stim[7] = 43'h1326beca54d;
    stim[8] = 43'h38af22fcdf5;
    stim[9] = 43'h357eeb3087a;
    stim[10] = 43'h19983ec0917;
    stim[11] = 43'h0cfb04a96f9;
    stim[12] = 43'h3083447e1ef;
    stim[13] = 43'h3ccece6c69d;
    stim[14] = 43'h0103ca8f899;
    stim[15] = 43'h24843ca20ab;
    stim[16] = 43'h240dfd68df7;
    stim[17] = 43'h0d2951c99fc;
    stim[18] = 43'h22d18b3688b;
    stim[19] = 43'h0e0c568ac06;
    stim[20] = 43'h177cf50bdd5;
    stim[21] = 43'h3b975de6c4a;
    stim[22] = 43'h39c82415f01;
    stim[23] = 43'h394d75fe462;
    stim[24] = 43'h2e4c41f0645;
    stim[25] = 43'h057b3b01af2;
    stim[26] = 43'h2388c394a92;
    stim[27] = 43'h17e10ffd6ed;
    stim[28] = 43'h30d9d6a577e;
    stim[29] = 43'h0fe608725f7;
    stim[30] = 43'h214b3b396c6;
    stim[31] = 43'h3fb66a4bd85;
    stim[32] = 43'h2cd9d0a580e;
    stim[33] = 43'h046856be773;
    stim[34] = 43'h39ce40ad9d8;
    stim[35] = 43'h11797ced076;
    stim[36] = 43'h126f8be59dd;
    stim[37] = 43'h1f4434ab97b;
    stim[38] = 43'h00414545d06;
    stim[39] = 43'h37e2644adaa;
    stim[40] = 43'h049bab1034b;
    stim[41] = 43'h21c463d957a;
    stim[42] = 43'h36bb8734ebc;
    stim[43] = 43'h0bd56ac1572;
    stim[44] = 43'h1d0b88bf4b7;
    stim[45] = 43'h21a6d519c1d;
    stim[46] = 43'h3ba450c8d19;
    stim[47] = 43'h11f72c4e05e;
    stim[48] = 43'h16abf9d6e7e;
    stim[49] = 43'h061e53cb179;
    stim[50] = 43'h29a42d5ac2e;
    stim[51] = 43'h266c7ec71a8;
    stim[52] = 43'h0ea9f6adbb3;
    stim[53] = 43'h1df389d67ab;
    stim[54] = 43'h0d4950c2161;
    stim[55] = 43'h30275959930;
    stim[56] = 43'h3d8c964eef8;
    stim[57] = 43'h2887bc7f918;
    stim[58] = 43'h0720bfe6d4a;
    stim[59] = 43'h3170d753631;
    stim[60] = 43'h28dca4ea56c;
    stim[61] = 43'h0f8498cf7b3;
    stim[62] = 43'h00df4eaea09;
    stim[63] = 43'h733c3a4774c;
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
      expv[0] = 4'h6;
      expv[1] = 4'h6;
      expv[2] = 4'h6;
      expv[3] = 4'h6;
      expv[4] = 4'h6;
      expv[5] = 4'h6;
      expv[6] = 4'h6;
      expv[7] = 4'h6;
      expv[8] = 4'h6;
      expv[9] = 4'h6;
      expv[10] = 4'h6;
      expv[11] = 4'h6;
      expv[12] = 4'h6;
      expv[13] = 4'h6;
      expv[14] = 4'h6;
      expv[15] = 4'h6;
      expv[16] = 4'h6;
      expv[17] = 4'h6;
      expv[18] = 4'h6;
      expv[19] = 4'h6;
      expv[20] = 4'h6;
      expv[21] = 4'h6;
      expv[22] = 4'h6;
      expv[23] = 4'h6;
      expv[24] = 4'h6;
      expv[25] = 4'h6;
      expv[26] = 4'h6;
      expv[27] = 4'h6;
      expv[28] = 4'h6;
      expv[29] = 4'h6;
      expv[30] = 4'h6;
      expv[31] = 4'h6;
      expv[32] = 4'h6;
      expv[33] = 4'h6;
      expv[34] = 4'h6;
      expv[35] = 4'h6;
      expv[36] = 4'h6;
      expv[37] = 4'h6;
      expv[38] = 4'h6;
      expv[39] = 4'h6;
      expv[40] = 4'h6;
      expv[41] = 4'h6;
      expv[42] = 4'h6;
      expv[43] = 4'h6;
      expv[44] = 4'h6;
      expv[45] = 4'h6;
      expv[46] = 4'h6;
      expv[47] = 4'he;
      expv[48] = 4'he;
      expv[49] = 4'he;
      expv[50] = 4'h6;
      expv[51] = 4'h6;
      expv[52] = 4'h6;
      expv[53] = 4'h6;
      expv[54] = 4'h6;
      expv[55] = 4'h6;
      expv[56] = 4'h6;
      expv[57] = 4'h6;
      expv[58] = 4'he;
      expv[59] = 4'h6;
      expv[60] = 4'h6;
      expv[61] = 4'h6;
      expv[62] = 4'h6;
      expv[63] = 4'h6;
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
