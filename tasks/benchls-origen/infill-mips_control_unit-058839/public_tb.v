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

  origen_058839 dut (
    .OP(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .RegDst(out_vec[14:14]),
    .BranchEQ(out_vec[13:13]),
    .BranchNE(out_vec[12:12]),
    .MemRead(out_vec[11:11]),
    .MemToReg(out_vec[10:10]),
    .MemWrite(out_vec[9:9]),
    .ALUSrc(out_vec[8:8]),
    .RegWrite(out_vec[7:7]),
    .Jump(out_vec[6:6]),
    .JumpAndLink(out_vec[5:5]),
    .LoadUpperImmediate(out_vec[4:4]),
    .JumpRegister(out_vec[3:3]),
    .ALUOp(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc51;
    stim[1] = 12'h993;
    stim[2] = 12'h7d1;
    stim[3] = 12'he62;
    stim[4] = 12'h026;
    stim[5] = 12'hd37;
    stim[6] = 12'hba3;
    stim[7] = 12'h7e9;
    stim[8] = 12'hb6e;
    stim[9] = 12'h20d;
    stim[10] = 12'hcbb;
    stim[11] = 12'hfeb;
    stim[12] = 12'h45b;
    stim[13] = 12'h502;
    stim[14] = 12'h4e3;
    stim[15] = 12'h64c;
    stim[16] = 12'h397;
    stim[17] = 12'hcca;
    stim[18] = 12'haf7;
    stim[19] = 12'h62b;
    stim[20] = 12'hf6c;
    stim[21] = 12'h223;
    stim[22] = 12'h19b;
    stim[23] = 12'hb53;
    stim[24] = 12'h219;
    stim[25] = 12'hc5c;
    stim[26] = 12'h0ed;
    stim[27] = 12'h9fc;
    stim[28] = 12'h540;
    stim[29] = 12'h168;
    stim[30] = 12'h9ea;
    stim[31] = 12'h995;
    stim[32] = 12'hd6d;
    stim[33] = 12'h899;
    stim[34] = 12'h53d;
    stim[35] = 12'h613;
    stim[36] = 12'hc29;
    stim[37] = 12'hb63;
    stim[38] = 12'hf29;
    stim[39] = 12'h824;
    stim[40] = 12'h314;
    stim[41] = 12'h588;
    stim[42] = 12'h2e8;
    stim[43] = 12'hd85;
    stim[44] = 12'h2b9;
    stim[45] = 12'h0e6;
    stim[46] = 12'h1d9;
    stim[47] = 12'h547;
    stim[48] = 12'hc06;
    stim[49] = 12'hae2;
    stim[50] = 12'h82a;
    stim[51] = 12'hdba;
    stim[52] = 12'h5ea;
    stim[53] = 12'hdee;
    stim[54] = 12'h964;
    stim[55] = 12'ha99;
    stim[56] = 12'h2e9;
    stim[57] = 12'hac1;
    stim[58] = 12'hebb;
    stim[59] = 12'hddb;
    stim[60] = 12'h2bc;
    stim[61] = 12'hd08;
    stim[62] = 12'h3f0;
    stim[63] = 12'hb73;
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
      expv[4] = 15'h4043;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h00c1;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0300;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h00c1;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h00c1;
      expv[25] = 15'h0000;
      expv[26] = 15'h0030;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h2004;
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
      expv[40] = 15'h00c1;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0030;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0300;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0300;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h00c2;
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
