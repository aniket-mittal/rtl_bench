// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  byte_enabled_simple_dual_port_ram dut (
    .clk(clk),
    .waddr(in_vec[24:19]),
    .raddr(in_vec[18:13]),
    .be(in_vec[12:9]),
    .wdata(in_vec[8:1]),
    .we(in_vec[0:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h081c5b4;
    stim[1] = 25'h1681eb6;
    stim[2] = 25'h1e165c0;
    stim[3] = 25'h14019d7;
    stim[4] = 25'h1c2ee9b;
    stim[5] = 25'h065b0db;
    stim[6] = 25'h07c11ae;
    stim[7] = 25'h13dbba2;
    stim[8] = 25'h118ccd7;
    stim[9] = 25'h1469f49;
    stim[10] = 25'h006f0c8;
    stim[11] = 25'h03ea8a1;
    stim[12] = 25'h1e32eb7;
    stim[13] = 25'h13f71ff;
    stim[14] = 25'h02350b1;
    stim[15] = 25'h06d64c7;
    stim[16] = 25'h06e4818;
    stim[17] = 25'h08e1314;
    stim[18] = 25'h0b63ed7;
    stim[19] = 25'h1174bb6;
    stim[20] = 25'h1177594;
    stim[21] = 25'h13fdc47;
    stim[22] = 25'h080959b;
    stim[23] = 25'h1802820;
    stim[24] = 25'h0c7378c;
    stim[25] = 25'h0f620db;
    stim[26] = 25'h0eda9ab;
    stim[27] = 25'h1353646;
    stim[28] = 25'h1113799;
    stim[29] = 25'h1d918ca;
    stim[30] = 25'h03cb7c1;
    stim[31] = 25'h0537b4d;
    stim[32] = 25'h0eb0d73;
    stim[33] = 25'h08a66e8;
    stim[34] = 25'h0479e0d;
    stim[35] = 25'h00f8ade;
    stim[36] = 25'h0fb89ee;
    stim[37] = 25'h0eef405;
    stim[38] = 25'h1741a2a;
    stim[39] = 25'h02a8722;
    stim[40] = 25'h0978961;
    stim[41] = 25'h0aeffe5;
    stim[42] = 25'h1dc674a;
    stim[43] = 25'h1d71033;
    stim[44] = 25'h111f449;
    stim[45] = 25'h02f4ce1;
    stim[46] = 25'h0c3bc0c;
    stim[47] = 25'h1148d08;
    stim[48] = 25'h0571a4e;
    stim[49] = 25'h04d7f2a;
    stim[50] = 25'h1504ba4;
    stim[51] = 25'h144723c;
    stim[52] = 25'h0731710;
    stim[53] = 25'h0b2b8b8;
    stim[54] = 25'h15d1f9f;
    stim[55] = 25'h1d8d4f6;
    stim[56] = 25'h1c25f24;
    stim[57] = 25'h10b15e0;
    stim[58] = 25'h1c1a78e;
    stim[59] = 25'h120b3d3;
    stim[60] = 25'h1a960f5;
    stim[61] = 25'h1e6d880;
    stim[62] = 25'h0772e88;
    stim[63] = 25'h1d44e67;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'h58xxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxx5b5b5b;
      expv[36] = 32'hxx5b5b5b;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxx5b5b5b;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxx6b6bxx;
      expv[44] = 32'hxx4d4d4d;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'h19xxxxxx;
      expv[47] = 32'h02b902xx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxx4d4d4d;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxx6b6bxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hf2f2f2f2;
      expv[55] = 32'ha4a4a4a4;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxb0xxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxx63xx;
      expv[60] = 32'hxx7070xx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
