// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087674 dut (
    .in_byte(in_vec[7:0]),
    .out_seg1(out_vec[15:8]),
    .out_seg2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h33;
    stim[1] = 8'hf1;
    stim[2] = 8'hb4;
    stim[3] = 8'h7b;
    stim[4] = 8'hab;
    stim[5] = 8'h02;
    stim[6] = 8'h93;
    stim[7] = 8'h8c;
    stim[8] = 8'hbd;
    stim[9] = 8'hba;
    stim[10] = 8'hd2;
    stim[11] = 8'h88;
    stim[12] = 8'h33;
    stim[13] = 8'hbd;
    stim[14] = 8'h98;
    stim[15] = 8'hca;
    stim[16] = 8'ha7;
    stim[17] = 8'h54;
    stim[18] = 8'hb1;
    stim[19] = 8'hd6;
    stim[20] = 8'h85;
    stim[21] = 8'hbd;
    stim[22] = 8'h78;
    stim[23] = 8'ha7;
    stim[24] = 8'h6b;
    stim[25] = 8'ha8;
    stim[26] = 8'h07;
    stim[27] = 8'hce;
    stim[28] = 8'haa;
    stim[29] = 8'h4c;
    stim[30] = 8'h3e;
    stim[31] = 8'hd7;
    stim[32] = 8'he1;
    stim[33] = 8'h71;
    stim[34] = 8'h69;
    stim[35] = 8'h28;
    stim[36] = 8'h3c;
    stim[37] = 8'hcd;
    stim[38] = 8'hd5;
    stim[39] = 8'h74;
    stim[40] = 8'h46;
    stim[41] = 8'heb;
    stim[42] = 8'h33;
    stim[43] = 8'h50;
    stim[44] = 8'h01;
    stim[45] = 8'h56;
    stim[46] = 8'h83;
    stim[47] = 8'ha4;
    stim[48] = 8'he7;
    stim[49] = 8'h73;
    stim[50] = 8'hf4;
    stim[51] = 8'h25;
    stim[52] = 8'h26;
    stim[53] = 8'hdf;
    stim[54] = 8'h05;
    stim[55] = 8'hcc;
    stim[56] = 8'h4c;
    stim[57] = 8'h13;
    stim[58] = 8'h9d;
    stim[59] = 8'hea;
    stim[60] = 8'hb1;
    stim[61] = 8'h46;
    stim[62] = 8'hfe;
    stim[63] = 8'h19;
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
      expv[0] = 16'h7979;
      expv[1] = 16'h3047;
      expv[2] = 16'h331f;
      expv[3] = 16'h1f70;
      expv[4] = 16'h1f77;
      expv[5] = 16'h6d7e;
      expv[6] = 16'h797b;
      expv[7] = 16'h4e7f;
      expv[8] = 16'h3d1f;
      expv[9] = 16'h771f;
      expv[10] = 16'h6d3d;
      expv[11] = 16'h7f7f;
      expv[12] = 16'h7979;
      expv[13] = 16'h3d1f;
      expv[14] = 16'h7f7b;
      expv[15] = 16'h774e;
      expv[16] = 16'h7077;
      expv[17] = 16'h335b;
      expv[18] = 16'h301f;
      expv[19] = 16'h5f3d;
      expv[20] = 16'h5b7f;
      expv[21] = 16'h3d1f;
      expv[22] = 16'h7f70;
      expv[23] = 16'h7077;
      expv[24] = 16'h1f5f;
      expv[25] = 16'h7f77;
      expv[26] = 16'h707e;
      expv[27] = 16'h4f4e;
      expv[28] = 16'h7777;
      expv[29] = 16'h4e33;
      expv[30] = 16'h4f79;
      expv[31] = 16'h703d;
      expv[32] = 16'h304f;
      expv[33] = 16'h3070;
      expv[34] = 16'h7b5f;
      expv[35] = 16'h7f6d;
      expv[36] = 16'h4e79;
      expv[37] = 16'h3d4e;
      expv[38] = 16'h5b3d;
      expv[39] = 16'h3370;
      expv[40] = 16'h5f33;
      expv[41] = 16'h1f4f;
      expv[42] = 16'h7979;
      expv[43] = 16'h7e5b;
      expv[44] = 16'h307e;
      expv[45] = 16'h5f5b;
      expv[46] = 16'h797f;
      expv[47] = 16'h3377;
      expv[48] = 16'h704f;
      expv[49] = 16'h7970;
      expv[50] = 16'h3347;
      expv[51] = 16'h5b6d;
      expv[52] = 16'h5f6d;
      expv[53] = 16'h473d;
      expv[54] = 16'h5b7e;
      expv[55] = 16'h4e4e;
      expv[56] = 16'h4e33;
      expv[57] = 16'h7930;
      expv[58] = 16'h3d7b;
      expv[59] = 16'h774f;
      expv[60] = 16'h301f;
      expv[61] = 16'h5f33;
      expv[62] = 16'h4f47;
      expv[63] = 16'h7b30;
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
