// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  simple_dual_port_ram_dual_clock dut (
    .read_clock(clk),
    .data(in_vec[21:14]),
    .read_addr(in_vec[13:8]),
    .write_addr(in_vec[7:2]),
    .we(in_vec[1:1]),
    .write_clock(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h36a0cc;
    stim[1] = 22'h302117;
    stim[2] = 22'h01afa6;
    stim[3] = 22'h186214;
    stim[4] = 22'h33680b;
    stim[5] = 22'h0f3330;
    stim[6] = 22'h1f2fc9;
    stim[7] = 22'h3fb769;
    stim[8] = 22'h328d31;
    stim[9] = 22'h0d1e3a;
    stim[10] = 22'h02f5a0;
    stim[11] = 22'h15549e;
    stim[12] = 22'h3c0d62;
    stim[13] = 22'h38f4dc;
    stim[14] = 22'h398e9a;
    stim[15] = 22'h1a0e8f;
    stim[16] = 22'h322dc6;
    stim[17] = 22'h079de1;
    stim[18] = 22'h3915d0;
    stim[19] = 22'h3a6c30;
    stim[20] = 22'h318be0;
    stim[21] = 22'h1a0f1c;
    stim[22] = 22'h3f6aa1;
    stim[23] = 22'h0348d4;
    stim[24] = 22'h2bbf81;
    stim[25] = 22'h1c6cd1;
    stim[26] = 22'h177f61;
    stim[27] = 22'h38cf4f;
    stim[28] = 22'h36d9e8;
    stim[29] = 22'h3ba693;
    stim[30] = 22'h08bd12;
    stim[31] = 22'h372eb7;
    stim[32] = 22'h213f4b;
    stim[33] = 22'h24cb14;
    stim[34] = 22'h11529d;
    stim[35] = 22'h0380a6;
    stim[36] = 22'h022274;
    stim[37] = 22'h34b106;
    stim[38] = 22'h2d86c3;
    stim[39] = 22'h0e05d1;
    stim[40] = 22'h3d75b0;
    stim[41] = 22'h285889;
    stim[42] = 22'h166477;
    stim[43] = 22'h3a76ba;
    stim[44] = 22'h20d35e;
    stim[45] = 22'h08aede;
    stim[46] = 22'h10891c;
    stim[47] = 22'h1bad7e;
    stim[48] = 22'h124f90;
    stim[49] = 22'h354369;
    stim[50] = 22'h352467;
    stim[51] = 22'h25451b;
    stim[52] = 22'h08a45a;
    stim[53] = 22'h0a5172;
    stim[54] = 22'h00de9b;
    stim[55] = 22'h32c5bf;
    stim[56] = 22'h048900;
    stim[57] = 22'h0ee4c9;
    stim[58] = 22'h048752;
    stim[59] = 22'h237d03;
    stim[60] = 22'h36f34c;
    stim[61] = 22'h0fbc93;
    stim[62] = 22'h02007c;
    stim[63] = 22'h027f29;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hc0;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hee;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hdc;
      expv[49] = 8'hxx;
      expv[50] = 8'hxx;
      expv[51] = 8'hee;
      expv[52] = 8'hc0;
      expv[53] = 8'hee;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hc0;
      expv[57] = 8'hxx;
      expv[58] = 8'hee;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'h8d;
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
