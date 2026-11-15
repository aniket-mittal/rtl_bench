// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146015 dut (
    .clk(clk),
    .data_in(in_vec[15:0]),
    .pattern_detected(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h8540;
    stim[1] = 16'hec48;
    stim[2] = 16'h5314;
    stim[3] = 16'h243d;
    stim[4] = 16'heb59;
    stim[5] = 16'h7626;
    stim[6] = 16'h5a29;
    stim[7] = 16'h713d;
    stim[8] = 16'h49cb;
    stim[9] = 16'h53a1;
    stim[10] = 16'h9a40;
    stim[11] = 16'h4d2c;
    stim[12] = 16'hce2d;
    stim[13] = 16'h1a3d;
    stim[14] = 16'hfbb0;
    stim[15] = 16'h6a78;
    stim[16] = 16'h554c;
    stim[17] = 16'h31ee;
    stim[18] = 16'ha429;
    stim[19] = 16'hcb11;
    stim[20] = 16'hf61d;
    stim[21] = 16'h61ec;
    stim[22] = 16'hf596;
    stim[23] = 16'h49df;
    stim[24] = 16'hdbff;
    stim[25] = 16'h872c;
    stim[26] = 16'h7d70;
    stim[27] = 16'h678b;
    stim[28] = 16'hb10b;
    stim[29] = 16'h875a;
    stim[30] = 16'he9e2;
    stim[31] = 16'h5568;
    stim[32] = 16'hb11a;
    stim[33] = 16'ha845;
    stim[34] = 16'h24c5;
    stim[35] = 16'h59f1;
    stim[36] = 16'he1fb;
    stim[37] = 16'hc65a;
    stim[38] = 16'h4205;
    stim[39] = 16'h8c63;
    stim[40] = 16'he7fc;
    stim[41] = 16'h2f24;
    stim[42] = 16'h21e4;
    stim[43] = 16'hae46;
    stim[44] = 16'ha533;
    stim[45] = 16'hdf5b;
    stim[46] = 16'h8e01;
    stim[47] = 16'h4da3;
    stim[48] = 16'h3b94;
    stim[49] = 16'h6689;
    stim[50] = 16'h9248;
    stim[51] = 16'h4604;
    stim[52] = 16'h8514;
    stim[53] = 16'h65e2;
    stim[54] = 16'h1303;
    stim[55] = 16'h4fca;
    stim[56] = 16'hdc80;
    stim[57] = 16'h83a6;
    stim[58] = 16'h7b5c;
    stim[59] = 16'h29fd;
    stim[60] = 16'h9729;
    stim[61] = 16'h892d;
    stim[62] = 16'hc5c9;
    stim[63] = 16'h3584;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
