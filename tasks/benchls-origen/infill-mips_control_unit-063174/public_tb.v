// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063174 dut (
    .Op(in_vec[5:0]),
    .RegDst(out_vec[10:10]),
    .MemRead(out_vec[9:9]),
    .MemtoReg(out_vec[8:8]),
    .MemWrite(out_vec[7:7]),
    .ALUSrc(out_vec[6:6]),
    .RegWrite(out_vec[5:5]),
    .Jump(out_vec[4:4]),
    .Branch(out_vec[3:3]),
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
    stim[0] = 6'h25;
    stim[1] = 6'h1d;
    stim[2] = 6'h38;
    stim[3] = 6'h12;
    stim[4] = 6'h07;
    stim[5] = 6'h1a;
    stim[6] = 6'h01;
    stim[7] = 6'h09;
    stim[8] = 6'h2b;
    stim[9] = 6'h36;
    stim[10] = 6'h1a;
    stim[11] = 6'h24;
    stim[12] = 6'h0e;
    stim[13] = 6'h0c;
    stim[14] = 6'h3f;
    stim[15] = 6'h07;
    stim[16] = 6'h0c;
    stim[17] = 6'h26;
    stim[18] = 6'h00;
    stim[19] = 6'h3c;
    stim[20] = 6'h11;
    stim[21] = 6'h2f;
    stim[22] = 6'h32;
    stim[23] = 6'h25;
    stim[24] = 6'h09;
    stim[25] = 6'h1e;
    stim[26] = 6'h0b;
    stim[27] = 6'h00;
    stim[28] = 6'h27;
    stim[29] = 6'h2a;
    stim[30] = 6'h3d;
    stim[31] = 6'h00;
    stim[32] = 6'h33;
    stim[33] = 6'h29;
    stim[34] = 6'h13;
    stim[35] = 6'h15;
    stim[36] = 6'h24;
    stim[37] = 6'h26;
    stim[38] = 6'h00;
    stim[39] = 6'h1c;
    stim[40] = 6'h33;
    stim[41] = 6'h28;
    stim[42] = 6'h35;
    stim[43] = 6'h3f;
    stim[44] = 6'h1f;
    stim[45] = 6'h0f;
    stim[46] = 6'h0f;
    stim[47] = 6'h3f;
    stim[48] = 6'h10;
    stim[49] = 6'h01;
    stim[50] = 6'h21;
    stim[51] = 6'h29;
    stim[52] = 6'h08;
    stim[53] = 6'h01;
    stim[54] = 6'h07;
    stim[55] = 6'h16;
    stim[56] = 6'h2b;
    stim[57] = 6'h39;
    stim[58] = 6'h11;
    stim[59] = 6'h3a;
    stim[60] = 6'h1d;
    stim[61] = 6'h06;
    stim[62] = 6'h12;
    stim[63] = 6'h36;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'h422;
      expv[10] = 11'hxxx;
      expv[11] = 11'hxxx;
      expv[12] = 11'hxxx;
      expv[13] = 11'hxxx;
      expv[14] = 11'hxxx;
      expv[15] = 11'hxxx;
      expv[16] = 11'hxxx;
      expv[17] = 11'hxxx;
      expv[18] = 11'hxxx;
      expv[19] = 11'hxxx;
      expv[20] = 11'hxxx;
      expv[21] = 11'hxxx;
      expv[22] = 11'hxxx;
      expv[23] = 11'hxxx;
      expv[24] = 11'hxxx;
      expv[25] = 11'hxxx;
      expv[26] = 11'hxxx;
      expv[27] = 11'hxxx;
      expv[28] = 11'h0c0;
      expv[29] = 11'h061;
      expv[30] = 11'hxxx;
      expv[31] = 11'hxxx;
      expv[32] = 11'hxxx;
      expv[33] = 11'h060;
      expv[34] = 11'hxxx;
      expv[35] = 11'hxxx;
      expv[36] = 11'hxxx;
      expv[37] = 11'hxxx;
      expv[38] = 11'hxxx;
      expv[39] = 11'hxxx;
      expv[40] = 11'hxxx;
      expv[41] = 11'h360;
      expv[42] = 11'hxxx;
      expv[43] = 11'hxxx;
      expv[44] = 11'h00d;
      expv[45] = 11'hxxx;
      expv[46] = 11'hxxx;
      expv[47] = 11'hxxx;
      expv[48] = 11'hxxx;
      expv[49] = 11'hxxx;
      expv[50] = 11'hxxx;
      expv[51] = 11'h060;
      expv[52] = 11'hxxx;
      expv[53] = 11'hxxx;
      expv[54] = 11'hxxx;
      expv[55] = 11'hxxx;
      expv[56] = 11'hxxx;
      expv[57] = 11'hxxx;
      expv[58] = 11'hxxx;
      expv[59] = 11'hxxx;
      expv[60] = 11'hxxx;
      expv[61] = 11'hxxx;
      expv[62] = 11'hxxx;
      expv[63] = 11'h422;
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
