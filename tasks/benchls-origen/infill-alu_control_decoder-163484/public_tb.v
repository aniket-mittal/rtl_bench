// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_163484 dut (
    .instruction(in_vec[3:0]),
    .regWrite(out_vec[9:9]),
    .aluCon(out_vec[8:6]),
    .branch(out_vec[5:5]),
    .memWrite(out_vec[4:4]),
    .memRead(out_vec[3:3]),
    .AluSrc(out_vec[2:2]),
    .memToReg(out_vec[1:1]),
    .regDst(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h5;
    stim[1] = 4'ha;
    stim[2] = 4'h2;
    stim[3] = 4'h8;
    stim[4] = 4'h1;
    stim[5] = 4'h8;
    stim[6] = 4'h3;
    stim[7] = 4'ha;
    stim[8] = 4'ha;
    stim[9] = 4'hc;
    stim[10] = 4'hd;
    stim[11] = 4'h2;
    stim[12] = 4'hc;
    stim[13] = 4'h8;
    stim[14] = 4'h6;
    stim[15] = 4'h9;
    stim[16] = 4'ha;
    stim[17] = 4'hf;
    stim[18] = 4'h8;
    stim[19] = 4'h8;
    stim[20] = 4'hd;
    stim[21] = 4'h3;
    stim[22] = 4'h4;
    stim[23] = 4'he;
    stim[24] = 4'h7;
    stim[25] = 4'hd;
    stim[26] = 4'hd;
    stim[27] = 4'hd;
    stim[28] = 4'h3;
    stim[29] = 4'hf;
    stim[30] = 4'h9;
    stim[31] = 4'hd;
    stim[32] = 4'h2;
    stim[33] = 4'h2;
    stim[34] = 4'h5;
    stim[35] = 4'h3;
    stim[36] = 4'h9;
    stim[37] = 4'h8;
    stim[38] = 4'h4;
    stim[39] = 4'h4;
    stim[40] = 4'ha;
    stim[41] = 4'hb;
    stim[42] = 4'hd;
    stim[43] = 4'hc;
    stim[44] = 4'h5;
    stim[45] = 4'hc;
    stim[46] = 4'h8;
    stim[47] = 4'h2;
    stim[48] = 4'h6;
    stim[49] = 4'he;
    stim[50] = 4'h7;
    stim[51] = 4'hf;
    stim[52] = 4'h1;
    stim[53] = 4'he;
    stim[54] = 4'h4;
    stim[55] = 4'he;
    stim[56] = 4'he;
    stim[57] = 4'h5;
    stim[58] = 4'h6;
    stim[59] = 4'h3;
    stim[60] = 4'hd;
    stim[61] = 4'h6;
    stim[62] = 4'h5;
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
      expv[0] = 10'h000;
      expv[1] = 10'h0b4;
      expv[2] = 10'h281;
      expv[3] = 10'h2ae;
      expv[4] = 10'h241;
      expv[5] = 10'h2ae;
      expv[6] = 10'h000;
      expv[7] = 10'h0b4;
      expv[8] = 10'h0b4;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h281;
      expv[12] = 10'h000;
      expv[13] = 10'h2ae;
      expv[14] = 10'h381;
      expv[15] = 10'h000;
      expv[16] = 10'h0b4;
      expv[17] = 10'h000;
      expv[18] = 10'h2ae;
      expv[19] = 10'h2ae;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h0e0;
      expv[24] = 10'h3c0;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h281;
      expv[33] = 10'h281;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h2ae;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h0b4;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h2ae;
      expv[47] = 10'h281;
      expv[48] = 10'h381;
      expv[49] = 10'h0e0;
      expv[50] = 10'h3c0;
      expv[51] = 10'h000;
      expv[52] = 10'h241;
      expv[53] = 10'h0e0;
      expv[54] = 10'h000;
      expv[55] = 10'h0e0;
      expv[56] = 10'h0e0;
      expv[57] = 10'h000;
      expv[58] = 10'h381;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h381;
      expv[62] = 10'h000;
      expv[63] = 10'h281;
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
