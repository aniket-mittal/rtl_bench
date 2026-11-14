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

  TopModule dut (
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
    stim[0] = 16'haf6b;
    stim[1] = 16'ha4d7;
    stim[2] = 16'h604d;
    stim[3] = 16'h826d;
    stim[4] = 16'he4ea;
    stim[5] = 16'ha0d0;
    stim[6] = 16'h4789;
    stim[7] = 16'h26fd;
    stim[8] = 16'h8588;
    stim[9] = 16'hf692;
    stim[10] = 16'hf59c;
    stim[11] = 16'h1059;
    stim[12] = 16'h9de9;
    stim[13] = 16'h1168;
    stim[14] = 16'h96da;
    stim[15] = 16'h4998;
    stim[16] = 16'hbf1a;
    stim[17] = 16'h95c4;
    stim[18] = 16'h5920;
    stim[19] = 16'h2d74;
    stim[20] = 16'h8462;
    stim[21] = 16'h7cf6;
    stim[22] = 16'h70bf;
    stim[23] = 16'h93c0;
    stim[24] = 16'h744e;
    stim[25] = 16'h4b56;
    stim[26] = 16'hd2bd;
    stim[27] = 16'hbbd7;
    stim[28] = 16'h5bb8;
    stim[29] = 16'hf0f7;
    stim[30] = 16'h8c0b;
    stim[31] = 16'h94c9;
    stim[32] = 16'hbf5f;
    stim[33] = 16'hcdb3;
    stim[34] = 16'hb93d;
    stim[35] = 16'h3a70;
    stim[36] = 16'h800a;
    stim[37] = 16'h3ec8;
    stim[38] = 16'h9d52;
    stim[39] = 16'haf9b;
    stim[40] = 16'haea3;
    stim[41] = 16'ha5b2;
    stim[42] = 16'h8b94;
    stim[43] = 16'h18da;
    stim[44] = 16'hc1b4;
    stim[45] = 16'ha79b;
    stim[46] = 16'hdb31;
    stim[47] = 16'h8ea2;
    stim[48] = 16'h8ba8;
    stim[49] = 16'h26b1;
    stim[50] = 16'h0688;
    stim[51] = 16'h4ba7;
    stim[52] = 16'h4b7f;
    stim[53] = 16'h0b59;
    stim[54] = 16'hc30e;
    stim[55] = 16'h1d18;
    stim[56] = 16'h0594;
    stim[57] = 16'h0bcb;
    stim[58] = 16'habf2;
    stim[59] = 16'hcc3b;
    stim[60] = 16'h1bb9;
    stim[61] = 16'h97ff;
    stim[62] = 16'h6c0f;
    stim[63] = 16'h4e05;
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
      expv[0] = 16'haf6b;
      expv[1] = 16'ha4d7;
      expv[2] = 16'h604d;
      expv[3] = 16'h826d;
      expv[4] = 16'he4ea;
      expv[5] = 16'ha0d0;
      expv[6] = 16'h4789;
      expv[7] = 16'h26fd;
      expv[8] = 16'h8588;
      expv[9] = 16'hf692;
      expv[10] = 16'hf59c;
      expv[11] = 16'h1059;
      expv[12] = 16'h9de9;
      expv[13] = 16'h1168;
      expv[14] = 16'h96da;
      expv[15] = 16'h4998;
      expv[16] = 16'hbf1a;
      expv[17] = 16'h95c4;
      expv[18] = 16'h5920;
      expv[19] = 16'h2d74;
      expv[20] = 16'h8462;
      expv[21] = 16'h7cf6;
      expv[22] = 16'h70bf;
      expv[23] = 16'h93c0;
      expv[24] = 16'h744e;
      expv[25] = 16'h4b56;
      expv[26] = 16'hd2bd;
      expv[27] = 16'hbbd7;
      expv[28] = 16'h5bb8;
      expv[29] = 16'hf0f7;
      expv[30] = 16'h8c0b;
      expv[31] = 16'h94c9;
      expv[32] = 16'hbf5f;
      expv[33] = 16'hcdb3;
      expv[34] = 16'hb93d;
      expv[35] = 16'h3a70;
      expv[36] = 16'h800a;
      expv[37] = 16'h3ec8;
      expv[38] = 16'h9d52;
      expv[39] = 16'haf9b;
      expv[40] = 16'haea3;
      expv[41] = 16'ha5b2;
      expv[42] = 16'h8b94;
      expv[43] = 16'h18da;
      expv[44] = 16'hc1b4;
      expv[45] = 16'ha79b;
      expv[46] = 16'hdb31;
      expv[47] = 16'h8ea2;
      expv[48] = 16'h8ba8;
      expv[49] = 16'h26b1;
      expv[50] = 16'h0688;
      expv[51] = 16'h4ba7;
      expv[52] = 16'h4b7f;
      expv[53] = 16'h0b59;
      expv[54] = 16'hc30e;
      expv[55] = 16'h1d18;
      expv[56] = 16'h0594;
      expv[57] = 16'h0bcb;
      expv[58] = 16'habf2;
      expv[59] = 16'hcc3b;
      expv[60] = 16'h1bb9;
      expv[61] = 16'h97ff;
      expv[62] = 16'h6c0f;
      expv[63] = 16'h4e05;
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
