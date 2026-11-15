// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03264 dut (
    .CLK(clk),
    .write_0(in_vec[9:9]),
    .EN_write_0(in_vec[8:8]),
    .write_1(in_vec[7:7]),
    .EN_write_1(in_vec[6:6]),
    .write_2(in_vec[5:5]),
    .EN_write_2(in_vec[4:4]),
    .write_3(in_vec[3:3]),
    .EN_write_3(in_vec[2:2]),
    .write_4(in_vec[1:1]),
    .EN_write_4(in_vec[0:0]),
    .read_0(out_vec[4:4]),
    .read_1(out_vec[3:3]),
    .read_2(out_vec[2:2]),
    .read_3(out_vec[1:1]),
    .read_4(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3c9;
    stim[1] = 10'h01c;
    stim[2] = 10'h3bb;
    stim[3] = 10'h027;
    stim[4] = 10'h3b9;
    stim[5] = 10'h3a5;
    stim[6] = 10'h351;
    stim[7] = 10'h39b;
    stim[8] = 10'h21f;
    stim[9] = 10'h347;
    stim[10] = 10'h088;
    stim[11] = 10'h382;
    stim[12] = 10'h0ea;
    stim[13] = 10'h3f2;
    stim[14] = 10'h1e4;
    stim[15] = 10'h0f3;
    stim[16] = 10'h2b6;
    stim[17] = 10'h2a6;
    stim[18] = 10'h311;
    stim[19] = 10'h045;
    stim[20] = 10'h265;
    stim[21] = 10'h08f;
    stim[22] = 10'h0ae;
    stim[23] = 10'h0a0;
    stim[24] = 10'h1f6;
    stim[25] = 10'h11e;
    stim[26] = 10'h0ca;
    stim[27] = 10'h1c6;
    stim[28] = 10'h1b3;
    stim[29] = 10'h1d9;
    stim[30] = 10'h13b;
    stim[31] = 10'h2c2;
    stim[32] = 10'h0a8;
    stim[33] = 10'h149;
    stim[34] = 10'h079;
    stim[35] = 10'h006;
    stim[36] = 10'h273;
    stim[37] = 10'h24a;
    stim[38] = 10'h3bb;
    stim[39] = 10'h35c;
    stim[40] = 10'h061;
    stim[41] = 10'h180;
    stim[42] = 10'h083;
    stim[43] = 10'h2e0;
    stim[44] = 10'h21f;
    stim[45] = 10'h10b;
    stim[46] = 10'h2e8;
    stim[47] = 10'h3b4;
    stim[48] = 10'h23a;
    stim[49] = 10'h0fa;
    stim[50] = 10'h157;
    stim[51] = 10'h351;
    stim[52] = 10'h33a;
    stim[53] = 10'h229;
    stim[54] = 10'h352;
    stim[55] = 10'h360;
    stim[56] = 10'h360;
    stim[57] = 10'h160;
    stim[58] = 10'h251;
    stim[59] = 10'h2ad;
    stim[60] = 10'h363;
    stim[61] = 10'h1f6;
    stim[62] = 10'h1e9;
    stim[63] = 10'h039;
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
      expv[0] = 5'hxf;
      expv[1] = 5'h01;
      expv[2] = 5'h1f;
      expv[3] = 5'h1e;
      expv[4] = 5'h1f;
      expv[5] = 5'h0e;
      expv[6] = 5'h08;
      expv[7] = 5'h0c;
      expv[8] = 5'h1d;
      expv[9] = 5'h18;
      expv[10] = 5'h1f;
      expv[11] = 5'h1f;
      expv[12] = 5'h1f;
      expv[13] = 5'h1f;
      expv[14] = 5'h16;
      expv[15] = 5'h07;
      expv[16] = 5'h1e;
      expv[17] = 5'h00;
      expv[18] = 5'h0c;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h01;
      expv[22] = 5'h1f;
      expv[23] = 5'h1f;
      expv[24] = 5'h16;
      expv[25] = 5'h01;
      expv[26] = 5'h1f;
      expv[27] = 5'h16;
      expv[28] = 5'h03;
      expv[29] = 5'h14;
      expv[30] = 5'h03;
      expv[31] = 5'h1f;
      expv[32] = 5'h1f;
      expv[33] = 5'h10;
      expv[34] = 5'h03;
      expv[35] = 5'h00;
      expv[36] = 5'h03;
      expv[37] = 5'h18;
      expv[38] = 5'h0f;
      expv[39] = 5'h19;
      expv[40] = 5'h18;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h1f;
      expv[44] = 5'h1d;
      expv[45] = 5'h10;
      expv[46] = 5'h1f;
      expv[47] = 5'h1e;
      expv[48] = 5'h03;
      expv[49] = 5'h1f;
      expv[50] = 5'h10;
      expv[51] = 5'h18;
      expv[52] = 5'h0f;
      expv[53] = 5'h1f;
      expv[54] = 5'h08;
      expv[55] = 5'h08;
      expv[56] = 5'h08;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h01;
      expv[60] = 5'h08;
      expv[61] = 5'h16;
      expv[62] = 5'h07;
      expv[63] = 5'h03;
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
