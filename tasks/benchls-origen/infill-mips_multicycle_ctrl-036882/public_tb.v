// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036882 dut (
    .clk(clk),
    .reset(in_vec[6:6]),
    .opcode(in_vec[5:0]),
    .PcWrite(out_vec[16:16]),
    .PcWriteCond(out_vec[15:15]),
    .IoD(out_vec[14:14]),
    .MemRead(out_vec[13:13]),
    .MemWrite(out_vec[12:12]),
    .MemtoReg(out_vec[11:11]),
    .IRwrite(out_vec[10:10]),
    .PcSource(out_vec[9:8]),
    .AluSrcA(out_vec[7:6]),
    .AluSrcB(out_vec[5:4]),
    .Aluop(out_vec[3:2]),
    .RegWrite(out_vec[1:1]),
    .RegDst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h58;
    stim[1] = 7'h58;
    stim[2] = 7'h33;
    stim[3] = 7'h13;
    stim[4] = 7'h30;
    stim[5] = 7'h30;
    stim[6] = 7'h2d;
    stim[7] = 7'h21;
    stim[8] = 7'h28;
    stim[9] = 7'h2b;
    stim[10] = 7'h3c;
    stim[11] = 7'h2f;
    stim[12] = 7'h38;
    stim[13] = 7'h19;
    stim[14] = 7'h13;
    stim[15] = 7'h03;
    stim[16] = 7'h31;
    stim[17] = 7'h2e;
    stim[18] = 7'h34;
    stim[19] = 7'h34;
    stim[20] = 7'h3c;
    stim[21] = 7'h30;
    stim[22] = 7'h3b;
    stim[23] = 7'h32;
    stim[24] = 7'h04;
    stim[25] = 7'h16;
    stim[26] = 7'h75;
    stim[27] = 7'h21;
    stim[28] = 7'h27;
    stim[29] = 7'h3d;
    stim[30] = 7'h12;
    stim[31] = 7'h2c;
    stim[32] = 7'h0b;
    stim[33] = 7'h37;
    stim[34] = 7'h2d;
    stim[35] = 7'h31;
    stim[36] = 7'h24;
    stim[37] = 7'h19;
    stim[38] = 7'h1d;
    stim[39] = 7'h0a;
    stim[40] = 7'h10;
    stim[41] = 7'h0a;
    stim[42] = 7'h33;
    stim[43] = 7'h36;
    stim[44] = 7'h2d;
    stim[45] = 7'h56;
    stim[46] = 7'h16;
    stim[47] = 7'h05;
    stim[48] = 7'h16;
    stim[49] = 7'h20;
    stim[50] = 7'h22;
    stim[51] = 7'h22;
    stim[52] = 7'h0a;
    stim[53] = 7'h1c;
    stim[54] = 7'h31;
    stim[55] = 7'h3f;
    stim[56] = 7'h02;
    stim[57] = 7'h3c;
    stim[58] = 7'h35;
    stim[59] = 7'h3e;
    stim[60] = 7'h06;
    stim[61] = 7'h0c;
    stim[62] = 7'h1d;
    stim[63] = 7'h03;
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
      expv[0] = 17'h12410;
      expv[1] = 17'h12410;
      expv[2] = 17'h12410;
      expv[3] = 17'h00070;
      expv[4] = 17'h12410;
      expv[5] = 17'h00070;
      expv[6] = 17'h12410;
      expv[7] = 17'h00070;
      expv[8] = 17'h12410;
      expv[9] = 17'h00070;
      expv[10] = 17'h00060;
      expv[11] = 17'h05000;
      expv[12] = 17'h12410;
      expv[13] = 17'h00070;
      expv[14] = 17'h12410;
      expv[15] = 17'h00070;
      expv[16] = 17'h12410;
      expv[17] = 17'h00070;
      expv[18] = 17'h12410;
      expv[19] = 17'h00070;
      expv[20] = 17'h12410;
      expv[21] = 17'h00070;
      expv[22] = 17'h12410;
      expv[23] = 17'h00070;
      expv[24] = 17'h12410;
      expv[25] = 17'h00070;
      expv[26] = 17'h12410;
      expv[27] = 17'h12410;
      expv[28] = 17'h00070;
      expv[29] = 17'h12410;
      expv[30] = 17'h00070;
      expv[31] = 17'h12410;
      expv[32] = 17'h00070;
      expv[33] = 17'h12410;
      expv[34] = 17'h00070;
      expv[35] = 17'h12410;
      expv[36] = 17'h00070;
      expv[37] = 17'h12410;
      expv[38] = 17'h00070;
      expv[39] = 17'h12410;
      expv[40] = 17'h00070;
      expv[41] = 17'h12410;
      expv[42] = 17'h00070;
      expv[43] = 17'h12410;
      expv[44] = 17'h00070;
      expv[45] = 17'h12410;
      expv[46] = 17'h12410;
      expv[47] = 17'h00070;
      expv[48] = 17'h12410;
      expv[49] = 17'h00070;
      expv[50] = 17'h12410;
      expv[51] = 17'h00070;
      expv[52] = 17'h12410;
      expv[53] = 17'h00070;
      expv[54] = 17'h12410;
      expv[55] = 17'h00070;
      expv[56] = 17'h12410;
      expv[57] = 17'h00070;
      expv[58] = 17'h12410;
      expv[59] = 17'h00070;
      expv[60] = 17'h12410;
      expv[61] = 17'h00070;
      expv[62] = 17'h12410;
      expv[63] = 17'h00070;
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
