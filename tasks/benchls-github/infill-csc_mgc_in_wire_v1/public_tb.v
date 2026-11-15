// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  CSC_mgc_in_wire_v1 dut (
    .z(in_vec[7:0]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h45;
    stim[1] = 8'hf7;
    stim[2] = 8'he7;
    stim[3] = 8'h2b;
    stim[4] = 8'h3a;
    stim[5] = 8'h3d;
    stim[6] = 8'h70;
    stim[7] = 8'h25;
    stim[8] = 8'hd3;
    stim[9] = 8'h7d;
    stim[10] = 8'h25;
    stim[11] = 8'h50;
    stim[12] = 8'hbe;
    stim[13] = 8'hb4;
    stim[14] = 8'he7;
    stim[15] = 8'he4;
    stim[16] = 8'h0e;
    stim[17] = 8'h71;
    stim[18] = 8'h0d;
    stim[19] = 8'h15;
    stim[20] = 8'hf7;
    stim[21] = 8'h51;
    stim[22] = 8'ha1;
    stim[23] = 8'h2f;
    stim[24] = 8'h08;
    stim[25] = 8'h5e;
    stim[26] = 8'h83;
    stim[27] = 8'h26;
    stim[28] = 8'h19;
    stim[29] = 8'h4e;
    stim[30] = 8'hb4;
    stim[31] = 8'h97;
    stim[32] = 8'h06;
    stim[33] = 8'h99;
    stim[34] = 8'h10;
    stim[35] = 8'ha3;
    stim[36] = 8'h36;
    stim[37] = 8'hb7;
    stim[38] = 8'h17;
    stim[39] = 8'he4;
    stim[40] = 8'h82;
    stim[41] = 8'hb8;
    stim[42] = 8'h3a;
    stim[43] = 8'h20;
    stim[44] = 8'h5d;
    stim[45] = 8'ha5;
    stim[46] = 8'h79;
    stim[47] = 8'h67;
    stim[48] = 8'h52;
    stim[49] = 8'h16;
    stim[50] = 8'h0f;
    stim[51] = 8'h2e;
    stim[52] = 8'h6f;
    stim[53] = 8'h6a;
    stim[54] = 8'h15;
    stim[55] = 8'h8e;
    stim[56] = 8'h7a;
    stim[57] = 8'hc3;
    stim[58] = 8'h78;
    stim[59] = 8'h77;
    stim[60] = 8'h61;
    stim[61] = 8'h40;
    stim[62] = 8'h0e;
    stim[63] = 8'h37;
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
      expv[0] = 8'h45;
      expv[1] = 8'hf7;
      expv[2] = 8'he7;
      expv[3] = 8'h2b;
      expv[4] = 8'h3a;
      expv[5] = 8'h3d;
      expv[6] = 8'h70;
      expv[7] = 8'h25;
      expv[8] = 8'hd3;
      expv[9] = 8'h7d;
      expv[10] = 8'h25;
      expv[11] = 8'h50;
      expv[12] = 8'hbe;
      expv[13] = 8'hb4;
      expv[14] = 8'he7;
      expv[15] = 8'he4;
      expv[16] = 8'h0e;
      expv[17] = 8'h71;
      expv[18] = 8'h0d;
      expv[19] = 8'h15;
      expv[20] = 8'hf7;
      expv[21] = 8'h51;
      expv[22] = 8'ha1;
      expv[23] = 8'h2f;
      expv[24] = 8'h08;
      expv[25] = 8'h5e;
      expv[26] = 8'h83;
      expv[27] = 8'h26;
      expv[28] = 8'h19;
      expv[29] = 8'h4e;
      expv[30] = 8'hb4;
      expv[31] = 8'h97;
      expv[32] = 8'h06;
      expv[33] = 8'h99;
      expv[34] = 8'h10;
      expv[35] = 8'ha3;
      expv[36] = 8'h36;
      expv[37] = 8'hb7;
      expv[38] = 8'h17;
      expv[39] = 8'he4;
      expv[40] = 8'h82;
      expv[41] = 8'hb8;
      expv[42] = 8'h3a;
      expv[43] = 8'h20;
      expv[44] = 8'h5d;
      expv[45] = 8'ha5;
      expv[46] = 8'h79;
      expv[47] = 8'h67;
      expv[48] = 8'h52;
      expv[49] = 8'h16;
      expv[50] = 8'h0f;
      expv[51] = 8'h2e;
      expv[52] = 8'h6f;
      expv[53] = 8'h6a;
      expv[54] = 8'h15;
      expv[55] = 8'h8e;
      expv[56] = 8'h7a;
      expv[57] = 8'hc3;
      expv[58] = 8'h78;
      expv[59] = 8'h77;
      expv[60] = 8'h61;
      expv[61] = 8'h40;
      expv[62] = 8'h0e;
      expv[63] = 8'h37;
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
