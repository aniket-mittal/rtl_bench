// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07367 dut (
    .pla_ph1(clk),
    .pla_ph2(in_vec[9:9]),
    .dsp_reset(in_vec[8:8]),
    .padd(in_vec[7:0]),
    .out2_r(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h17f;
    stim[1] = 10'h389;
    stim[2] = 10'h241;
    stim[3] = 10'h24b;
    stim[4] = 10'h299;
    stim[5] = 10'h0d4;
    stim[6] = 10'h25b;
    stim[7] = 10'h2ba;
    stim[8] = 10'h0fd;
    stim[9] = 10'h0bd;
    stim[10] = 10'h0fa;
    stim[11] = 10'h039;
    stim[12] = 10'h3f6;
    stim[13] = 10'h289;
    stim[14] = 10'h23f;
    stim[15] = 10'h017;
    stim[16] = 10'h0f3;
    stim[17] = 10'h242;
    stim[18] = 10'h265;
    stim[19] = 10'h056;
    stim[20] = 10'h289;
    stim[21] = 10'h065;
    stim[22] = 10'h2a4;
    stim[23] = 10'h28a;
    stim[24] = 10'h21e;
    stim[25] = 10'h05d;
    stim[26] = 10'h24f;
    stim[27] = 10'h073;
    stim[28] = 10'h0ae;
    stim[29] = 10'h2bc;
    stim[30] = 10'h03c;
    stim[31] = 10'h244;
    stim[32] = 10'h25d;
    stim[33] = 10'h2cd;
    stim[34] = 10'h25b;
    stim[35] = 10'h0ba;
    stim[36] = 10'h29e;
    stim[37] = 10'h0bf;
    stim[38] = 10'h0b2;
    stim[39] = 10'h0f5;
    stim[40] = 10'h04f;
    stim[41] = 10'h062;
    stim[42] = 10'h0e7;
    stim[43] = 10'h2f2;
    stim[44] = 10'h2c7;
    stim[45] = 10'h2c5;
    stim[46] = 10'h2ce;
    stim[47] = 10'h2bd;
    stim[48] = 10'h0d5;
    stim[49] = 10'h081;
    stim[50] = 10'h09c;
    stim[51] = 10'h208;
    stim[52] = 10'h0ad;
    stim[53] = 10'h0a9;
    stim[54] = 10'h0c3;
    stim[55] = 10'h0b6;
    stim[56] = 10'h02c;
    stim[57] = 10'h22d;
    stim[58] = 10'h05a;
    stim[59] = 10'h2ac;
    stim[60] = 10'h23c;
    stim[61] = 10'h05f;
    stim[62] = 10'h2de;
    stim[63] = 10'h273;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'hd4;
      expv[7] = 8'hd4;
      expv[8] = 8'hd4;
      expv[9] = 8'hd4;
      expv[10] = 8'hd4;
      expv[11] = 8'hd4;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'hf3;
      expv[18] = 8'hf3;
      expv[19] = 8'hf3;
      expv[20] = 8'h56;
      expv[21] = 8'h56;
      expv[22] = 8'h65;
      expv[23] = 8'h65;
      expv[24] = 8'h65;
      expv[25] = 8'h65;
      expv[26] = 8'h5d;
      expv[27] = 8'h5d;
      expv[28] = 8'h5d;
      expv[29] = 8'hae;
      expv[30] = 8'hae;
      expv[31] = 8'h3c;
      expv[32] = 8'h3c;
      expv[33] = 8'h3c;
      expv[34] = 8'h3c;
      expv[35] = 8'h3c;
      expv[36] = 8'hba;
      expv[37] = 8'hba;
      expv[38] = 8'hba;
      expv[39] = 8'hba;
      expv[40] = 8'hba;
      expv[41] = 8'hba;
      expv[42] = 8'hba;
      expv[43] = 8'he7;
      expv[44] = 8'he7;
      expv[45] = 8'he7;
      expv[46] = 8'he7;
      expv[47] = 8'he7;
      expv[48] = 8'he7;
      expv[49] = 8'he7;
      expv[50] = 8'he7;
      expv[51] = 8'h9c;
      expv[52] = 8'h9c;
      expv[53] = 8'h9c;
      expv[54] = 8'h9c;
      expv[55] = 8'h9c;
      expv[56] = 8'h9c;
      expv[57] = 8'h2c;
      expv[58] = 8'h2c;
      expv[59] = 8'h5a;
      expv[60] = 8'h5a;
      expv[61] = 8'h5a;
      expv[62] = 8'h5f;
      expv[63] = 8'h5f;
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
