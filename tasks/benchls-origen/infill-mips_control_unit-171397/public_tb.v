// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_171397 dut (
    .opcode(in_vec[15:10]),
    .funct(in_vec[9:4]),
    .Less(in_vec[3:3]),
    .Gre(in_vec[2:2]),
    .Equ(in_vec[1:1]),
    .Judge(in_vec[0:0]),
    .NPCOp(out_vec[13:12]),
    .GRFWr(out_vec[11:11]),
    .EXTOp(out_vec[10:10]),
    .ALUOp(out_vec[9:8]),
    .DMWr(out_vec[7:7]),
    .A3Sel(out_vec[6:5]),
    .WDSel(out_vec[4:3]),
    .BSel(out_vec[2:2]),
    .Br(out_vec[1:1]),
    .Lah_Sel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h2b75;
    stim[1] = 16'hffbe;
    stim[2] = 16'he97c;
    stim[3] = 16'h0392;
    stim[4] = 16'hd5d8;
    stim[5] = 16'h66ea;
    stim[6] = 16'h582a;
    stim[7] = 16'hbcac;
    stim[8] = 16'h6413;
    stim[9] = 16'hec96;
    stim[10] = 16'h5377;
    stim[11] = 16'h0530;
    stim[12] = 16'h6904;
    stim[13] = 16'h4dfc;
    stim[14] = 16'h7710;
    stim[15] = 16'h8182;
    stim[16] = 16'h9360;
    stim[17] = 16'hef8a;
    stim[18] = 16'h3d27;
    stim[19] = 16'h9098;
    stim[20] = 16'h2c7b;
    stim[21] = 16'h4b03;
    stim[22] = 16'hbdab;
    stim[23] = 16'ha705;
    stim[24] = 16'hfe2d;
    stim[25] = 16'hb39a;
    stim[26] = 16'he8bd;
    stim[27] = 16'hb82a;
    stim[28] = 16'h3a06;
    stim[29] = 16'h8948;
    stim[30] = 16'h197d;
    stim[31] = 16'h30e2;
    stim[32] = 16'hc4ff;
    stim[33] = 16'h7c42;
    stim[34] = 16'h5a66;
    stim[35] = 16'h4376;
    stim[36] = 16'h5d05;
    stim[37] = 16'h5e7e;
    stim[38] = 16'h143e;
    stim[39] = 16'h74be;
    stim[40] = 16'h85d8;
    stim[41] = 16'hcb0a;
    stim[42] = 16'h5743;
    stim[43] = 16'hc192;
    stim[44] = 16'h9a7a;
    stim[45] = 16'h4c3f;
    stim[46] = 16'hfd58;
    stim[47] = 16'hd79e;
    stim[48] = 16'he6e2;
    stim[49] = 16'hd20c;
    stim[50] = 16'h0a38;
    stim[51] = 16'h0689;
    stim[52] = 16'h88a2;
    stim[53] = 16'hd41a;
    stim[54] = 16'h14ed;
    stim[55] = 16'h2138;
    stim[56] = 16'h61d5;
    stim[57] = 16'hf95a;
    stim[58] = 16'hb2e5;
    stim[59] = 16'hdb89;
    stim[60] = 16'h3d74;
    stim[61] = 16'hb7ac;
    stim[62] = 16'h5a7e;
    stim[63] = 16'ha4f5;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0f2c;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0821;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h0000;
      expv[36] = 14'h0000;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
      expv[60] = 14'h0f2c;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
