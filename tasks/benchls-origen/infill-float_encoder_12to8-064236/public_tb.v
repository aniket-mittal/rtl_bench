// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_064236 dut (
    .D(in_vec[11:0]),
    .S(out_vec[7:7]),
    .E(out_vec[6:4]),
    .F(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd81;
    stim[1] = 12'h399;
    stim[2] = 12'h865;
    stim[3] = 12'h1b1;
    stim[4] = 12'ha73;
    stim[5] = 12'h33d;
    stim[6] = 12'h11a;
    stim[7] = 12'h501;
    stim[8] = 12'hc17;
    stim[9] = 12'h9ad;
    stim[10] = 12'h088;
    stim[11] = 12'h9bb;
    stim[12] = 12'h0a8;
    stim[13] = 12'heab;
    stim[14] = 12'h566;
    stim[15] = 12'h84f;
    stim[16] = 12'h58a;
    stim[17] = 12'h6a7;
    stim[18] = 12'h7ba;
    stim[19] = 12'hf3b;
    stim[20] = 12'h76a;
    stim[21] = 12'hc79;
    stim[22] = 12'h5ec;
    stim[23] = 12'h9b8;
    stim[24] = 12'h7f2;
    stim[25] = 12'h6fa;
    stim[26] = 12'hd4d;
    stim[27] = 12'hb16;
    stim[28] = 12'h80b;
    stim[29] = 12'h689;
    stim[30] = 12'h878;
    stim[31] = 12'h668;
    stim[32] = 12'heea;
    stim[33] = 12'h128;
    stim[34] = 12'h991;
    stim[35] = 12'hf57;
    stim[36] = 12'h7d4;
    stim[37] = 12'hea5;
    stim[38] = 12'hd65;
    stim[39] = 12'hb31;
    stim[40] = 12'h726;
    stim[41] = 12'h79d;
    stim[42] = 12'h7ce;
    stim[43] = 12'hfa2;
    stim[44] = 12'hc8f;
    stim[45] = 12'h54f;
    stim[46] = 12'hf70;
    stim[47] = 12'h064;
    stim[48] = 12'h746;
    stim[49] = 12'h0ac;
    stim[50] = 12'h9b7;
    stim[51] = 12'hc12;
    stim[52] = 12'h7de;
    stim[53] = 12'had2;
    stim[54] = 12'h1e0;
    stim[55] = 12'hcaf;
    stim[56] = 12'hfd9;
    stim[57] = 12'h2f4;
    stim[58] = 12'h99f;
    stim[59] = 12'hce8;
    stim[60] = 12'h4b4;
    stim[61] = 12'h1e6;
    stim[62] = 12'h64c;
    stim[63] = 12'haa9;
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
      expv[0] = 8'h80;
      expv[1] = 8'h00;
      expv[2] = 8'h80;
      expv[3] = 8'h00;
      expv[4] = 8'h80;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h80;
      expv[9] = 8'h80;
      expv[10] = 8'h00;
      expv[11] = 8'h80;
      expv[12] = 8'h00;
      expv[13] = 8'h80;
      expv[14] = 8'h00;
      expv[15] = 8'h80;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h80;
      expv[20] = 8'h00;
      expv[21] = 8'h80;
      expv[22] = 8'h00;
      expv[23] = 8'h80;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h80;
      expv[27] = 8'h80;
      expv[28] = 8'h80;
      expv[29] = 8'h00;
      expv[30] = 8'h80;
      expv[31] = 8'h00;
      expv[32] = 8'h80;
      expv[33] = 8'h00;
      expv[34] = 8'h80;
      expv[35] = 8'h80;
      expv[36] = 8'h00;
      expv[37] = 8'h80;
      expv[38] = 8'h80;
      expv[39] = 8'h80;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h80;
      expv[44] = 8'h80;
      expv[45] = 8'h00;
      expv[46] = 8'h90;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h80;
      expv[51] = 8'h80;
      expv[52] = 8'h00;
      expv[53] = 8'h80;
      expv[54] = 8'h10;
      expv[55] = 8'h80;
      expv[56] = 8'h80;
      expv[57] = 8'h00;
      expv[58] = 8'h80;
      expv[59] = 8'h80;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h80;
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
