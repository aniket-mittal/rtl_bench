// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
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
    .i_instr(in_vec[32:1]),
    .i_ack(in_vec[0:0]),
    .o_instr(out_vec[32:1]),
    .o_iscomp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1caf75771;
    stim[1] = 33'h0e95be557;
    stim[2] = 33'h0fb2a1586;
    stim[3] = 33'h154c719a7;
    stim[4] = 33'h16606c08d;
    stim[5] = 33'h007d72ead;
    stim[6] = 33'h00e87282c;
    stim[7] = 33'h062665b8c;
    stim[8] = 33'h04740cb89;
    stim[9] = 33'h03b1c8742;
    stim[10] = 33'h0949fd493;
    stim[11] = 33'h05d3ef298;
    stim[12] = 33'h0fc2b8bed;
    stim[13] = 33'h12bf53a48;
    stim[14] = 33'h1359145c4;
    stim[15] = 33'h03d68f34a;
    stim[16] = 33'h14f829d09;
    stim[17] = 33'h1b814a417;
    stim[18] = 33'h0f7323029;
    stim[19] = 33'h17dc88884;
    stim[20] = 33'h034225867;
    stim[21] = 33'h0c791c57c;
    stim[22] = 33'h102a1efda;
    stim[23] = 33'h19638035c;
    stim[24] = 33'h0c73ea459;
    stim[25] = 33'h0bffb6c77;
    stim[26] = 33'h0abae7a7c;
    stim[27] = 33'h1229cc632;
    stim[28] = 33'h0319617bf;
    stim[29] = 33'h1173e2223;
    stim[30] = 33'h1861bb622;
    stim[31] = 33'h18e11ce49;
    stim[32] = 33'h13b9856ca;
    stim[33] = 33'h187bc0276;
    stim[34] = 33'h1547f6133;
    stim[35] = 33'h002d8dcf0;
    stim[36] = 33'h1566ad100;
    stim[37] = 33'h02d0d0a99;
    stim[38] = 33'h0c9dd9a50;
    stim[39] = 33'h0a5b34762;
    stim[40] = 33'h00862e8f2;
    stim[41] = 33'h1d878b996;
    stim[42] = 33'h1403228f6;
    stim[43] = 33'h0cbf49b12;
    stim[44] = 33'h1d23cdfe1;
    stim[45] = 33'h12206615a;
    stim[46] = 33'h02048dafa;
    stim[47] = 33'h0a1434e19;
    stim[48] = 33'h00699f3ab;
    stim[49] = 33'h00cc48f3d;
    stim[50] = 33'h026f5d837;
    stim[51] = 33'h1d9ee8138;
    stim[52] = 33'h1a95d85c9;
    stim[53] = 33'h0966f509f;
    stim[54] = 33'h10dba1918;
    stim[55] = 33'h1c3a34f12;
    stim[56] = 33'h13d957e24;
    stim[57] = 33'h019eb8074;
    stim[58] = 33'h189d48fe4;
    stim[59] = 33'h1402ba599;
    stim[60] = 33'h0f7aee555;
    stim[61] = 33'h1d9d128d5;
    stim[62] = 33'h0dcdadfa0;
    stim[63] = 33'h153b87690;
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
      expv[0] = 33'h1caf7577x;
      expv[1] = 33'h0e95be556;
      expv[2] = 33'h0fb2a1586;
      expv[3] = 33'h154c719a6;
      expv[4] = 33'h00a024006;
      expv[5] = 33'h002ae0e67;
      expv[6] = 33'h000a80867;
      expv[7] = 33'h0023b3b27;
      expv[8] = 33'h0018b4907;
      expv[9] = 33'h001000727;
      expv[10] = 33'h0100c32c7;
      expv[11] = 33'h0068a4b07;
      expv[12] = 33'h01ba24847;
      expv[13] = 33'h12bf53a49;
      expv[14] = 33'h003000567;
      expv[15] = 33'h1fffd336f;
      expv[16] = 33'h0030d4907;
      expv[17] = 33'h1b814a417;
      expv[18] = 33'h006010d26;
      expv[19] = 33'h002024807;
      expv[20] = 33'h034225867;
      expv[21] = 33'h009e24446;
      expv[22] = 33'h1fc0f2bc6;
      expv[23] = 33'h001632326;
      expv[24] = 33'h00c0c4b06;
      expv[25] = 33'h0bffb6c77;
      expv[26] = 33'h001fa3a26;
      expv[27] = 33'h00000c66e;
      expv[28] = 33'h0319617be;
      expv[29] = 33'h1fc820226;
      expv[30] = 33'h1e00e15c7;
      expv[31] = 33'h0092e4847;
      expv[32] = 33'h0b70001df;
      expv[33] = 33'h187bc0277;
      expv[34] = 33'h108ffe0df;
      expv[35] = 33'h00b8c4e07;
      expv[36] = 33'h002094807;
      expv[37] = 33'h02d0d0a99;
      expv[38] = 33'h0094a5846;
      expv[39] = 33'h0a98000de;
      expv[40] = 33'h1ffffc86e;
      expv[41] = 33'h1d878b996;
      expv[42] = 33'h1403228f6;
      expv[43] = 33'h000401b26;
      expv[44] = 33'h00b8f4c06;
      expv[45] = 33'h10d7fe1df;
      expv[46] = 33'h00003fa6f;
      expv[47] = 33'h0a1434e19;
      expv[48] = 33'h1f40b35c6;
      expv[49] = 33'h018824f07;
      expv[50] = 33'h026f5d837;
      expv[51] = 33'h000094f06;
      expv[52] = 33'h0092d4446;
      expv[53] = 33'h0966f509f;
      expv[54] = 33'h04a010b26;
      expv[55] = 33'h0e84000de;
      expv[56] = 33'h0009e1e66;
      expv[57] = 33'h001c24046;
      expv[58] = 33'h003824f06;
      expv[59] = 33'h0056d4446;
      expv[60] = 33'h015024507;
      expv[61] = 33'h003480867;
      expv[62] = 33'h0038f4c07;
      expv[63] = 33'h036810a27;
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
