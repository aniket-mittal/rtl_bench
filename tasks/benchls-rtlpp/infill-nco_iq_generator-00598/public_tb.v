// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00598 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h3cf83eec;
    stim[1] = 31'h1113c48f;
    stim[2] = 31'h6b2d2199;
    stim[3] = 31'h5cb84244;
    stim[4] = 31'h754b4377;
    stim[5] = 31'h6e647d24;
    stim[6] = 31'h4bdfd878;
    stim[7] = 31'h79a1e6e5;
    stim[8] = 31'h42c333fc;
    stim[9] = 31'h614ac4cb;
    stim[10] = 31'h4ca4788c;
    stim[11] = 31'h51caf7ab;
    stim[12] = 31'h6c4b189c;
    stim[13] = 31'h55b5dd46;
    stim[14] = 31'h678466de;
    stim[15] = 31'h5327eddc;
    stim[16] = 31'h579df5a4;
    stim[17] = 31'h46623e40;
    stim[18] = 31'h61eb1551;
    stim[19] = 31'h64866ee0;
    stim[20] = 31'h5fb99c2c;
    stim[21] = 31'h7604caab;
    stim[22] = 31'h69c13227;
    stim[23] = 31'h4ebfba1a;
    stim[24] = 31'h4d9808d0;
    stim[25] = 31'h7f1d4e54;
    stim[26] = 31'h44e53a5a;
    stim[27] = 31'h424f9837;
    stim[28] = 31'h670ea5c2;
    stim[29] = 31'h539de48f;
    stim[30] = 31'h6e3ed7cb;
    stim[31] = 31'h565315bd;
    stim[32] = 31'h4ef4ff35;
    stim[33] = 31'h541232fc;
    stim[34] = 31'h49b41e23;
    stim[35] = 31'h5848fe53;
    stim[36] = 31'h75da427b;
    stim[37] = 31'h797a5859;
    stim[38] = 31'h790c02ad;
    stim[39] = 31'h7767e995;
    stim[40] = 31'h6ee4baed;
    stim[41] = 31'h6527a8b4;
    stim[42] = 31'h4bb96117;
    stim[43] = 31'h65b37f54;
    stim[44] = 31'h6084674f;
    stim[45] = 31'h709fb6ab;
    stim[46] = 31'h42c57574;
    stim[47] = 31'h5bab400c;
    stim[48] = 31'h5b157b06;
    stim[49] = 31'h4d231b3c;
    stim[50] = 31'h709d2fbf;
    stim[51] = 31'h693b202e;
    stim[52] = 31'h5e45fcd9;
    stim[53] = 31'h7baa0b9e;
    stim[54] = 31'h537dfabb;
    stim[55] = 31'h4f89fe28;
    stim[56] = 31'h56eba444;
    stim[57] = 31'h720de648;
    stim[58] = 31'h62f9c4f1;
    stim[59] = 31'h7eff2983;
    stim[60] = 31'h68909079;
    stim[61] = 31'h7fb7bc2c;
    stim[62] = 31'h5e1f4fa4;
    stim[63] = 31'h5bd7b3ba;
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
      expv[0] = 36'hxxxxxxxx9;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxxb;
      expv[3] = 36'h000000001;
      expv[4] = 36'h000000003;
      expv[5] = 36'h0000027eb;
      expv[6] = 36'h000003d3c;
      expv[7] = 36'h000003d34;
      expv[8] = 36'h000001774;
      expv[9] = 36'h000001776;
      expv[10] = 36'h0000033d3;
      expv[11] = 36'h0000033de;
      expv[12] = 36'h0000033d9;
      expv[13] = 36'h000005396;
      expv[14] = 36'h000005393;
      expv[15] = 36'h00000359e;
      expv[16] = 36'h000003591;
      expv[17] = 36'h000003594;
      expv[18] = 36'h000003594;
      expv[19] = 36'h000006e46;
      expv[20] = 36'h00000302c;
      expv[21] = 36'h000003021;
      expv[22] = 36'h000005466;
      expv[23] = 36'h000002a73;
      expv[24] = 36'h000002a7e;
      expv[25] = 36'h000002a74;
      expv[26] = 36'h000005086;
      expv[27] = 36'h000005086;
      expv[28] = 36'h000005083;
      expv[29] = 36'h0000036de;
      expv[30] = 36'h0000036d9;
      expv[31] = 36'h000005186;
      expv[32] = 36'h00000518b;
      expv[33] = 36'h00000518c;
      expv[34] = 36'h000005189;
      expv[35] = 36'h000005186;
      expv[36] = 36'h00000518e;
      expv[37] = 36'h000007b11;
      expv[38] = 36'h0000010f3;
      expv[39] = 36'h000002a7c;
      expv[40] = 36'h000000381;
      expv[41] = 36'h000001ae4;
      expv[42] = 36'h0000029c6;
      expv[43] = 36'h0000029c3;
      expv[44] = 36'h000003aa3;
      expv[45] = 36'h00000006e;
      expv[46] = 36'h0000000ec;
      expv[47] = 36'h0000000e4;
      expv[48] = 36'h0000000eb;
      expv[49] = 36'h0000000ec;
      expv[50] = 36'h0000000e1;
      expv[51] = 36'h000005824;
      expv[52] = 36'h0000028ce;
      expv[53] = 36'h0000028c1;
      expv[54] = 36'h000005043;
      expv[55] = 36'h00000504e;
      expv[56] = 36'h000005041;
      expv[57] = 36'h000005046;
      expv[58] = 36'h0000065e6;
      expv[59] = 36'h0000037fc;
      expv[60] = 36'h000003af9;
      expv[61] = 36'h0000019f3;
      expv[62] = 36'h000002289;
      expv[63] = 36'h000002283;
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
