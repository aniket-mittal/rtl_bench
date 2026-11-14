// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .d(in_vec[12:12]),
    .done_counting(in_vec[11:11]),
    .ack(in_vec[10:10]),
    .state(in_vec[9:0]),
    .B3_next(out_vec[7:7]),
    .S_next(out_vec[6:6]),
    .S1_next(out_vec[5:5]),
    .Count_next(out_vec[4:4]),
    .Wait_next(out_vec[3:3]),
    .done(out_vec[2:2]),
    .counting(out_vec[1:1]),
    .shift_ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h123c;
    stim[1] = 13'h135c;
    stim[2] = 13'h03b5;
    stim[3] = 13'h1df5;
    stim[4] = 13'h07aa;
    stim[5] = 13'h0add;
    stim[6] = 13'h1371;
    stim[7] = 13'h0af1;
    stim[8] = 13'h0b48;
    stim[9] = 13'h0219;
    stim[10] = 13'h1ca3;
    stim[11] = 13'h0ded;
    stim[12] = 13'h1736;
    stim[13] = 13'h0f33;
    stim[14] = 13'h0a50;
    stim[15] = 13'h06d3;
    stim[16] = 13'h1714;
    stim[17] = 13'h018a;
    stim[18] = 13'h1656;
    stim[19] = 13'h06ff;
    stim[20] = 13'h0b56;
    stim[21] = 13'h039f;
    stim[22] = 13'h180a;
    stim[23] = 13'h15f9;
    stim[24] = 13'h0c7b;
    stim[25] = 13'h0e41;
    stim[26] = 13'h033e;
    stim[27] = 13'h0d45;
    stim[28] = 13'h0d04;
    stim[29] = 13'h0cff;
    stim[30] = 13'h1e49;
    stim[31] = 13'h0b58;
    stim[32] = 13'h1c35;
    stim[33] = 13'h09c9;
    stim[34] = 13'h0189;
    stim[35] = 13'h048c;
    stim[36] = 13'h14e6;
    stim[37] = 13'h1519;
    stim[38] = 13'h1250;
    stim[39] = 13'h1e9b;
    stim[40] = 13'h1d4d;
    stim[41] = 13'h11a4;
    stim[42] = 13'h0cbe;
    stim[43] = 13'h10df;
    stim[44] = 13'h1934;
    stim[45] = 13'h0852;
    stim[46] = 13'h1283;
    stim[47] = 13'h0b22;
    stim[48] = 13'h001b;
    stim[49] = 13'h0844;
    stim[50] = 13'h0fdd;
    stim[51] = 13'h1ac2;
    stim[52] = 13'h0740;
    stim[53] = 13'h1ce8;
    stim[54] = 13'h138c;
    stim[55] = 13'h0f2f;
    stim[56] = 13'h1e5c;
    stim[57] = 13'h0612;
    stim[58] = 13'h153e;
    stim[59] = 13'h0030;
    stim[60] = 13'h1f38;
    stim[61] = 13'h14b7;
    stim[62] = 13'h1e24;
    stim[63] = 13'h19ff;
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
      expv[0] = 8'h09;
      expv[1] = 8'h9f;
      expv[2] = 8'h5f;
      expv[3] = 8'hbf;
      expv[4] = 8'h57;
      expv[5] = 8'hd9;
      expv[6] = 8'hbf;
      expv[7] = 8'hd9;
      expv[8] = 8'hcf;
      expv[9] = 8'h49;
      expv[10] = 8'h31;
      expv[11] = 8'hdf;
      expv[12] = 8'h57;
      expv[13] = 8'h4f;
      expv[14] = 8'h89;
      expv[15] = 8'hd1;
      expv[16] = 8'h57;
      expv[17] = 8'h57;
      expv[18] = 8'hc1;
      expv[19] = 8'hd1;
      expv[20] = 8'hcf;
      expv[21] = 8'h5f;
      expv[22] = 8'h00;
      expv[23] = 8'hb7;
      expv[24] = 8'hc1;
      expv[25] = 8'hc1;
      expv[26] = 8'h5f;
      expv[27] = 8'hcf;
      expv[28] = 8'h0e;
      expv[29] = 8'hd1;
      expv[30] = 8'he1;
      expv[31] = 8'hcf;
      expv[32] = 8'h21;
      expv[33] = 8'hdf;
      expv[34] = 8'h57;
      expv[35] = 8'h51;
      expv[36] = 8'h91;
      expv[37] = 8'h37;
      expv[38] = 8'h89;
      expv[39] = 8'h71;
      expv[40] = 8'haf;
      expv[41] = 8'h17;
      expv[42] = 8'h51;
      expv[43] = 8'hb1;
      expv[44] = 8'h0f;
      expv[45] = 8'hc1;
      expv[46] = 8'h39;
      expv[47] = 8'h4f;
      expv[48] = 8'h41;
      expv[49] = 8'h81;
      expv[50] = 8'hdf;
      expv[51] = 8'h99;
      expv[52] = 8'hd7;
      expv[53] = 8'h91;
      expv[54] = 8'h1f;
      expv[55] = 8'h4f;
      expv[56] = 8'hc1;
      expv[57] = 8'h41;
      expv[58] = 8'h17;
      expv[59] = 8'h01;
      expv[60] = 8'h4f;
      expv[61] = 8'h31;
      expv[62] = 8'h41;
      expv[63] = 8'hbf;
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
