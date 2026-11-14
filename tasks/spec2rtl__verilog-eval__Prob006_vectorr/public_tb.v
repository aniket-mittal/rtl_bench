// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hd4;
    stim[1] = 8'h77;
    stim[2] = 8'h66;
    stim[3] = 8'he9;
    stim[4] = 8'h83;
    stim[5] = 8'h4f;
    stim[6] = 8'hed;
    stim[7] = 8'h30;
    stim[8] = 8'h90;
    stim[9] = 8'hbc;
    stim[10] = 8'h42;
    stim[11] = 8'hfb;
    stim[12] = 8'hbe;
    stim[13] = 8'h9c;
    stim[14] = 8'h0d;
    stim[15] = 8'hd8;
    stim[16] = 8'h6f;
    stim[17] = 8'h30;
    stim[18] = 8'hb9;
    stim[19] = 8'hee;
    stim[20] = 8'h4c;
    stim[21] = 8'hf1;
    stim[22] = 8'h29;
    stim[23] = 8'h6e;
    stim[24] = 8'haa;
    stim[25] = 8'hc1;
    stim[26] = 8'hcd;
    stim[27] = 8'he2;
    stim[28] = 8'h72;
    stim[29] = 8'h60;
    stim[30] = 8'hf8;
    stim[31] = 8'h83;
    stim[32] = 8'h9b;
    stim[33] = 8'h50;
    stim[34] = 8'h5d;
    stim[35] = 8'hb0;
    stim[36] = 8'hb6;
    stim[37] = 8'hc9;
    stim[38] = 8'h44;
    stim[39] = 8'h1f;
    stim[40] = 8'hd6;
    stim[41] = 8'he6;
    stim[42] = 8'h78;
    stim[43] = 8'h8b;
    stim[44] = 8'h8f;
    stim[45] = 8'h2c;
    stim[46] = 8'hd4;
    stim[47] = 8'h49;
    stim[48] = 8'he5;
    stim[49] = 8'hda;
    stim[50] = 8'hcb;
    stim[51] = 8'h6e;
    stim[52] = 8'h72;
    stim[53] = 8'h50;
    stim[54] = 8'h60;
    stim[55] = 8'hb2;
    stim[56] = 8'hc5;
    stim[57] = 8'h7a;
    stim[58] = 8'h6e;
    stim[59] = 8'hd0;
    stim[60] = 8'ha8;
    stim[61] = 8'hbd;
    stim[62] = 8'h05;
    stim[63] = 8'ha3;
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
      expv[0] = 8'h2b;
      expv[1] = 8'hee;
      expv[2] = 8'h66;
      expv[3] = 8'h97;
      expv[4] = 8'hc1;
      expv[5] = 8'hf2;
      expv[6] = 8'hb7;
      expv[7] = 8'h0c;
      expv[8] = 8'h09;
      expv[9] = 8'h3d;
      expv[10] = 8'h42;
      expv[11] = 8'hdf;
      expv[12] = 8'h7d;
      expv[13] = 8'h39;
      expv[14] = 8'hb0;
      expv[15] = 8'h1b;
      expv[16] = 8'hf6;
      expv[17] = 8'h0c;
      expv[18] = 8'h9d;
      expv[19] = 8'h77;
      expv[20] = 8'h32;
      expv[21] = 8'h8f;
      expv[22] = 8'h94;
      expv[23] = 8'h76;
      expv[24] = 8'h55;
      expv[25] = 8'h83;
      expv[26] = 8'hb3;
      expv[27] = 8'h47;
      expv[28] = 8'h4e;
      expv[29] = 8'h06;
      expv[30] = 8'h1f;
      expv[31] = 8'hc1;
      expv[32] = 8'hd9;
      expv[33] = 8'h0a;
      expv[34] = 8'hba;
      expv[35] = 8'h0d;
      expv[36] = 8'h6d;
      expv[37] = 8'h93;
      expv[38] = 8'h22;
      expv[39] = 8'hf8;
      expv[40] = 8'h6b;
      expv[41] = 8'h67;
      expv[42] = 8'h1e;
      expv[43] = 8'hd1;
      expv[44] = 8'hf1;
      expv[45] = 8'h34;
      expv[46] = 8'h2b;
      expv[47] = 8'h92;
      expv[48] = 8'ha7;
      expv[49] = 8'h5b;
      expv[50] = 8'hd3;
      expv[51] = 8'h76;
      expv[52] = 8'h4e;
      expv[53] = 8'h0a;
      expv[54] = 8'h06;
      expv[55] = 8'h4d;
      expv[56] = 8'ha3;
      expv[57] = 8'h5e;
      expv[58] = 8'h76;
      expv[59] = 8'h0b;
      expv[60] = 8'h15;
      expv[61] = 8'hbd;
      expv[62] = 8'ha0;
      expv[63] = 8'hc5;
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
