// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050140 dut (
    .EX_MemR(in_vec[31:31]),
    .EX_RegW(in_vec[30:30]),
    .EX_WeSel(in_vec[29:25]),
    .MEM_MemR(in_vec[24:24]),
    .MEM_RegW(in_vec[23:23]),
    .MEM_WeSel(in_vec[22:18]),
    .ID_oprs(in_vec[17:13]),
    .ID_oprt(in_vec[12:8]),
    .ID_Branch(in_vec[7:7]),
    .ID_BranchNE(in_vec[6:6]),
    .ID_jump(in_vec[5:5]),
    .ID_pcSel(in_vec[4:3]),
    .EX_Branch(in_vec[2:2]),
    .EX_BranchNE(in_vec[1:1]),
    .EX_jump(in_vec[0:0]),
    .Wr_PC(out_vec[8:8]),
    .Wr_IFID(out_vec[7:7]),
    .Wr_IDEX(out_vec[6:6]),
    .Wr_EXMEM(out_vec[5:5]),
    .Wr_MEMWB(out_vec[4:4]),
    .ClearCtrl_IDEX(out_vec[3:3]),
    .ClearCtrl_EXMEM(out_vec[2:2]),
    .ClearCtrl_MEMWB(out_vec[1:1]),
    .Bubble(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h06f3ba84;
    stim[1] = 32'hb45af954;
    stim[2] = 32'h26015472;
    stim[3] = 32'hb69fbca2;
    stim[4] = 32'h6d806129;
    stim[5] = 32'h6ac375f7;
    stim[6] = 32'h1cf32353;
    stim[7] = 32'h6b40dab8;
    stim[8] = 32'h762392fd;
    stim[9] = 32'h2e45e11a;
    stim[10] = 32'hf7ea6f06;
    stim[11] = 32'h946b03ca;
    stim[12] = 32'hfd007bc6;
    stim[13] = 32'h7e0ef099;
    stim[14] = 32'hbeb40822;
    stim[15] = 32'hfe245e94;
    stim[16] = 32'hbee14170;
    stim[17] = 32'h139f9039;
    stim[18] = 32'hc461eb66;
    stim[19] = 32'h532b963b;
    stim[20] = 32'hecc4d1d6;
    stim[21] = 32'h7b574d43;
    stim[22] = 32'h14132412;
    stim[23] = 32'h8ccd6f43;
    stim[24] = 32'hc6a3909f;
    stim[25] = 32'h59dedc1a;
    stim[26] = 32'h884f03ff;
    stim[27] = 32'h111e6909;
    stim[28] = 32'hedf2c3bf;
    stim[29] = 32'h4dde77a3;
    stim[30] = 32'h72c45f3d;
    stim[31] = 32'h98253110;
    stim[32] = 32'h8f822a4c;
    stim[33] = 32'ha5ca9829;
    stim[34] = 32'h7e0a15af;
    stim[35] = 32'h0b8136f0;
    stim[36] = 32'hcf8672af;
    stim[37] = 32'h6daa2ed5;
    stim[38] = 32'hf4b58e80;
    stim[39] = 32'ha2064ace;
    stim[40] = 32'h1f7c0a71;
    stim[41] = 32'hd77e9572;
    stim[42] = 32'h3aec72f2;
    stim[43] = 32'hc9012296;
    stim[44] = 32'h9b2b9d9c;
    stim[45] = 32'h1df3832f;
    stim[46] = 32'h9c821c4d;
    stim[47] = 32'h8a14484c;
    stim[48] = 32'h1ef5df09;
    stim[49] = 32'h78e8c416;
    stim[50] = 32'h138d2c87;
    stim[51] = 32'h99d4b793;
    stim[52] = 32'h65c087ef;
    stim[53] = 32'h7a8fb5aa;
    stim[54] = 32'h2baa77c3;
    stim[55] = 32'h289654b8;
    stim[56] = 32'h42b1d2f5;
    stim[57] = 32'hfd7dad97;
    stim[58] = 32'h0ef39c19;
    stim[59] = 32'h74a8d966;
    stim[60] = 32'h802341dd;
    stim[61] = 32'h856beef8;
    stim[62] = 32'h34706f01;
    stim[63] = 32'h52449e90;
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
      expv[0] = 9'h1f9;
      expv[1] = 9'h1f9;
      expv[2] = 9'h1f9;
      expv[3] = 9'h1f9;
      expv[4] = 9'h1f9;
      expv[5] = 9'h078;
      expv[6] = 9'h1f9;
      expv[7] = 9'h1f0;
      expv[8] = 9'h1f9;
      expv[9] = 9'h1f9;
      expv[10] = 9'h1f9;
      expv[11] = 9'h1f9;
      expv[12] = 9'h1f9;
      expv[13] = 9'h1f9;
      expv[14] = 9'h1f9;
      expv[15] = 9'h1f9;
      expv[16] = 9'h1f0;
      expv[17] = 9'h1f9;
      expv[18] = 9'h1f9;
      expv[19] = 9'h1f9;
      expv[20] = 9'h078;
      expv[21] = 9'h1f9;
      expv[22] = 9'h1f9;
      expv[23] = 9'h1f9;
      expv[24] = 9'h1f9;
      expv[25] = 9'h1f9;
      expv[26] = 9'h1f9;
      expv[27] = 9'h1f9;
      expv[28] = 9'h078;
      expv[29] = 9'h078;
      expv[30] = 9'h1f9;
      expv[31] = 9'h1f0;
      expv[32] = 9'h1f9;
      expv[33] = 9'h1f9;
      expv[34] = 9'h1f9;
      expv[35] = 9'h1f0;
      expv[36] = 9'h1f9;
      expv[37] = 9'h1f9;
      expv[38] = 9'h1f0;
      expv[39] = 9'h1f9;
      expv[40] = 9'h1f9;
      expv[41] = 9'h1f9;
      expv[42] = 9'h1f9;
      expv[43] = 9'h1f9;
      expv[44] = 9'h1f9;
      expv[45] = 9'h078;
      expv[46] = 9'h1f9;
      expv[47] = 9'h1f9;
      expv[48] = 9'h1f9;
      expv[49] = 9'h1f9;
      expv[50] = 9'h1f9;
      expv[51] = 9'h1f9;
      expv[52] = 9'h1f9;
      expv[53] = 9'h078;
      expv[54] = 9'h1f9;
      expv[55] = 9'h1f0;
      expv[56] = 9'h1f9;
      expv[57] = 9'h1f9;
      expv[58] = 9'h1f9;
      expv[59] = 9'h1f9;
      expv[60] = 9'h1f9;
      expv[61] = 9'h1f0;
      expv[62] = 9'h1f9;
      expv[63] = 9'h1f0;
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
