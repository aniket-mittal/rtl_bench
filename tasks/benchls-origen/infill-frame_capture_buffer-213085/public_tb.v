// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213085 dut (
    .clk(clk),
    .HS(in_vec[3:3]),
    .VS(in_vec[2:2]),
    .pclk(in_vec[1:1]),
    .start_capture(in_vec[0:0]),
    .addr(out_vec[17:2]),
    .write_to_buff(out_vec[1:1]),
    .frame_captured(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h2;
    stim[1] = 4'h2;
    stim[2] = 4'h9;
    stim[3] = 4'h1;
    stim[4] = 4'ha;
    stim[5] = 4'hb;
    stim[6] = 4'hf;
    stim[7] = 4'h6;
    stim[8] = 4'h2;
    stim[9] = 4'hf;
    stim[10] = 4'h2;
    stim[11] = 4'hb;
    stim[12] = 4'h5;
    stim[13] = 4'h6;
    stim[14] = 4'he;
    stim[15] = 4'hd;
    stim[16] = 4'h5;
    stim[17] = 4'h3;
    stim[18] = 4'h0;
    stim[19] = 4'h4;
    stim[20] = 4'hf;
    stim[21] = 4'hb;
    stim[22] = 4'h4;
    stim[23] = 4'hb;
    stim[24] = 4'h4;
    stim[25] = 4'he;
    stim[26] = 4'hc;
    stim[27] = 4'hf;
    stim[28] = 4'h1;
    stim[29] = 4'h8;
    stim[30] = 4'he;
    stim[31] = 4'ha;
    stim[32] = 4'h6;
    stim[33] = 4'h0;
    stim[34] = 4'h9;
    stim[35] = 4'ha;
    stim[36] = 4'h4;
    stim[37] = 4'hf;
    stim[38] = 4'h6;
    stim[39] = 4'h8;
    stim[40] = 4'h4;
    stim[41] = 4'h3;
    stim[42] = 4'hf;
    stim[43] = 4'h1;
    stim[44] = 4'h6;
    stim[45] = 4'h1;
    stim[46] = 4'hf;
    stim[47] = 4'ha;
    stim[48] = 4'h5;
    stim[49] = 4'hc;
    stim[50] = 4'hb;
    stim[51] = 4'hf;
    stim[52] = 4'hc;
    stim[53] = 4'he;
    stim[54] = 4'h0;
    stim[55] = 4'hc;
    stim[56] = 4'hb;
    stim[57] = 4'h9;
    stim[58] = 4'ha;
    stim[59] = 4'hd;
    stim[60] = 4'hc;
    stim[61] = 4'h5;
    stim[62] = 4'he;
    stim[63] = 4'h2;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h0000x;
      expv[2] = 18'h0000x;
      expv[3] = 18'h0000x;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00006;
      expv[8] = 18'h00002;
      expv[9] = 18'h00002;
      expv[10] = 18'h00002;
      expv[11] = 18'h00002;
      expv[12] = 18'h00002;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00006;
      expv[23] = 18'h00002;
      expv[24] = 18'h00002;
      expv[25] = 18'h00002;
      expv[26] = 18'h00002;
      expv[27] = 18'h00002;
      expv[28] = 18'h00002;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00006;
      expv[44] = 18'h00004;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00006;
      expv[48] = 18'h00002;
      expv[49] = 18'h00002;
      expv[50] = 18'h00002;
      expv[51] = 18'h00002;
      expv[52] = 18'h00006;
      expv[53] = 18'h00002;
      expv[54] = 18'h00002;
      expv[55] = 18'h00002;
      expv[56] = 18'h00002;
      expv[57] = 18'h00002;
      expv[58] = 18'h00006;
      expv[59] = 18'h00002;
      expv[60] = 18'h00002;
      expv[61] = 18'h00002;
      expv[62] = 18'h00002;
      expv[63] = 18'h00002;
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
