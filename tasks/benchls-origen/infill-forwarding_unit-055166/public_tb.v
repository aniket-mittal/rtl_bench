// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055166 dut (
    .rs1_id(in_vec[38:34]),
    .rs2_id(in_vec[33:29]),
    .rs1_ex(in_vec[28:24]),
    .rs2_ex(in_vec[23:19]),
    .rd_ex(in_vec[18:14]),
    .rd_mem(in_vec[13:9]),
    .rd_wb(in_vec[8:4]),
    .RegWrite_ex(in_vec[3:3]),
    .RegWrite_mem(in_vec[2:2]),
    .RegWrite_wb(in_vec[1:1]),
    .AluSrcB_ex(in_vec[0:0]),
    .Forward_A_ex(out_vec[9:8]),
    .Forward_B_ex(out_vec[7:6]),
    .Forward_MemWriteData_ex(out_vec[5:4]),
    .Forward_RegWriteData_A_id(out_vec[3:2]),
    .Forward_RegWriteData_B_id(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h0825652c48;
    stim[1] = 39'h39667abd02;
    stim[2] = 39'h4389a73a0c;
    stim[3] = 39'h39d4079807;
    stim[4] = 39'h1695148114;
    stim[5] = 39'h7477098675;
    stim[6] = 39'h60ff78b6be;
    stim[7] = 39'h07d18415b8;
    stim[8] = 39'h4f1631967e;
    stim[9] = 39'h4ad80ea694;
    stim[10] = 39'h18cba8c8bb;
    stim[11] = 39'h1b785f8fff;
    stim[12] = 39'h3188dab12b;
    stim[13] = 39'h73b76fd1fa;
    stim[14] = 39'h021dbc57c3;
    stim[15] = 39'h626c97e61a;
    stim[16] = 39'h2cd707f6af;
    stim[17] = 39'h1363d4355e;
    stim[18] = 39'h4650feb6df;
    stim[19] = 39'h0100694a14;
    stim[20] = 39'h40490f4f47;
    stim[21] = 39'h7cd9b02ea8;
    stim[22] = 39'h63010e5c9c;
    stim[23] = 39'h295d35e6b9;
    stim[24] = 39'h28eed3ce3e;
    stim[25] = 39'h6e199a6e13;
    stim[26] = 39'h2547f98ea4;
    stim[27] = 39'h3f996e40a9;
    stim[28] = 39'h3465cd4382;
    stim[29] = 39'h5064f3eec6;
    stim[30] = 39'h6045857707;
    stim[31] = 39'h3a478f7897;
    stim[32] = 39'h679fed5c7d;
    stim[33] = 39'h4fed220a49;
    stim[34] = 39'h6fd4c57674;
    stim[35] = 39'h7203ab4877;
    stim[36] = 39'h79964fe588;
    stim[37] = 39'h5942c68c51;
    stim[38] = 39'h6f75c18919;
    stim[39] = 39'h7248c5a177;
    stim[40] = 39'h0adf37c9fa;
    stim[41] = 39'h073a1c711a;
    stim[42] = 39'h28b439b61a;
    stim[43] = 39'h713c0dbb02;
    stim[44] = 39'h7344e77bae;
    stim[45] = 39'h7fe3427f80;
    stim[46] = 39'h2190a01fb5;
    stim[47] = 39'h60bbbbbf3e;
    stim[48] = 39'h7c774789fb;
    stim[49] = 39'h38fecefae1;
    stim[50] = 39'h2318102e52;
    stim[51] = 39'h0bbb7664c2;
    stim[52] = 39'h06b0ca4af1;
    stim[53] = 39'h6786a1ae1c;
    stim[54] = 39'h7607426865;
    stim[55] = 39'h5d7f028c5f;
    stim[56] = 39'h7432256dd2;
    stim[57] = 39'h3b12a58798;
    stim[58] = 39'h563c2754b7;
    stim[59] = 39'h5f5c843b98;
    stim[60] = 39'h436914e2b4;
    stim[61] = 39'h4b877d356b;
    stim[62] = 39'h2794a26804;
    stim[63] = 39'h140476f76e;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h002;
      expv[3] = 10'h0c0;
      expv[4] = 10'h000;
      expv[5] = 10'h0c1;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h1c0;
      expv[11] = 10'h0c0;
      expv[12] = 10'h0c0;
      expv[13] = 10'h000;
      expv[14] = 10'h0c0;
      expv[15] = 10'h000;
      expv[16] = 10'h0c0;
      expv[17] = 10'h0a0;
      expv[18] = 10'h0c0;
      expv[19] = 10'h000;
      expv[20] = 10'h0c0;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h0c0;
      expv[24] = 10'h001;
      expv[25] = 10'h0c0;
      expv[26] = 10'h200;
      expv[27] = 10'h0c0;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h0d0;
      expv[31] = 10'h0c0;
      expv[32] = 10'h0c0;
      expv[33] = 10'h0c0;
      expv[34] = 10'h004;
      expv[35] = 10'h0c0;
      expv[36] = 10'h000;
      expv[37] = 10'h0c0;
      expv[38] = 10'h0c0;
      expv[39] = 10'h0c0;
      expv[40] = 10'h100;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h0c0;
      expv[47] = 10'h000;
      expv[48] = 10'h0c0;
      expv[49] = 10'h0c0;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h0c0;
      expv[53] = 10'h000;
      expv[54] = 10'h0c0;
      expv[55] = 10'h0c0;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h0c0;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h0c0;
      expv[62] = 10'h2a0;
      expv[63] = 10'h000;
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
