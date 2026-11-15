// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059954 dut (
    .clk(clk),
    .rst(in_vec[3:3]),
    .Opcode(in_vec[2:0]),
    .IorD(out_vec[15:15]),
    .MemRead(out_vec[14:14]),
    .MemWrite(out_vec[13:13]),
    .LdA(out_vec[12:12]),
    .LdB(out_vec[11:11]),
    .PcWrite(out_vec[10:10]),
    .PcWriteCond(out_vec[9:9]),
    .PcSrc(out_vec[8:7]),
    .ALUop(out_vec[6:4]),
    .Push(out_vec[3:3]),
    .Pop(out_vec[2:2]),
    .Tos(out_vec[1:1]),
    .MtoS(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hd;
    stim[1] = 4'hc;
    stim[2] = 4'h5;
    stim[3] = 4'h4;
    stim[4] = 4'h4;
    stim[5] = 4'h4;
    stim[6] = 4'h7;
    stim[7] = 4'h1;
    stim[8] = 4'h2;
    stim[9] = 4'h7;
    stim[10] = 4'h3;
    stim[11] = 4'h0;
    stim[12] = 4'h6;
    stim[13] = 4'h0;
    stim[14] = 4'h4;
    stim[15] = 4'h7;
    stim[16] = 4'h6;
    stim[17] = 4'h1;
    stim[18] = 4'h4;
    stim[19] = 4'h7;
    stim[20] = 4'h7;
    stim[21] = 4'h5;
    stim[22] = 4'h2;
    stim[23] = 4'h4;
    stim[24] = 4'h6;
    stim[25] = 4'h5;
    stim[26] = 4'h7;
    stim[27] = 4'h0;
    stim[28] = 4'h2;
    stim[29] = 4'h2;
    stim[30] = 4'h2;
    stim[31] = 4'h6;
    stim[32] = 4'h2;
    stim[33] = 4'h2;
    stim[34] = 4'h1;
    stim[35] = 4'h5;
    stim[36] = 4'h1;
    stim[37] = 4'h0;
    stim[38] = 4'h7;
    stim[39] = 4'h5;
    stim[40] = 4'h5;
    stim[41] = 4'h5;
    stim[42] = 4'h2;
    stim[43] = 4'h3;
    stim[44] = 4'h0;
    stim[45] = 4'h3;
    stim[46] = 4'h2;
    stim[47] = 4'h3;
    stim[48] = 4'h6;
    stim[49] = 4'h7;
    stim[50] = 4'h0;
    stim[51] = 4'h1;
    stim[52] = 4'h4;
    stim[53] = 4'h0;
    stim[54] = 4'h7;
    stim[55] = 4'h6;
    stim[56] = 4'h4;
    stim[57] = 4'h1;
    stim[58] = 4'h7;
    stim[59] = 4'h5;
    stim[60] = 4'h7;
    stim[61] = 4'h2;
    stim[62] = 4'h0;
    stim[63] = 4'h7;
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
      expv[0] = 16'h4400;
      expv[1] = 16'h4400;
      expv[2] = 16'h4400;
      expv[3] = 16'h1800;
      expv[4] = 16'hc000;
      expv[5] = 16'h0002;
      expv[6] = 16'h4400;
      expv[7] = 16'h1800;
      expv[8] = 16'h0420;
      expv[9] = 16'h4400;
      expv[10] = 16'h1800;
      expv[11] = 16'h0040;
      expv[12] = 16'h0280;
      expv[13] = 16'h4400;
      expv[14] = 16'h1800;
      expv[15] = 16'hc000;
      expv[16] = 16'h0002;
      expv[17] = 16'h4400;
      expv[18] = 16'h1800;
      expv[19] = 16'hc000;
      expv[20] = 16'h0002;
      expv[21] = 16'h4400;
      expv[22] = 16'h1800;
      expv[23] = 16'h0430;
      expv[24] = 16'h4400;
      expv[25] = 16'h1800;
      expv[26] = 16'ha000;
      expv[27] = 16'h0001;
      expv[28] = 16'h4400;
      expv[29] = 16'h1800;
      expv[30] = 16'h0430;
      expv[31] = 16'h4400;
      expv[32] = 16'h1800;
      expv[33] = 16'h0430;
      expv[34] = 16'h4400;
      expv[35] = 16'h1800;
      expv[36] = 16'ha000;
      expv[37] = 16'h0001;
      expv[38] = 16'h4400;
      expv[39] = 16'h1800;
      expv[40] = 16'ha000;
      expv[41] = 16'h0001;
      expv[42] = 16'h4400;
      expv[43] = 16'h1800;
      expv[44] = 16'h0040;
      expv[45] = 16'h0280;
      expv[46] = 16'h4400;
      expv[47] = 16'h1800;
      expv[48] = 16'h0040;
      expv[49] = 16'h0500;
      expv[50] = 16'h4400;
      expv[51] = 16'h1800;
      expv[52] = 16'h0420;
      expv[53] = 16'h4400;
      expv[54] = 16'h1800;
      expv[55] = 16'h0004;
      expv[56] = 16'h4400;
      expv[57] = 16'h1800;
      expv[58] = 16'h0420;
      expv[59] = 16'h4400;
      expv[60] = 16'h1800;
      expv[61] = 16'h0004;
      expv[62] = 16'h4400;
      expv[63] = 16'h1800;
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
