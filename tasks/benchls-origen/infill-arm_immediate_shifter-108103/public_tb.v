// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108103 dut (
    .shiftOperand(in_vec[11:0]),
    .immediate(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h1bd;
    stim[1] = 12'h718;
    stim[2] = 12'h520;
    stim[3] = 12'hd4c;
    stim[4] = 12'h74f;
    stim[5] = 12'hc8d;
    stim[6] = 12'h392;
    stim[7] = 12'h690;
    stim[8] = 12'hff1;
    stim[9] = 12'hc6f;
    stim[10] = 12'h437;
    stim[11] = 12'h586;
    stim[12] = 12'h2a1;
    stim[13] = 12'h7b9;
    stim[14] = 12'h56a;
    stim[15] = 12'hb86;
    stim[16] = 12'h2f6;
    stim[17] = 12'h7f8;
    stim[18] = 12'h868;
    stim[19] = 12'h3c3;
    stim[20] = 12'h243;
    stim[21] = 12'h102;
    stim[22] = 12'h5f6;
    stim[23] = 12'he55;
    stim[24] = 12'h2d3;
    stim[25] = 12'h429;
    stim[26] = 12'h33c;
    stim[27] = 12'h8b1;
    stim[28] = 12'h0e9;
    stim[29] = 12'h073;
    stim[30] = 12'h945;
    stim[31] = 12'h68a;
    stim[32] = 12'hc8f;
    stim[33] = 12'h3be;
    stim[34] = 12'h985;
    stim[35] = 12'h805;
    stim[36] = 12'hb46;
    stim[37] = 12'h9c9;
    stim[38] = 12'hcce;
    stim[39] = 12'hb52;
    stim[40] = 12'h54b;
    stim[41] = 12'hb70;
    stim[42] = 12'hdd8;
    stim[43] = 12'hff3;
    stim[44] = 12'h5a4;
    stim[45] = 12'h5a4;
    stim[46] = 12'hacf;
    stim[47] = 12'habb;
    stim[48] = 12'h5cb;
    stim[49] = 12'h312;
    stim[50] = 12'hc2c;
    stim[51] = 12'hc23;
    stim[52] = 12'h4d3;
    stim[53] = 12'hca9;
    stim[54] = 12'h26f;
    stim[55] = 12'h93e;
    stim[56] = 12'h8cc;
    stim[57] = 12'h9e2;
    stim[58] = 12'heef;
    stim[59] = 12'h85b;
    stim[60] = 12'h078;
    stim[61] = 12'hd6f;
    stim[62] = 12'h185;
    stim[63] = 12'h422;
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
      expv[0] = 32'h0000002f;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000002;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h0000000a;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h0000000f;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000003;
      expv[20] = 32'h00000004;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h0000000d;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h000000e9;
      expv[29] = 32'h00000073;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000002;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000006;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000078;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000021;
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
