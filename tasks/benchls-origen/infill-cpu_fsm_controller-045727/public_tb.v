// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_045727 dut (
    .CLKSLOW(clk),
    .CLK100MHZ(in_vec[16:16]),
    .ir_inst(in_vec[15:0]),
    .pc_load(out_vec[43:43]),
    .pc_clear(out_vec[42:42]),
    .pc_inc(out_vec[41:41]),
    .ir_load(out_vec[40:40]),
    .mb_sel(out_vec[39:39]),
    .mb_addr(out_vec[38:31]),
    .mb_read(out_vec[30:30]),
    .mb_write(out_vec[29:29]),
    .dp_imm(out_vec[28:21]),
    .dp_sel(out_vec[20:19]),
    .dp_write_addr(out_vec[18:15]),
    .dp_write(out_vec[14:14]),
    .dp_a_addr(out_vec[13:10]),
    .dp_a_read(out_vec[9:9]),
    .dp_b_addr(out_vec[8:5]),
    .dp_b_read(out_vec[4:4]),
    .dp_alu_sel(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0bf66;
    stim[1] = 17'h17d99;
    stim[2] = 17'h1afdc;
    stim[3] = 17'h1316a;
    stim[4] = 17'h18278;
    stim[5] = 17'h17ca8;
    stim[6] = 17'h0e439;
    stim[7] = 17'h1cc47;
    stim[8] = 17'h18762;
    stim[9] = 17'h13771;
    stim[10] = 17'h08fb1;
    stim[11] = 17'h14794;
    stim[12] = 17'h1a41d;
    stim[13] = 17'h0aef7;
    stim[14] = 17'h0f262;
    stim[15] = 17'h066a6;
    stim[16] = 17'h1a7b9;
    stim[17] = 17'h05ec2;
    stim[18] = 17'h0536d;
    stim[19] = 17'h18e3c;
    stim[20] = 17'h0ddb0;
    stim[21] = 17'h03f8c;
    stim[22] = 17'h03857;
    stim[23] = 17'h11c11;
    stim[24] = 17'h09bef;
    stim[25] = 17'h1df45;
    stim[26] = 17'h11a29;
    stim[27] = 17'h0c78d;
    stim[28] = 17'h092aa;
    stim[29] = 17'h04947;
    stim[30] = 17'h0c704;
    stim[31] = 17'h04b55;
    stim[32] = 17'h0ef83;
    stim[33] = 17'h0c51c;
    stim[34] = 17'h04fdc;
    stim[35] = 17'h0799f;
    stim[36] = 17'h16738;
    stim[37] = 17'h126f8;
    stim[38] = 17'h1ce20;
    stim[39] = 17'h170ba;
    stim[40] = 17'h10a46;
    stim[41] = 17'h00176;
    stim[42] = 17'h028c4;
    stim[43] = 17'h01164;
    stim[44] = 17'h11b31;
    stim[45] = 17'h06e8e;
    stim[46] = 17'h1a70b;
    stim[47] = 17'h0399e;
    stim[48] = 17'h01005;
    stim[49] = 17'h109aa;
    stim[50] = 17'h0ca98;
    stim[51] = 17'h0d210;
    stim[52] = 17'h13a90;
    stim[53] = 17'h0404d;
    stim[54] = 17'h062b7;
    stim[55] = 17'h14399;
    stim[56] = 17'h11ad6;
    stim[57] = 17'h00e4b;
    stim[58] = 17'h06020;
    stim[59] = 17'h07483;
    stim[60] = 17'h04987;
    stim[61] = 17'h1c90f;
    stim[62] = 17'h037a3;
    stim[63] = 17'h19a79;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h40000000000;
      expv[2] = 44'h30040000000;
      expv[3] = 44'h00000000000;
      expv[4] = 44'h00000044af8;
      expv[5] = 44'h30040000000;
      expv[6] = 44'h00000000000;
      expv[7] = 44'h00000000000;
      expv[8] = 44'h00000000000;
      expv[9] = 44'h00000000000;
      expv[10] = 44'h00000000000;
      expv[11] = 44'h00000000000;
      expv[12] = 44'h00000000000;
      expv[13] = 44'h00000000000;
      expv[14] = 44'h00000000000;
      expv[15] = 44'h00000000000;
      expv[16] = 44'h00000000000;
      expv[17] = 44'h00000000000;
      expv[18] = 44'h00000000000;
      expv[19] = 44'h00000000000;
      expv[20] = 44'h00000000000;
      expv[21] = 44'h00000000000;
      expv[22] = 44'h00000000000;
      expv[23] = 44'h00000000000;
      expv[24] = 44'h00000000000;
      expv[25] = 44'h00000000000;
      expv[26] = 44'h00000000000;
      expv[27] = 44'h00000000000;
      expv[28] = 44'h00000000000;
      expv[29] = 44'h00000000000;
      expv[30] = 44'h00000000000;
      expv[31] = 44'h00000000000;
      expv[32] = 44'h00000000000;
      expv[33] = 44'h00000000000;
      expv[34] = 44'h00000000000;
      expv[35] = 44'h00000000000;
      expv[36] = 44'h00000000000;
      expv[37] = 44'h00000000000;
      expv[38] = 44'h00000000000;
      expv[39] = 44'h00000000000;
      expv[40] = 44'h00000000000;
      expv[41] = 44'h00000000000;
      expv[42] = 44'h00000000000;
      expv[43] = 44'h00000000000;
      expv[44] = 44'h00000000000;
      expv[45] = 44'h00000000000;
      expv[46] = 44'h00000000000;
      expv[47] = 44'h00000000000;
      expv[48] = 44'h00000000000;
      expv[49] = 44'h00000000000;
      expv[50] = 44'h00000000000;
      expv[51] = 44'h00000000000;
      expv[52] = 44'h00000000000;
      expv[53] = 44'h00000000000;
      expv[54] = 44'h00000000000;
      expv[55] = 44'h00000000000;
      expv[56] = 44'h00000000000;
      expv[57] = 44'h00000000000;
      expv[58] = 44'h00000000000;
      expv[59] = 44'h00000000000;
      expv[60] = 44'h00000000000;
      expv[61] = 44'h00000000000;
      expv[62] = 44'h00000000000;
      expv[63] = 44'h00000000000;
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
