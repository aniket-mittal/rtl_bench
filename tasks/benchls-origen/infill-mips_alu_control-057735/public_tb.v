// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_057735 dut (
    .op(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .ALUOp(out_vec[15:13]),
    .MemWrite(out_vec[12:12]),
    .MemtoReg(out_vec[11:10]),
    .RegWrite(out_vec[9:9]),
    .RegDst(out_vec[8:7]),
    .EXTOp(out_vec[6:5]),
    .Beq_if(out_vec[4:4]),
    .Bne_if(out_vec[3:3]),
    .J_if(out_vec[2:2]),
    .Jr_if(out_vec[1:1]),
    .Bgezal_if(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h8e0;
    stim[1] = 12'he2b;
    stim[2] = 12'hc8e;
    stim[3] = 12'hae7;
    stim[4] = 12'hcca;
    stim[5] = 12'h136;
    stim[6] = 12'h323;
    stim[7] = 12'h3ef;
    stim[8] = 12'hb91;
    stim[9] = 12'h3da;
    stim[10] = 12'h795;
    stim[11] = 12'h244;
    stim[12] = 12'h637;
    stim[13] = 12'hebc;
    stim[14] = 12'h222;
    stim[15] = 12'hcf2;
    stim[16] = 12'ha17;
    stim[17] = 12'h8ab;
    stim[18] = 12'h956;
    stim[19] = 12'h1f1;
    stim[20] = 12'h767;
    stim[21] = 12'ha5d;
    stim[22] = 12'h418;
    stim[23] = 12'hc53;
    stim[24] = 12'hbcb;
    stim[25] = 12'hc1c;
    stim[26] = 12'h70f;
    stim[27] = 12'hcf6;
    stim[28] = 12'hb74;
    stim[29] = 12'h317;
    stim[30] = 12'h5e8;
    stim[31] = 12'h1c0;
    stim[32] = 12'h540;
    stim[33] = 12'h4a9;
    stim[34] = 12'hf67;
    stim[35] = 12'hbca;
    stim[36] = 12'haad;
    stim[37] = 12'h69d;
    stim[38] = 12'hfbb;
    stim[39] = 12'haa0;
    stim[40] = 12'hc83;
    stim[41] = 12'h31c;
    stim[42] = 12'hb5b;
    stim[43] = 12'h197;
    stim[44] = 12'he96;
    stim[45] = 12'h98e;
    stim[46] = 12'h602;
    stim[47] = 12'hed0;
    stim[48] = 12'h0aa;
    stim[49] = 12'h65e;
    stim[50] = 12'he40;
    stim[51] = 12'hb7a;
    stim[52] = 12'h51c;
    stim[53] = 12'h9c3;
    stim[54] = 12'h913;
    stim[55] = 12'hcee;
    stim[56] = 12'h4a8;
    stim[57] = 12'h265;
    stim[58] = 12'h2c0;
    stim[59] = 12'ha5f;
    stim[60] = 12'hffb;
    stim[61] = 12'h395;
    stim[62] = 12'hfc9;
    stim[63] = 12'hf01;
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
      expv[0] = 16'h0220;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h1020;
      expv[4] = 16'h0000;
      expv[5] = 16'h0030;
      expv[6] = 16'h0000;
      expv[7] = 16'h0640;
      expv[8] = 16'h0000;
      expv[9] = 16'h0640;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0725;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0725;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0004;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
