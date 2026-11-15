// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_080493 dut (
    .opcode_i(in_vec[5:0]),
    .reg_dst_o(out_vec[11:11]),
    .branch_eq_o(out_vec[10:10]),
    .branch_ne_o(out_vec[9:9]),
    .mem_read_o(out_vec[8:8]),
    .mem_write_o(out_vec[7:7]),
    .mem_to_reg_o(out_vec[6:6]),
    .alu_src_o(out_vec[5:5]),
    .reg_write_o(out_vec[4:4]),
    .jump_o(out_vec[3:3]),
    .alu_op_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h0f;
    stim[1] = 6'h18;
    stim[2] = 6'h21;
    stim[3] = 6'h3f;
    stim[4] = 6'h33;
    stim[5] = 6'h0e;
    stim[6] = 6'h3e;
    stim[7] = 6'h2d;
    stim[8] = 6'h32;
    stim[9] = 6'h24;
    stim[10] = 6'h33;
    stim[11] = 6'h26;
    stim[12] = 6'h3d;
    stim[13] = 6'h26;
    stim[14] = 6'h3c;
    stim[15] = 6'h19;
    stim[16] = 6'h3e;
    stim[17] = 6'h16;
    stim[18] = 6'h08;
    stim[19] = 6'h29;
    stim[20] = 6'h16;
    stim[21] = 6'h1e;
    stim[22] = 6'h1f;
    stim[23] = 6'h05;
    stim[24] = 6'h1c;
    stim[25] = 6'h30;
    stim[26] = 6'h17;
    stim[27] = 6'h16;
    stim[28] = 6'h3e;
    stim[29] = 6'h39;
    stim[30] = 6'h1b;
    stim[31] = 6'h13;
    stim[32] = 6'h2c;
    stim[33] = 6'h1e;
    stim[34] = 6'h22;
    stim[35] = 6'h2c;
    stim[36] = 6'h36;
    stim[37] = 6'h3d;
    stim[38] = 6'h2e;
    stim[39] = 6'h02;
    stim[40] = 6'h0d;
    stim[41] = 6'h22;
    stim[42] = 6'h38;
    stim[43] = 6'h1c;
    stim[44] = 6'h1e;
    stim[45] = 6'h1f;
    stim[46] = 6'h0f;
    stim[47] = 6'h3b;
    stim[48] = 6'h0a;
    stim[49] = 6'h1a;
    stim[50] = 6'h3a;
    stim[51] = 6'h28;
    stim[52] = 6'h27;
    stim[53] = 6'h3d;
    stim[54] = 6'h0a;
    stim[55] = 6'h3c;
    stim[56] = 6'h17;
    stim[57] = 6'h2c;
    stim[58] = 6'h2f;
    stim[59] = 6'h1b;
    stim[60] = 6'h3c;
    stim[61] = 6'h1b;
    stim[62] = 6'h1c;
    stim[63] = 6'h1f;
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
      expv[0] = 12'h0a0;
      expv[1] = 12'hfff;
      expv[2] = 12'hfff;
      expv[3] = 12'hfff;
      expv[4] = 12'hfff;
      expv[5] = 12'hfff;
      expv[6] = 12'hfff;
      expv[7] = 12'hfff;
      expv[8] = 12'hfff;
      expv[9] = 12'hfff;
      expv[10] = 12'hfff;
      expv[11] = 12'hfff;
      expv[12] = 12'hfff;
      expv[13] = 12'hfff;
      expv[14] = 12'hfff;
      expv[15] = 12'hfff;
      expv[16] = 12'hfff;
      expv[17] = 12'hfff;
      expv[18] = 12'h0a1;
      expv[19] = 12'hfff;
      expv[20] = 12'hfff;
      expv[21] = 12'hfff;
      expv[22] = 12'hfff;
      expv[23] = 12'h203;
      expv[24] = 12'hfff;
      expv[25] = 12'hfff;
      expv[26] = 12'hfff;
      expv[27] = 12'hfff;
      expv[28] = 12'hfff;
      expv[29] = 12'hfff;
      expv[30] = 12'hfff;
      expv[31] = 12'hfff;
      expv[32] = 12'hfff;
      expv[33] = 12'hfff;
      expv[34] = 12'hfff;
      expv[35] = 12'hfff;
      expv[36] = 12'hfff;
      expv[37] = 12'hfff;
      expv[38] = 12'hfff;
      expv[39] = 12'h00e;
      expv[40] = 12'h0a2;
      expv[41] = 12'hfff;
      expv[42] = 12'hfff;
      expv[43] = 12'hfff;
      expv[44] = 12'hfff;
      expv[45] = 12'hfff;
      expv[46] = 12'h0a0;
      expv[47] = 12'hfff;
      expv[48] = 12'hfff;
      expv[49] = 12'hfff;
      expv[50] = 12'hfff;
      expv[51] = 12'hfff;
      expv[52] = 12'hfff;
      expv[53] = 12'hfff;
      expv[54] = 12'hfff;
      expv[55] = 12'hfff;
      expv[56] = 12'hfff;
      expv[57] = 12'hfff;
      expv[58] = 12'hfff;
      expv[59] = 12'hfff;
      expv[60] = 12'hfff;
      expv[61] = 12'hfff;
      expv[62] = 12'hfff;
      expv[63] = 12'hfff;
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
