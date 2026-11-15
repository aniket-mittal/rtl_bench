// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  oh_mux8 dut (
    .sel7(in_vec[15:15]),
    .sel6(in_vec[14:14]),
    .sel5(in_vec[13:13]),
    .sel4(in_vec[12:12]),
    .sel3(in_vec[11:11]),
    .sel2(in_vec[10:10]),
    .sel1(in_vec[9:9]),
    .sel0(in_vec[8:8]),
    .in7(in_vec[7:7]),
    .in6(in_vec[6:6]),
    .in5(in_vec[5:5]),
    .in4(in_vec[4:4]),
    .in3(in_vec[3:3]),
    .in2(in_vec[2:2]),
    .in1(in_vec[1:1]),
    .in0(in_vec[0:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h83f9;
    stim[1] = 16'hd1b5;
    stim[2] = 16'h6cfa;
    stim[3] = 16'h837f;
    stim[4] = 16'h139d;
    stim[5] = 16'h97fc;
    stim[6] = 16'hdbc6;
    stim[7] = 16'h63f7;
    stim[8] = 16'h8344;
    stim[9] = 16'hdf75;
    stim[10] = 16'h0b62;
    stim[11] = 16'h18b3;
    stim[12] = 16'h2a0c;
    stim[13] = 16'h42bd;
    stim[14] = 16'ha309;
    stim[15] = 16'h06f1;
    stim[16] = 16'h59bf;
    stim[17] = 16'h29bf;
    stim[18] = 16'hcaec;
    stim[19] = 16'h2f72;
    stim[20] = 16'h32ad;
    stim[21] = 16'head5;
    stim[22] = 16'h1a63;
    stim[23] = 16'hd002;
    stim[24] = 16'hdf4e;
    stim[25] = 16'h05dd;
    stim[26] = 16'h83d7;
    stim[27] = 16'h70e7;
    stim[28] = 16'hbac7;
    stim[29] = 16'he4d2;
    stim[30] = 16'h5447;
    stim[31] = 16'h2391;
    stim[32] = 16'h7cfb;
    stim[33] = 16'h1f7c;
    stim[34] = 16'hd414;
    stim[35] = 16'h48cd;
    stim[36] = 16'h9360;
    stim[37] = 16'h4084;
    stim[38] = 16'h1988;
    stim[39] = 16'h111c;
    stim[40] = 16'h7e50;
    stim[41] = 16'h1a43;
    stim[42] = 16'h4629;
    stim[43] = 16'h8988;
    stim[44] = 16'haf94;
    stim[45] = 16'h3809;
    stim[46] = 16'h4d02;
    stim[47] = 16'he3b3;
    stim[48] = 16'hb80f;
    stim[49] = 16'h4425;
    stim[50] = 16'hc0ba;
    stim[51] = 16'h8ad0;
    stim[52] = 16'h90fa;
    stim[53] = 16'h8948;
    stim[54] = 16'hea97;
    stim[55] = 16'h67a9;
    stim[56] = 16'h991f;
    stim[57] = 16'h0de3;
    stim[58] = 16'h9278;
    stim[59] = 16'hb034;
    stim[60] = 16'hb4b1;
    stim[61] = 16'h4c92;
    stim[62] = 16'h02f1;
    stim[63] = 16'h8f62;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
