// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022710 dut (
    .operationCode(in_vec[6:1]),
    .zero(in_vec[0:0]),
    .ALUSrcB(out_vec[11:11]),
    .ALUM2Reg(out_vec[10:10]),
    .RegWre(out_vec[9:9]),
    .InsMemRW(out_vec[8:8]),
    .DataMemRW(out_vec[7:7]),
    .ExtSel(out_vec[6:6]),
    .PCSrc(out_vec[5:5]),
    .RegOut(out_vec[4:4]),
    .PCWre(out_vec[3:3]),
    .ALUFlag(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h2a;
    stim[1] = 7'h69;
    stim[2] = 7'h2a;
    stim[3] = 7'h33;
    stim[4] = 7'h64;
    stim[5] = 7'h67;
    stim[6] = 7'h49;
    stim[7] = 7'h4d;
    stim[8] = 7'h52;
    stim[9] = 7'h3c;
    stim[10] = 7'h7f;
    stim[11] = 7'h5f;
    stim[12] = 7'h38;
    stim[13] = 7'h20;
    stim[14] = 7'h64;
    stim[15] = 7'h44;
    stim[16] = 7'h5c;
    stim[17] = 7'h3d;
    stim[18] = 7'h78;
    stim[19] = 7'h1d;
    stim[20] = 7'h11;
    stim[21] = 7'h6f;
    stim[22] = 7'h6a;
    stim[23] = 7'h70;
    stim[24] = 7'h74;
    stim[25] = 7'h41;
    stim[26] = 7'h5e;
    stim[27] = 7'h1c;
    stim[28] = 7'h43;
    stim[29] = 7'h43;
    stim[30] = 7'h33;
    stim[31] = 7'h20;
    stim[32] = 7'h57;
    stim[33] = 7'h65;
    stim[34] = 7'h57;
    stim[35] = 7'h5f;
    stim[36] = 7'h0f;
    stim[37] = 7'h64;
    stim[38] = 7'h60;
    stim[39] = 7'h5c;
    stim[40] = 7'h6d;
    stim[41] = 7'h22;
    stim[42] = 7'h61;
    stim[43] = 7'h2d;
    stim[44] = 7'h35;
    stim[45] = 7'h2a;
    stim[46] = 7'h7f;
    stim[47] = 7'h5b;
    stim[48] = 7'h53;
    stim[49] = 7'h41;
    stim[50] = 7'h70;
    stim[51] = 7'h52;
    stim[52] = 7'h5c;
    stim[53] = 7'h0b;
    stim[54] = 7'h3b;
    stim[55] = 7'h47;
    stim[56] = 7'h77;
    stim[57] = 7'h13;
    stim[58] = 7'h0c;
    stim[59] = 7'h05;
    stim[60] = 7'h27;
    stim[61] = 7'h47;
    stim[62] = 7'h4d;
    stim[63] = 7'h48;
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
      expv[0] = 12'h108;
      expv[1] = 12'h108;
      expv[2] = 12'h108;
      expv[3] = 12'h108;
      expv[4] = 12'h149;
      expv[5] = 12'h108;
      expv[6] = 12'h108;
      expv[7] = 12'h108;
      expv[8] = 12'h108;
      expv[9] = 12'h108;
      expv[10] = 12'h100;
      expv[11] = 12'h108;
      expv[12] = 12'h108;
      expv[13] = 12'hb0b;
      expv[14] = 12'h149;
      expv[15] = 12'h108;
      expv[16] = 12'h108;
      expv[17] = 12'h108;
      expv[18] = 12'h108;
      expv[19] = 12'h108;
      expv[20] = 12'h108;
      expv[21] = 12'h108;
      expv[22] = 12'h108;
      expv[23] = 12'h108;
      expv[24] = 12'h108;
      expv[25] = 12'h318;
      expv[26] = 12'h108;
      expv[27] = 12'h108;
      expv[28] = 12'h108;
      expv[29] = 12'h108;
      expv[30] = 12'h108;
      expv[31] = 12'hb0b;
      expv[32] = 12'h108;
      expv[33] = 12'h169;
      expv[34] = 12'h108;
      expv[35] = 12'h108;
      expv[36] = 12'h108;
      expv[37] = 12'h149;
      expv[38] = 12'h9c8;
      expv[39] = 12'h108;
      expv[40] = 12'h108;
      expv[41] = 12'h31c;
      expv[42] = 12'h9c8;
      expv[43] = 12'h108;
      expv[44] = 12'h108;
      expv[45] = 12'h108;
      expv[46] = 12'h100;
      expv[47] = 12'h108;
      expv[48] = 12'h108;
      expv[49] = 12'h318;
      expv[50] = 12'h108;
      expv[51] = 12'h108;
      expv[52] = 12'h108;
      expv[53] = 12'h108;
      expv[54] = 12'h108;
      expv[55] = 12'h108;
      expv[56] = 12'h108;
      expv[57] = 12'h108;
      expv[58] = 12'h108;
      expv[59] = 12'h108;
      expv[60] = 12'h108;
      expv[61] = 12'h108;
      expv[62] = 12'h108;
      expv[63] = 12'h108;
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
