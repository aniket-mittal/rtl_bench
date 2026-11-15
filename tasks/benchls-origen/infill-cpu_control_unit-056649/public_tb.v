// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056649 dut (
    .IR_opcode(in_vec[20:13]),
    .IR_oldopcode(in_vec[12:9]),
    .EXEC1(in_vec[8:8]),
    .EXEC2(in_vec[7:7]),
    .EXEC3(in_vec[6:6]),
    .EQ(in_vec[5:5]),
    .MI(in_vec[4:4]),
    .CMPFlag(in_vec[3:0]),
    .PC_sync_load(out_vec[16:16]),
    .PC_count_enable(out_vec[15:15]),
    .MUX1_select(out_vec[14:13]),
    .RAM_write_enable(out_vec[12:12]),
    .MUX2sel(out_vec[11:10]),
    .MUXLsel(out_vec[9:8]),
    .EXTRA1(out_vec[7:7]),
    .EXTRA2(out_vec[6:6]),
    .SpMux(out_vec[5:4]),
    .SP_Cnt(out_vec[3:2]),
    .pushpop(out_vec[1:1]),
    .ldnsel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1a714c;
    stim[1] = 21'h128ac2;
    stim[2] = 21'h0a5534;
    stim[3] = 21'h129fcc;
    stim[4] = 21'h1ef8c3;
    stim[5] = 21'h102aa1;
    stim[6] = 21'h1f3b07;
    stim[7] = 21'h0ac845;
    stim[8] = 21'h14411b;
    stim[9] = 21'h04ab8d;
    stim[10] = 21'h1238ee;
    stim[11] = 21'h190839;
    stim[12] = 21'h0fe16d;
    stim[13] = 21'h1ac7d7;
    stim[14] = 21'h13e97c;
    stim[15] = 21'h0f5c1b;
    stim[16] = 21'h0c069e;
    stim[17] = 21'h007536;
    stim[18] = 21'h1a7af7;
    stim[19] = 21'h0bf4de;
    stim[20] = 21'h013030;
    stim[21] = 21'h165a65;
    stim[22] = 21'h049e51;
    stim[23] = 21'h04145c;
    stim[24] = 21'h0d6771;
    stim[25] = 21'h0332aa;
    stim[26] = 21'h170474;
    stim[27] = 21'h092548;
    stim[28] = 21'h0b50fa;
    stim[29] = 21'h124c73;
    stim[30] = 21'h1c9518;
    stim[31] = 21'h0362e0;
    stim[32] = 21'h107acd;
    stim[33] = 21'h1b2e33;
    stim[34] = 21'h151192;
    stim[35] = 21'h09d7e8;
    stim[36] = 21'h0323dd;
    stim[37] = 21'h057eff;
    stim[38] = 21'h18e11e;
    stim[39] = 21'h19b1d6;
    stim[40] = 21'h0ec29c;
    stim[41] = 21'h1d53ee;
    stim[42] = 21'h1fb231;
    stim[43] = 21'h19953d;
    stim[44] = 21'h0b4dc7;
    stim[45] = 21'h17e980;
    stim[46] = 21'h0c1e59;
    stim[47] = 21'h1afcf5;
    stim[48] = 21'h080019;
    stim[49] = 21'h1d6126;
    stim[50] = 21'h0c1e11;
    stim[51] = 21'h020984;
    stim[52] = 21'h1eca36;
    stim[53] = 21'h10f2e9;
    stim[54] = 21'h1d2dbd;
    stim[55] = 21'h033301;
    stim[56] = 21'h1d4bb8;
    stim[57] = 21'h01ef5b;
    stim[58] = 21'h006e27;
    stim[59] = 21'h1d93a2;
    stim[60] = 21'h1fe0c6;
    stim[61] = 21'h137470;
    stim[62] = 21'h18ad40;
    stim[63] = 21'h14923e;
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
      expv[0] = 17'h0401a;
      expv[1] = 17'h04040;
      expv[2] = 17'h0a000;
      expv[3] = 17'h0c041;
      expv[4] = 17'h00040;
      expv[5] = 17'h04040;
      expv[6] = 17'h00000;
      expv[7] = 17'h02000;
      expv[8] = 17'h14000;
      expv[9] = 17'h0a5c0;
      expv[10] = 17'h04040;
      expv[11] = 17'h04000;
      expv[12] = 17'h00000;
      expv[13] = 17'h1405a;
      expv[14] = 17'h14000;
      expv[15] = 17'h00000;
      expv[16] = 17'h025c0;
      expv[17] = 17'h0a000;
      expv[18] = 17'h14058;
      expv[19] = 17'h025c0;
      expv[20] = 17'h02000;
      expv[21] = 17'h04000;
      expv[22] = 17'h02001;
      expv[23] = 17'h02000;
      expv[24] = 17'h0a000;
      expv[25] = 17'h03540;
      expv[26] = 17'h04000;
      expv[27] = 17'h0a000;
      expv[28] = 17'h025c0;
      expv[29] = 17'h04000;
      expv[30] = 17'h00000;
      expv[31] = 17'h03500;
      expv[32] = 17'h04040;
      expv[33] = 17'h04018;
      expv[34] = 17'h14040;
      expv[35] = 17'h0a5c0;
      expv[36] = 17'h0b540;
      expv[37] = 17'h025c1;
      expv[38] = 17'h0c000;
      expv[39] = 17'h0c040;
      expv[40] = 17'h00040;
      expv[41] = 17'h00040;
      expv[42] = 17'h00000;
      expv[43] = 17'h0c000;
      expv[44] = 17'h0a5c0;
      expv[45] = 17'h0c000;
      expv[46] = 17'h02001;
      expv[47] = 17'h14058;
      expv[48] = 17'h02000;
      expv[49] = 17'h00000;
      expv[50] = 17'h02000;
      expv[51] = 17'h0b540;
      expv[52] = 17'h00000;
      expv[53] = 17'h04040;
      expv[54] = 17'h00040;
      expv[55] = 17'h0a000;
      expv[56] = 17'h00040;
      expv[57] = 17'h0a000;
      expv[58] = 17'h02000;
      expv[59] = 17'h00040;
      expv[60] = 17'h00040;
      expv[61] = 17'h04000;
      expv[62] = 17'h14000;
      expv[63] = 17'h04000;
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
