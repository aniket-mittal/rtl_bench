// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091094 dut (
    .I(in_vec[31:0]),
    .ID_shift_imm(out_vec[13:13]),
    .ID_ALU_Op(out_vec[12:9]),
    .mem_size(out_vec[8:7]),
    .mem_enable(out_vec[6:6]),
    .mem_RW(out_vec[5:5]),
    .ID_Load_Inst(out_vec[4:4]),
    .S(out_vec[3:3]),
    .ID_RF_enable(out_vec[2:2]),
    .ID_B_instr(out_vec[1:1]),
    .B_L(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h75cbf571;
    stim[1] = 32'hfb8cd5da;
    stim[2] = 32'h5b35340e;
    stim[3] = 32'h4a4316a5;
    stim[4] = 32'h02204987;
    stim[5] = 32'hc68f300e;
    stim[6] = 32'hf2b8856d;
    stim[7] = 32'h772f9997;
    stim[8] = 32'h4c710c9d;
    stim[9] = 32'had28510c;
    stim[10] = 32'h14aad846;
    stim[11] = 32'he908d811;
    stim[12] = 32'hc6298e66;
    stim[13] = 32'hb0cec00f;
    stim[14] = 32'hde2b0069;
    stim[15] = 32'h5363bff4;
    stim[16] = 32'h54832b2f;
    stim[17] = 32'h7a8c2cf7;
    stim[18] = 32'h5071ab21;
    stim[19] = 32'h89750733;
    stim[20] = 32'hed23f805;
    stim[21] = 32'h1fb1c12b;
    stim[22] = 32'h99c57941;
    stim[23] = 32'h04b4de5b;
    stim[24] = 32'h1cabf08d;
    stim[25] = 32'h79d92627;
    stim[26] = 32'h92e7efa0;
    stim[27] = 32'h156d43de;
    stim[28] = 32'hbe9c0f0c;
    stim[29] = 32'h14f9041d;
    stim[30] = 32'h2d8b0add;
    stim[31] = 32'h2fe30d91;
    stim[32] = 32'h3d76ca44;
    stim[33] = 32'hcee458e2;
    stim[34] = 32'hb66e07ac;
    stim[35] = 32'hc9f760f8;
    stim[36] = 32'hba2908ec;
    stim[37] = 32'h1a1d91a4;
    stim[38] = 32'h9c8ce0a2;
    stim[39] = 32'he4b3ff76;
    stim[40] = 32'h32cbc9da;
    stim[41] = 32'h09af458a;
    stim[42] = 32'heed7b19a;
    stim[43] = 32'h6ad914bf;
    stim[44] = 32'h2e4a7ad0;
    stim[45] = 32'h4f87a3b3;
    stim[46] = 32'hd0be0790;
    stim[47] = 32'heeaa0c58;
    stim[48] = 32'h4dc2047d;
    stim[49] = 32'h0851f3d9;
    stim[50] = 32'hf604fb09;
    stim[51] = 32'ha094a3e8;
    stim[52] = 32'h87a31eca;
    stim[53] = 32'hd4f58b98;
    stim[54] = 32'h2a56b788;
    stim[55] = 32'h025dfe7b;
    stim[56] = 32'h0c2f03c6;
    stim[57] = 32'hc383d42e;
    stim[58] = 32'h08d55ecb;
    stim[59] = 32'hc92edd78;
    stim[60] = 32'h20a00c9d;
    stim[61] = 32'h35efb915;
    stim[62] = 32'h176287a7;
    stim[63] = 32'h2b4f93d3;
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
      expv[0] = 14'h0960;
      expv[1] = 14'h0803;
      expv[2] = 14'h0803;
      expv[3] = 14'h0402;
      expv[4] = 14'h0204;
      expv[5] = 14'h0820;
      expv[6] = 14'h0a0c;
      expv[7] = 14'h04a0;
      expv[8] = 14'h04a0;
      expv[9] = 14'h04a0;
      expv[10] = 14'h08e0;
      expv[11] = 14'h08e0;
      expv[12] = 14'h04e0;
      expv[13] = 14'h2c04;
      expv[14] = 14'h2c04;
      expv[15] = 14'h1604;
      expv[16] = 14'h0860;
      expv[17] = 14'h0402;
      expv[18] = 14'h260c;
      expv[19] = 14'h260c;
      expv[20] = 14'h260c;
      expv[21] = 14'h260c;
      expv[22] = 14'h260c;
      expv[23] = 14'h0894;
      expv[24] = 14'h0894;
      expv[25] = 14'h0894;
      expv[26] = 14'h0e04;
      expv[27] = 14'h05e0;
      expv[28] = 14'h05e0;
      expv[29] = 14'h0994;
      expv[30] = 14'h0994;
      expv[31] = 14'h0994;
      expv[32] = 14'h0994;
      expv[33] = 14'h0994;
      expv[34] = 14'h05a0;
      expv[35] = 14'h05a0;
      expv[36] = 14'h0402;
      expv[37] = 14'h0402;
      expv[38] = 14'h0402;
      expv[39] = 14'h0894;
      expv[40] = 14'h0c04;
      expv[41] = 14'h0c04;
      expv[42] = 14'h0c04;
      expv[43] = 14'h0402;
      expv[44] = 14'h0402;
      expv[45] = 14'h0402;
      expv[46] = 14'h2a0c;
      expv[47] = 14'h2a0c;
      expv[48] = 14'h2a0c;
      expv[49] = 14'h2a0c;
      expv[50] = 14'h0420;
      expv[51] = 14'h280c;
      expv[52] = 14'h08a0;
      expv[53] = 14'h0994;
      expv[54] = 14'h0402;
      expv[55] = 14'h040c;
      expv[56] = 14'h040c;
      expv[57] = 14'h1804;
      expv[58] = 14'h1804;
      expv[59] = 14'h1804;
      expv[60] = 14'h2a04;
      expv[61] = 14'h09e0;
      expv[62] = 14'h05e0;
      expv[63] = 14'h0803;
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
