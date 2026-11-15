// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00306 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
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
    stim[0] = 38'h11cb354b3a;
    stim[1] = 38'h08dfda1cbb;
    stim[2] = 38'h3f01b786a1;
    stim[3] = 38'h067f06b428;
    stim[4] = 38'h1ece7367e0;
    stim[5] = 38'h2ad0c44853;
    stim[6] = 38'h0302518708;
    stim[7] = 38'h165048df44;
    stim[8] = 38'h003504d6ae;
    stim[9] = 38'h234c8ec40f;
    stim[10] = 38'h3e95f6ca59;
    stim[11] = 38'h0a22ad53d4;
    stim[12] = 38'h3e5e653ef3;
    stim[13] = 38'h335e1611bb;
    stim[14] = 38'h272b4e30d1;
    stim[15] = 38'h1aaffc7a7a;
    stim[16] = 38'h377f85ba8a;
    stim[17] = 38'h2bd37f075c;
    stim[18] = 38'h022b51ae57;
    stim[19] = 38'h3ea28efeed;
    stim[20] = 38'h27aacfbf6e;
    stim[21] = 38'h17320fc637;
    stim[22] = 38'h1bd1ccecc7;
    stim[23] = 38'h3e4ff83e64;
    stim[24] = 38'h3baf73e40d;
    stim[25] = 38'h02c3595f23;
    stim[26] = 38'h26282f5886;
    stim[27] = 38'h0e2e27a4a0;
    stim[28] = 38'h32e6c0752e;
    stim[29] = 38'h0f226f0a9a;
    stim[30] = 38'h2e184fc5d0;
    stim[31] = 38'h3bf7890150;
    stim[32] = 38'h1f145cc468;
    stim[33] = 38'h37ac198810;
    stim[34] = 38'h0e74b15134;
    stim[35] = 38'h1f96788510;
    stim[36] = 38'h0ecba74134;
    stim[37] = 38'h2282b703e6;
    stim[38] = 38'h123f95e726;
    stim[39] = 38'h2312c6c8ef;
    stim[40] = 38'h2f8a81d57b;
    stim[41] = 38'h0b0b0b0a8b;
    stim[42] = 38'h277c2e6333;
    stim[43] = 38'h17108f6798;
    stim[44] = 38'h1fb2d71f1f;
    stim[45] = 38'h2ab1d34001;
    stim[46] = 38'h13dea9c099;
    stim[47] = 38'h17442b17ca;
    stim[48] = 38'h037e1bb6f0;
    stim[49] = 38'h1e3d8086a6;
    stim[50] = 38'h24b7f46e5f;
    stim[51] = 38'h3b1bf24ea9;
    stim[52] = 38'h36d015d5f4;
    stim[53] = 38'h33af55bd59;
    stim[54] = 38'h3b5e9b6c46;
    stim[55] = 38'h3f05f1f93e;
    stim[56] = 38'h2b83a22481;
    stim[57] = 38'h3e6b37abe7;
    stim[58] = 38'h1f1cca509e;
    stim[59] = 38'h3f974b60c6;
    stim[60] = 38'h0adead00e0;
    stim[61] = 38'h0f81528f96;
    stim[62] = 38'h1e8df068ac;
    stim[63] = 38'h26440b399d;
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
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000000;
      expv[6] = 33'h100000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000001;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000001;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000001;
      expv[29] = 33'h000000001;
      expv[30] = 33'h000000001;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000001;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h100000000;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000001;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
