// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202403 dut (
    .fmap_idx_delay5(in_vec[6:0]),
    .sram_bytemask(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h59;
    stim[1] = 7'h7b;
    stim[2] = 7'h7b;
    stim[3] = 7'h64;
    stim[4] = 7'h28;
    stim[5] = 7'h14;
    stim[6] = 7'h3b;
    stim[7] = 7'h56;
    stim[8] = 7'h30;
    stim[9] = 7'h71;
    stim[10] = 7'h0f;
    stim[11] = 7'h13;
    stim[12] = 7'h2c;
    stim[13] = 7'h01;
    stim[14] = 7'h0d;
    stim[15] = 7'h26;
    stim[16] = 7'h20;
    stim[17] = 7'h0e;
    stim[18] = 7'h71;
    stim[19] = 7'h63;
    stim[20] = 7'h27;
    stim[21] = 7'h07;
    stim[22] = 7'h46;
    stim[23] = 7'h6b;
    stim[24] = 7'h3d;
    stim[25] = 7'h4d;
    stim[26] = 7'h26;
    stim[27] = 7'h27;
    stim[28] = 7'h2b;
    stim[29] = 7'h5a;
    stim[30] = 7'h44;
    stim[31] = 7'h4d;
    stim[32] = 7'h4b;
    stim[33] = 7'h59;
    stim[34] = 7'h48;
    stim[35] = 7'h1a;
    stim[36] = 7'h0f;
    stim[37] = 7'h5f;
    stim[38] = 7'h02;
    stim[39] = 7'h2c;
    stim[40] = 7'h5a;
    stim[41] = 7'h1e;
    stim[42] = 7'h20;
    stim[43] = 7'h10;
    stim[44] = 7'h00;
    stim[45] = 7'h05;
    stim[46] = 7'h73;
    stim[47] = 7'h20;
    stim[48] = 7'h3d;
    stim[49] = 7'h3a;
    stim[50] = 7'h65;
    stim[51] = 7'h63;
    stim[52] = 7'h3a;
    stim[53] = 7'h3d;
    stim[54] = 7'h5f;
    stim[55] = 7'h53;
    stim[56] = 7'h18;
    stim[57] = 7'h2c;
    stim[58] = 7'h78;
    stim[59] = 7'h1d;
    stim[60] = 7'h4b;
    stim[61] = 7'h4f;
    stim[62] = 7'h24;
    stim[63] = 7'h65;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'hffffffff;
      expv[2] = 32'hffffffff;
      expv[3] = 32'hffffffff;
      expv[4] = 32'hffffffff;
      expv[5] = 32'hffffffff;
      expv[6] = 32'hffffffff;
      expv[7] = 32'hffffffff;
      expv[8] = 32'hffffffff;
      expv[9] = 32'hffffffff;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hffffffff;
      expv[12] = 32'hffffffff;
      expv[13] = 32'hffffffff;
      expv[14] = 32'hffffffff;
      expv[15] = 32'hffffffff;
      expv[16] = 32'hffffffff;
      expv[17] = 32'hffffffff;
      expv[18] = 32'hffffffff;
      expv[19] = 32'hffffffff;
      expv[20] = 32'hffffffff;
      expv[21] = 32'hffffffff;
      expv[22] = 32'hffffffff;
      expv[23] = 32'hffffffff;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'hffffffff;
      expv[27] = 32'hffffffff;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hffffffff;
      expv[30] = 32'hffffffff;
      expv[31] = 32'hffffffff;
      expv[32] = 32'hffffffff;
      expv[33] = 32'hffffffff;
      expv[34] = 32'hffffffff;
      expv[35] = 32'hffffffff;
      expv[36] = 32'hffffffff;
      expv[37] = 32'hffffffff;
      expv[38] = 32'hffffffff;
      expv[39] = 32'hffffffff;
      expv[40] = 32'hffffffff;
      expv[41] = 32'hffffffff;
      expv[42] = 32'hffffffff;
      expv[43] = 32'hffffffff;
      expv[44] = 32'hffffffff;
      expv[45] = 32'hffffffff;
      expv[46] = 32'hffffffff;
      expv[47] = 32'hffffffff;
      expv[48] = 32'hffffffff;
      expv[49] = 32'hffffffff;
      expv[50] = 32'hffffffff;
      expv[51] = 32'hffffffff;
      expv[52] = 32'hffffffff;
      expv[53] = 32'hffffffff;
      expv[54] = 32'hffffffff;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffffffff;
      expv[57] = 32'hffffffff;
      expv[58] = 32'hffffffff;
      expv[59] = 32'hffffffff;
      expv[60] = 32'hffffffff;
      expv[61] = 32'hffffffff;
      expv[62] = 32'hffffffff;
      expv[63] = 32'hffffffff;
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
