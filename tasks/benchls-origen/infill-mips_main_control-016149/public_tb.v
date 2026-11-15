// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_016149 dut (
    .reset(in_vec[6:6]),
    .opcode(in_vec[5:0]),
    .reg_dst(out_vec[9:9]),
    .mem_to_reg(out_vec[8:8]),
    .mem_read(out_vec[7:7]),
    .mem_write(out_vec[6:6]),
    .alu_src(out_vec[5:5]),
    .reg_write(out_vec[4:4]),
    .branch(out_vec[3:3]),
    .jump(out_vec[2:2]),
    .alu_op(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h4f;
    stim[1] = 7'h68;
    stim[2] = 7'h28;
    stim[3] = 7'h31;
    stim[4] = 7'h08;
    stim[5] = 7'h2a;
    stim[6] = 7'h3b;
    stim[7] = 7'h25;
    stim[8] = 7'h2c;
    stim[9] = 7'h23;
    stim[10] = 7'h21;
    stim[11] = 7'h10;
    stim[12] = 7'h3d;
    stim[13] = 7'h35;
    stim[14] = 7'h27;
    stim[15] = 7'h3d;
    stim[16] = 7'h25;
    stim[17] = 7'h32;
    stim[18] = 7'h07;
    stim[19] = 7'h0e;
    stim[20] = 7'h20;
    stim[21] = 7'h23;
    stim[22] = 7'h1b;
    stim[23] = 7'h3a;
    stim[24] = 7'h20;
    stim[25] = 7'h02;
    stim[26] = 7'h20;
    stim[27] = 7'h0b;
    stim[28] = 7'h0f;
    stim[29] = 7'h15;
    stim[30] = 7'h2c;
    stim[31] = 7'h15;
    stim[32] = 7'h1f;
    stim[33] = 7'h08;
    stim[34] = 7'h2a;
    stim[35] = 7'h3d;
    stim[36] = 7'h02;
    stim[37] = 7'h11;
    stim[38] = 7'h32;
    stim[39] = 7'h1e;
    stim[40] = 7'h29;
    stim[41] = 7'h1b;
    stim[42] = 7'h39;
    stim[43] = 7'h30;
    stim[44] = 7'h39;
    stim[45] = 7'h34;
    stim[46] = 7'h05;
    stim[47] = 7'h3c;
    stim[48] = 7'h34;
    stim[49] = 7'h18;
    stim[50] = 7'h29;
    stim[51] = 7'h16;
    stim[52] = 7'h15;
    stim[53] = 7'h2e;
    stim[54] = 7'h29;
    stim[55] = 7'h27;
    stim[56] = 7'h3a;
    stim[57] = 7'h1d;
    stim[58] = 7'h3b;
    stim[59] = 7'h3e;
    stim[60] = 7'h26;
    stim[61] = 7'h3f;
    stim[62] = 7'h0e;
    stim[63] = 7'h62;
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
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h030;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h1b0;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h1b0;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h004;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h030;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h004;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h232;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
