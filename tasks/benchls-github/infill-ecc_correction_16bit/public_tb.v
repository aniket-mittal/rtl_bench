// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ecc_correction_16bit dut (
    .s(in_vec[5:0]),
    .e(out_vec[16:1]),
    .fatal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h36;
    stim[1] = 6'h25;
    stim[2] = 6'h01;
    stim[3] = 6'h00;
    stim[4] = 6'h07;
    stim[5] = 6'h1b;
    stim[6] = 6'h0e;
    stim[7] = 6'h02;
    stim[8] = 6'h1c;
    stim[9] = 6'h33;
    stim[10] = 6'h1e;
    stim[11] = 6'h18;
    stim[12] = 6'h2f;
    stim[13] = 6'h39;
    stim[14] = 6'h32;
    stim[15] = 6'h38;
    stim[16] = 6'h00;
    stim[17] = 6'h00;
    stim[18] = 6'h1f;
    stim[19] = 6'h0d;
    stim[20] = 6'h2c;
    stim[21] = 6'h24;
    stim[22] = 6'h34;
    stim[23] = 6'h10;
    stim[24] = 6'h25;
    stim[25] = 6'h01;
    stim[26] = 6'h1e;
    stim[27] = 6'h3a;
    stim[28] = 6'h1f;
    stim[29] = 6'h1f;
    stim[30] = 6'h3d;
    stim[31] = 6'h22;
    stim[32] = 6'h2f;
    stim[33] = 6'h11;
    stim[34] = 6'h11;
    stim[35] = 6'h37;
    stim[36] = 6'h2f;
    stim[37] = 6'h3d;
    stim[38] = 6'h2c;
    stim[39] = 6'h39;
    stim[40] = 6'h14;
    stim[41] = 6'h09;
    stim[42] = 6'h21;
    stim[43] = 6'h02;
    stim[44] = 6'h1a;
    stim[45] = 6'h15;
    stim[46] = 6'h04;
    stim[47] = 6'h39;
    stim[48] = 6'h27;
    stim[49] = 6'h31;
    stim[50] = 6'h08;
    stim[51] = 6'h0c;
    stim[52] = 6'h12;
    stim[53] = 6'h07;
    stim[54] = 6'h35;
    stim[55] = 6'h11;
    stim[56] = 6'h38;
    stim[57] = 6'h33;
    stim[58] = 6'h1c;
    stim[59] = 6'h2b;
    stim[60] = 6'h3c;
    stim[61] = 6'h38;
    stim[62] = 6'h07;
    stim[63] = 6'h25;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00004;
      expv[2] = 17'h00001;
      expv[3] = 17'h00000;
      expv[4] = 17'h00001;
      expv[5] = 17'h00001;
      expv[6] = 17'h00001;
      expv[7] = 17'h00001;
      expv[8] = 17'h00001;
      expv[9] = 17'h04000;
      expv[10] = 17'h00001;
      expv[11] = 17'h00001;
      expv[12] = 17'h00800;
      expv[13] = 17'h00000;
      expv[14] = 17'h02000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00001;
      expv[19] = 17'h00001;
      expv[20] = 17'h00100;
      expv[21] = 17'h00000;
      expv[22] = 17'h08000;
      expv[23] = 17'h00001;
      expv[24] = 17'h00004;
      expv[25] = 17'h00001;
      expv[26] = 17'h00001;
      expv[27] = 17'h00000;
      expv[28] = 17'h00001;
      expv[29] = 17'h00001;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00800;
      expv[33] = 17'h00001;
      expv[34] = 17'h00001;
      expv[35] = 17'h00000;
      expv[36] = 17'h00800;
      expv[37] = 17'h00000;
      expv[38] = 17'h00100;
      expv[39] = 17'h00000;
      expv[40] = 17'h00001;
      expv[41] = 17'h00001;
      expv[42] = 17'h00000;
      expv[43] = 17'h00001;
      expv[44] = 17'h00001;
      expv[45] = 17'h00001;
      expv[46] = 17'h00001;
      expv[47] = 17'h00000;
      expv[48] = 17'h00010;
      expv[49] = 17'h01000;
      expv[50] = 17'h00001;
      expv[51] = 17'h00001;
      expv[52] = 17'h00001;
      expv[53] = 17'h00001;
      expv[54] = 17'h10000;
      expv[55] = 17'h00001;
      expv[56] = 17'h00000;
      expv[57] = 17'h04000;
      expv[58] = 17'h00001;
      expv[59] = 17'h00080;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00001;
      expv[63] = 17'h00004;
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
