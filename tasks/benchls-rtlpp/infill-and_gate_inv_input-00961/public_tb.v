// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00961 dut (
    .A_N(in_vec[6:6]),
    .B(in_vec[5:5]),
    .C(in_vec[4:4]),
    .VPWR(in_vec[3:3]),
    .VGND(in_vec[2:2]),
    .VPB(in_vec[1:1]),
    .VNB(in_vec[0:0]),
    .X(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h4d;
    stim[1] = 7'h7c;
    stim[2] = 7'h25;
    stim[3] = 7'h2b;
    stim[4] = 7'h40;
    stim[5] = 7'h38;
    stim[6] = 7'h13;
    stim[7] = 7'h28;
    stim[8] = 7'h48;
    stim[9] = 7'h46;
    stim[10] = 7'h5c;
    stim[11] = 7'h63;
    stim[12] = 7'h5c;
    stim[13] = 7'h5d;
    stim[14] = 7'h62;
    stim[15] = 7'h0a;
    stim[16] = 7'h1c;
    stim[17] = 7'h4c;
    stim[18] = 7'h19;
    stim[19] = 7'h4c;
    stim[20] = 7'h2a;
    stim[21] = 7'h68;
    stim[22] = 7'h2d;
    stim[23] = 7'h14;
    stim[24] = 7'h6f;
    stim[25] = 7'h50;
    stim[26] = 7'h1f;
    stim[27] = 7'h47;
    stim[28] = 7'h42;
    stim[29] = 7'h5a;
    stim[30] = 7'h53;
    stim[31] = 7'h21;
    stim[32] = 7'h7f;
    stim[33] = 7'h47;
    stim[34] = 7'h08;
    stim[35] = 7'h1a;
    stim[36] = 7'h52;
    stim[37] = 7'h65;
    stim[38] = 7'h08;
    stim[39] = 7'h27;
    stim[40] = 7'h6d;
    stim[41] = 7'h50;
    stim[42] = 7'h44;
    stim[43] = 7'h13;
    stim[44] = 7'h23;
    stim[45] = 7'h41;
    stim[46] = 7'h74;
    stim[47] = 7'h57;
    stim[48] = 7'h70;
    stim[49] = 7'h00;
    stim[50] = 7'h1f;
    stim[51] = 7'h1e;
    stim[52] = 7'h29;
    stim[53] = 7'h4e;
    stim[54] = 7'h79;
    stim[55] = 7'h7a;
    stim[56] = 7'h1e;
    stim[57] = 7'h07;
    stim[58] = 7'h59;
    stim[59] = 7'h16;
    stim[60] = 7'h4c;
    stim[61] = 7'h7d;
    stim[62] = 7'h53;
    stim[63] = 7'h6a;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
