// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_168168 dut (
    .key(in_vec[6:3]),
    .columns(in_vec[2:0]),
    .rows(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h2f;
    stim[1] = 7'h76;
    stim[2] = 7'h3f;
    stim[3] = 7'h2f;
    stim[4] = 7'h11;
    stim[5] = 7'h6a;
    stim[6] = 7'h2e;
    stim[7] = 7'h23;
    stim[8] = 7'h24;
    stim[9] = 7'h60;
    stim[10] = 7'h5b;
    stim[11] = 7'h7e;
    stim[12] = 7'h66;
    stim[13] = 7'h30;
    stim[14] = 7'h40;
    stim[15] = 7'h5d;
    stim[16] = 7'h7c;
    stim[17] = 7'h65;
    stim[18] = 7'h0e;
    stim[19] = 7'h5a;
    stim[20] = 7'h60;
    stim[21] = 7'h5b;
    stim[22] = 7'h57;
    stim[23] = 7'h74;
    stim[24] = 7'h53;
    stim[25] = 7'h04;
    stim[26] = 7'h14;
    stim[27] = 7'h33;
    stim[28] = 7'h6a;
    stim[29] = 7'h39;
    stim[30] = 7'h59;
    stim[31] = 7'h47;
    stim[32] = 7'h09;
    stim[33] = 7'h4e;
    stim[34] = 7'h28;
    stim[35] = 7'h64;
    stim[36] = 7'h26;
    stim[37] = 7'h19;
    stim[38] = 7'h25;
    stim[39] = 7'h4c;
    stim[40] = 7'h1e;
    stim[41] = 7'h3e;
    stim[42] = 7'h0f;
    stim[43] = 7'h52;
    stim[44] = 7'h2d;
    stim[45] = 7'h39;
    stim[46] = 7'h0c;
    stim[47] = 7'h6b;
    stim[48] = 7'h41;
    stim[49] = 7'h5a;
    stim[50] = 7'h14;
    stim[51] = 7'h65;
    stim[52] = 7'h46;
    stim[53] = 7'h1d;
    stim[54] = 7'h60;
    stim[55] = 7'h11;
    stim[56] = 7'h0b;
    stim[57] = 7'h33;
    stim[58] = 7'h1f;
    stim[59] = 7'h35;
    stim[60] = 7'h65;
    stim[61] = 7'h68;
    stim[62] = 7'h67;
    stim[63] = 7'h2b;
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
      expv[0] = 4'h2;
      expv[1] = 4'h0;
      expv[2] = 4'h8;
      expv[3] = 4'h2;
      expv[4] = 4'h4;
      expv[5] = 4'h0;
      expv[6] = 4'h2;
      expv[7] = 4'h0;
      expv[8] = 4'h1;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h1;
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
      expv[32] = 4'h2;
      expv[33] = 4'h4;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h1;
      expv[37] = 4'h8;
      expv[38] = 4'h1;
      expv[39] = 4'h1;
      expv[40] = 4'h0;
      expv[41] = 4'h8;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h2;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h2;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h4;
      expv[56] = 4'h2;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h4;
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
