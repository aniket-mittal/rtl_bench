// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_054998 dut (
    .stallSignal(in_vec[6:6]),
    .opCode(in_vec[5:0]),
    .regDst(out_vec[8:8]),
    .branch(out_vec[7:7]),
    .memRead(out_vec[6:6]),
    .memToReg(out_vec[5:5]),
    .aluOp(out_vec[4:3]),
    .memWrite(out_vec[2:2]),
    .aluSrc(out_vec[1:1]),
    .regWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h37;
    stim[1] = 7'h54;
    stim[2] = 7'h49;
    stim[3] = 7'h44;
    stim[4] = 7'h40;
    stim[5] = 7'h64;
    stim[6] = 7'h37;
    stim[7] = 7'h03;
    stim[8] = 7'h66;
    stim[9] = 7'h1f;
    stim[10] = 7'h54;
    stim[11] = 7'h50;
    stim[12] = 7'h5c;
    stim[13] = 7'h3b;
    stim[14] = 7'h08;
    stim[15] = 7'h03;
    stim[16] = 7'h4b;
    stim[17] = 7'h47;
    stim[18] = 7'h1f;
    stim[19] = 7'h7d;
    stim[20] = 7'h4b;
    stim[21] = 7'h2e;
    stim[22] = 7'h47;
    stim[23] = 7'h2e;
    stim[24] = 7'h67;
    stim[25] = 7'h32;
    stim[26] = 7'h2e;
    stim[27] = 7'h39;
    stim[28] = 7'h43;
    stim[29] = 7'h69;
    stim[30] = 7'h09;
    stim[31] = 7'h34;
    stim[32] = 7'h0b;
    stim[33] = 7'h68;
    stim[34] = 7'h10;
    stim[35] = 7'h62;
    stim[36] = 7'h6e;
    stim[37] = 7'h03;
    stim[38] = 7'h51;
    stim[39] = 7'h4d;
    stim[40] = 7'h0e;
    stim[41] = 7'h52;
    stim[42] = 7'h4c;
    stim[43] = 7'h5d;
    stim[44] = 7'h2a;
    stim[45] = 7'h62;
    stim[46] = 7'h47;
    stim[47] = 7'h60;
    stim[48] = 7'h1b;
    stim[49] = 7'h65;
    stim[50] = 7'h77;
    stim[51] = 7'h65;
    stim[52] = 7'h39;
    stim[53] = 7'h6f;
    stim[54] = 7'h60;
    stim[55] = 7'h42;
    stim[56] = 7'h37;
    stim[57] = 7'h2d;
    stim[58] = 7'h63;
    stim[59] = 7'h7f;
    stim[60] = 7'h1f;
    stim[61] = 7'h4e;
    stim[62] = 7'h6c;
    stim[63] = 7'h38;
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
      expv[0] = 9'h063;
      expv[1] = 9'h063;
      expv[2] = 9'h063;
      expv[3] = 9'h088;
      expv[4] = 9'h111;
      expv[5] = 9'h063;
      expv[6] = 9'h063;
      expv[7] = 9'h063;
      expv[8] = 9'h063;
      expv[9] = 9'h063;
      expv[10] = 9'h063;
      expv[11] = 9'h063;
      expv[12] = 9'h063;
      expv[13] = 9'h063;
      expv[14] = 9'h063;
      expv[15] = 9'h063;
      expv[16] = 9'h063;
      expv[17] = 9'h063;
      expv[18] = 9'h063;
      expv[19] = 9'h063;
      expv[20] = 9'h063;
      expv[21] = 9'h063;
      expv[22] = 9'h063;
      expv[23] = 9'h063;
      expv[24] = 9'h063;
      expv[25] = 9'h063;
      expv[26] = 9'h063;
      expv[27] = 9'h063;
      expv[28] = 9'h063;
      expv[29] = 9'h063;
      expv[30] = 9'h063;
      expv[31] = 9'h063;
      expv[32] = 9'h063;
      expv[33] = 9'h063;
      expv[34] = 9'h063;
      expv[35] = 9'h063;
      expv[36] = 9'h063;
      expv[37] = 9'h063;
      expv[38] = 9'h063;
      expv[39] = 9'h063;
      expv[40] = 9'h063;
      expv[41] = 9'h063;
      expv[42] = 9'h063;
      expv[43] = 9'h063;
      expv[44] = 9'h063;
      expv[45] = 9'h063;
      expv[46] = 9'h063;
      expv[47] = 9'h063;
      expv[48] = 9'h063;
      expv[49] = 9'h063;
      expv[50] = 9'h063;
      expv[51] = 9'h063;
      expv[52] = 9'h063;
      expv[53] = 9'h063;
      expv[54] = 9'h063;
      expv[55] = 9'h063;
      expv[56] = 9'h063;
      expv[57] = 9'h063;
      expv[58] = 9'h063;
      expv[59] = 9'h063;
      expv[60] = 9'h063;
      expv[61] = 9'h063;
      expv[62] = 9'h063;
      expv[63] = 9'h063;
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
