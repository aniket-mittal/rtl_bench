// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128629 dut (
    .operation(in_vec[18:16]),
    .operand_a(in_vec[15:8]),
    .operand_b(in_vec[7:0]),
    .result(out_vec[9:2]),
    .overflow(out_vec[1:1]),
    .underflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h788c4;
    stim[1] = 19'h723af;
    stim[2] = 19'h1c0e3;
    stim[3] = 19'h3bfe2;
    stim[4] = 19'h53d9d;
    stim[5] = 19'h098d1;
    stim[6] = 19'h10404;
    stim[7] = 19'h46b6c;
    stim[8] = 19'h22a2d;
    stim[9] = 19'h1dfd0;
    stim[10] = 19'h4e360;
    stim[11] = 19'h445bb;
    stim[12] = 19'h3bf27;
    stim[13] = 19'h25207;
    stim[14] = 19'h3edcb;
    stim[15] = 19'h46184;
    stim[16] = 19'h3e73a;
    stim[17] = 19'h755cb;
    stim[18] = 19'h25e52;
    stim[19] = 19'h4bd1c;
    stim[20] = 19'h1d5f6;
    stim[21] = 19'h47fa9;
    stim[22] = 19'h714db;
    stim[23] = 19'h3170a;
    stim[24] = 19'h358e7;
    stim[25] = 19'h3d103;
    stim[26] = 19'h79ebd;
    stim[27] = 19'h3b3e5;
    stim[28] = 19'h45e16;
    stim[29] = 19'h204ff;
    stim[30] = 19'h2b298;
    stim[31] = 19'h218e1;
    stim[32] = 19'h2ae68;
    stim[33] = 19'h2e042;
    stim[34] = 19'h3ed7b;
    stim[35] = 19'h4cc89;
    stim[36] = 19'h5de89;
    stim[37] = 19'h45ec7;
    stim[38] = 19'h0be3d;
    stim[39] = 19'h1d7af;
    stim[40] = 19'h798ae;
    stim[41] = 19'h07bfe;
    stim[42] = 19'h4631e;
    stim[43] = 19'h24a8e;
    stim[44] = 19'h390fb;
    stim[45] = 19'h3dda6;
    stim[46] = 19'h7ccd1;
    stim[47] = 19'h6d80d;
    stim[48] = 19'h042bf;
    stim[49] = 19'h222a6;
    stim[50] = 19'h60a2c;
    stim[51] = 19'h03309;
    stim[52] = 19'h07eed;
    stim[53] = 19'h499ee;
    stim[54] = 19'h78ac7;
    stim[55] = 19'h2b8cb;
    stim[56] = 19'h2ef6a;
    stim[57] = 19'h19cb0;
    stim[58] = 19'h5b71d;
    stim[59] = 19'h7992e;
    stim[60] = 19'h76676;
    stim[61] = 19'h65ab6;
    stim[62] = 19'h731a6;
    stim[63] = 19'h5087a;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'h374;
      expv[3] = 10'h001;
      expv[4] = 10'hxxx;
      expv[5] = 10'h1a6;
      expv[6] = 10'h000;
      expv[7] = 10'hxxx;
      expv[8] = 10'h18a;
      expv[9] = 10'h03c;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'h011;
      expv[13] = 10'h0fa;
      expv[14] = 10'h005;
      expv[15] = 10'hxxx;
      expv[16] = 10'h00d;
      expv[17] = 10'hxxx;
      expv[18] = 10'h072;
      expv[19] = 10'hxxx;
      expv[20] = 10'h37c;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'h009;
      expv[24] = 10'h001;
      expv[25] = 10'h115;
      expv[26] = 10'hxxx;
      expv[27] = 10'h001;
      expv[28] = 10'hxxx;
      expv[29] = 10'h3f2;
      expv[30] = 10'h2c2;
      expv[31] = 10'h062;
      expv[32] = 10'h2c2;
      expv[33] = 10'h302;
      expv[34] = 10'h005;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'h3ee;
      expv[39] = 10'h0a0;
      expv[40] = 10'hxxx;
      expv[41] = 10'h1e6;
      expv[42] = 10'hxxx;
      expv[43] = 10'h032;
      expv[44] = 10'h001;
      expv[45] = 10'h005;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'h006;
      expv[49] = 10'h032;
      expv[50] = 10'hxxx;
      expv[51] = 10'h0f0;
      expv[52] = 10'h1ae;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'h3a2;
      expv[56] = 10'h3da;
      expv[57] = 10'h3b0;
      expv[58] = 10'hxxx;
      expv[59] = 10'hxxx;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
