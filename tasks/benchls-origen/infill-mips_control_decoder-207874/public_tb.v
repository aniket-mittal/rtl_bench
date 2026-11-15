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

  origen_207874 dut (
    .Op(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .RegWrite(out_vec[12:12]),
    .ALUSrc(out_vec[11:11]),
    .RegDst(out_vec[10:10]),
    .Branch(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .MemtoReg(out_vec[7:7]),
    .Jump(out_vec[6:6]),
    .ALUControl(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h1ac;
    stim[1] = 12'he81;
    stim[2] = 12'h7b3;
    stim[3] = 12'h5bb;
    stim[4] = 12'h41d;
    stim[5] = 12'h124;
    stim[6] = 12'he33;
    stim[7] = 12'h5bd;
    stim[8] = 12'hc5a;
    stim[9] = 12'hc18;
    stim[10] = 12'hc11;
    stim[11] = 12'hf5e;
    stim[12] = 12'h0ac;
    stim[13] = 12'h386;
    stim[14] = 12'h00d;
    stim[15] = 12'h68f;
    stim[16] = 12'h2a9;
    stim[17] = 12'hba4;
    stim[18] = 12'h928;
    stim[19] = 12'ha76;
    stim[20] = 12'h445;
    stim[21] = 12'h5ea;
    stim[22] = 12'hc1f;
    stim[23] = 12'h7bf;
    stim[24] = 12'h135;
    stim[25] = 12'hcb7;
    stim[26] = 12'h5c2;
    stim[27] = 12'h406;
    stim[28] = 12'h435;
    stim[29] = 12'h5b9;
    stim[30] = 12'hb3d;
    stim[31] = 12'h6f9;
    stim[32] = 12'h53f;
    stim[33] = 12'h0b1;
    stim[34] = 12'he5f;
    stim[35] = 12'hbe8;
    stim[36] = 12'h48b;
    stim[37] = 12'h5ef;
    stim[38] = 12'h8ff;
    stim[39] = 12'h45f;
    stim[40] = 12'h4bf;
    stim[41] = 12'h5f9;
    stim[42] = 12'h4b2;
    stim[43] = 12'h44a;
    stim[44] = 12'h3ba;
    stim[45] = 12'hdf0;
    stim[46] = 12'h5f4;
    stim[47] = 12'h6eb;
    stim[48] = 12'hdee;
    stim[49] = 12'h5d6;
    stim[50] = 12'h3a4;
    stim[51] = 12'h5de;
    stim[52] = 12'hd5d;
    stim[53] = 12'hbd9;
    stim[54] = 12'h960;
    stim[55] = 12'h3df;
    stim[56] = 12'hd9d;
    stim[57] = 12'h0fe;
    stim[58] = 12'h26a;
    stim[59] = 12'hf0b;
    stim[60] = 12'he9e;
    stim[61] = 12'h8f8;
    stim[62] = 12'ha31;
    stim[63] = 12'h29c;
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
      expv[0] = 13'h00xx;
      expv[1] = 13'h00xx;
      expv[2] = 13'h00xx;
      expv[3] = 13'h00xx;
      expv[4] = 13'h00xx;
      expv[5] = 13'h0xx2;
      expv[6] = 13'h00xx;
      expv[7] = 13'h00xx;
      expv[8] = 13'h00xx;
      expv[9] = 13'h00xx;
      expv[10] = 13'h00xx;
      expv[11] = 13'h00xx;
      expv[12] = 13'h0xxx;
      expv[13] = 13'h00xx;
      expv[14] = 13'h140d;
      expv[15] = 13'h00xx;
      expv[16] = 13'h00xx;
      expv[17] = 13'h00xx;
      expv[18] = 13'h00xx;
      expv[19] = 13'h00xx;
      expv[20] = 13'h00xx;
      expv[21] = 13'h00xx;
      expv[22] = 13'h00xx;
      expv[23] = 13'h00xx;
      expv[24] = 13'h0xx2;
      expv[25] = 13'h00xx;
      expv[26] = 13'h00xx;
      expv[27] = 13'h00xx;
      expv[28] = 13'h00xx;
      expv[29] = 13'h00xx;
      expv[30] = 13'h00xx;
      expv[31] = 13'h00xx;
      expv[32] = 13'h00xx;
      expv[33] = 13'h0xxx;
      expv[34] = 13'h00xx;
      expv[35] = 13'h00xx;
      expv[36] = 13'h00xx;
      expv[37] = 13'h00xx;
      expv[38] = 13'h18a0;
      expv[39] = 13'h00xx;
      expv[40] = 13'h00xx;
      expv[41] = 13'h00xx;
      expv[42] = 13'h00xx;
      expv[43] = 13'h00xx;
      expv[44] = 13'h00xx;
      expv[45] = 13'h00xx;
      expv[46] = 13'h00xx;
      expv[47] = 13'h00xx;
      expv[48] = 13'h00xx;
      expv[49] = 13'h00xx;
      expv[50] = 13'h00xx;
      expv[51] = 13'h00xx;
      expv[52] = 13'h00xx;
      expv[53] = 13'h00xx;
      expv[54] = 13'h00xx;
      expv[55] = 13'h00xx;
      expv[56] = 13'h00xx;
      expv[57] = 13'h00xx;
      expv[58] = 13'h00xx;
      expv[59] = 13'h00xx;
      expv[60] = 13'h00xx;
      expv[61] = 13'h18a0;
      expv[62] = 13'h00xx;
      expv[63] = 13'h00xx;
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
