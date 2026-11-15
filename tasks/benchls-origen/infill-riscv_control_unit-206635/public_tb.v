// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_206635 dut (
    .op(in_vec[6:0]),
    .RegWrite(out_vec[14:14]),
    .ALUop(out_vec[13:10]),
    .ALUsrc(out_vec[9:9]),
    .branchCtrl(out_vec[8:8]),
    .PCtoRegSrc(out_vec[7:7]),
    .RDsrc(out_vec[6:5]),
    .MRead(out_vec[4:4]),
    .MWrite(out_vec[3:3]),
    .MenToReg(out_vec[2:2]),
    .ImmType(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h73;
    stim[1] = 7'h09;
    stim[2] = 7'h44;
    stim[3] = 7'h55;
    stim[4] = 7'h6a;
    stim[5] = 7'h6d;
    stim[6] = 7'h0b;
    stim[7] = 7'h12;
    stim[8] = 7'h6a;
    stim[9] = 7'h54;
    stim[10] = 7'h38;
    stim[11] = 7'h20;
    stim[12] = 7'h2c;
    stim[13] = 7'h76;
    stim[14] = 7'h05;
    stim[15] = 7'h4a;
    stim[16] = 7'h50;
    stim[17] = 7'h2c;
    stim[18] = 7'h48;
    stim[19] = 7'h66;
    stim[20] = 7'h19;
    stim[21] = 7'h60;
    stim[22] = 7'h6d;
    stim[23] = 7'h43;
    stim[24] = 7'h07;
    stim[25] = 7'h6b;
    stim[26] = 7'h58;
    stim[27] = 7'h5c;
    stim[28] = 7'h66;
    stim[29] = 7'h24;
    stim[30] = 7'h1c;
    stim[31] = 7'h1e;
    stim[32] = 7'h72;
    stim[33] = 7'h0f;
    stim[34] = 7'h17;
    stim[35] = 7'h0b;
    stim[36] = 7'h1d;
    stim[37] = 7'h1d;
    stim[38] = 7'h28;
    stim[39] = 7'h13;
    stim[40] = 7'h18;
    stim[41] = 7'h26;
    stim[42] = 7'h54;
    stim[43] = 7'h6f;
    stim[44] = 7'h6d;
    stim[45] = 7'h56;
    stim[46] = 7'h1b;
    stim[47] = 7'h43;
    stim[48] = 7'h79;
    stim[49] = 7'h1f;
    stim[50] = 7'h07;
    stim[51] = 7'h40;
    stim[52] = 7'h3e;
    stim[53] = 7'h6e;
    stim[54] = 7'h14;
    stim[55] = 7'h49;
    stim[56] = 7'h20;
    stim[57] = 7'h65;
    stim[58] = 7'h31;
    stim[59] = 7'h5b;
    stim[60] = 7'h24;
    stim[61] = 7'h0a;
    stim[62] = 7'h57;
    stim[63] = 7'h66;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h5a83;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h4a00;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h5b83;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
