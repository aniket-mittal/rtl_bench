// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024406 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h02cd;
    stim[1] = 15'h3369;
    stim[2] = 15'h224e;
    stim[3] = 15'h613b;
    stim[4] = 15'h71e0;
    stim[5] = 15'h5a84;
    stim[6] = 15'h423d;
    stim[7] = 15'h5be7;
    stim[8] = 15'h5ad8;
    stim[9] = 15'h30af;
    stim[10] = 15'h3508;
    stim[11] = 15'h64d6;
    stim[12] = 15'h2a7c;
    stim[13] = 15'h59e5;
    stim[14] = 15'h43b9;
    stim[15] = 15'h4243;
    stim[16] = 15'h73d5;
    stim[17] = 15'h79bd;
    stim[18] = 15'h71c3;
    stim[19] = 15'h2e63;
    stim[20] = 15'h1d1c;
    stim[21] = 15'h6d02;
    stim[22] = 15'h362d;
    stim[23] = 15'h6327;
    stim[24] = 15'h4607;
    stim[25] = 15'h7bec;
    stim[26] = 15'h5d3a;
    stim[27] = 15'h30d8;
    stim[28] = 15'h71c2;
    stim[29] = 15'h5735;
    stim[30] = 15'h3555;
    stim[31] = 15'h73d5;
    stim[32] = 15'h42d2;
    stim[33] = 15'h7578;
    stim[34] = 15'h57ea;
    stim[35] = 15'h63f3;
    stim[36] = 15'h29b4;
    stim[37] = 15'h0daa;
    stim[38] = 15'h3dd4;
    stim[39] = 15'h4ed8;
    stim[40] = 15'h7e3e;
    stim[41] = 15'h2eea;
    stim[42] = 15'h65c5;
    stim[43] = 15'h238a;
    stim[44] = 15'h7862;
    stim[45] = 15'h45e9;
    stim[46] = 15'h3dcf;
    stim[47] = 15'h34b8;
    stim[48] = 15'h31e5;
    stim[49] = 15'h0fd8;
    stim[50] = 15'h79e4;
    stim[51] = 15'h5e5a;
    stim[52] = 15'h3e90;
    stim[53] = 15'h2da8;
    stim[54] = 15'h49ce;
    stim[55] = 15'h42f8;
    stim[56] = 15'h2123;
    stim[57] = 15'h56fb;
    stim[58] = 15'h2963;
    stim[59] = 15'h4617;
    stim[60] = 15'h191e;
    stim[61] = 15'h1f97;
    stim[62] = 15'h45ec;
    stim[63] = 15'h2035;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h02cd;
      expv[2] = 15'h3369;
      expv[3] = 15'h224e;
      expv[4] = 15'h613b;
      expv[5] = 15'h71e0;
      expv[6] = 15'h5a84;
      expv[7] = 15'h423d;
      expv[8] = 15'h5be7;
      expv[9] = 15'h5ad8;
      expv[10] = 15'h30af;
      expv[11] = 15'h3508;
      expv[12] = 15'h64d6;
      expv[13] = 15'h2a7c;
      expv[14] = 15'h59e5;
      expv[15] = 15'h43b9;
      expv[16] = 15'h4243;
      expv[17] = 15'h73d5;
      expv[18] = 15'h79bd;
      expv[19] = 15'h71c3;
      expv[20] = 15'h2e63;
      expv[21] = 15'h1d1c;
      expv[22] = 15'h6d02;
      expv[23] = 15'h362d;
      expv[24] = 15'h6327;
      expv[25] = 15'h4607;
      expv[26] = 15'h7bec;
      expv[27] = 15'h5d3a;
      expv[28] = 15'h30d8;
      expv[29] = 15'h71c2;
      expv[30] = 15'h5735;
      expv[31] = 15'h3555;
      expv[32] = 15'h73d5;
      expv[33] = 15'h42d2;
      expv[34] = 15'h7578;
      expv[35] = 15'h57ea;
      expv[36] = 15'h63f3;
      expv[37] = 15'h29b4;
      expv[38] = 15'h0daa;
      expv[39] = 15'h3dd4;
      expv[40] = 15'h4ed8;
      expv[41] = 15'h7e3e;
      expv[42] = 15'h2eea;
      expv[43] = 15'h65c5;
      expv[44] = 15'h238a;
      expv[45] = 15'h7862;
      expv[46] = 15'h45e9;
      expv[47] = 15'h3dcf;
      expv[48] = 15'h34b8;
      expv[49] = 15'h31e5;
      expv[50] = 15'h0fd8;
      expv[51] = 15'h79e4;
      expv[52] = 15'h5e5a;
      expv[53] = 15'h3e90;
      expv[54] = 15'h2da8;
      expv[55] = 15'h49ce;
      expv[56] = 15'h42f8;
      expv[57] = 15'h2123;
      expv[58] = 15'h56fb;
      expv[59] = 15'h2963;
      expv[60] = 15'h4617;
      expv[61] = 15'h191e;
      expv[62] = 15'h1f97;
      expv[63] = 15'h45ec;
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
