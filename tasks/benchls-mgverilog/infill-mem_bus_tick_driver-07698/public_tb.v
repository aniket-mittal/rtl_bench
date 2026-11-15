// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07698 dut (
    .clk(clk),
    .resetn(in_vec[34:34]),
    .mem_ready(in_vec[33:33]),
    .mem_rdata(in_vec[32:1]),
    .tick(in_vec[0:0]),
    .mem_valid(out_vec[69:69]),
    .mem_instr(out_vec[68:68]),
    .mem_addr(out_vec[67:36]),
    .mem_wstrb(out_vec[35:32]),
    .mem_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h237f2354b;
    stim[1] = 35'h11c7652f5;
    stim[2] = 35'h420384e63;
    stim[3] = 35'h56b6f18d9;
    stim[4] = 35'h435faeee3;
    stim[5] = 35'h6d3b908da;
    stim[6] = 35'h6fc47c717;
    stim[7] = 35'h44d803d07;
    stim[8] = 35'h741b2aaca;
    stim[9] = 35'h4a8273fc0;
    stim[10] = 35'h7338304d4;
    stim[11] = 35'h757e7acec;
    stim[12] = 35'h664be8371;
    stim[13] = 35'h4fe0856d5;
    stim[14] = 35'h404913db1;
    stim[15] = 35'h7658065cf;
    stim[16] = 35'h70d00d027;
    stim[17] = 35'h4691be7b0;
    stim[18] = 35'h69e536c32;
    stim[19] = 35'h58d0d7d60;
    stim[20] = 35'h5d72ffb6c;
    stim[21] = 35'h48ef47c81;
    stim[22] = 35'h412a5e095;
    stim[23] = 35'h59f90a5a8;
    stim[24] = 35'h51384b381;
    stim[25] = 35'h6186e3a17;
    stim[26] = 35'h605c6e779;
    stim[27] = 35'h747afb936;
    stim[28] = 35'h7ceff3ba6;
    stim[29] = 35'h7729232cb;
    stim[30] = 35'h48bebfd67;
    stim[31] = 35'h4d03475b3;
    stim[32] = 35'h768b0bd19;
    stim[33] = 35'h58f329bef;
    stim[34] = 35'h74895dde6;
    stim[35] = 35'h47a1a9c52;
    stim[36] = 35'h76176c8b6;
    stim[37] = 35'h4c03113d3;
    stim[38] = 35'h6143ab56e;
    stim[39] = 35'h50dc27fa3;
    stim[40] = 35'h77cc3f499;
    stim[41] = 35'h59e2fe2d2;
    stim[42] = 35'h56304a268;
    stim[43] = 35'h7a2a90cba;
    stim[44] = 35'h18ced94e1;
    stim[45] = 35'h55a61aee9;
    stim[46] = 35'h45bd33da5;
    stim[47] = 35'h7acb8701a;
    stim[48] = 35'h7b8ff427f;
    stim[49] = 35'h45603b6e2;
    stim[50] = 35'h4ea486741;
    stim[51] = 35'h46f75238c;
    stim[52] = 35'h503d157f5;
    stim[53] = 35'h4e9074043;
    stim[54] = 35'h635266bab;
    stim[55] = 35'h670012eec;
    stim[56] = 35'h78037d967;
    stim[57] = 35'h4f734ee1e;
    stim[58] = 35'h6a189d640;
    stim[59] = 35'h542fa498c;
    stim[60] = 35'h77cbac5fe;
    stim[61] = 35'h7d2a47398;
    stim[62] = 35'h427b04c50;
    stim[63] = 35'h40a49cc7f;
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
      expv[0] = 70'h2ffff006010000000x;
      expv[1] = 70'h2ffff0060100000000;
      expv[2] = 70'h2ffff0060100000000;
      expv[3] = 70'h2ffff0060100000001;
      expv[4] = 70'h2ffff0060100000002;
      expv[5] = 70'h000000000000000000;
      expv[6] = 70'h2ffff0060100000003;
      expv[7] = 70'h2ffff0060100000004;
      expv[8] = 70'h000000000000000000;
      expv[9] = 70'h000000000000000000;
      expv[10] = 70'h000000000000000000;
      expv[11] = 70'h000000000000000000;
      expv[12] = 70'h2ffff0060100000005;
      expv[13] = 70'h2ffff0060100000006;
      expv[14] = 70'h2ffff0060100000007;
      expv[15] = 70'h2ffff0060100000008;
      expv[16] = 70'h2ffff0060100000009;
      expv[17] = 70'h000000000000000000;
      expv[18] = 70'h000000000000000000;
      expv[19] = 70'h000000000000000000;
      expv[20] = 70'h000000000000000000;
      expv[21] = 70'h2ffff006010000000a;
      expv[22] = 70'h2ffff006010000000b;
      expv[23] = 70'h000000000000000000;
      expv[24] = 70'h2ffff006010000000c;
      expv[25] = 70'h2ffff006010000000d;
      expv[26] = 70'h2ffff006010000000e;
      expv[27] = 70'h000000000000000000;
      expv[28] = 70'h000000000000000000;
      expv[29] = 70'h2ffff006010000000f;
      expv[30] = 70'h2ffff0060100000000;
      expv[31] = 70'h2ffff0060100000001;
      expv[32] = 70'h2ffff0060100000002;
      expv[33] = 70'h2ffff0060100000003;
      expv[34] = 70'h000000000000000000;
      expv[35] = 70'h000000000000000000;
      expv[36] = 70'h000000000000000000;
      expv[37] = 70'h2ffff0060100000004;
      expv[38] = 70'h000000000000000000;
      expv[39] = 70'h2ffff0060100000005;
      expv[40] = 70'h2ffff0060100000006;
      expv[41] = 70'h000000000000000000;
      expv[42] = 70'h000000000000000000;
      expv[43] = 70'h000000000000000000;
      expv[44] = 70'h2ffff0060100000007;
      expv[45] = 70'h2ffff0060100000000;
      expv[46] = 70'h2ffff0060100000001;
      expv[47] = 70'h000000000000000000;
      expv[48] = 70'h2ffff0060100000002;
      expv[49] = 70'h000000000000000000;
      expv[50] = 70'h2ffff0060100000003;
      expv[51] = 70'h000000000000000000;
      expv[52] = 70'h2ffff0060100000004;
      expv[53] = 70'h2ffff0060100000005;
      expv[54] = 70'h2ffff0060100000006;
      expv[55] = 70'h000000000000000000;
      expv[56] = 70'h2ffff0060100000007;
      expv[57] = 70'h000000000000000000;
      expv[58] = 70'h000000000000000000;
      expv[59] = 70'h000000000000000000;
      expv[60] = 70'h000000000000000000;
      expv[61] = 70'h000000000000000000;
      expv[62] = 70'h000000000000000000;
      expv[63] = 70'h2ffff0060100000008;
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
