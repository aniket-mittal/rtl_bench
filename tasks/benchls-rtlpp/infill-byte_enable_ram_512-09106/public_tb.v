// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09106 dut (
    .clk(clk),
    .address(in_vec[48:40]),
    .byteenable(in_vec[39:36]),
    .chipselect(in_vec[35:35]),
    .clken(in_vec[34:34]),
    .reset(in_vec[33:33]),
    .write(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h112d234db4160;
    stim[1] = 49'h1935ad55256df;
    stim[2] = 49'h1772da9da493d;
    stim[3] = 49'h0c7e0831c5105;
    stim[4] = 49'h1c745d07c26a5;
    stim[5] = 49'h1684d1158aafe;
    stim[6] = 49'h1576152a1d3e1;
    stim[7] = 49'h02058a8af8949;
    stim[8] = 49'h1f291b39ec7c4;
    stim[9] = 49'h1eda50cf05a93;
    stim[10] = 49'h0a3107ac5b1fe;
    stim[11] = 49'h06b93b272ddf8;
    stim[12] = 49'h019053f87055b;
    stim[13] = 49'h1e3bd4c1e51a4;
    stim[14] = 49'h0154968581075;
    stim[15] = 49'h0cbb85563f9f3;
    stim[16] = 49'h0be1d95620fc1;
    stim[17] = 49'h0e84c1ebb22ef;
    stim[18] = 49'h0d69f1d9f293c;
    stim[19] = 49'h0955031824efc;
    stim[20] = 49'h06ca9a47f2060;
    stim[21] = 49'h1361cf3024a09;
    stim[22] = 49'h169c45ee0d25b;
    stim[23] = 49'h0ecb5583ba1a4;
    stim[24] = 49'h09449cb4bf74a;
    stim[25] = 49'h01dccb75b183f;
    stim[26] = 49'h07bb10eeba8b4;
    stim[27] = 49'h1aca9b6a1937b;
    stim[28] = 49'h06dec64f18cb1;
    stim[29] = 49'h18539968a8d6d;
    stim[30] = 49'h159b5bb2fce5c;
    stim[31] = 49'h091b1d6170dbc;
    stim[32] = 49'h1136943b524e9;
    stim[33] = 49'h0dc9034230f7e;
    stim[34] = 49'h10a1823dc5c4c;
    stim[35] = 49'h1bb60cc89d2c6;
    stim[36] = 49'h1c340b62e83bd;
    stim[37] = 49'h131f672535d52;
    stim[38] = 49'h1888541dad20b;
    stim[39] = 49'h003f88fab4d89;
    stim[40] = 49'h10ee4e9a97202;
    stim[41] = 49'h0bc68ba2b22a3;
    stim[42] = 49'h0e01d7f021234;
    stim[43] = 49'h029b809ecce13;
    stim[44] = 49'h1e51941e40d06;
    stim[45] = 49'h18ce84def1e43;
    stim[46] = 49'h1b3f5635bff6a;
    stim[47] = 49'h07c45cf801030;
    stim[48] = 49'h19cf19884cac1;
    stim[49] = 49'h19ea10c5f43f1;
    stim[50] = 49'h0c6b56a8b1b48;
    stim[51] = 49'h03599f0560548;
    stim[52] = 49'h17fc4ff5eb95e;
    stim[53] = 49'h0bf54180d266e;
    stim[54] = 49'h13cf98a6add51;
    stim[55] = 49'h1f73d7db4c0b4;
    stim[56] = 49'h0329dd5647f84;
    stim[57] = 49'h15d198510eebc;
    stim[58] = 49'h13390c7c0eee2;
    stim[59] = 49'h1bf306bf3c180;
    stim[60] = 49'h10624a8bbde04;
    stim[61] = 49'h0accc4c0fce18;
    stim[62] = 49'h14600bbdef9c2;
    stim[63] = 49'h02225ad5d240c;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'h00000000;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'h00000000;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
