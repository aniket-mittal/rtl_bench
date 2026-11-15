// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068209 dut (
    .opcode_i(in_vec[3:0]),
    .RegWrite(out_vec[12:12]),
    .ALUop(out_vec[11:10]),
    .Branch(out_vec[9:9]),
    .MemRead(out_vec[8:8]),
    .RegDst(out_vec[7:7]),
    .MemWrite(out_vec[6:6]),
    .Jump(out_vec[5:5]),
    .MemToReg(out_vec[4:4]),
    .Mov(out_vec[3:3]),
    .Floating(out_vec[2:2]),
    .Stop(out_vec[1:1]),
    .R_type(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'ha;
    stim[1] = 4'h2;
    stim[2] = 4'h9;
    stim[3] = 4'h5;
    stim[4] = 4'h9;
    stim[5] = 4'hd;
    stim[6] = 4'hc;
    stim[7] = 4'h2;
    stim[8] = 4'hd;
    stim[9] = 4'h3;
    stim[10] = 4'h4;
    stim[11] = 4'h5;
    stim[12] = 4'h6;
    stim[13] = 4'h1;
    stim[14] = 4'hf;
    stim[15] = 4'h6;
    stim[16] = 4'h4;
    stim[17] = 4'h3;
    stim[18] = 4'ha;
    stim[19] = 4'h6;
    stim[20] = 4'h3;
    stim[21] = 4'h3;
    stim[22] = 4'h6;
    stim[23] = 4'h9;
    stim[24] = 4'h3;
    stim[25] = 4'h5;
    stim[26] = 4'he;
    stim[27] = 4'h4;
    stim[28] = 4'h2;
    stim[29] = 4'h6;
    stim[30] = 4'h4;
    stim[31] = 4'he;
    stim[32] = 4'h8;
    stim[33] = 4'h2;
    stim[34] = 4'hc;
    stim[35] = 4'h3;
    stim[36] = 4'h9;
    stim[37] = 4'h0;
    stim[38] = 4'hb;
    stim[39] = 4'h9;
    stim[40] = 4'h8;
    stim[41] = 4'h5;
    stim[42] = 4'h3;
    stim[43] = 4'hc;
    stim[44] = 4'h2;
    stim[45] = 4'h8;
    stim[46] = 4'h1;
    stim[47] = 4'h1;
    stim[48] = 4'h4;
    stim[49] = 4'h5;
    stim[50] = 4'h1;
    stim[51] = 4'h9;
    stim[52] = 4'h5;
    stim[53] = 4'h9;
    stim[54] = 4'h4;
    stim[55] = 4'h7;
    stim[56] = 4'hc;
    stim[57] = 4'hf;
    stim[58] = 4'h2;
    stim[59] = 4'hd;
    stim[60] = 4'h7;
    stim[61] = 4'h3;
    stim[62] = 4'h3;
    stim[63] = 4'h2;
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
      expv[0] = 13'h001f;
      expv[1] = 13'h1001;
      expv[2] = 13'h1005;
      expv[3] = 13'h0201;
      expv[4] = 13'h1005;
      expv[5] = 13'h001e;
      expv[6] = 13'h001e;
      expv[7] = 13'h1001;
      expv[8] = 13'h001e;
      expv[9] = 13'h1088;
      expv[10] = 13'h1401;
      expv[11] = 13'h0201;
      expv[12] = 13'h0020;
      expv[13] = 13'h0040;
      expv[14] = 13'h0001;
      expv[15] = 13'h0020;
      expv[16] = 13'h1401;
      expv[17] = 13'h1088;
      expv[18] = 13'h001f;
      expv[19] = 13'h0020;
      expv[20] = 13'h1088;
      expv[21] = 13'h1088;
      expv[22] = 13'h0020;
      expv[23] = 13'h1005;
      expv[24] = 13'h1088;
      expv[25] = 13'h0201;
      expv[26] = 13'h001e;
      expv[27] = 13'h1401;
      expv[28] = 13'h1001;
      expv[29] = 13'h0020;
      expv[30] = 13'h1401;
      expv[31] = 13'h001e;
      expv[32] = 13'h1004;
      expv[33] = 13'h1001;
      expv[34] = 13'h001e;
      expv[35] = 13'h1088;
      expv[36] = 13'h1005;
      expv[37] = 13'h1190;
      expv[38] = 13'h001e;
      expv[39] = 13'h1005;
      expv[40] = 13'h1004;
      expv[41] = 13'h0201;
      expv[42] = 13'h1088;
      expv[43] = 13'h001e;
      expv[44] = 13'h1001;
      expv[45] = 13'h1004;
      expv[46] = 13'h0040;
      expv[47] = 13'h0040;
      expv[48] = 13'h1401;
      expv[49] = 13'h0201;
      expv[50] = 13'h0040;
      expv[51] = 13'h1005;
      expv[52] = 13'h0201;
      expv[53] = 13'h1005;
      expv[54] = 13'h1401;
      expv[55] = 13'h0003;
      expv[56] = 13'h001e;
      expv[57] = 13'h0001;
      expv[58] = 13'h1001;
      expv[59] = 13'h001e;
      expv[60] = 13'h0003;
      expv[61] = 13'h1088;
      expv[62] = 13'h1088;
      expv[63] = 13'h1001;
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
