// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169004 dut (
    .Opcode(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .ALUop(out_vec[12:9]),
    .RegDst(out_vec[8:8]),
    .RegWrite(out_vec[7:7]),
    .MemRead(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .ALUSrc(out_vec[4:4]),
    .MemtoReg(out_vec[3:3]),
    .Branch(out_vec[2:2]),
    .NotEqualBranch(out_vec[1:1]),
    .Jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hba8;
    stim[1] = 12'ha98;
    stim[2] = 12'h759;
    stim[3] = 12'h557;
    stim[4] = 12'h3c9;
    stim[5] = 12'ha82;
    stim[6] = 12'h911;
    stim[7] = 12'hcb2;
    stim[8] = 12'hb5d;
    stim[9] = 12'had4;
    stim[10] = 12'h44b;
    stim[11] = 12'h911;
    stim[12] = 12'hf8d;
    stim[13] = 12'h70a;
    stim[14] = 12'he7a;
    stim[15] = 12'h0f3;
    stim[16] = 12'hf3f;
    stim[17] = 12'hfec;
    stim[18] = 12'h99c;
    stim[19] = 12'h4b5;
    stim[20] = 12'h566;
    stim[21] = 12'he2b;
    stim[22] = 12'hfb9;
    stim[23] = 12'hb09;
    stim[24] = 12'h1f4;
    stim[25] = 12'hdea;
    stim[26] = 12'h5c0;
    stim[27] = 12'ha88;
    stim[28] = 12'hc78;
    stim[29] = 12'h4ac;
    stim[30] = 12'h623;
    stim[31] = 12'h67c;
    stim[32] = 12'hd99;
    stim[33] = 12'hbbb;
    stim[34] = 12'h6e1;
    stim[35] = 12'h8e5;
    stim[36] = 12'h5fd;
    stim[37] = 12'h406;
    stim[38] = 12'h19c;
    stim[39] = 12'h544;
    stim[40] = 12'h07e;
    stim[41] = 12'h8de;
    stim[42] = 12'hf5f;
    stim[43] = 12'hdd0;
    stim[44] = 12'hbe4;
    stim[45] = 12'h882;
    stim[46] = 12'ha91;
    stim[47] = 12'haac;
    stim[48] = 12'h8b8;
    stim[49] = 12'h09c;
    stim[50] = 12'h41d;
    stim[51] = 12'h40d;
    stim[52] = 12'hdbb;
    stim[53] = 12'h0b7;
    stim[54] = 12'h41b;
    stim[55] = 12'h7ee;
    stim[56] = 12'heed;
    stim[57] = 12'h4c0;
    stim[58] = 12'hdcf;
    stim[59] = 12'h54d;
    stim[60] = 12'h85a;
    stim[61] = 12'h466;
    stim[62] = 12'h19c;
    stim[63] = 12'h614;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0430;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h04d8;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h04d8;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0001;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0001;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
