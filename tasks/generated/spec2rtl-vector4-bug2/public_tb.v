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
    stim[0] = 8'h32;
    stim[1] = 8'hf0;
    stim[2] = 8'hcb;
    stim[3] = 8'h93;
    stim[4] = 8'he0;
    stim[5] = 8'h31;
    stim[6] = 8'h5c;
    stim[7] = 8'h5d;
    stim[8] = 8'h3f;
    stim[9] = 8'hdd;
    stim[10] = 8'h6f;
    stim[11] = 8'hf3;
    stim[12] = 8'hd6;
    stim[13] = 8'h03;
    stim[14] = 8'h9a;
    stim[15] = 8'h73;
    stim[16] = 8'h77;
    stim[17] = 8'h37;
    stim[18] = 8'h12;
    stim[19] = 8'hae;
    stim[20] = 8'h2b;
    stim[21] = 8'h80;
    stim[22] = 8'h67;
    stim[23] = 8'hf6;
    stim[24] = 8'h1d;
    stim[25] = 8'hf3;
    stim[26] = 8'hc1;
    stim[27] = 8'h3f;
    stim[28] = 8'ha8;
    stim[29] = 8'hae;
    stim[30] = 8'ha9;
    stim[31] = 8'h2d;
    stim[32] = 8'h59;
    stim[33] = 8'h3a;
    stim[34] = 8'hbc;
    stim[35] = 8'hc6;
    stim[36] = 8'h4f;
    stim[37] = 8'h3e;
    stim[38] = 8'h24;
    stim[39] = 8'h0f;
    stim[40] = 8'h3f;
    stim[41] = 8'hc4;
    stim[42] = 8'h09;
    stim[43] = 8'h0f;
    stim[44] = 8'h43;
    stim[45] = 8'hee;
    stim[46] = 8'hb1;
    stim[47] = 8'h13;
    stim[48] = 8'h99;
    stim[49] = 8'h3e;
    stim[50] = 8'h96;
    stim[51] = 8'hdc;
    stim[52] = 8'h78;
    stim[53] = 8'h17;
    stim[54] = 8'h33;
    stim[55] = 8'h43;
    stim[56] = 8'h3d;
    stim[57] = 8'hee;
    stim[58] = 8'h51;
    stim[59] = 8'had;
    stim[60] = 8'ha9;
    stim[61] = 8'hae;
    stim[62] = 8'h0e;
    stim[63] = 8'hd3;
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
      expv[0] = 32'h32000000;
      expv[1] = 32'hf0ffffff;
      expv[2] = 32'hcbffffff;
      expv[3] = 32'h93ffffff;
      expv[4] = 32'he0ffffff;
      expv[5] = 32'h31000000;
      expv[6] = 32'h5c000000;
      expv[7] = 32'h5d000000;
      expv[8] = 32'h3f000000;
      expv[9] = 32'hddffffff;
      expv[10] = 32'h6f000000;
      expv[11] = 32'hf3ffffff;
      expv[12] = 32'hd6ffffff;
      expv[13] = 32'h03000000;
      expv[14] = 32'h9affffff;
      expv[15] = 32'h73000000;
      expv[16] = 32'h77000000;
      expv[17] = 32'h37000000;
      expv[18] = 32'h12000000;
      expv[19] = 32'haeffffff;
      expv[20] = 32'h2b000000;
      expv[21] = 32'h80ffffff;
      expv[22] = 32'h67000000;
      expv[23] = 32'hf6ffffff;
      expv[24] = 32'h1d000000;
      expv[25] = 32'hf3ffffff;
      expv[26] = 32'hc1ffffff;
      expv[27] = 32'h3f000000;
      expv[28] = 32'ha8ffffff;
      expv[29] = 32'haeffffff;
      expv[30] = 32'ha9ffffff;
      expv[31] = 32'h2d000000;
      expv[32] = 32'h59000000;
      expv[33] = 32'h3a000000;
      expv[34] = 32'hbcffffff;
      expv[35] = 32'hc6ffffff;
      expv[36] = 32'h4f000000;
      expv[37] = 32'h3e000000;
      expv[38] = 32'h24000000;
      expv[39] = 32'h0f000000;
      expv[40] = 32'h3f000000;
      expv[41] = 32'hc4ffffff;
      expv[42] = 32'h09000000;
      expv[43] = 32'h0f000000;
      expv[44] = 32'h43000000;
      expv[45] = 32'heeffffff;
      expv[46] = 32'hb1ffffff;
      expv[47] = 32'h13000000;
      expv[48] = 32'h99ffffff;
      expv[49] = 32'h3e000000;
      expv[50] = 32'h96ffffff;
      expv[51] = 32'hdcffffff;
      expv[52] = 32'h78000000;
      expv[53] = 32'h17000000;
      expv[54] = 32'h33000000;
      expv[55] = 32'h43000000;
      expv[56] = 32'h3d000000;
      expv[57] = 32'heeffffff;
      expv[58] = 32'h51000000;
      expv[59] = 32'hadffffff;
      expv[60] = 32'ha9ffffff;
      expv[61] = 32'haeffffff;
      expv[62] = 32'h0e000000;
      expv[63] = 32'hd3ffffff;
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
