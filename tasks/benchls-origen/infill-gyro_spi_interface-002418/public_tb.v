// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_002418 dut (
    .gyroclk(clk),
    .gyrowdav(in_vec[16:16]),
    .gyrordav(in_vec[15:15]),
    .gyroaddr(in_vec[14:9]),
    .gyrowdata(in_vec[8:1]),
    .gyrosdo(in_vec[0:0]),
    .wdavgyro(out_vec[12:12]),
    .rdavgyro(out_vec[11:11]),
    .gyrodata(out_vec[10:3]),
    .gyrosclk(out_vec[2:2]),
    .gyrosdi(out_vec[1:1]),
    .gyross(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h13be7;
    stim[1] = 17'h12045;
    stim[2] = 17'h19022;
    stim[3] = 17'h0ac48;
    stim[4] = 17'h1f872;
    stim[5] = 17'h1a34e;
    stim[6] = 17'h04c31;
    stim[7] = 17'h006e2;
    stim[8] = 17'h0439c;
    stim[9] = 17'h16525;
    stim[10] = 17'h1c7e1;
    stim[11] = 17'h1c857;
    stim[12] = 17'h162de;
    stim[13] = 17'h0daa9;
    stim[14] = 17'h11231;
    stim[15] = 17'h1c549;
    stim[16] = 17'h0525e;
    stim[17] = 17'h17364;
    stim[18] = 17'h16aca;
    stim[19] = 17'h1cff6;
    stim[20] = 17'h044fc;
    stim[21] = 17'h11114;
    stim[22] = 17'h09c23;
    stim[23] = 17'h1cd72;
    stim[24] = 17'h0a911;
    stim[25] = 17'h098d3;
    stim[26] = 17'h1d336;
    stim[27] = 17'h18ba9;
    stim[28] = 17'h1d1e8;
    stim[29] = 17'h058f2;
    stim[30] = 17'h04199;
    stim[31] = 17'h0c9e3;
    stim[32] = 17'h11295;
    stim[33] = 17'h00844;
    stim[34] = 17'h12621;
    stim[35] = 17'h03223;
    stim[36] = 17'h1fac4;
    stim[37] = 17'h01123;
    stim[38] = 17'h00c94;
    stim[39] = 17'h05647;
    stim[40] = 17'h0cbdf;
    stim[41] = 17'h07f08;
    stim[42] = 17'h06d0a;
    stim[43] = 17'h0080e;
    stim[44] = 17'h07342;
    stim[45] = 17'h14138;
    stim[46] = 17'h008e9;
    stim[47] = 17'h04b96;
    stim[48] = 17'h03cd1;
    stim[49] = 17'h0e5be;
    stim[50] = 17'h145f4;
    stim[51] = 17'h05c4d;
    stim[52] = 17'h042c5;
    stim[53] = 17'h0a76e;
    stim[54] = 17'h1c4b9;
    stim[55] = 17'h1d6cd;
    stim[56] = 17'h1b02d;
    stim[57] = 17'h08960;
    stim[58] = 17'h0f339;
    stim[59] = 17'h17dc2;
    stim[60] = 17'h0861c;
    stim[61] = 17'h14e45;
    stim[62] = 17'h102de;
    stim[63] = 17'h16ed3;
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
      expv[0] = 13'h0xxx;
      expv[1] = 13'h0xxx;
      expv[2] = 13'h0xxx;
      expv[3] = 13'h0xxx;
      expv[4] = 13'h0xxx;
      expv[5] = 13'h0xxx;
      expv[6] = 13'h0xxx;
      expv[7] = 13'h0xxx;
      expv[8] = 13'h0xxx;
      expv[9] = 13'h0xxx;
      expv[10] = 13'h0xxx;
      expv[11] = 13'h0xxx;
      expv[12] = 13'h0xxx;
      expv[13] = 13'h0xxx;
      expv[14] = 13'h0xxx;
      expv[15] = 13'h0xxx;
      expv[16] = 13'h0xxx;
      expv[17] = 13'h0xxx;
      expv[18] = 13'h0xxx;
      expv[19] = 13'h0xxx;
      expv[20] = 13'h0xxx;
      expv[21] = 13'h0xxx;
      expv[22] = 13'h0xxx;
      expv[23] = 13'h0xxx;
      expv[24] = 13'h0xxx;
      expv[25] = 13'h0xxx;
      expv[26] = 13'h0xxx;
      expv[27] = 13'h0xxx;
      expv[28] = 13'h0xxx;
      expv[29] = 13'h0xxx;
      expv[30] = 13'h0xxx;
      expv[31] = 13'h0xxx;
      expv[32] = 13'h0xxx;
      expv[33] = 13'h0xxx;
      expv[34] = 13'h0xxx;
      expv[35] = 13'h0xxx;
      expv[36] = 13'h0xxx;
      expv[37] = 13'h0xxx;
      expv[38] = 13'h0xxx;
      expv[39] = 13'h0xxx;
      expv[40] = 13'h0xxx;
      expv[41] = 13'h0xxx;
      expv[42] = 13'h0xxx;
      expv[43] = 13'h0xxx;
      expv[44] = 13'h0xxx;
      expv[45] = 13'h0xxx;
      expv[46] = 13'h0xxx;
      expv[47] = 13'h0xxx;
      expv[48] = 13'h0xxx;
      expv[49] = 13'h0xxx;
      expv[50] = 13'h0xxx;
      expv[51] = 13'h0xxx;
      expv[52] = 13'h0xxx;
      expv[53] = 13'h0xxx;
      expv[54] = 13'h0xxx;
      expv[55] = 13'h0xxx;
      expv[56] = 13'h0xxx;
      expv[57] = 13'h0xxx;
      expv[58] = 13'h02xx;
      expv[59] = 13'h02xx;
      expv[60] = 13'h02xx;
      expv[61] = 13'h02xx;
      expv[62] = 13'h02xx;
      expv[63] = 13'h02xx;
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
