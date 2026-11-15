// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  alu_control dut (
    .funct(in_vec[7:2]),
    .aluop(in_vec[1:0]),
    .aluctl(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h53;
    stim[1] = 8'had;
    stim[2] = 8'h6c;
    stim[3] = 8'h52;
    stim[4] = 8'h10;
    stim[5] = 8'h31;
    stim[6] = 8'h9a;
    stim[7] = 8'hd5;
    stim[8] = 8'h1d;
    stim[9] = 8'h82;
    stim[10] = 8'h99;
    stim[11] = 8'h6b;
    stim[12] = 8'hb5;
    stim[13] = 8'h08;
    stim[14] = 8'h13;
    stim[15] = 8'h51;
    stim[16] = 8'h34;
    stim[17] = 8'h8a;
    stim[18] = 8'h25;
    stim[19] = 8'h24;
    stim[20] = 8'h1f;
    stim[21] = 8'h77;
    stim[22] = 8'hf2;
    stim[23] = 8'h08;
    stim[24] = 8'haf;
    stim[25] = 8'h54;
    stim[26] = 8'h25;
    stim[27] = 8'hca;
    stim[28] = 8'h32;
    stim[29] = 8'hd9;
    stim[30] = 8'hf4;
    stim[31] = 8'hd9;
    stim[32] = 8'he0;
    stim[33] = 8'hb4;
    stim[34] = 8'h84;
    stim[35] = 8'hba;
    stim[36] = 8'h14;
    stim[37] = 8'h53;
    stim[38] = 8'hfd;
    stim[39] = 8'hc2;
    stim[40] = 8'hfd;
    stim[41] = 8'hfc;
    stim[42] = 8'h9f;
    stim[43] = 8'h2b;
    stim[44] = 8'ha5;
    stim[45] = 8'h38;
    stim[46] = 8'h5e;
    stim[47] = 8'h0f;
    stim[48] = 8'hb0;
    stim[49] = 8'hfc;
    stim[50] = 8'h1b;
    stim[51] = 8'hac;
    stim[52] = 8'hfd;
    stim[53] = 8'hd2;
    stim[54] = 8'h27;
    stim[55] = 8'h3d;
    stim[56] = 8'h07;
    stim[57] = 8'h2b;
    stim[58] = 8'h88;
    stim[59] = 8'h0e;
    stim[60] = 8'hde;
    stim[61] = 8'h78;
    stim[62] = 8'h16;
    stim[63] = 8'h11;
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
      expv[1] = 4'h6;
      expv[2] = 4'h2;
      expv[3] = 4'h0;
      expv[4] = 4'h2;
      expv[5] = 4'h6;
      expv[6] = 4'hd;
      expv[7] = 4'h6;
      expv[8] = 4'h6;
      expv[9] = 4'h2;
      expv[10] = 4'h6;
      expv[11] = 4'h2;
      expv[12] = 4'h6;
      expv[13] = 4'h2;
      expv[14] = 4'h2;
      expv[15] = 4'h6;
      expv[16] = 4'h2;
      expv[17] = 4'h6;
      expv[18] = 4'h6;
      expv[19] = 4'h2;
      expv[20] = 4'h2;
      expv[21] = 4'h2;
      expv[22] = 4'h0;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h6;
      expv[27] = 4'h6;
      expv[28] = 4'h0;
      expv[29] = 4'h6;
      expv[30] = 4'h2;
      expv[31] = 4'h6;
      expv[32] = 4'h2;
      expv[33] = 4'h2;
      expv[34] = 4'h2;
      expv[35] = 4'h0;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h6;
      expv[39] = 4'h2;
      expv[40] = 4'h6;
      expv[41] = 4'h2;
      expv[42] = 4'h2;
      expv[43] = 4'h2;
      expv[44] = 4'h6;
      expv[45] = 4'h2;
      expv[46] = 4'hc;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'h2;
      expv[52] = 4'h6;
      expv[53] = 4'h0;
      expv[54] = 4'h2;
      expv[55] = 4'h6;
      expv[56] = 4'h2;
      expv[57] = 4'h2;
      expv[58] = 4'h2;
      expv[59] = 4'h0;
      expv[60] = 4'hc;
      expv[61] = 4'h2;
      expv[62] = 4'h1;
      expv[63] = 4'h6;
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
