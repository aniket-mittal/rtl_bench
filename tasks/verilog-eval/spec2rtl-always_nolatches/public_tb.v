// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .scancode(in_vec[15:0]),
    .left(out_vec[3:3]),
    .down(out_vec[2:2]),
    .right(out_vec[1:1]),
    .up(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h12c7;
    stim[1] = 16'h73a6;
    stim[2] = 16'hb4f9;
    stim[3] = 16'h8285;
    stim[4] = 16'hd22c;
    stim[5] = 16'h2d6b;
    stim[6] = 16'h4303;
    stim[7] = 16'hc851;
    stim[8] = 16'h38cd;
    stim[9] = 16'hdb4a;
    stim[10] = 16'h1712;
    stim[11] = 16'h97d7;
    stim[12] = 16'h41df;
    stim[13] = 16'hc6ea;
    stim[14] = 16'h01cc;
    stim[15] = 16'h90ea;
    stim[16] = 16'hda2e;
    stim[17] = 16'h92e5;
    stim[18] = 16'h4b8c;
    stim[19] = 16'h6988;
    stim[20] = 16'h4b75;
    stim[21] = 16'h987e;
    stim[22] = 16'h2ca7;
    stim[23] = 16'h2372;
    stim[24] = 16'h559d;
    stim[25] = 16'hf456;
    stim[26] = 16'h3894;
    stim[27] = 16'h470b;
    stim[28] = 16'hbd46;
    stim[29] = 16'hd094;
    stim[30] = 16'h2532;
    stim[31] = 16'h4795;
    stim[32] = 16'h4e65;
    stim[33] = 16'h45c2;
    stim[34] = 16'hdb4a;
    stim[35] = 16'h2a00;
    stim[36] = 16'h4a99;
    stim[37] = 16'h3b8c;
    stim[38] = 16'h669b;
    stim[39] = 16'h5b40;
    stim[40] = 16'hb4d6;
    stim[41] = 16'h69a6;
    stim[42] = 16'h6c0d;
    stim[43] = 16'hcb55;
    stim[44] = 16'he683;
    stim[45] = 16'h7fb8;
    stim[46] = 16'hf189;
    stim[47] = 16'h0438;
    stim[48] = 16'h8e7e;
    stim[49] = 16'h0431;
    stim[50] = 16'h51c3;
    stim[51] = 16'h2302;
    stim[52] = 16'h8af8;
    stim[53] = 16'h7059;
    stim[54] = 16'h22d6;
    stim[55] = 16'h7e48;
    stim[56] = 16'hac37;
    stim[57] = 16'h471f;
    stim[58] = 16'hec74;
    stim[59] = 16'h2c83;
    stim[60] = 16'h0cc3;
    stim[61] = 16'he05f;
    stim[62] = 16'h1a80;
    stim[63] = 16'h4759;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
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
