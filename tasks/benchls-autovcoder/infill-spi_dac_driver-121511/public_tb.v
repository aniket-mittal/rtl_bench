// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121511 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .datain(in_vec[9:0]),
    .sclk(out_vec[2:2]),
    .cs(out_vec[1:1]),
    .din(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h04b;
    stim[1] = 11'h295;
    stim[2] = 11'h7a4;
    stim[3] = 11'h56a;
    stim[4] = 11'h447;
    stim[5] = 11'h62d;
    stim[6] = 11'h570;
    stim[7] = 11'h5b2;
    stim[8] = 11'h531;
    stim[9] = 11'h4be;
    stim[10] = 11'h7f0;
    stim[11] = 11'h689;
    stim[12] = 11'h689;
    stim[13] = 11'h7e9;
    stim[14] = 11'h7f2;
    stim[15] = 11'h64c;
    stim[16] = 11'h734;
    stim[17] = 11'h5cc;
    stim[18] = 11'h70d;
    stim[19] = 11'h5da;
    stim[20] = 11'h471;
    stim[21] = 11'h63d;
    stim[22] = 11'h544;
    stim[23] = 11'h497;
    stim[24] = 11'h6e3;
    stim[25] = 11'h786;
    stim[26] = 11'h54a;
    stim[27] = 11'h645;
    stim[28] = 11'h48f;
    stim[29] = 11'h63d;
    stim[30] = 11'h62d;
    stim[31] = 11'h55e;
    stim[32] = 11'h363;
    stim[33] = 11'h5f9;
    stim[34] = 11'h56c;
    stim[35] = 11'h744;
    stim[36] = 11'h407;
    stim[37] = 11'h707;
    stim[38] = 11'h0c0;
    stim[39] = 11'h49f;
    stim[40] = 11'h761;
    stim[41] = 11'h456;
    stim[42] = 11'h641;
    stim[43] = 11'h733;
    stim[44] = 11'h6ad;
    stim[45] = 11'h67c;
    stim[46] = 11'h450;
    stim[47] = 11'h43c;
    stim[48] = 11'h433;
    stim[49] = 11'h7de;
    stim[50] = 11'h774;
    stim[51] = 11'h498;
    stim[52] = 11'h587;
    stim[53] = 11'h72b;
    stim[54] = 11'h5e6;
    stim[55] = 11'h7dd;
    stim[56] = 11'h477;
    stim[57] = 11'h5e5;
    stim[58] = 11'h633;
    stim[59] = 11'h483;
    stim[60] = 11'h532;
    stim[61] = 11'h406;
    stim[62] = 11'h524;
    stim[63] = 11'h4a6;
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
      expv[0] = 3'h6;
      expv[1] = 3'h6;
      expv[2] = 3'h6;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h0;
      expv[6] = 3'h1;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h1;
      expv[12] = 3'h1;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h1;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h0;
      expv[19] = 3'h1;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h1;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h1;
      expv[26] = 3'h1;
      expv[27] = 3'h0;
      expv[28] = 3'h1;
      expv[29] = 3'h0;
      expv[30] = 3'h5;
      expv[31] = 3'h5;
      expv[32] = 3'h6;
      expv[33] = 3'h6;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h1;
      expv[37] = 3'h0;
      expv[38] = 3'h6;
      expv[39] = 3'h6;
      expv[40] = 3'h4;
      expv[41] = 3'h5;
      expv[42] = 3'h0;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h1;
      expv[55] = 3'h0;
      expv[56] = 3'h1;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h1;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
