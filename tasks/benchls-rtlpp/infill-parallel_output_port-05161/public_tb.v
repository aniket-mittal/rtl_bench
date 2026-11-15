// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05161 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[47:32]),
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
    stim[0] = 37'h0c28cbf4f5;
    stim[1] = 37'h10a3ed4ac5;
    stim[2] = 37'h1bd48c8549;
    stim[3] = 37'h16b3974076;
    stim[4] = 37'h0a8a1ea0cf;
    stim[5] = 37'h1e8570d030;
    stim[6] = 37'h07710af26b;
    stim[7] = 37'h07e094227c;
    stim[8] = 37'h1b6c60e070;
    stim[9] = 37'h1f5d24796b;
    stim[10] = 37'h0efe33db8e;
    stim[11] = 37'h02335f0d97;
    stim[12] = 37'h1f35272c73;
    stim[13] = 37'h033f3a80c7;
    stim[14] = 37'h16ee21ad1a;
    stim[15] = 37'h1a8714137c;
    stim[16] = 37'h12937e8107;
    stim[17] = 37'h120657953f;
    stim[18] = 37'h1247f1fb26;
    stim[19] = 37'h0a2e4fcd34;
    stim[20] = 37'h0eccc5d156;
    stim[21] = 37'h12144afad5;
    stim[22] = 37'h1670604094;
    stim[23] = 37'h1e14fccf6b;
    stim[24] = 37'h16071ee8ba;
    stim[25] = 37'h0e19550093;
    stim[26] = 37'h0ea2a62fb5;
    stim[27] = 37'h1b901abbcf;
    stim[28] = 37'h1ae1af8b45;
    stim[29] = 37'h0321bb6ff5;
    stim[30] = 37'h169ab1d673;
    stim[31] = 37'h07b2c411ea;
    stim[32] = 37'h1601ae358f;
    stim[33] = 37'h1b11f5b7ad;
    stim[34] = 37'h0e457f4402;
    stim[35] = 37'h1b5a6f9701;
    stim[36] = 37'h0ed2b65c23;
    stim[37] = 37'h030edd059f;
    stim[38] = 37'h071ed3a0ec;
    stim[39] = 37'h039a69a65f;
    stim[40] = 37'h1a52299022;
    stim[41] = 37'h1b33ae3b2b;
    stim[42] = 37'h127cd0e18f;
    stim[43] = 37'h16c2b8359e;
    stim[44] = 37'h1226a32580;
    stim[45] = 37'h13d7e7cdb0;
    stim[46] = 37'h13a32e7e40;
    stim[47] = 37'h0be02b4c9b;
    stim[48] = 37'h0fbd1d28db;
    stim[49] = 37'h0e94269780;
    stim[50] = 37'h03afb3fbfa;
    stim[51] = 37'h0a5b34249b;
    stim[52] = 37'h0b91771fb5;
    stim[53] = 37'h136ef4dea8;
    stim[54] = 37'h06303f5f2f;
    stim[55] = 37'h19fab6dfcd;
    stim[56] = 37'h12b0325911;
    stim[57] = 37'h03b1615f3c;
    stim[58] = 37'h06026611e8;
    stim[59] = 37'h1bfe99102f;
    stim[60] = 37'h16106dc4da;
    stim[61] = 37'h13ec01a341;
    stim[62] = 37'h0780c44a9f;
    stim[63] = 37'h1fd5a42a3b;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000000000;
      expv[12] = 48'h000000000000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h000000000000;
      expv[15] = 48'h000000000000;
      expv[16] = 48'h000000000000;
      expv[17] = 48'h000000000000;
      expv[18] = 48'h000000000000;
      expv[19] = 48'h000000000000;
      expv[20] = 48'h000000000000;
      expv[21] = 48'h000000000000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000000000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h000000000000;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h000000000000;
      expv[30] = 48'h000000000000;
      expv[31] = 48'h000000000000;
      expv[32] = 48'h000000000000;
      expv[33] = 48'h000000000000;
      expv[34] = 48'h000000000000;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h000000000000;
      expv[38] = 48'h000000000000;
      expv[39] = 48'h000000000000;
      expv[40] = 48'h000000000000;
      expv[41] = 48'h000000000000;
      expv[42] = 48'h000000000000;
      expv[43] = 48'h000000000000;
      expv[44] = 48'h000000000000;
      expv[45] = 48'h000000000000;
      expv[46] = 48'h000000000000;
      expv[47] = 48'h000000000000;
      expv[48] = 48'h000000000000;
      expv[49] = 48'h000000000000;
      expv[50] = 48'h000000000000;
      expv[51] = 48'h000000000000;
      expv[52] = 48'h000000000000;
      expv[53] = 48'h000000000000;
      expv[54] = 48'h000000000000;
      expv[55] = 48'h000000000000;
      expv[56] = 48'h000000000000;
      expv[57] = 48'h000000000000;
      expv[58] = 48'h000000000000;
      expv[59] = 48'h11e800000000;
      expv[60] = 48'h11e800000000;
      expv[61] = 48'h11e800000000;
      expv[62] = 48'h11e8000011e8;
      expv[63] = 48'h11e800000000;
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
