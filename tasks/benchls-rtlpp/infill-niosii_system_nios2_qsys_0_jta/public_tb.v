// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  niosII_system_nios2_qsys_0_jtag_debug_module_sysclk dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3e48261607b;
    stim[1] = 42'h27e13c62e26;
    stim[2] = 42'h075bf966f29;
    stim[3] = 42'h15c8ae39607;
    stim[4] = 42'h1ca939ede12;
    stim[5] = 42'h23182e5614e;
    stim[6] = 42'h0d2e06a4de8;
    stim[7] = 42'h1a067212cab;
    stim[8] = 42'h2baa1ac102e;
    stim[9] = 42'h113c51cd1b3;
    stim[10] = 42'h25d7be9181a;
    stim[11] = 42'h2c0f03ea195;
    stim[12] = 42'h0072289f725;
    stim[13] = 42'h30d7df68b6e;
    stim[14] = 42'h05f7bcecaeb;
    stim[15] = 42'h1a9731cc47e;
    stim[16] = 42'h113488af39a;
    stim[17] = 42'h3846ecd8638;
    stim[18] = 42'h2fba63d16d9;
    stim[19] = 42'h251ff63e2b7;
    stim[20] = 42'h3701ad177d5;
    stim[21] = 42'h3347120bec3;
    stim[22] = 42'h19b901d3717;
    stim[23] = 42'h337376936a1;
    stim[24] = 42'h1e72f57035b;
    stim[25] = 42'h1cb4fc7ca3f;
    stim[26] = 42'h11dc8cabe70;
    stim[27] = 42'h19ef903a567;
    stim[28] = 42'h10af49d2da1;
    stim[29] = 42'h2f5002f9b01;
    stim[30] = 42'h0e59286e320;
    stim[31] = 42'h2c07d81d7d4;
    stim[32] = 42'h1a706d696d4;
    stim[33] = 42'h0a34c6402e0;
    stim[34] = 42'h2855f5ce578;
    stim[35] = 42'h36725e1dccb;
    stim[36] = 42'h022adc0f242;
    stim[37] = 42'h1b1b758d0e7;
    stim[38] = 42'h33a61888891;
    stim[39] = 42'h3ed2b9796ee;
    stim[40] = 42'h09be8d1ebd8;
    stim[41] = 42'h3fd467a2da5;
    stim[42] = 42'h0274025e83b;
    stim[43] = 42'h31db0d0228c;
    stim[44] = 42'h2790295e51f;
    stim[45] = 42'h14a3ffc4583;
    stim[46] = 42'h0e90ebfad42;
    stim[47] = 42'h37c3f1bc14d;
    stim[48] = 42'h36b706fd02a;
    stim[49] = 42'h3a878a8d3bd;
    stim[50] = 42'h1fbe80ef897;
    stim[51] = 42'h2ed6a47edf4;
    stim[52] = 42'h074226a2ae9;
    stim[53] = 42'h0e23ab9f2d1;
    stim[54] = 42'h1f837748511;
    stim[55] = 42'h34615a48b09;
    stim[56] = 42'h215fd019042;
    stim[57] = 42'h19d5ce64e70;
    stim[58] = 42'h1f470acae4a;
    stim[59] = 42'h1165c112d09;
    stim[60] = 42'h0c8a365aecf;
    stim[61] = 42'h2327005b5bd;
    stim[62] = 42'h09bdf9de21d;
    stim[63] = 42'h2b8d03c8064;
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
      expv[0] = 51'h0000000000000;
      expv[1] = 51'h0000000000000;
      expv[2] = 51'h0000000000000;
      expv[3] = 51'h0000000000000;
      expv[4] = 51'h0000000000000;
      expv[5] = 51'h0000000000000;
      expv[6] = 51'h0000000000000;
      expv[7] = 51'h0000000000000;
      expv[8] = 51'h0000000000000;
      expv[9] = 51'h0000000000000;
      expv[10] = 51'h0000000000000;
      expv[11] = 51'h0000000000000;
      expv[12] = 51'h0000000000000;
      expv[13] = 51'h0000000000000;
      expv[14] = 51'h0000000000000;
      expv[15] = 51'h0000000000000;
      expv[16] = 51'h0000000000000;
      expv[17] = 51'h0000000000000;
      expv[18] = 51'h0000000000000;
      expv[19] = 51'h0000000000000;
      expv[20] = 51'h0000000000000;
      expv[21] = 51'h0000000000000;
      expv[22] = 51'h0000000000000;
      expv[23] = 51'h0000000000000;
      expv[24] = 51'h0000000000000;
      expv[25] = 51'h0000000000000;
      expv[26] = 51'h0000000000000;
      expv[27] = 51'h0000000000000;
      expv[28] = 51'h0000000000000;
      expv[29] = 51'h0000000000000;
      expv[30] = 51'h0000000000000;
      expv[31] = 51'h0000000000000;
      expv[32] = 51'h0000000000000;
      expv[33] = 51'h0000000000000;
      expv[34] = 51'h0000000000000;
      expv[35] = 51'h0000000000000;
      expv[36] = 51'h0000000000000;
      expv[37] = 51'h0000000000000;
      expv[38] = 51'h0000000000000;
      expv[39] = 51'h0000000000000;
      expv[40] = 51'h0000000000000;
      expv[41] = 51'h0000000000000;
      expv[42] = 51'h0000000000000;
      expv[43] = 51'h0000000000000;
      expv[44] = 51'h0000000000000;
      expv[45] = 51'h0000000000000;
      expv[46] = 51'h0000000000000;
      expv[47] = 51'h0000000000000;
      expv[48] = 51'h0000000000000;
      expv[49] = 51'h0000000000000;
      expv[50] = 51'h0000000000000;
      expv[51] = 51'h0000000000000;
      expv[52] = 51'h0000000000000;
      expv[53] = 51'h0000000000000;
      expv[54] = 51'h0000000000000;
      expv[55] = 51'h0000000000000;
      expv[56] = 51'h0000000000000;
      expv[57] = 51'h0000000000000;
      expv[58] = 51'h0000000000000;
      expv[59] = 51'h0000000000000;
      expv[60] = 51'h0000000000000;
      expv[61] = 51'h0000000000000;
      expv[62] = 51'h0000000000000;
      expv[63] = 51'h0000000000000;
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
