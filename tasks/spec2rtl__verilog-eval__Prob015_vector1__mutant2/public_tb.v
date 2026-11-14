// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[15:0]),
    .out_hi(out_vec[15:8]),
    .out_lo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'ha09d;
    stim[1] = 16'h1cca;
    stim[2] = 16'h8ba9;
    stim[3] = 16'hcf2b;
    stim[4] = 16'haa72;
    stim[5] = 16'h8397;
    stim[6] = 16'h5a57;
    stim[7] = 16'hc124;
    stim[8] = 16'h2c2e;
    stim[9] = 16'h4b85;
    stim[10] = 16'h91b7;
    stim[11] = 16'h4c17;
    stim[12] = 16'h9189;
    stim[13] = 16'h658c;
    stim[14] = 16'h74eb;
    stim[15] = 16'h6682;
    stim[16] = 16'h0449;
    stim[17] = 16'ha46c;
    stim[18] = 16'h048f;
    stim[19] = 16'hf519;
    stim[20] = 16'hb2bf;
    stim[21] = 16'h52a5;
    stim[22] = 16'h6bd7;
    stim[23] = 16'h9692;
    stim[24] = 16'hc195;
    stim[25] = 16'hac03;
    stim[26] = 16'h5c03;
    stim[27] = 16'h9de0;
    stim[28] = 16'hed53;
    stim[29] = 16'hf7f6;
    stim[30] = 16'h5eb2;
    stim[31] = 16'ha4ab;
    stim[32] = 16'h91a6;
    stim[33] = 16'h6ccb;
    stim[34] = 16'h1f0c;
    stim[35] = 16'hc789;
    stim[36] = 16'h161f;
    stim[37] = 16'hfed6;
    stim[38] = 16'hde6a;
    stim[39] = 16'h2f05;
    stim[40] = 16'hbb53;
    stim[41] = 16'h0146;
    stim[42] = 16'hd1cd;
    stim[43] = 16'hf6f4;
    stim[44] = 16'h3ce7;
    stim[45] = 16'h8690;
    stim[46] = 16'h0d14;
    stim[47] = 16'h65fd;
    stim[48] = 16'h29bf;
    stim[49] = 16'h7b92;
    stim[50] = 16'h72aa;
    stim[51] = 16'h46b6;
    stim[52] = 16'ha8c0;
    stim[53] = 16'h9f89;
    stim[54] = 16'ha46c;
    stim[55] = 16'h42b3;
    stim[56] = 16'hb9aa;
    stim[57] = 16'hd2f5;
    stim[58] = 16'h1c07;
    stim[59] = 16'hc6e0;
    stim[60] = 16'he42a;
    stim[61] = 16'h649f;
    stim[62] = 16'h809b;
    stim[63] = 16'h3650;
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
      expv[0] = 16'ha03d;
      expv[1] = 16'h1cd6;
      expv[2] = 16'h8b22;
      expv[3] = 16'hcfe4;
      expv[4] = 16'haad8;
      expv[5] = 16'h8314;
      expv[6] = 16'h5a0d;
      expv[7] = 16'hc1e5;
      expv[8] = 16'h2c02;
      expv[9] = 16'h4bce;
      expv[10] = 16'h9126;
      expv[11] = 16'h4c5b;
      expv[12] = 16'h9118;
      expv[13] = 16'h65e9;
      expv[14] = 16'h749f;
      expv[15] = 16'h66e4;
      expv[16] = 16'h044d;
      expv[17] = 16'ha4c8;
      expv[18] = 16'h048b;
      expv[19] = 16'hf5ec;
      expv[20] = 16'hb20d;
      expv[21] = 16'h52f7;
      expv[22] = 16'h6bbc;
      expv[23] = 16'h9604;
      expv[24] = 16'hc154;
      expv[25] = 16'hacaf;
      expv[26] = 16'h5c5f;
      expv[27] = 16'h9d7d;
      expv[28] = 16'hedbe;
      expv[29] = 16'hf701;
      expv[30] = 16'h5eec;
      expv[31] = 16'ha40f;
      expv[32] = 16'h9137;
      expv[33] = 16'h6ca7;
      expv[34] = 16'h1f13;
      expv[35] = 16'hc74e;
      expv[36] = 16'h1609;
      expv[37] = 16'hfe28;
      expv[38] = 16'hdeb4;
      expv[39] = 16'h2f2a;
      expv[40] = 16'hbbe8;
      expv[41] = 16'h0147;
      expv[42] = 16'hd11c;
      expv[43] = 16'hf602;
      expv[44] = 16'h3cdb;
      expv[45] = 16'h8616;
      expv[46] = 16'h0d19;
      expv[47] = 16'h6598;
      expv[48] = 16'h2996;
      expv[49] = 16'h7be9;
      expv[50] = 16'h72d8;
      expv[51] = 16'h46f0;
      expv[52] = 16'ha868;
      expv[53] = 16'h9f16;
      expv[54] = 16'ha4c8;
      expv[55] = 16'h42f1;
      expv[56] = 16'hb913;
      expv[57] = 16'hd227;
      expv[58] = 16'h1c1b;
      expv[59] = 16'hc626;
      expv[60] = 16'he4ce;
      expv[61] = 16'h64fb;
      expv[62] = 16'h801b;
      expv[63] = 16'h3666;
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
