// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01174 dut (
    .clk(clk),
    .we(in_vec[16:16]),
    .a(in_vec[15:12]),
    .dpra(in_vec[11:8]),
    .di(in_vec[7:0]),
    .dpo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h14757;
    stim[1] = 17'h1ab9b;
    stim[2] = 17'h05fef;
    stim[3] = 17'h15dd5;
    stim[4] = 17'h19296;
    stim[5] = 17'h1100e;
    stim[6] = 17'h0e7bd;
    stim[7] = 17'h0192b;
    stim[8] = 17'h0ed01;
    stim[9] = 17'h07ff2;
    stim[10] = 17'h1b1f8;
    stim[11] = 17'h0d71e;
    stim[12] = 17'h1a593;
    stim[13] = 17'h053b1;
    stim[14] = 17'h1bec1;
    stim[15] = 17'h04db4;
    stim[16] = 17'h14ac2;
    stim[17] = 17'h17165;
    stim[18] = 17'h0b034;
    stim[19] = 17'h0eb6d;
    stim[20] = 17'h18852;
    stim[21] = 17'h1f189;
    stim[22] = 17'h10cb9;
    stim[23] = 17'h0f84a;
    stim[24] = 17'h0579c;
    stim[25] = 17'h1b599;
    stim[26] = 17'h0349b;
    stim[27] = 17'h121bf;
    stim[28] = 17'h10698;
    stim[29] = 17'h03cb5;
    stim[30] = 17'h00212;
    stim[31] = 17'h1f1ab;
    stim[32] = 17'h0bc3c;
    stim[33] = 17'h069ee;
    stim[34] = 17'h0ad86;
    stim[35] = 17'h05aa8;
    stim[36] = 17'h01a34;
    stim[37] = 17'h189db;
    stim[38] = 17'h005b5;
    stim[39] = 17'h082bc;
    stim[40] = 17'h1c80d;
    stim[41] = 17'h0f94a;
    stim[42] = 17'h1c8d1;
    stim[43] = 17'h144e6;
    stim[44] = 17'h0b6df;
    stim[45] = 17'h1fc89;
    stim[46] = 17'h00064;
    stim[47] = 17'h0c03f;
    stim[48] = 17'h11d40;
    stim[49] = 17'h1faf7;
    stim[50] = 17'h07241;
    stim[51] = 17'h07bf1;
    stim[52] = 17'h16a44;
    stim[53] = 17'h1218c;
    stim[54] = 17'h1f293;
    stim[55] = 17'h0f07f;
    stim[56] = 17'h0e668;
    stim[57] = 17'h03f11;
    stim[58] = 17'h111c0;
    stim[59] = 17'h09aca;
    stim[60] = 17'h184b3;
    stim[61] = 17'h0ce2a;
    stim[62] = 17'h048bf;
    stim[63] = 17'h0cf3c;
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
      expv[7] = 8'h96;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'h0e;
      expv[11] = 8'hxx;
      expv[12] = 8'hd5;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'h93;
      expv[17] = 8'h0e;
      expv[18] = 8'hxx;
      expv[19] = 8'hc1;
      expv[20] = 8'hxx;
      expv[21] = 8'h0e;
      expv[22] = 8'hxx;
      expv[23] = 8'h52;
      expv[24] = 8'h65;
      expv[25] = 8'hd5;
      expv[26] = 8'hc2;
      expv[27] = 8'h0e;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hbf;
      expv[31] = 8'h0e;
      expv[32] = 8'hxx;
      expv[33] = 8'h96;
      expv[34] = 8'hxx;
      expv[35] = 8'h93;
      expv[36] = 8'h93;
      expv[37] = 8'h96;
      expv[38] = 8'hd5;
      expv[39] = 8'hbf;
      expv[40] = 8'hdb;
      expv[41] = 8'h96;
      expv[42] = 8'hdb;
      expv[43] = 8'hc2;
      expv[44] = 8'hxx;
      expv[45] = 8'hd1;
      expv[46] = 8'h98;
      expv[47] = 8'h98;
      expv[48] = 8'hxx;
      expv[49] = 8'h93;
      expv[50] = 8'hbf;
      expv[51] = 8'h99;
      expv[52] = 8'h93;
      expv[53] = 8'h40;
      expv[54] = 8'h8c;
      expv[55] = 8'h98;
      expv[56] = 8'h44;
      expv[57] = 8'h93;
      expv[58] = 8'h40;
      expv[59] = 8'h93;
      expv[60] = 8'he6;
      expv[61] = 8'hxx;
      expv[62] = 8'hb3;
      expv[63] = 8'h93;
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
