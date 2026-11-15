// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_163381 dut (
    .opd_1(in_vec[19:12]),
    .opd_2(in_vec[11:4]),
    .opcode(in_vec[3:0]),
    .res(out_vec[17:2]),
    .c_flag(out_vec[1:1]),
    .z_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hb9d63;
    stim[1] = 20'h12129;
    stim[2] = 20'hef743;
    stim[3] = 20'h7e69f;
    stim[4] = 20'h00396;
    stim[5] = 20'hfe855;
    stim[6] = 20'h5eefd;
    stim[7] = 20'h022ca;
    stim[8] = 20'hacaff;
    stim[9] = 20'hc5bbb;
    stim[10] = 20'hbc1ff;
    stim[11] = 20'hc9b7a;
    stim[12] = 20'h1b5b6;
    stim[13] = 20'h86845;
    stim[14] = 20'h47041;
    stim[15] = 20'h7322b;
    stim[16] = 20'hcd8b6;
    stim[17] = 20'h8eceb;
    stim[18] = 20'h0a701;
    stim[19] = 20'h25946;
    stim[20] = 20'hf6b8a;
    stim[21] = 20'hcf847;
    stim[22] = 20'h18aa0;
    stim[23] = 20'h869e7;
    stim[24] = 20'hc4007;
    stim[25] = 20'h4c7fc;
    stim[26] = 20'h97480;
    stim[27] = 20'h8d4c9;
    stim[28] = 20'h6e071;
    stim[29] = 20'h19ca0;
    stim[30] = 20'h13839;
    stim[31] = 20'hbe999;
    stim[32] = 20'h13b16;
    stim[33] = 20'hbdcdd;
    stim[34] = 20'h8e8de;
    stim[35] = 20'hfff50;
    stim[36] = 20'h6e99c;
    stim[37] = 20'hefde5;
    stim[38] = 20'he4d4f;
    stim[39] = 20'h0d213;
    stim[40] = 20'heffd1;
    stim[41] = 20'h116dc;
    stim[42] = 20'h91a27;
    stim[43] = 20'h2089a;
    stim[44] = 20'h5820a;
    stim[45] = 20'h93e29;
    stim[46] = 20'h34f01;
    stim[47] = 20'hc3c0e;
    stim[48] = 20'h44c4a;
    stim[49] = 20'h99968;
    stim[50] = 20'h23663;
    stim[51] = 20'h5c0ef;
    stim[52] = 20'h41fd8;
    stim[53] = 20'h7b5d5;
    stim[54] = 20'hb71f2;
    stim[55] = 20'h4669e;
    stim[56] = 20'h28736;
    stim[57] = 20'h79c3f;
    stim[58] = 20'hbca94;
    stim[59] = 20'h44c84;
    stim[60] = 20'h42c78;
    stim[61] = 20'h652fd;
    stim[62] = 20'hdce6e;
    stim[63] = 20'h23247;
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
      expv[0] = 18'h00xxx;
      expv[1] = 18'h00001;
      expv[2] = 18'h001f0;
      expv[3] = 18'h00001;
      expv[4] = 18'h00001;
      expv[5] = 18'h003fc;
      expv[6] = 18'h00001;
      expv[7] = 18'h003f4;
      expv[8] = 18'h00001;
      expv[9] = 18'h0022a;
      expv[10] = 18'h00001;
      expv[11] = 18'h000d8;
      expv[12] = 18'h0006c;
      expv[13] = 18'h0021c;
      expv[14] = 18'h0012c;
      expv[15] = 18'h00398;
      expv[16] = 18'h00334;
      expv[17] = 18'h00072;
      expv[18] = 18'h001ec;
      expv[19] = 18'h00094;
      expv[20] = 18'h00024;
      expv[21] = 18'h00210;
      expv[22] = 18'h00308;
      expv[23] = 18'h00218;
      expv[24] = 18'h00001;
      expv[25] = 18'h00098;
      expv[26] = 18'h0037c;
      expv[27] = 18'h00304;
      expv[28] = 18'h001d4;
      expv[29] = 18'h0038c;
      expv[30] = 18'h00240;
      expv[31] = 18'h0009c;
      expv[32] = 18'h0004c;
      expv[33] = 18'h00001;
      expv[34] = 18'h00001;
      expv[35] = 18'h003d2;
      expv[36] = 18'h000dc;
      expv[37] = 18'h003c0;
      expv[38] = 18'h00001;
      expv[39] = 18'h003b6;
      expv[40] = 18'h003b6;
      expv[41] = 18'h00022;
      expv[42] = 18'h00200;
      expv[43] = 18'h0037c;
      expv[44] = 18'h0029c;
      expv[45] = 18'h001c4;
      expv[46] = 18'h00092;
      expv[47] = 18'h00001;
      expv[48] = 18'h002ec;
      expv[49] = 18'h0027c;
      expv[50] = 18'h002fa;
      expv[51] = 18'h00001;
      expv[52] = 18'h003f4;
      expv[53] = 18'h001f0;
      expv[54] = 18'h00260;
      expv[55] = 18'h00001;
      expv[56] = 18'h000a0;
      expv[57] = 18'h00001;
      expv[58] = 18'h002ec;
      expv[59] = 18'h0010c;
      expv[60] = 18'h0031c;
      expv[61] = 18'h00001;
      expv[62] = 18'h00001;
      expv[63] = 18'h00080;
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
