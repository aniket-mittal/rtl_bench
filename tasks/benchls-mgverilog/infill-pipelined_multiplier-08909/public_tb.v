// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08909 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .en(in_vec[9:9]),
    .a(in_vec[8:3]),
    .b(in_vec[2:0]),
    .p(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h521;
    stim[1] = 11'h48e;
    stim[2] = 11'h19f;
    stim[3] = 11'h079;
    stim[4] = 11'h317;
    stim[5] = 11'h0a1;
    stim[6] = 11'h0a8;
    stim[7] = 11'h118;
    stim[8] = 11'h399;
    stim[9] = 11'h100;
    stim[10] = 11'h277;
    stim[11] = 11'h273;
    stim[12] = 11'h176;
    stim[13] = 11'h3af;
    stim[14] = 11'h15b;
    stim[15] = 11'h3cd;
    stim[16] = 11'h123;
    stim[17] = 11'h30d;
    stim[18] = 11'h301;
    stim[19] = 11'h332;
    stim[20] = 11'h17c;
    stim[21] = 11'h31e;
    stim[22] = 11'h0ff;
    stim[23] = 11'h215;
    stim[24] = 11'h2e6;
    stim[25] = 11'h2e7;
    stim[26] = 11'h112;
    stim[27] = 11'h04a;
    stim[28] = 11'h346;
    stim[29] = 11'h296;
    stim[30] = 11'h0a0;
    stim[31] = 11'h00a;
    stim[32] = 11'h3b8;
    stim[33] = 11'h129;
    stim[34] = 11'h02f;
    stim[35] = 11'h2e5;
    stim[36] = 11'h374;
    stim[37] = 11'h296;
    stim[38] = 11'h186;
    stim[39] = 11'h26e;
    stim[40] = 11'h37a;
    stim[41] = 11'h010;
    stim[42] = 11'h607;
    stim[43] = 11'h2a4;
    stim[44] = 11'h187;
    stim[45] = 11'h204;
    stim[46] = 11'h4b2;
    stim[47] = 11'h29c;
    stim[48] = 11'h09f;
    stim[49] = 11'h267;
    stim[50] = 11'h210;
    stim[51] = 11'h379;
    stim[52] = 11'h0ac;
    stim[53] = 11'h293;
    stim[54] = 11'h288;
    stim[55] = 11'h3ea;
    stim[56] = 11'h3ff;
    stim[57] = 11'h441;
    stim[58] = 11'h25e;
    stim[59] = 11'h024;
    stim[60] = 11'h263;
    stim[61] = 11'h14d;
    stim[62] = 11'h3f6;
    stim[63] = 11'h31b;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h0ee;
      expv[10] = 9'h0ee;
      expv[11] = 9'h033;
      expv[12] = 9'h062;
      expv[13] = 9'h062;
      expv[14] = 9'h02a;
      expv[15] = 9'h02a;
      expv[16] = 9'h173;
      expv[17] = 9'h173;
      expv[18] = 9'h11d;
      expv[19] = 9'h0a5;
      expv[20] = 9'h020;
      expv[21] = 9'h020;
      expv[22] = 9'h04c;
      expv[23] = 9'h04c;
      expv[24] = 9'h0d2;
      expv[25] = 9'h00a;
      expv[26] = 9'h0a8;
      expv[27] = 9'h0a8;
      expv[28] = 9'h0a8;
      expv[29] = 9'h0c4;
      expv[30] = 9'h0f0;
      expv[31] = 9'h0f0;
      expv[32] = 9'h0f0;
      expv[33] = 9'h06c;
      expv[34] = 9'h06c;
      expv[35] = 9'h06c;
      expv[36] = 9'h000;
      expv[37] = 9'h08c;
      expv[38] = 9'h0b8;
      expv[39] = 9'h0b8;
      expv[40] = 9'h06c;
      expv[41] = 9'h04e;
      expv[42] = 9'h04e;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h050;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h04c;
      expv[51] = 9'h054;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h02f;
      expv[55] = 9'h036;
      expv[56] = 9'h000;
      expv[57] = 9'h07a;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h042;
      expv[62] = 9'h042;
      expv[63] = 9'h024;
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
