// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03821 dut (
    .A(in_vec[5:5]),
    .B(in_vec[4:4]),
    .C(in_vec[3:3]),
    .G(in_vec[2:2]),
    .G_2A(in_vec[1:1]),
    .G_2B(in_vec[0:0]),
    .Y0(out_vec[7:7]),
    .Y1(out_vec[6:6]),
    .Y2(out_vec[5:5]),
    .Y3(out_vec[4:4]),
    .Y4(out_vec[3:3]),
    .Y5(out_vec[2:2]),
    .Y6(out_vec[1:1]),
    .Y7(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h15;
    stim[1] = 6'h22;
    stim[2] = 6'h00;
    stim[3] = 6'h09;
    stim[4] = 6'h12;
    stim[5] = 6'h07;
    stim[6] = 6'h04;
    stim[7] = 6'h0e;
    stim[8] = 6'h29;
    stim[9] = 6'h1c;
    stim[10] = 6'h03;
    stim[11] = 6'h1b;
    stim[12] = 6'h0e;
    stim[13] = 6'h0f;
    stim[14] = 6'h3c;
    stim[15] = 6'h29;
    stim[16] = 6'h26;
    stim[17] = 6'h24;
    stim[18] = 6'h2b;
    stim[19] = 6'h2f;
    stim[20] = 6'h19;
    stim[21] = 6'h2a;
    stim[22] = 6'h21;
    stim[23] = 6'h34;
    stim[24] = 6'h1c;
    stim[25] = 6'h1b;
    stim[26] = 6'h36;
    stim[27] = 6'h14;
    stim[28] = 6'h3d;
    stim[29] = 6'h10;
    stim[30] = 6'h37;
    stim[31] = 6'h1f;
    stim[32] = 6'h1f;
    stim[33] = 6'h00;
    stim[34] = 6'h32;
    stim[35] = 6'h0e;
    stim[36] = 6'h1f;
    stim[37] = 6'h37;
    stim[38] = 6'h34;
    stim[39] = 6'h21;
    stim[40] = 6'h15;
    stim[41] = 6'h05;
    stim[42] = 6'h1a;
    stim[43] = 6'h3e;
    stim[44] = 6'h07;
    stim[45] = 6'h30;
    stim[46] = 6'h03;
    stim[47] = 6'h04;
    stim[48] = 6'h0a;
    stim[49] = 6'h1a;
    stim[50] = 6'h19;
    stim[51] = 6'h1e;
    stim[52] = 6'h15;
    stim[53] = 6'h0d;
    stim[54] = 6'h03;
    stim[55] = 6'h3a;
    stim[56] = 6'h22;
    stim[57] = 6'h0f;
    stim[58] = 6'h26;
    stim[59] = 6'h0f;
    stim[60] = 6'h05;
    stim[61] = 6'h0a;
    stim[62] = 6'h33;
    stim[63] = 6'h14;
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
      expv[0] = 8'hff;
      expv[1] = 8'hff;
      expv[2] = 8'hff;
      expv[3] = 8'hff;
      expv[4] = 8'hff;
      expv[5] = 8'hff;
      expv[6] = 8'h7f;
      expv[7] = 8'hff;
      expv[8] = 8'hff;
      expv[9] = 8'hfd;
      expv[10] = 8'hff;
      expv[11] = 8'hff;
      expv[12] = 8'hff;
      expv[13] = 8'hff;
      expv[14] = 8'hfe;
      expv[15] = 8'hff;
      expv[16] = 8'hff;
      expv[17] = 8'hbf;
      expv[18] = 8'hff;
      expv[19] = 8'hff;
      expv[20] = 8'hff;
      expv[21] = 8'hff;
      expv[22] = 8'hff;
      expv[23] = 8'hef;
      expv[24] = 8'hfd;
      expv[25] = 8'hff;
      expv[26] = 8'hff;
      expv[27] = 8'hdf;
      expv[28] = 8'hff;
      expv[29] = 8'hff;
      expv[30] = 8'hff;
      expv[31] = 8'hff;
      expv[32] = 8'hff;
      expv[33] = 8'hff;
      expv[34] = 8'hff;
      expv[35] = 8'hff;
      expv[36] = 8'hff;
      expv[37] = 8'hff;
      expv[38] = 8'hef;
      expv[39] = 8'hff;
      expv[40] = 8'hff;
      expv[41] = 8'hff;
      expv[42] = 8'hff;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hff;
      expv[46] = 8'hff;
      expv[47] = 8'h7f;
      expv[48] = 8'hff;
      expv[49] = 8'hff;
      expv[50] = 8'hff;
      expv[51] = 8'hff;
      expv[52] = 8'hff;
      expv[53] = 8'hff;
      expv[54] = 8'hff;
      expv[55] = 8'hff;
      expv[56] = 8'hff;
      expv[57] = 8'hff;
      expv[58] = 8'hff;
      expv[59] = 8'hff;
      expv[60] = 8'hff;
      expv[61] = 8'hff;
      expv[62] = 8'hff;
      expv[63] = 8'hdf;
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
