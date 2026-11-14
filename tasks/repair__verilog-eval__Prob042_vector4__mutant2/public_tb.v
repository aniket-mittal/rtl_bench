// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h62;
    stim[1] = 8'h38;
    stim[2] = 8'h53;
    stim[3] = 8'h9e;
    stim[4] = 8'ha8;
    stim[5] = 8'hdf;
    stim[6] = 8'hb2;
    stim[7] = 8'h2c;
    stim[8] = 8'hc3;
    stim[9] = 8'h24;
    stim[10] = 8'h9e;
    stim[11] = 8'he7;
    stim[12] = 8'h98;
    stim[13] = 8'hde;
    stim[14] = 8'h0e;
    stim[15] = 8'h35;
    stim[16] = 8'h4c;
    stim[17] = 8'h1b;
    stim[18] = 8'h81;
    stim[19] = 8'ha5;
    stim[20] = 8'h80;
    stim[21] = 8'h25;
    stim[22] = 8'hd1;
    stim[23] = 8'he3;
    stim[24] = 8'hf4;
    stim[25] = 8'h9d;
    stim[26] = 8'hc9;
    stim[27] = 8'hf5;
    stim[28] = 8'h10;
    stim[29] = 8'h0c;
    stim[30] = 8'hc5;
    stim[31] = 8'hcd;
    stim[32] = 8'h84;
    stim[33] = 8'h56;
    stim[34] = 8'h9f;
    stim[35] = 8'h22;
    stim[36] = 8'h6a;
    stim[37] = 8'h26;
    stim[38] = 8'h36;
    stim[39] = 8'h25;
    stim[40] = 8'h2c;
    stim[41] = 8'h1f;
    stim[42] = 8'h04;
    stim[43] = 8'hf2;
    stim[44] = 8'h9d;
    stim[45] = 8'h36;
    stim[46] = 8'h84;
    stim[47] = 8'h5a;
    stim[48] = 8'hb8;
    stim[49] = 8'h8a;
    stim[50] = 8'hcd;
    stim[51] = 8'h79;
    stim[52] = 8'he2;
    stim[53] = 8'h1e;
    stim[54] = 8'haa;
    stim[55] = 8'hce;
    stim[56] = 8'hc3;
    stim[57] = 8'h9a;
    stim[58] = 8'h1e;
    stim[59] = 8'h28;
    stim[60] = 8'h63;
    stim[61] = 8'h1f;
    stim[62] = 8'hc3;
    stim[63] = 8'hae;
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
      expv[0] = 32'h62000000;
      expv[1] = 32'h38000000;
      expv[2] = 32'h53000000;
      expv[3] = 32'h9effffff;
      expv[4] = 32'ha8ffffff;
      expv[5] = 32'hdfffffff;
      expv[6] = 32'hb2ffffff;
      expv[7] = 32'h2c000000;
      expv[8] = 32'hc3ffffff;
      expv[9] = 32'h24000000;
      expv[10] = 32'h9effffff;
      expv[11] = 32'he7ffffff;
      expv[12] = 32'h98ffffff;
      expv[13] = 32'hdeffffff;
      expv[14] = 32'h0e000000;
      expv[15] = 32'h35000000;
      expv[16] = 32'h4c000000;
      expv[17] = 32'h1b000000;
      expv[18] = 32'h81ffffff;
      expv[19] = 32'ha5ffffff;
      expv[20] = 32'h80ffffff;
      expv[21] = 32'h25000000;
      expv[22] = 32'hd1ffffff;
      expv[23] = 32'he3ffffff;
      expv[24] = 32'hf4ffffff;
      expv[25] = 32'h9dffffff;
      expv[26] = 32'hc9ffffff;
      expv[27] = 32'hf5ffffff;
      expv[28] = 32'h10000000;
      expv[29] = 32'h0c000000;
      expv[30] = 32'hc5ffffff;
      expv[31] = 32'hcdffffff;
      expv[32] = 32'h84ffffff;
      expv[33] = 32'h56000000;
      expv[34] = 32'h9fffffff;
      expv[35] = 32'h22000000;
      expv[36] = 32'h6a000000;
      expv[37] = 32'h26000000;
      expv[38] = 32'h36000000;
      expv[39] = 32'h25000000;
      expv[40] = 32'h2c000000;
      expv[41] = 32'h1f000000;
      expv[42] = 32'h04000000;
      expv[43] = 32'hf2ffffff;
      expv[44] = 32'h9dffffff;
      expv[45] = 32'h36000000;
      expv[46] = 32'h84ffffff;
      expv[47] = 32'h5a000000;
      expv[48] = 32'hb8ffffff;
      expv[49] = 32'h8affffff;
      expv[50] = 32'hcdffffff;
      expv[51] = 32'h79000000;
      expv[52] = 32'he2ffffff;
      expv[53] = 32'h1e000000;
      expv[54] = 32'haaffffff;
      expv[55] = 32'hceffffff;
      expv[56] = 32'hc3ffffff;
      expv[57] = 32'h9affffff;
      expv[58] = 32'h1e000000;
      expv[59] = 32'h28000000;
      expv[60] = 32'h63000000;
      expv[61] = 32'h1f000000;
      expv[62] = 32'hc3ffffff;
      expv[63] = 32'haeffffff;
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
