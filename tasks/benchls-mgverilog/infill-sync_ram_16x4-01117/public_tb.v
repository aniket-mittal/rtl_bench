// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01117 dut (
    .clk(clk),
    .wr_addr(in_vec[12:9]),
    .wr_data(in_vec[8:5]),
    .wr_enable(in_vec[4:4]),
    .rd_addr(in_vec[3:0]),
    .rd_data(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1076;
    stim[1] = 13'h0f0e;
    stim[2] = 13'h11c7;
    stim[3] = 13'h04a3;
    stim[4] = 13'h040d;
    stim[5] = 13'h1177;
    stim[6] = 13'h1051;
    stim[7] = 13'h1097;
    stim[8] = 13'h0863;
    stim[9] = 13'h12e4;
    stim[10] = 13'h004a;
    stim[11] = 13'h0141;
    stim[12] = 13'h17f3;
    stim[13] = 13'h170b;
    stim[14] = 13'h1b98;
    stim[15] = 13'h1c51;
    stim[16] = 13'h0662;
    stim[17] = 13'h137d;
    stim[18] = 13'h096f;
    stim[19] = 13'h08d8;
    stim[20] = 13'h1cbe;
    stim[21] = 13'h08e1;
    stim[22] = 13'h05fb;
    stim[23] = 13'h17bb;
    stim[24] = 13'h0f71;
    stim[25] = 13'h0692;
    stim[26] = 13'h1aa3;
    stim[27] = 13'h06a8;
    stim[28] = 13'h1d61;
    stim[29] = 13'h10be;
    stim[30] = 13'h1eee;
    stim[31] = 13'h14a1;
    stim[32] = 13'h1475;
    stim[33] = 13'h103f;
    stim[34] = 13'h05a4;
    stim[35] = 13'h067d;
    stim[36] = 13'h1334;
    stim[37] = 13'h1a02;
    stim[38] = 13'h0c81;
    stim[39] = 13'h01e4;
    stim[40] = 13'h19d8;
    stim[41] = 13'h04a7;
    stim[42] = 13'h1f3c;
    stim[43] = 13'h165d;
    stim[44] = 13'h01f1;
    stim[45] = 13'h0ce7;
    stim[46] = 13'h155c;
    stim[47] = 13'h1274;
    stim[48] = 13'h0572;
    stim[49] = 13'h13aa;
    stim[50] = 13'h17c2;
    stim[51] = 13'h0769;
    stim[52] = 13'h01cc;
    stim[53] = 13'h006a;
    stim[54] = 13'h1037;
    stim[55] = 13'h07b6;
    stim[56] = 13'h02e6;
    stim[57] = 13'h1ff9;
    stim[58] = 13'h1289;
    stim[59] = 13'h1ee7;
    stim[60] = 13'h16aa;
    stim[61] = 13'h09bc;
    stim[62] = 13'h1b4e;
    stim[63] = 13'h1b26;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hx;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'hx;
      expv[10] = 4'hx;
      expv[11] = 4'hx;
      expv[12] = 4'hx;
      expv[13] = 4'hx;
      expv[14] = 4'hf;
      expv[15] = 4'h4;
      expv[16] = 4'hx;
      expv[17] = 4'hx;
      expv[18] = 4'hc;
      expv[19] = 4'hx;
      expv[20] = 4'h4;
      expv[21] = 4'h2;
      expv[22] = 4'hx;
      expv[23] = 4'hf;
      expv[24] = 4'hf;
      expv[25] = 4'hx;
      expv[26] = 4'hf;
      expv[27] = 4'h4;
      expv[28] = 4'h4;
      expv[29] = 4'hx;
      expv[30] = 4'h5;
      expv[31] = 4'h5;
      expv[32] = 4'hx;
      expv[33] = 4'hx;
      expv[34] = 4'hx;
      expv[35] = 4'h6;
      expv[36] = 4'hc;
      expv[37] = 4'h6;
      expv[38] = 4'hf;
      expv[39] = 4'hx;
      expv[40] = 4'h6;
      expv[41] = 4'h1;
      expv[42] = 4'hb;
      expv[43] = 4'he;
      expv[44] = 4'hc;
      expv[45] = 4'hx;
      expv[46] = 4'hb;
      expv[47] = 4'he;
      expv[48] = 4'h6;
      expv[49] = 4'hf;
      expv[50] = 4'ha;
      expv[51] = 4'hb;
      expv[52] = 4'h3;
      expv[53] = 4'he;
      expv[54] = 4'ha;
      expv[55] = 4'hb;
      expv[56] = 4'hx;
      expv[57] = 4'hx;
      expv[58] = 4'h3;
      expv[59] = 4'h3;
      expv[60] = 4'hb;
      expv[61] = 4'ha;
      expv[62] = 4'he;
      expv[63] = 4'h5;
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
