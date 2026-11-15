// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020595 dut (
    .opcode(in_vec[6:1]),
    .czero(in_vec[0:0]),
    .aluOp(out_vec[10:9]),
    .regDst(out_vec[8:8]),
    .aluSrc(out_vec[7:7]),
    .memToReg(out_vec[6:6]),
    .regWrite(out_vec[5:5]),
    .memRead(out_vec[4:4]),
    .memWrite(out_vec[3:3]),
    .pccontrol(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h44;
    stim[1] = 7'h0f;
    stim[2] = 7'h79;
    stim[3] = 7'h67;
    stim[4] = 7'h7d;
    stim[5] = 7'h1c;
    stim[6] = 7'h45;
    stim[7] = 7'h24;
    stim[8] = 7'h34;
    stim[9] = 7'h36;
    stim[10] = 7'h54;
    stim[11] = 7'h25;
    stim[12] = 7'h54;
    stim[13] = 7'h4e;
    stim[14] = 7'h78;
    stim[15] = 7'h7e;
    stim[16] = 7'h62;
    stim[17] = 7'h16;
    stim[18] = 7'h15;
    stim[19] = 7'h2c;
    stim[20] = 7'h00;
    stim[21] = 7'h03;
    stim[22] = 7'h36;
    stim[23] = 7'h6d;
    stim[24] = 7'h07;
    stim[25] = 7'h76;
    stim[26] = 7'h0c;
    stim[27] = 7'h28;
    stim[28] = 7'h3e;
    stim[29] = 7'h65;
    stim[30] = 7'h7d;
    stim[31] = 7'h0a;
    stim[32] = 7'h62;
    stim[33] = 7'h50;
    stim[34] = 7'h7f;
    stim[35] = 7'h63;
    stim[36] = 7'h72;
    stim[37] = 7'h72;
    stim[38] = 7'h66;
    stim[39] = 7'h16;
    stim[40] = 7'h46;
    stim[41] = 7'h02;
    stim[42] = 7'h2c;
    stim[43] = 7'h61;
    stim[44] = 7'h11;
    stim[45] = 7'h15;
    stim[46] = 7'h21;
    stim[47] = 7'h0c;
    stim[48] = 7'h07;
    stim[49] = 7'h6e;
    stim[50] = 7'h20;
    stim[51] = 7'h05;
    stim[52] = 7'h5c;
    stim[53] = 7'h38;
    stim[54] = 7'h2c;
    stim[55] = 7'h00;
    stim[56] = 7'h51;
    stim[57] = 7'h79;
    stim[58] = 7'h18;
    stim[59] = 7'h15;
    stim[60] = 7'h5d;
    stim[61] = 7'h69;
    stim[62] = 7'h24;
    stim[63] = 7'h00;
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
      expv[0] = 11'h600;
      expv[1] = 11'h600;
      expv[2] = 11'h600;
      expv[3] = 11'h600;
      expv[4] = 11'h600;
      expv[5] = 11'h600;
      expv[6] = 11'h600;
      expv[7] = 11'h600;
      expv[8] = 11'h600;
      expv[9] = 11'h600;
      expv[10] = 11'h600;
      expv[11] = 11'h600;
      expv[12] = 11'h600;
      expv[13] = 11'h600;
      expv[14] = 11'h600;
      expv[15] = 11'hxx7;
      expv[16] = 11'h600;
      expv[17] = 11'h600;
      expv[18] = 11'h600;
      expv[19] = 11'h600;
      expv[20] = 11'h520;
      expv[21] = 11'h600;
      expv[22] = 11'h600;
      expv[23] = 11'h600;
      expv[24] = 11'h600;
      expv[25] = 11'h600;
      expv[26] = 11'h600;
      expv[27] = 11'h600;
      expv[28] = 11'h600;
      expv[29] = 11'h600;
      expv[30] = 11'h600;
      expv[31] = 11'h600;
      expv[32] = 11'h600;
      expv[33] = 11'h600;
      expv[34] = 11'hxx7;
      expv[35] = 11'h600;
      expv[36] = 11'h600;
      expv[37] = 11'h600;
      expv[38] = 11'h600;
      expv[39] = 11'h600;
      expv[40] = 11'h0f0;
      expv[41] = 11'h600;
      expv[42] = 11'h600;
      expv[43] = 11'h600;
      expv[44] = 11'h6a0;
      expv[45] = 11'h600;
      expv[46] = 11'h600;
      expv[47] = 11'h600;
      expv[48] = 11'h600;
      expv[49] = 11'h600;
      expv[50] = 11'h600;
      expv[51] = 11'hxx1;
      expv[52] = 11'h600;
      expv[53] = 11'h600;
      expv[54] = 11'h600;
      expv[55] = 11'h520;
      expv[56] = 11'h600;
      expv[57] = 11'h600;
      expv[58] = 11'h600;
      expv[59] = 11'h600;
      expv[60] = 11'h600;
      expv[61] = 11'h600;
      expv[62] = 11'h600;
      expv[63] = 11'h520;
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
