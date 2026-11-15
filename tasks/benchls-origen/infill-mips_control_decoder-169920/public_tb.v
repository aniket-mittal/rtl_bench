// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169920 dut (
    .clk(clk),
    .rst(in_vec[13:13]),
    .beqout(in_vec[12:12]),
    .op(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .DMWrite(out_vec[22:22]),
    .npc_sel(out_vec[21:20]),
    .RegWrt(out_vec[19:19]),
    .ExtOp(out_vec[18:17]),
    .mux4_5sel(out_vec[16:16]),
    .mux2sel(out_vec[15:15]),
    .mux4_32sel(out_vec[14:13]),
    .ALUctr(out_vec[12:10]),
    .Rtype(out_vec[9:9]),
    .add(out_vec[8:8]),
    .sub(out_vec[7:7]),
    .lw(out_vec[6:6]),
    .sw(out_vec[5:5]),
    .beq(out_vec[4:4]),
    .lui(out_vec[3:3]),
    .addiu(out_vec[2:2]),
    .j(out_vec[1:1]),
    .bgtz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h32d5;
    stim[1] = 14'h29b5;
    stim[2] = 14'h099b;
    stim[3] = 14'h095e;
    stim[4] = 14'h0b8d;
    stim[5] = 14'h0b4f;
    stim[6] = 14'h16d0;
    stim[7] = 14'h09e1;
    stim[8] = 14'h1ab3;
    stim[9] = 14'h009b;
    stim[10] = 14'h1f87;
    stim[11] = 14'h0be7;
    stim[12] = 14'h1c5d;
    stim[13] = 14'h0651;
    stim[14] = 14'h148c;
    stim[15] = 14'h1cec;
    stim[16] = 14'h164e;
    stim[17] = 14'h1d90;
    stim[18] = 14'h05d3;
    stim[19] = 14'h1ffd;
    stim[20] = 14'h131e;
    stim[21] = 14'h0de3;
    stim[22] = 14'h141c;
    stim[23] = 14'h177b;
    stim[24] = 14'h1a06;
    stim[25] = 14'h0708;
    stim[26] = 14'h07f9;
    stim[27] = 14'h1f09;
    stim[28] = 14'h0884;
    stim[29] = 14'h03ec;
    stim[30] = 14'h1bbd;
    stim[31] = 14'h0bde;
    stim[32] = 14'h1179;
    stim[33] = 14'h1d70;
    stim[34] = 14'h1509;
    stim[35] = 14'h0bd3;
    stim[36] = 14'h149c;
    stim[37] = 14'h0deb;
    stim[38] = 14'h0375;
    stim[39] = 14'h1ec3;
    stim[40] = 14'h1560;
    stim[41] = 14'h0a32;
    stim[42] = 14'h104b;
    stim[43] = 14'h1208;
    stim[44] = 14'h0733;
    stim[45] = 14'h00cb;
    stim[46] = 14'h0e35;
    stim[47] = 14'h1608;
    stim[48] = 14'h0829;
    stim[49] = 14'h0f64;
    stim[50] = 14'h06b7;
    stim[51] = 14'h010f;
    stim[52] = 14'h1c68;
    stim[53] = 14'h1e97;
    stim[54] = 14'h0c1c;
    stim[55] = 14'h025f;
    stim[56] = 14'h1e7e;
    stim[57] = 14'h06ef;
    stim[58] = 14'h1211;
    stim[59] = 14'h05ae;
    stim[60] = 14'h193b;
    stim[61] = 14'h1f09;
    stim[62] = 14'h0b00;
    stim[63] = 14'h1f5a;
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
      expv[0] = 23'h020000;
      expv[1] = 23'h020000;
      expv[2] = 23'h020000;
      expv[3] = 23'h020000;
      expv[4] = 23'h020000;
      expv[5] = 23'h020000;
      expv[6] = 23'h020000;
      expv[7] = 23'h020000;
      expv[8] = 23'h020000;
      expv[9] = 23'h120002;
      expv[10] = 23'h020000;
      expv[11] = 23'h020000;
      expv[12] = 23'h020000;
      expv[13] = 23'h020000;
      expv[14] = 23'h020000;
      expv[15] = 23'h020000;
      expv[16] = 23'h020000;
      expv[17] = 23'h020000;
      expv[18] = 23'h020000;
      expv[19] = 23'h020000;
      expv[20] = 23'h020000;
      expv[21] = 23'h020000;
      expv[22] = 23'h020000;
      expv[23] = 23'h020000;
      expv[24] = 23'h020000;
      expv[25] = 23'h020000;
      expv[26] = 23'h020000;
      expv[27] = 23'h020000;
      expv[28] = 23'h020000;
      expv[29] = 23'h084008;
      expv[30] = 23'h020000;
      expv[31] = 23'h020000;
      expv[32] = 23'h020000;
      expv[33] = 23'h020000;
      expv[34] = 23'h020000;
      expv[35] = 23'h020000;
      expv[36] = 23'h020000;
      expv[37] = 23'h020000;
      expv[38] = 23'h020000;
      expv[39] = 23'h020000;
      expv[40] = 23'h020000;
      expv[41] = 23'h020000;
      expv[42] = 23'h020000;
      expv[43] = 23'h020000;
      expv[44] = 23'h020000;
      expv[45] = 23'h020000;
      expv[46] = 23'h020000;
      expv[47] = 23'h020000;
      expv[48] = 23'h020000;
      expv[49] = 23'h020000;
      expv[50] = 23'h020000;
      expv[51] = 23'h020810;
      expv[52] = 23'h020000;
      expv[53] = 23'h020000;
      expv[54] = 23'h020000;
      expv[55] = 23'h0be404;
      expv[56] = 23'h020000;
      expv[57] = 23'h020000;
      expv[58] = 23'h020000;
      expv[59] = 23'h020000;
      expv[60] = 23'h020000;
      expv[61] = 23'h020000;
      expv[62] = 23'h020000;
      expv[63] = 23'h020000;
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
