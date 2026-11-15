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

  mg_02453 dut (
    .in0(in_vec[15:8]),
    .in1(in_vec[7:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h4f4e;
    stim[1] = 16'hb71e;
    stim[2] = 16'hfe9b;
    stim[3] = 16'h325b;
    stim[4] = 16'h72d8;
    stim[5] = 16'hbb25;
    stim[6] = 16'h01de;
    stim[7] = 16'ha782;
    stim[8] = 16'hae00;
    stim[9] = 16'h8c30;
    stim[10] = 16'h22ab;
    stim[11] = 16'hfa54;
    stim[12] = 16'h3ff4;
    stim[13] = 16'h9600;
    stim[14] = 16'h6304;
    stim[15] = 16'hdbf0;
    stim[16] = 16'h80b4;
    stim[17] = 16'ha322;
    stim[18] = 16'hb8a9;
    stim[19] = 16'hccf7;
    stim[20] = 16'h7879;
    stim[21] = 16'h6371;
    stim[22] = 16'h9f86;
    stim[23] = 16'hb412;
    stim[24] = 16'h8721;
    stim[25] = 16'h610a;
    stim[26] = 16'hafd4;
    stim[27] = 16'h4abc;
    stim[28] = 16'h07a4;
    stim[29] = 16'h4bd5;
    stim[30] = 16'had4c;
    stim[31] = 16'hba3c;
    stim[32] = 16'ha447;
    stim[33] = 16'he034;
    stim[34] = 16'h3a69;
    stim[35] = 16'hf122;
    stim[36] = 16'h9ee6;
    stim[37] = 16'hab09;
    stim[38] = 16'hde67;
    stim[39] = 16'ha8bf;
    stim[40] = 16'haa28;
    stim[41] = 16'h739b;
    stim[42] = 16'h0857;
    stim[43] = 16'h85b2;
    stim[44] = 16'h4378;
    stim[45] = 16'h21a2;
    stim[46] = 16'h087f;
    stim[47] = 16'h34f6;
    stim[48] = 16'he9cb;
    stim[49] = 16'hcc61;
    stim[50] = 16'h38c3;
    stim[51] = 16'h5d7a;
    stim[52] = 16'h2712;
    stim[53] = 16'h1a17;
    stim[54] = 16'hf470;
    stim[55] = 16'h71ec;
    stim[56] = 16'h48f8;
    stim[57] = 16'h5624;
    stim[58] = 16'h6c80;
    stim[59] = 16'h7a11;
    stim[60] = 16'hd030;
    stim[61] = 16'h2810;
    stim[62] = 16'h2d81;
    stim[63] = 16'hb1a3;
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
      expv[0] = 16'h1812;
      expv[1] = 16'h1572;
      expv[2] = 16'h9bca;
      expv[3] = 16'h11c6;
      expv[4] = 16'hee30;
      expv[5] = 16'h1b07;
      expv[6] = 16'hffde;
      expv[7] = 16'hadce;
      expv[8] = 16'h0000;
      expv[9] = 16'h1a40;
      expv[10] = 16'hf4b6;
      expv[11] = 16'h5208;
      expv[12] = 16'hfd0c;
      expv[13] = 16'h0000;
      expv[14] = 16'h018c;
      expv[15] = 16'hf250;
      expv[16] = 16'hda00;
      expv[17] = 16'h15a6;
      expv[18] = 16'hc178;
      expv[19] = 16'hf8d4;
      expv[20] = 16'h38b8;
      expv[21] = 16'h2bb3;
      expv[22] = 16'hb43a;
      expv[23] = 16'h0ca8;
      expv[24] = 16'h1167;
      expv[25] = 16'h03ca;
      expv[26] = 16'he1ec;
      expv[27] = 16'hec58;
      expv[28] = 16'hfd7c;
      expv[29] = 16'hf367;
      expv[30] = 16'h335c;
      expv[31] = 16'h2b98;
      expv[32] = 16'h2d7c;
      expv[33] = 16'h2d80;
      expv[34] = 16'h17ca;
      expv[35] = 16'h2002;
      expv[36] = 16'heff4;
      expv[37] = 16'h0603;
      expv[38] = 16'h5952;
      expv[39] = 16'hd558;
      expv[40] = 16'h1a90;
      expv[41] = 16'hd2a1;
      expv[42] = 16'h02b8;
      expv[43] = 16'hd77a;
      expv[44] = 16'h1f68;
      expv[45] = 16'hf3e2;
      expv[46] = 16'h03f8;
      expv[47] = 16'hfdf8;
      expv[48] = 16'hcfc3;
      expv[49] = 16'h4d4c;
      expv[50] = 16'hf2a8;
      expv[51] = 16'h2c52;
      expv[52] = 16'h02be;
      expv[53] = 16'h0256;
      expv[54] = 16'h6ac0;
      expv[55] = 16'hf72c;
      expv[56] = 16'hfdc0;
      expv[57] = 16'h0c18;
      expv[58] = 16'hca00;
      expv[59] = 16'h081a;
      expv[60] = 16'h2700;
      expv[61] = 16'h0280;
      expv[62] = 16'he9ad;
      expv[63] = 16'hbfb3;
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
