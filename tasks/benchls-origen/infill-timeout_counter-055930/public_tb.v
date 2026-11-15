// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055930 dut (
    .Clk(clk),
    .Start(in_vec[34:34]),
    .Reset(in_vec[33:33]),
    .Tclear(in_vec[32:32]),
    .Timeout(in_vec[31:0]),
    .T(out_vec[32:32]),
    .I(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h26a1c47ab;
    stim[1] = 35'h3cafbf731;
    stim[2] = 35'h56c3a99b6;
    stim[3] = 35'h1dce06b44;
    stim[4] = 35'h1ea1143f0;
    stim[5] = 35'h5e869bd95;
    stim[6] = 35'h41f968d18;
    stim[7] = 35'h51fdc8e2c;
    stim[8] = 35'h050d86dfb;
    stim[9] = 35'h4683343a5;
    stim[10] = 35'h59ed41de9;
    stim[11] = 35'h04cf7929d;
    stim[12] = 35'h46b8c72fe;
    stim[13] = 35'h4ad0eb217;
    stim[14] = 35'h4bc172b0b;
    stim[15] = 35'h5738b9a67;
    stim[16] = 35'h4d4b04cb3;
    stim[17] = 35'h18889937d;
    stim[18] = 35'h0d0dfc7ad;
    stim[19] = 35'h4e9a33b8c;
    stim[20] = 35'h10d06f84e;
    stim[21] = 35'h4a1d9ab5b;
    stim[22] = 35'h06626c14b;
    stim[23] = 35'h0c16b8896;
    stim[24] = 35'h56e98c9b5;
    stim[25] = 35'h42f695a45;
    stim[26] = 35'h058ec5da9;
    stim[27] = 35'h5917ad1f6;
    stim[28] = 35'h59f90a17e;
    stim[29] = 35'h13c5046c3;
    stim[30] = 35'h10fcde08c;
    stim[31] = 35'h07145a26c;
    stim[32] = 35'h5645b7876;
    stim[33] = 35'h54ef7c342;
    stim[34] = 35'h103365f2f;
    stim[35] = 35'h0d8281349;
    stim[36] = 35'h185f51ebb;
    stim[37] = 35'h17ce583d4;
    stim[38] = 35'h1ebb694dd;
    stim[39] = 35'h11a99ea97;
    stim[40] = 35'h457489f34;
    stim[41] = 35'h19346358f;
    stim[42] = 35'h471d05cb0;
    stim[43] = 35'h5a86a748b;
    stim[44] = 35'h1b4265b1c;
    stim[45] = 35'h0f1faa376;
    stim[46] = 35'h06bd05bb7;
    stim[47] = 35'h5e60e019c;
    stim[48] = 35'h00c085466;
    stim[49] = 35'h0e7cdb343;
    stim[50] = 35'h5b0656b9e;
    stim[51] = 35'h1c6d3aedc;
    stim[52] = 35'h47bb19890;
    stim[53] = 35'h165ab471b;
    stim[54] = 35'h1bb380b95;
    stim[55] = 35'h4965f4b21;
    stim[56] = 35'h0bfe178f4;
    stim[57] = 35'h01e1d57f7;
    stim[58] = 35'h5ea4fe83a;
    stim[59] = 35'h4f5086fc5;
    stim[60] = 35'h5c7f31d42;
    stim[61] = 35'h42eccedda;
    stim[62] = 35'h011b4b2e0;
    stim[63] = 35'h532a67531;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000000002;
      expv[16] = 33'h000000003;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000002;
      expv[25] = 33'h000000003;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000002;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000002;
      expv[59] = 33'h000000003;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000001;
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
