// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182344 dut (
    .op_code(in_vec[7:4]),
    .func_in(in_vec[3:0]),
    .func_out(out_vec[13:10]),
    .reg_x_reg(out_vec[9:9]),
    .reg_x_imm(out_vec[8:8]),
    .beqz(out_vec[7:7]),
    .bnez(out_vec[6:6]),
    .lw(out_vec[5:5]),
    .sw(out_vec[4:4]),
    .reg_write(out_vec[3:3]),
    .jump(out_vec[2:2]),
    .jal(out_vec[1:1]),
    .jr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h8f;
    stim[1] = 8'he4;
    stim[2] = 8'h14;
    stim[3] = 8'h61;
    stim[4] = 8'h50;
    stim[5] = 8'h13;
    stim[6] = 8'h32;
    stim[7] = 8'h7a;
    stim[8] = 8'h1b;
    stim[9] = 8'h14;
    stim[10] = 8'hcc;
    stim[11] = 8'h16;
    stim[12] = 8'h0a;
    stim[13] = 8'ha6;
    stim[14] = 8'h6f;
    stim[15] = 8'hcf;
    stim[16] = 8'h3a;
    stim[17] = 8'hea;
    stim[18] = 8'ha0;
    stim[19] = 8'h3d;
    stim[20] = 8'h9b;
    stim[21] = 8'hbd;
    stim[22] = 8'h7b;
    stim[23] = 8'hb8;
    stim[24] = 8'h51;
    stim[25] = 8'h79;
    stim[26] = 8'hd0;
    stim[27] = 8'h4f;
    stim[28] = 8'hf7;
    stim[29] = 8'h63;
    stim[30] = 8'h68;
    stim[31] = 8'h42;
    stim[32] = 8'h3c;
    stim[33] = 8'hdc;
    stim[34] = 8'h89;
    stim[35] = 8'hd7;
    stim[36] = 8'hcf;
    stim[37] = 8'h53;
    stim[38] = 8'hbd;
    stim[39] = 8'ha4;
    stim[40] = 8'hcd;
    stim[41] = 8'he1;
    stim[42] = 8'h10;
    stim[43] = 8'h52;
    stim[44] = 8'h71;
    stim[45] = 8'h2e;
    stim[46] = 8'h6c;
    stim[47] = 8'he7;
    stim[48] = 8'hd9;
    stim[49] = 8'he0;
    stim[50] = 8'h92;
    stim[51] = 8'h3e;
    stim[52] = 8'h8f;
    stim[53] = 8'hb5;
    stim[54] = 8'h7d;
    stim[55] = 8'h91;
    stim[56] = 8'h7b;
    stim[57] = 8'h0b;
    stim[58] = 8'h25;
    stim[59] = 8'h61;
    stim[60] = 8'h2c;
    stim[61] = 8'hb5;
    stim[62] = 8'hb7;
    stim[63] = 8'h52;
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
      expv[0] = 14'h3e05;
      expv[1] = 14'h0000;
      expv[2] = 14'h1108;
      expv[3] = 14'h0004;
      expv[4] = 14'h0310;
      expv[5] = 14'h0d08;
      expv[6] = 14'h0a40;
      expv[7] = 14'h000e;
      expv[8] = 14'h2d08;
      expv[9] = 14'h1108;
      expv[10] = 14'h0000;
      expv[11] = 14'h1908;
      expv[12] = 14'h2a08;
      expv[13] = 14'h0000;
      expv[14] = 14'h0004;
      expv[15] = 14'h0000;
      expv[16] = 14'h2a40;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h3640;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h000e;
      expv[23] = 14'h0000;
      expv[24] = 14'h0310;
      expv[25] = 14'h000e;
      expv[26] = 14'h0000;
      expv[27] = 14'h0128;
      expv[28] = 14'h0000;
      expv[29] = 14'h0004;
      expv[30] = 14'h0004;
      expv[31] = 14'h0128;
      expv[32] = 14'h3240;
      expv[33] = 14'h0000;
      expv[34] = 14'h2605;
      expv[35] = 14'h0000;
      expv[36] = 14'h0000;
      expv[37] = 14'h0310;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0108;
      expv[43] = 14'h0310;
      expv[44] = 14'h000e;
      expv[45] = 14'h3a80;
      expv[46] = 14'h0004;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h3a40;
      expv[52] = 14'h3e05;
      expv[53] = 14'h0000;
      expv[54] = 14'h000e;
      expv[55] = 14'h0000;
      expv[56] = 14'h000e;
      expv[57] = 14'h2e08;
      expv[58] = 14'h1680;
      expv[59] = 14'h0004;
      expv[60] = 14'h3280;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0310;
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
