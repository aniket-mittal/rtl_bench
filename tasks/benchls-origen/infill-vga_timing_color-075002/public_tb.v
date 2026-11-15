// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_075002 dut (
    .pixel_clk(clk),
    .pixel_color(in_vec[7:0]),
    .R(out_vec[13:10]),
    .G(out_vec[9:6]),
    .B(out_vec[5:2]),
    .hsync(out_vec[1:1]),
    .vsync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc6;
    stim[1] = 8'ha2;
    stim[2] = 8'h35;
    stim[3] = 8'h6f;
    stim[4] = 8'hdb;
    stim[5] = 8'h94;
    stim[6] = 8'h0f;
    stim[7] = 8'h32;
    stim[8] = 8'hc7;
    stim[9] = 8'hc8;
    stim[10] = 8'h04;
    stim[11] = 8'h4d;
    stim[12] = 8'hca;
    stim[13] = 8'h2f;
    stim[14] = 8'hfd;
    stim[15] = 8'hb8;
    stim[16] = 8'he6;
    stim[17] = 8'hdf;
    stim[18] = 8'h9e;
    stim[19] = 8'hd8;
    stim[20] = 8'hf0;
    stim[21] = 8'h27;
    stim[22] = 8'h4b;
    stim[23] = 8'ha9;
    stim[24] = 8'h37;
    stim[25] = 8'hfc;
    stim[26] = 8'h2a;
    stim[27] = 8'h7f;
    stim[28] = 8'h1c;
    stim[29] = 8'h63;
    stim[30] = 8'h1e;
    stim[31] = 8'h7a;
    stim[32] = 8'h69;
    stim[33] = 8'h9b;
    stim[34] = 8'hb9;
    stim[35] = 8'h2b;
    stim[36] = 8'h66;
    stim[37] = 8'h37;
    stim[38] = 8'h9c;
    stim[39] = 8'h83;
    stim[40] = 8'haa;
    stim[41] = 8'hed;
    stim[42] = 8'h6e;
    stim[43] = 8'hdc;
    stim[44] = 8'hdd;
    stim[45] = 8'h93;
    stim[46] = 8'h99;
    stim[47] = 8'he6;
    stim[48] = 8'h50;
    stim[49] = 8'h30;
    stim[50] = 8'h7a;
    stim[51] = 8'h45;
    stim[52] = 8'h7e;
    stim[53] = 8'h87;
    stim[54] = 8'hdf;
    stim[55] = 8'h75;
    stim[56] = 8'h52;
    stim[57] = 8'h00;
    stim[58] = 8'h64;
    stim[59] = 8'h44;
    stim[60] = 8'hbe;
    stim[61] = 8'hba;
    stim[62] = 8'he5;
    stim[63] = 8'hd6;
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
      expv[0] = 14'h000x;
      expv[1] = 14'h000x;
      expv[2] = 14'h000x;
      expv[3] = 14'h000x;
      expv[4] = 14'h000x;
      expv[5] = 14'h000x;
      expv[6] = 14'h000x;
      expv[7] = 14'h000x;
      expv[8] = 14'h000x;
      expv[9] = 14'h000x;
      expv[10] = 14'h000x;
      expv[11] = 14'h000x;
      expv[12] = 14'h000x;
      expv[13] = 14'h000x;
      expv[14] = 14'h000x;
      expv[15] = 14'h000x;
      expv[16] = 14'h000x;
      expv[17] = 14'h000x;
      expv[18] = 14'h000x;
      expv[19] = 14'h000x;
      expv[20] = 14'h000x;
      expv[21] = 14'h000x;
      expv[22] = 14'h000x;
      expv[23] = 14'h000x;
      expv[24] = 14'h000x;
      expv[25] = 14'h000x;
      expv[26] = 14'h000x;
      expv[27] = 14'h000x;
      expv[28] = 14'h000x;
      expv[29] = 14'h000x;
      expv[30] = 14'h000x;
      expv[31] = 14'h000x;
      expv[32] = 14'h000x;
      expv[33] = 14'h000x;
      expv[34] = 14'h000x;
      expv[35] = 14'h000x;
      expv[36] = 14'h000x;
      expv[37] = 14'h000x;
      expv[38] = 14'h000x;
      expv[39] = 14'h000x;
      expv[40] = 14'h000x;
      expv[41] = 14'h000x;
      expv[42] = 14'h000x;
      expv[43] = 14'h000x;
      expv[44] = 14'h000x;
      expv[45] = 14'h000x;
      expv[46] = 14'h000x;
      expv[47] = 14'h000x;
      expv[48] = 14'h000x;
      expv[49] = 14'h000x;
      expv[50] = 14'h000x;
      expv[51] = 14'h000x;
      expv[52] = 14'h000x;
      expv[53] = 14'h000x;
      expv[54] = 14'h000x;
      expv[55] = 14'h000x;
      expv[56] = 14'h000x;
      expv[57] = 14'h000x;
      expv[58] = 14'h000x;
      expv[59] = 14'h000x;
      expv[60] = 14'h000x;
      expv[61] = 14'h000x;
      expv[62] = 14'h000x;
      expv[63] = 14'h000x;
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
