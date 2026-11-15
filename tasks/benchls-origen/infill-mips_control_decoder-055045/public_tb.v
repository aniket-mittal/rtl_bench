// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055045 dut (
    .Op(in_vec[11:6]),
    .Func(in_vec[5:0]),
    .RegDst(out_vec[14:14]),
    .ALUSrc(out_vec[13:13]),
    .MemtoReg(out_vec[12:12]),
    .RegWrite(out_vec[11:11]),
    .MemWrite(out_vec[10:10]),
    .nPC_sel(out_vec[9:9]),
    .ExtOp(out_vec[8:8]),
    .ALUOp(out_vec[7:5]),
    .Jump(out_vec[4:4]),
    .RegRa(out_vec[3:3]),
    .JReg(out_vec[2:2]),
    .Jalr(out_vec[1:1]),
    .Lb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h5fc;
    stim[1] = 12'h908;
    stim[2] = 12'hc1f;
    stim[3] = 12'hb66;
    stim[4] = 12'h59d;
    stim[5] = 12'h9bd;
    stim[6] = 12'h509;
    stim[7] = 12'h452;
    stim[8] = 12'hc96;
    stim[9] = 12'h86f;
    stim[10] = 12'h7ab;
    stim[11] = 12'hda1;
    stim[12] = 12'hb11;
    stim[13] = 12'hec8;
    stim[14] = 12'hb1f;
    stim[15] = 12'hfaf;
    stim[16] = 12'h597;
    stim[17] = 12'h679;
    stim[18] = 12'h2ba;
    stim[19] = 12'hda2;
    stim[20] = 12'hbf6;
    stim[21] = 12'hab8;
    stim[22] = 12'h6da;
    stim[23] = 12'hcd1;
    stim[24] = 12'hc8d;
    stim[25] = 12'h432;
    stim[26] = 12'hbcb;
    stim[27] = 12'h9a0;
    stim[28] = 12'h83a;
    stim[29] = 12'h869;
    stim[30] = 12'hb82;
    stim[31] = 12'he37;
    stim[32] = 12'hed3;
    stim[33] = 12'h1a1;
    stim[34] = 12'he5f;
    stim[35] = 12'h60d;
    stim[36] = 12'h9c4;
    stim[37] = 12'h149;
    stim[38] = 12'h6cf;
    stim[39] = 12'h53d;
    stim[40] = 12'h643;
    stim[41] = 12'hb07;
    stim[42] = 12'h7bc;
    stim[43] = 12'h354;
    stim[44] = 12'h9ac;
    stim[45] = 12'h689;
    stim[46] = 12'h0c7;
    stim[47] = 12'h3c6;
    stim[48] = 12'h62b;
    stim[49] = 12'h6fc;
    stim[50] = 12'hb42;
    stim[51] = 12'h88d;
    stim[52] = 12'h922;
    stim[53] = 12'hd9b;
    stim[54] = 12'he53;
    stim[55] = 12'h0b3;
    stim[56] = 12'h6f8;
    stim[57] = 12'h5f1;
    stim[58] = 12'hb05;
    stim[59] = 12'h82d;
    stim[60] = 12'h25d;
    stim[61] = 12'h921;
    stim[62] = 12'ha7f;
    stim[63] = 12'h669;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h3941;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h2820;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0818;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0010;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h3941;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
