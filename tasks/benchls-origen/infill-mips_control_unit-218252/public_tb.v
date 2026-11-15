// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_218252 dut (
    .opCode(in_vec[5:0]),
    .regDst(out_vec[9:9]),
    .aluSrc(out_vec[8:8]),
    .memToReg(out_vec[7:7]),
    .regWrite(out_vec[6:6]),
    .memRead(out_vec[5:5]),
    .memWrite(out_vec[4:4]),
    .branch(out_vec[3:3]),
    .aluOp(out_vec[2:1]),
    .jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h35;
    stim[1] = 6'h07;
    stim[2] = 6'h32;
    stim[3] = 6'h12;
    stim[4] = 6'h28;
    stim[5] = 6'h3f;
    stim[6] = 6'h1c;
    stim[7] = 6'h24;
    stim[8] = 6'h37;
    stim[9] = 6'h33;
    stim[10] = 6'h35;
    stim[11] = 6'h04;
    stim[12] = 6'h3d;
    stim[13] = 6'h36;
    stim[14] = 6'h2f;
    stim[15] = 6'h32;
    stim[16] = 6'h38;
    stim[17] = 6'h07;
    stim[18] = 6'h19;
    stim[19] = 6'h20;
    stim[20] = 6'h2d;
    stim[21] = 6'h23;
    stim[22] = 6'h33;
    stim[23] = 6'h21;
    stim[24] = 6'h1a;
    stim[25] = 6'h3d;
    stim[26] = 6'h1b;
    stim[27] = 6'h03;
    stim[28] = 6'h3d;
    stim[29] = 6'h32;
    stim[30] = 6'h0e;
    stim[31] = 6'h3d;
    stim[32] = 6'h07;
    stim[33] = 6'h05;
    stim[34] = 6'h23;
    stim[35] = 6'h38;
    stim[36] = 6'h2b;
    stim[37] = 6'h2c;
    stim[38] = 6'h04;
    stim[39] = 6'h22;
    stim[40] = 6'h0e;
    stim[41] = 6'h1f;
    stim[42] = 6'h1b;
    stim[43] = 6'h3f;
    stim[44] = 6'h2e;
    stim[45] = 6'h25;
    stim[46] = 6'h13;
    stim[47] = 6'h02;
    stim[48] = 6'h22;
    stim[49] = 6'h17;
    stim[50] = 6'h25;
    stim[51] = 6'h3b;
    stim[52] = 6'h2a;
    stim[53] = 6'h0b;
    stim[54] = 6'h39;
    stim[55] = 6'h2c;
    stim[56] = 6'h01;
    stim[57] = 6'h24;
    stim[58] = 6'h11;
    stim[59] = 6'h2d;
    stim[60] = 6'h11;
    stim[61] = 6'h1f;
    stim[62] = 6'h32;
    stim[63] = 6'h15;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxa;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'hxxx;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'h1e0;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'h1e0;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxx0;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxa;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
      expv[58] = 10'hxxx;
      expv[59] = 10'hxxx;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
