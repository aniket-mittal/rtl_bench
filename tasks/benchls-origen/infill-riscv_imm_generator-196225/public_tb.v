// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_196225 dut (
    .instr_i(in_vec[31:0]),
    .imm_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hc3dce535;
    stim[1] = 32'h69b34902;
    stim[2] = 32'h2e9500d7;
    stim[3] = 32'h641a0ed5;
    stim[4] = 32'hd79e13bc;
    stim[5] = 32'h08bd9e0b;
    stim[6] = 32'h7c71f842;
    stim[7] = 32'h5c6777b6;
    stim[8] = 32'h85480046;
    stim[9] = 32'h4c4e2498;
    stim[10] = 32'haf4cd5d0;
    stim[11] = 32'h59a121bc;
    stim[12] = 32'h96c1be37;
    stim[13] = 32'h6f59d3ec;
    stim[14] = 32'h190c21a0;
    stim[15] = 32'h37db5814;
    stim[16] = 32'hbe974414;
    stim[17] = 32'h9eb7a3c5;
    stim[18] = 32'h79b62d4b;
    stim[19] = 32'h84aa799b;
    stim[20] = 32'hcdc41ba9;
    stim[21] = 32'hf280abb1;
    stim[22] = 32'hddd24057;
    stim[23] = 32'h54f8f031;
    stim[24] = 32'hff31033f;
    stim[25] = 32'hdae79418;
    stim[26] = 32'h3cf9c17a;
    stim[27] = 32'h4f22716b;
    stim[28] = 32'h1bb5f390;
    stim[29] = 32'h126df914;
    stim[30] = 32'h54dea427;
    stim[31] = 32'h208d1136;
    stim[32] = 32'hfa9c69df;
    stim[33] = 32'hd1c0a661;
    stim[34] = 32'h1abbd249;
    stim[35] = 32'h83169544;
    stim[36] = 32'hc0b537ff;
    stim[37] = 32'hec871642;
    stim[38] = 32'h7e491889;
    stim[39] = 32'ha44263bf;
    stim[40] = 32'h5cfa9afa;
    stim[41] = 32'h48b7fb26;
    stim[42] = 32'hecc63d58;
    stim[43] = 32'h87638614;
    stim[44] = 32'h00fcd94e;
    stim[45] = 32'h5045a4da;
    stim[46] = 32'h641b4e08;
    stim[47] = 32'h3fb6da03;
    stim[48] = 32'h6120f58a;
    stim[49] = 32'h3c9a14af;
    stim[50] = 32'hc0856b34;
    stim[51] = 32'h858adef4;
    stim[52] = 32'hec6f7737;
    stim[53] = 32'h639fe709;
    stim[54] = 32'h88e4646d;
    stim[55] = 32'hf2c4e0d7;
    stim[56] = 32'h03093480;
    stim[57] = 32'h4d907b2e;
    stim[58] = 32'he789564e;
    stim[59] = 32'h969637da;
    stim[60] = 32'h1202f2da;
    stim[61] = 32'heaefa3f8;
    stim[62] = 32'hfbb0b6b2;
    stim[63] = 32'hf0cb4de2;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
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
      expv[47] = 32'h000003fb;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
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
