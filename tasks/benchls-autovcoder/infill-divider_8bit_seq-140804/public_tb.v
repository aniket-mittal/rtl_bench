// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_140804 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .dividend(in_vec[15:8]),
    .divisor(in_vec[7:0]),
    .quotient(out_vec[16:9]),
    .remainder(out_vec[8:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h120a0;
    stim[1] = 17'h17bd8;
    stim[2] = 17'h07d60;
    stim[3] = 17'h02b62;
    stim[4] = 17'h07c9a;
    stim[5] = 17'h006e0;
    stim[6] = 17'h04467;
    stim[7] = 17'h03bb2;
    stim[8] = 17'h0871a;
    stim[9] = 17'h0c72f;
    stim[10] = 17'h08960;
    stim[11] = 17'h0a356;
    stim[12] = 17'h05208;
    stim[13] = 17'h03719;
    stim[14] = 17'h1aff3;
    stim[15] = 17'h06352;
    stim[16] = 17'h060f3;
    stim[17] = 17'h00c74;
    stim[18] = 17'h018c8;
    stim[19] = 17'h02fe7;
    stim[20] = 17'h0eb65;
    stim[21] = 17'h06814;
    stim[22] = 17'h06619;
    stim[23] = 17'h0a7f5;
    stim[24] = 17'h0e028;
    stim[25] = 17'h0872e;
    stim[26] = 17'h053e9;
    stim[27] = 17'h030a2;
    stim[28] = 17'h0cf15;
    stim[29] = 17'h03d9b;
    stim[30] = 17'h00784;
    stim[31] = 17'h0b715;
    stim[32] = 17'h0e7ef;
    stim[33] = 17'h01648;
    stim[34] = 17'h0293c;
    stim[35] = 17'h093cc;
    stim[36] = 17'h07db7;
    stim[37] = 17'h08584;
    stim[38] = 17'h063da;
    stim[39] = 17'h02f70;
    stim[40] = 17'h092dc;
    stim[41] = 17'h00e02;
    stim[42] = 17'h0bec0;
    stim[43] = 17'h053e1;
    stim[44] = 17'h0f148;
    stim[45] = 17'h0861e;
    stim[46] = 17'h0e721;
    stim[47] = 17'h0e881;
    stim[48] = 17'h0286c;
    stim[49] = 17'h07140;
    stim[50] = 17'h075ce;
    stim[51] = 17'h02786;
    stim[52] = 17'h0c4bc;
    stim[53] = 17'h071ab;
    stim[54] = 17'h0c207;
    stim[55] = 17'h06161;
    stim[56] = 17'h000cf;
    stim[57] = 17'h0e946;
    stim[58] = 17'h06c56;
    stim[59] = 17'h0ab21;
    stim[60] = 17'h0eb6c;
    stim[61] = 17'h0c406;
    stim[62] = 17'h0bd3e;
    stim[63] = 17'h02737;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00200;
      expv[5] = 17'h0023a;
      expv[6] = 17'h0023a;
      expv[7] = 17'h0023a;
      expv[8] = 17'h0023a;
      expv[9] = 17'h0023a;
      expv[10] = 17'h0023a;
      expv[11] = 17'h0023b;
      expv[12] = 17'h00000;
      expv[13] = 17'h00200;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00200;
      expv[18] = 17'h00222;
      expv[19] = 17'h00222;
      expv[20] = 17'h00222;
      expv[21] = 17'h00222;
      expv[22] = 17'h00222;
      expv[23] = 17'h00222;
      expv[24] = 17'h00223;
      expv[25] = 17'h00000;
      expv[26] = 17'h00200;
      expv[27] = 17'h00400;
      expv[28] = 17'h00600;
      expv[29] = 17'h00800;
      expv[30] = 17'h00a00;
      expv[31] = 17'h00a30;
      expv[32] = 17'h00a30;
      expv[33] = 17'h00a31;
      expv[34] = 17'h00000;
      expv[35] = 17'h0002c;
      expv[36] = 17'h0002c;
      expv[37] = 17'h0002c;
      expv[38] = 17'h0002c;
      expv[39] = 17'h0002c;
      expv[40] = 17'h0002c;
      expv[41] = 17'h0002c;
      expv[42] = 17'h0002d;
      expv[43] = 17'h00000;
      expv[44] = 17'h0017c;
      expv[45] = 17'h0017c;
      expv[46] = 17'h0017c;
      expv[47] = 17'h0017c;
      expv[48] = 17'h0017c;
      expv[49] = 17'h0017c;
      expv[50] = 17'h0017c;
      expv[51] = 17'h0017d;
      expv[52] = 17'h00000;
      expv[53] = 17'h0004e;
      expv[54] = 17'h0004e;
      expv[55] = 17'h0004e;
      expv[56] = 17'h0004e;
      expv[57] = 17'h0004e;
      expv[58] = 17'h0004e;
      expv[59] = 17'h0004e;
      expv[60] = 17'h0004f;
      expv[61] = 17'h00000;
      expv[62] = 17'h00200;
      expv[63] = 17'h00400;
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
