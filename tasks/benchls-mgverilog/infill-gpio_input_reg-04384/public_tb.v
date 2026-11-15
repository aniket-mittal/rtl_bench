// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04384 dut (
    .clk(clk),
    .address(in_vec[6:5]),
    .in_port(in_vec[4:1]),
    .reset_n(in_vec[0:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h06;
    stim[1] = 7'h16;
    stim[2] = 7'h67;
    stim[3] = 7'h47;
    stim[4] = 7'h25;
    stim[5] = 7'h19;
    stim[6] = 7'h31;
    stim[7] = 7'h17;
    stim[8] = 7'h13;
    stim[9] = 7'h21;
    stim[10] = 7'h09;
    stim[11] = 7'h59;
    stim[12] = 7'h05;
    stim[13] = 7'h6f;
    stim[14] = 7'h09;
    stim[15] = 7'h6d;
    stim[16] = 7'h37;
    stim[17] = 7'h5f;
    stim[18] = 7'h21;
    stim[19] = 7'h2b;
    stim[20] = 7'h15;
    stim[21] = 7'h29;
    stim[22] = 7'h6f;
    stim[23] = 7'h61;
    stim[24] = 7'h1b;
    stim[25] = 7'h05;
    stim[26] = 7'h5b;
    stim[27] = 7'h61;
    stim[28] = 7'h3d;
    stim[29] = 7'h49;
    stim[30] = 7'h6d;
    stim[31] = 7'h2d;
    stim[32] = 7'h41;
    stim[33] = 7'h45;
    stim[34] = 7'h1a;
    stim[35] = 7'h37;
    stim[36] = 7'h09;
    stim[37] = 7'h1b;
    stim[38] = 7'h35;
    stim[39] = 7'h15;
    stim[40] = 7'h0d;
    stim[41] = 7'h0f;
    stim[42] = 7'h09;
    stim[43] = 7'h13;
    stim[44] = 7'h67;
    stim[45] = 7'h3f;
    stim[46] = 7'h1f;
    stim[47] = 7'h3d;
    stim[48] = 7'h01;
    stim[49] = 7'h29;
    stim[50] = 7'h77;
    stim[51] = 7'h49;
    stim[52] = 7'h6f;
    stim[53] = 7'h71;
    stim[54] = 7'h3d;
    stim[55] = 7'h71;
    stim[56] = 7'h03;
    stim[57] = 7'h51;
    stim[58] = 7'h39;
    stim[59] = 7'h0d;
    stim[60] = 7'h2b;
    stim[61] = 7'h07;
    stim[62] = 7'h41;
    stim[63] = 7'h15;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h0000000c;
      expv[7] = 32'h00000000;
      expv[8] = 32'h0000000b;
      expv[9] = 32'h00000009;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000004;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000002;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000004;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h0000000a;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h0000000d;
      expv[26] = 32'h00000002;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000004;
      expv[38] = 32'h0000000d;
      expv[39] = 32'h00000000;
      expv[40] = 32'h0000000a;
      expv[41] = 32'h00000006;
      expv[42] = 32'h00000007;
      expv[43] = 32'h00000004;
      expv[44] = 32'h00000009;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h0000000f;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000001;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000006;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000003;
      expv[63] = 32'h00000000;
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
