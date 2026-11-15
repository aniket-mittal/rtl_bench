// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131507 dut (
    .clk(clk),
    .rst_n(in_vec[26:26]),
    .baud_div(in_vec[25:10]),
    .data_in(in_vec[9:2]),
    .data_valid(in_vec[1:1]),
    .force_break(in_vec[0:0]),
    .txd(out_vec[3:3]),
    .tx_ready(out_vec[2:2]),
    .shift_empty(out_vec[1:1]),
    .overrun(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h2d8651f;
    stim[1] = 27'h3000824;
    stim[2] = 27'h43e4cae;
    stim[3] = 27'h64d13d6;
    stim[4] = 27'h4617719;
    stim[5] = 27'h6d5d2af;
    stim[6] = 27'h67b4cc9;
    stim[7] = 27'h6bb9295;
    stim[8] = 27'h7fce238;
    stim[9] = 27'h76e749f;
    stim[10] = 27'h6cfd74e;
    stim[11] = 27'h59d4c9f;
    stim[12] = 27'h5776417;
    stim[13] = 27'h4075de0;
    stim[14] = 27'h666fa69;
    stim[15] = 27'h681160b;
    stim[16] = 27'h423b6e3;
    stim[17] = 27'h485a99f;
    stim[18] = 27'h667311d;
    stim[19] = 27'h73d2138;
    stim[20] = 27'h62259a1;
    stim[21] = 27'h47b435f;
    stim[22] = 27'h6b13978;
    stim[23] = 27'h67fd9b9;
    stim[24] = 27'h6eccf38;
    stim[25] = 27'h6dc35df;
    stim[26] = 27'h517e059;
    stim[27] = 27'h6efbeec;
    stim[28] = 27'h4263387;
    stim[29] = 27'h40d190d;
    stim[30] = 27'h41c765e;
    stim[31] = 27'h765c7df;
    stim[32] = 27'h7542ae4;
    stim[33] = 27'h62e26f6;
    stim[34] = 27'h7baa462;
    stim[35] = 27'h7f9bbcf;
    stim[36] = 27'h11635e3;
    stim[37] = 27'h413f521;
    stim[38] = 27'h40084f5;
    stim[39] = 27'h5d8c711;
    stim[40] = 27'h585cca3;
    stim[41] = 27'h56ee7a1;
    stim[42] = 27'h69fb9aa;
    stim[43] = 27'h7fad701;
    stim[44] = 27'h5189054;
    stim[45] = 27'h45641b8;
    stim[46] = 27'h5f670c0;
    stim[47] = 27'h75c7ad5;
    stim[48] = 27'h5a90621;
    stim[49] = 27'h70b48d4;
    stim[50] = 27'h7490d13;
    stim[51] = 27'h74c7005;
    stim[52] = 27'h690b8ae;
    stim[53] = 27'h4f3c297;
    stim[54] = 27'h728ec85;
    stim[55] = 27'h5034d29;
    stim[56] = 27'h44266a0;
    stim[57] = 27'h6177b26;
    stim[58] = 27'h6a396b1;
    stim[59] = 27'h58eb83e;
    stim[60] = 27'h7ad2d88;
    stim[61] = 27'h75bc1cb;
    stim[62] = 27'h7139d45;
    stim[63] = 27'h6597590;
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
      expv[0] = 4'he;
      expv[1] = 4'he;
      expv[2] = 4'he;
      expv[3] = 4'he;
      expv[4] = 4'h1;
      expv[5] = 4'h0;
      expv[6] = 4'h1;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h1;
      expv[11] = 4'h1;
      expv[12] = 4'h1;
      expv[13] = 4'h1;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h1;
      expv[17] = 4'h1;
      expv[18] = 4'h1;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h1;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h1;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h1;
      expv[30] = 4'h0;
      expv[31] = 4'h1;
      expv[32] = 4'h1;
      expv[33] = 4'h0;
      expv[34] = 4'h1;
      expv[35] = 4'h1;
      expv[36] = 4'he;
      expv[37] = 4'he;
      expv[38] = 4'h6;
      expv[39] = 4'h6;
      expv[40] = 4'h6;
      expv[41] = 4'h6;
      expv[42] = 4'h6;
      expv[43] = 4'he;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h1;
      expv[52] = 4'h0;
      expv[53] = 4'h1;
      expv[54] = 4'h1;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h1;
      expv[59] = 4'h0;
      expv[60] = 4'h1;
      expv[61] = 4'h0;
      expv[62] = 4'h1;
      expv[63] = 4'h0;
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
