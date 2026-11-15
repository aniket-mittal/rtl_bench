// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132788 dut (
    .A(in_vec[7:7]),
    .B(in_vec[6:6]),
    .C(in_vec[5:5]),
    .D(in_vec[4:4]),
    .VPWR(in_vec[3:3]),
    .VGND(in_vec[2:2]),
    .VPB(in_vec[1:1]),
    .VNB(in_vec[0:0]),
    .Y(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hbd;
    stim[1] = 8'hb3;
    stim[2] = 8'h25;
    stim[3] = 8'hfc;
    stim[4] = 8'hfa;
    stim[5] = 8'hf8;
    stim[6] = 8'h30;
    stim[7] = 8'h2b;
    stim[8] = 8'h0f;
    stim[9] = 8'h7b;
    stim[10] = 8'h4b;
    stim[11] = 8'h47;
    stim[12] = 8'ha5;
    stim[13] = 8'h7d;
    stim[14] = 8'hba;
    stim[15] = 8'hdc;
    stim[16] = 8'hb2;
    stim[17] = 8'h0f;
    stim[18] = 8'h99;
    stim[19] = 8'hd0;
    stim[20] = 8'h6b;
    stim[21] = 8'h29;
    stim[22] = 8'hdd;
    stim[23] = 8'hf1;
    stim[24] = 8'hc6;
    stim[25] = 8'h96;
    stim[26] = 8'h8d;
    stim[27] = 8'h02;
    stim[28] = 8'hbc;
    stim[29] = 8'hd7;
    stim[30] = 8'h2a;
    stim[31] = 8'h7a;
    stim[32] = 8'h8e;
    stim[33] = 8'h7d;
    stim[34] = 8'h07;
    stim[35] = 8'ha1;
    stim[36] = 8'hbf;
    stim[37] = 8'h5a;
    stim[38] = 8'hf1;
    stim[39] = 8'h2a;
    stim[40] = 8'hea;
    stim[41] = 8'hc6;
    stim[42] = 8'he0;
    stim[43] = 8'h73;
    stim[44] = 8'hf3;
    stim[45] = 8'hd3;
    stim[46] = 8'h92;
    stim[47] = 8'h5b;
    stim[48] = 8'h14;
    stim[49] = 8'h55;
    stim[50] = 8'h7a;
    stim[51] = 8'h8e;
    stim[52] = 8'h4f;
    stim[53] = 8'hbb;
    stim[54] = 8'h58;
    stim[55] = 8'h86;
    stim[56] = 8'h3b;
    stim[57] = 8'h6c;
    stim[58] = 8'hdd;
    stim[59] = 8'h10;
    stim[60] = 8'h26;
    stim[61] = 8'h02;
    stim[62] = 8'hc5;
    stim[63] = 8'h09;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
