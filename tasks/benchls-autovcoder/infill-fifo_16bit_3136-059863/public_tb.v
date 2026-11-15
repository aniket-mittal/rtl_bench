// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059863 dut (
    .clk(clk),
    .reset(in_vec[20:20]),
    .if_write_ce(in_vec[19:19]),
    .if_write(in_vec[18:18]),
    .if_din(in_vec[17:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[17:17]),
    .if_empty_n(out_vec[16:16]),
    .if_dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1488fa;
    stim[1] = 21'h1db320;
    stim[2] = 21'h0b04f6;
    stim[3] = 21'h01f156;
    stim[4] = 21'h03f3b7;
    stim[5] = 21'h0e4b26;
    stim[6] = 21'h05630c;
    stim[7] = 21'h01f68d;
    stim[8] = 21'h052874;
    stim[9] = 21'h008c98;
    stim[10] = 21'h050bc5;
    stim[11] = 21'h03bbeb;
    stim[12] = 21'h0dea75;
    stim[13] = 21'h0d7569;
    stim[14] = 21'h08ce8c;
    stim[15] = 21'h09004f;
    stim[16] = 21'h0e34db;
    stim[17] = 21'h094f17;
    stim[18] = 21'h0ed6bc;
    stim[19] = 21'h002fcd;
    stim[20] = 21'h035b58;
    stim[21] = 21'h00fccb;
    stim[22] = 21'h06242d;
    stim[23] = 21'h056077;
    stim[24] = 21'h0c36b1;
    stim[25] = 21'h04dd3a;
    stim[26] = 21'h0785f4;
    stim[27] = 21'h0c85b4;
    stim[28] = 21'h0e4e95;
    stim[29] = 21'h062b96;
    stim[30] = 21'h057054;
    stim[31] = 21'h06f41b;
    stim[32] = 21'h0c1815;
    stim[33] = 21'h00a7d5;
    stim[34] = 21'h046aae;
    stim[35] = 21'h0bfa68;
    stim[36] = 21'h05b6e9;
    stim[37] = 21'h0f585a;
    stim[38] = 21'h021835;
    stim[39] = 21'h01c9f7;
    stim[40] = 21'h00245e;
    stim[41] = 21'h0c8d5d;
    stim[42] = 21'h0bfb2a;
    stim[43] = 21'h0858f2;
    stim[44] = 21'h04cb46;
    stim[45] = 21'h02315d;
    stim[46] = 21'h06f067;
    stim[47] = 21'h08caa0;
    stim[48] = 21'h09474b;
    stim[49] = 21'h048cd6;
    stim[50] = 21'h0277c2;
    stim[51] = 21'h0f88ba;
    stim[52] = 21'h0e275d;
    stim[53] = 21'h0ba9bc;
    stim[54] = 21'h05ccde;
    stim[55] = 21'h0dc1c9;
    stim[56] = 21'h0dcdc6;
    stim[57] = 21'h050e2a;
    stim[58] = 21'h11a4da;
    stim[59] = 21'h0a7142;
    stim[60] = 21'h05b16d;
    stim[61] = 21'h0c77e5;
    stim[62] = 21'h052f81;
    stim[63] = 21'h0346ff;
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
      expv[0] = 18'h20000;
      expv[1] = 18'h20000;
      expv[2] = 18'h20000;
      expv[3] = 18'h20000;
      expv[4] = 18'h20000;
      expv[5] = 18'h20000;
      expv[6] = 18'h20000;
      expv[7] = 18'h20000;
      expv[8] = 18'h20000;
      expv[9] = 18'h20000;
      expv[10] = 18'h20000;
      expv[11] = 18'h20000;
      expv[12] = 18'h392c9;
      expv[13] = 18'h392c9;
      expv[14] = 18'h392c9;
      expv[15] = 18'h392c9;
      expv[16] = 18'h37a9d;
      expv[17] = 18'h35d5a;
      expv[18] = 18'h38d36;
      expv[19] = 18'h38d36;
      expv[20] = 18'h38d36;
      expv[21] = 18'h38d36;
      expv[22] = 18'h3b5af;
      expv[23] = 18'h3b5af;
      expv[24] = 18'h2b5af;
      expv[25] = 18'h2b5af;
      expv[26] = 18'h30dac;
      expv[27] = 18'h30dac;
      expv[28] = 18'h30dac;
      expv[29] = 18'h30dac;
      expv[30] = 18'h30dac;
      expv[31] = 18'h30dac;
      expv[32] = 18'h3216d;
      expv[33] = 18'h3216d;
      expv[34] = 18'h3216d;
      expv[35] = 18'h3216d;
      expv[36] = 18'h3216d;
      expv[37] = 18'h3216d;
      expv[38] = 18'h3216d;
      expv[39] = 18'h3216d;
      expv[40] = 18'h393a5;
      expv[41] = 18'h393a5;
      expv[42] = 18'h393a5;
      expv[43] = 18'h393a5;
      expv[44] = 18'h393a5;
      expv[45] = 18'h393a5;
      expv[46] = 18'h393a5;
      expv[47] = 18'h30605;
      expv[48] = 18'h30605;
      expv[49] = 18'h3d616;
      expv[50] = 18'h3d616;
      expv[51] = 18'h3d616;
      expv[52] = 18'h3d616;
      expv[53] = 18'h3d616;
      expv[54] = 18'h3d616;
      expv[55] = 18'h3d616;
      expv[56] = 18'h3d616;
      expv[57] = 18'h3d616;
      expv[58] = 18'h3d616;
      expv[59] = 18'h20000;
      expv[60] = 18'h20000;
      expv[61] = 18'h20000;
      expv[62] = 18'h20000;
      expv[63] = 18'h20000;
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
