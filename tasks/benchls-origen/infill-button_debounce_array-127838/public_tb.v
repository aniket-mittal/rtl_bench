// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127838 dut (
    .clk(clk),
    .button(in_vec[12:8]),
    .SW(in_vec[7:0]),
    .button_out(out_vec[17:13]),
    .button_pulse(out_vec[12:8]),
    .SW_OK(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h05e1;
    stim[1] = 13'h0106;
    stim[2] = 13'h12d0;
    stim[3] = 13'h02a3;
    stim[4] = 13'h1df0;
    stim[5] = 13'h197f;
    stim[6] = 13'h0e87;
    stim[7] = 13'h00d1;
    stim[8] = 13'h0828;
    stim[9] = 13'h175b;
    stim[10] = 13'h0827;
    stim[11] = 13'h15d6;
    stim[12] = 13'h1f3d;
    stim[13] = 13'h1185;
    stim[14] = 13'h0981;
    stim[15] = 13'h1acc;
    stim[16] = 13'h0a23;
    stim[17] = 13'h07b0;
    stim[18] = 13'h1a4b;
    stim[19] = 13'h0d08;
    stim[20] = 13'h12de;
    stim[21] = 13'h0c81;
    stim[22] = 13'h1827;
    stim[23] = 13'h11e4;
    stim[24] = 13'h0b27;
    stim[25] = 13'h0c42;
    stim[26] = 13'h125c;
    stim[27] = 13'h11a9;
    stim[28] = 13'h1f53;
    stim[29] = 13'h17b2;
    stim[30] = 13'h108f;
    stim[31] = 13'h0a9c;
    stim[32] = 13'h1b69;
    stim[33] = 13'h0d00;
    stim[34] = 13'h087c;
    stim[35] = 13'h0dae;
    stim[36] = 13'h01db;
    stim[37] = 13'h1ffc;
    stim[38] = 13'h0cff;
    stim[39] = 13'h1be9;
    stim[40] = 13'h15f2;
    stim[41] = 13'h1e5b;
    stim[42] = 13'h0777;
    stim[43] = 13'h072b;
    stim[44] = 13'h0db3;
    stim[45] = 13'h0be6;
    stim[46] = 13'h0eaf;
    stim[47] = 13'h0f32;
    stim[48] = 13'h1564;
    stim[49] = 13'h07f2;
    stim[50] = 13'h1191;
    stim[51] = 13'h0280;
    stim[52] = 13'h10a0;
    stim[53] = 13'h143e;
    stim[54] = 13'h0b77;
    stim[55] = 13'h10dc;
    stim[56] = 13'h1a14;
    stim[57] = 13'h1e6f;
    stim[58] = 13'h1849;
    stim[59] = 13'h0d97;
    stim[60] = 13'h0927;
    stim[61] = 13'h1640;
    stim[62] = 13'h0550;
    stim[63] = 13'h1785;
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
      expv[0] = 18'hxxxe1;
      expv[1] = 18'hxx006;
      expv[2] = 18'hxx0d0;
      expv[3] = 18'hxx0a3;
      expv[4] = 18'hxx0f0;
      expv[5] = 18'hxx07f;
      expv[6] = 18'hxx087;
      expv[7] = 18'hxx0d1;
      expv[8] = 18'hxx028;
      expv[9] = 18'hxx05b;
      expv[10] = 18'hxx027;
      expv[11] = 18'hxx0d6;
      expv[12] = 18'hxx03d;
      expv[13] = 18'hxx085;
      expv[14] = 18'hxx081;
      expv[15] = 18'hxx0cc;
      expv[16] = 18'hxx023;
      expv[17] = 18'hxx0b0;
      expv[18] = 18'hxx04b;
      expv[19] = 18'hxx008;
      expv[20] = 18'hxx0de;
      expv[21] = 18'hxx081;
      expv[22] = 18'hxx027;
      expv[23] = 18'hxx0e4;
      expv[24] = 18'hxx027;
      expv[25] = 18'hxx042;
      expv[26] = 18'hxx05c;
      expv[27] = 18'hxx0a9;
      expv[28] = 18'hxx053;
      expv[29] = 18'hxx0b2;
      expv[30] = 18'hxx08f;
      expv[31] = 18'hxx09c;
      expv[32] = 18'hxx069;
      expv[33] = 18'hxx000;
      expv[34] = 18'hxx07c;
      expv[35] = 18'hxx0ae;
      expv[36] = 18'hxx0db;
      expv[37] = 18'hxx0fc;
      expv[38] = 18'hxx0ff;
      expv[39] = 18'hxx0e9;
      expv[40] = 18'hxx0f2;
      expv[41] = 18'hxx05b;
      expv[42] = 18'hxx077;
      expv[43] = 18'hxx02b;
      expv[44] = 18'hxx0b3;
      expv[45] = 18'hxx0e6;
      expv[46] = 18'hxx0af;
      expv[47] = 18'hxx032;
      expv[48] = 18'hxx064;
      expv[49] = 18'hxx0f2;
      expv[50] = 18'hxx091;
      expv[51] = 18'hxx080;
      expv[52] = 18'hxx0a0;
      expv[53] = 18'hxx03e;
      expv[54] = 18'hxx077;
      expv[55] = 18'hxx0dc;
      expv[56] = 18'hxx014;
      expv[57] = 18'hxx06f;
      expv[58] = 18'hxx049;
      expv[59] = 18'hxx097;
      expv[60] = 18'hxx027;
      expv[61] = 18'hxx040;
      expv[62] = 18'hxx050;
      expv[63] = 18'hxx085;
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
