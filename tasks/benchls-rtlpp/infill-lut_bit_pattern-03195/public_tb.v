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

  rtlpp_03195 dut (
    .clk(clk),
    .rst(in_vec[6:6]),
    .adr_i(in_vec[5:0]),
    .dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h57;
    stim[1] = 7'h66;
    stim[2] = 7'h3f;
    stim[3] = 7'h3f;
    stim[4] = 7'h13;
    stim[5] = 7'h15;
    stim[6] = 7'h1c;
    stim[7] = 7'h16;
    stim[8] = 7'h39;
    stim[9] = 7'h00;
    stim[10] = 7'h11;
    stim[11] = 7'h27;
    stim[12] = 7'h1d;
    stim[13] = 7'h1d;
    stim[14] = 7'h04;
    stim[15] = 7'h1a;
    stim[16] = 7'h24;
    stim[17] = 7'h31;
    stim[18] = 7'h26;
    stim[19] = 7'h04;
    stim[20] = 7'h36;
    stim[21] = 7'h2b;
    stim[22] = 7'h09;
    stim[23] = 7'h2a;
    stim[24] = 7'h07;
    stim[25] = 7'h04;
    stim[26] = 7'h0f;
    stim[27] = 7'h23;
    stim[28] = 7'h08;
    stim[29] = 7'h07;
    stim[30] = 7'h15;
    stim[31] = 7'h02;
    stim[32] = 7'h0c;
    stim[33] = 7'h66;
    stim[34] = 7'h61;
    stim[35] = 7'h24;
    stim[36] = 7'h0c;
    stim[37] = 7'h18;
    stim[38] = 7'h0e;
    stim[39] = 7'h34;
    stim[40] = 7'h2a;
    stim[41] = 7'h33;
    stim[42] = 7'h2d;
    stim[43] = 7'h1c;
    stim[44] = 7'h2e;
    stim[45] = 7'h32;
    stim[46] = 7'h12;
    stim[47] = 7'h0a;
    stim[48] = 7'h1c;
    stim[49] = 7'h2f;
    stim[50] = 7'h1e;
    stim[51] = 7'h19;
    stim[52] = 7'h1a;
    stim[53] = 7'h3f;
    stim[54] = 7'h1c;
    stim[55] = 7'h19;
    stim[56] = 7'h51;
    stim[57] = 7'h1f;
    stim[58] = 7'h29;
    stim[59] = 7'h5d;
    stim[60] = 7'h0e;
    stim[61] = 7'h2f;
    stim[62] = 7'h14;
    stim[63] = 7'h30;
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
      expv[5] = 32'h7ffffffe;
      expv[6] = 32'h7ffffffe;
      expv[7] = 32'h03ffffc0;
      expv[8] = 32'h3ffffffc;
      expv[9] = 32'h00000000;
      expv[10] = 32'h000ff000;
      expv[11] = 32'hffffffff;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00ffff00;
      expv[14] = 32'h00ffff00;
      expv[15] = 32'h07ffffe0;
      expv[16] = 32'h0ffffff0;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00ffff00;
      expv[19] = 32'h00000000;
      expv[20] = 32'h07ffffe0;
      expv[21] = 32'h000ff000;
      expv[22] = 32'h003ffc00;
      expv[23] = 32'h3ffffffc;
      expv[24] = 32'h003ffc00;
      expv[25] = 32'h1ffffff8;
      expv[26] = 32'h07ffffe0;
      expv[27] = 32'hffffffff;
      expv[28] = 32'h00000000;
      expv[29] = 32'h3ffffffc;
      expv[30] = 32'h1ffffff8;
      expv[31] = 32'h7ffffffe;
      expv[32] = 32'h00ffff00;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h7ffffffe;
      expv[38] = 32'h1ffffff8;
      expv[39] = 32'hffffffff;
      expv[40] = 32'h003ffc00;
      expv[41] = 32'h003ffc00;
      expv[42] = 32'h007ffe00;
      expv[43] = 32'h007ffe00;
      expv[44] = 32'h03ffffc0;
      expv[45] = 32'h00ffff00;
      expv[46] = 32'h007ffe00;
      expv[47] = 32'hffffffff;
      expv[48] = 32'h7ffffffe;
      expv[49] = 32'h03ffffc0;
      expv[50] = 32'h00ffff00;
      expv[51] = 32'h007ffe00;
      expv[52] = 32'h1ffffff8;
      expv[53] = 32'h0ffffff0;
      expv[54] = 32'h00000000;
      expv[55] = 32'h03ffffc0;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h000ff000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'hffffffff;
      expv[62] = 32'h00ffff00;
      expv[63] = 32'h7ffffffe;
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
