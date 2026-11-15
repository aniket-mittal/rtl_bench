// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061962 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h6064e582db3;
    stim[1] = 43'h3115d2908a6;
    stim[2] = 43'h0f9e42b755a;
    stim[3] = 43'h1da88217094;
    stim[4] = 43'h047e59b3fba;
    stim[5] = 43'h274d1ff2b51;
    stim[6] = 43'h2ce85383ff6;
    stim[7] = 43'h144581ed61f;
    stim[8] = 43'h060044d9bec;
    stim[9] = 43'h341174a8c7a;
    stim[10] = 43'h266cdf76afb;
    stim[11] = 43'h5509e848e55;
    stim[12] = 43'h04611f85bbf;
    stim[13] = 43'h6a9af8e56a9;
    stim[14] = 43'h2a99ac2b660;
    stim[15] = 43'h043d9157172;
    stim[16] = 43'h5f462151888;
    stim[17] = 43'h7d1fd16d000;
    stim[18] = 43'h36ddb4e47eb;
    stim[19] = 43'h68e4c059f9b;
    stim[20] = 43'h62e44b1d75c;
    stim[21] = 43'h0efb69b8bdf;
    stim[22] = 43'h54443c29c2d;
    stim[23] = 43'h2f00479a1d1;
    stim[24] = 43'h4253ddb063a;
    stim[25] = 43'h175ee15d2f6;
    stim[26] = 43'h3df10cabcb4;
    stim[27] = 43'h505fe60be82;
    stim[28] = 43'h2a3bd7f327e;
    stim[29] = 43'h729a77dd311;
    stim[30] = 43'h28e50131dec;
    stim[31] = 43'h794e2b1d614;
    stim[32] = 43'h1edd98222c7;
    stim[33] = 43'h2e8452d2570;
    stim[34] = 43'h554bb3a7792;
    stim[35] = 43'h5ac44d19d7a;
    stim[36] = 43'h290b58bebe6;
    stim[37] = 43'h6e8a43279b7;
    stim[38] = 43'h68b2d1deb12;
    stim[39] = 43'h30af6aab02e;
    stim[40] = 43'h2b058ca503a;
    stim[41] = 43'h7d03af1df6d;
    stim[42] = 43'h5a8ff805154;
    stim[43] = 43'h77b5d87d57e;
    stim[44] = 43'h62034c30099;
    stim[45] = 43'h19b442a1de1;
    stim[46] = 43'h17497ff2de0;
    stim[47] = 43'h158db0ce0f0;
    stim[48] = 43'h23a8d368cd8;
    stim[49] = 43'h65688a78eac;
    stim[50] = 43'h443246631f6;
    stim[51] = 43'h6c0d5e2b061;
    stim[52] = 43'h239cbf40eaf;
    stim[53] = 43'h4e25fe83692;
    stim[54] = 43'h0f65efeb827;
    stim[55] = 43'h7a4dcd52270;
    stim[56] = 43'h14e28fc7372;
    stim[57] = 43'h7366ec3f240;
    stim[58] = 43'h406ab881e97;
    stim[59] = 43'h25eb544c82d;
    stim[60] = 43'h3a6cd7ae352;
    stim[61] = 43'h73883b86ca1;
    stim[62] = 43'h68e04ad4781;
    stim[63] = 43'h732d095b8df;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h6064e582db3;
      expv[2] = 43'h3115d2908a6;
      expv[3] = 43'h0f9e42b755a;
      expv[4] = 43'h1da88217094;
      expv[5] = 43'h047e59b3fba;
      expv[6] = 43'h274d1ff2b51;
      expv[7] = 43'h2ce85383ff6;
      expv[8] = 43'h144581ed61f;
      expv[9] = 43'h060044d9bec;
      expv[10] = 43'h341174a8c7a;
      expv[11] = 43'h266cdf76afb;
      expv[12] = 43'h5509e848e55;
      expv[13] = 43'h04611f85bbf;
      expv[14] = 43'h6a9af8e56a9;
      expv[15] = 43'h2a99ac2b660;
      expv[16] = 43'h043d9157172;
      expv[17] = 43'h5f462151888;
      expv[18] = 43'h7d1fd16d000;
      expv[19] = 43'h36ddb4e47eb;
      expv[20] = 43'h68e4c059f9b;
      expv[21] = 43'h62e44b1d75c;
      expv[22] = 43'h0efb69b8bdf;
      expv[23] = 43'h54443c29c2d;
      expv[24] = 43'h2f00479a1d1;
      expv[25] = 43'h4253ddb063a;
      expv[26] = 43'h175ee15d2f6;
      expv[27] = 43'h3df10cabcb4;
      expv[28] = 43'h505fe60be82;
      expv[29] = 43'h2a3bd7f327e;
      expv[30] = 43'h729a77dd311;
      expv[31] = 43'h28e50131dec;
      expv[32] = 43'h794e2b1d614;
      expv[33] = 43'h1edd98222c7;
      expv[34] = 43'h2e8452d2570;
      expv[35] = 43'h554bb3a7792;
      expv[36] = 43'h5ac44d19d7a;
      expv[37] = 43'h290b58bebe6;
      expv[38] = 43'h6e8a43279b7;
      expv[39] = 43'h68b2d1deb12;
      expv[40] = 43'h30af6aab02e;
      expv[41] = 43'h2b058ca503a;
      expv[42] = 43'h7d03af1df6d;
      expv[43] = 43'h5a8ff805154;
      expv[44] = 43'h77b5d87d57e;
      expv[45] = 43'h62034c30099;
      expv[46] = 43'h19b442a1de1;
      expv[47] = 43'h17497ff2de0;
      expv[48] = 43'h158db0ce0f0;
      expv[49] = 43'h23a8d368cd8;
      expv[50] = 43'h65688a78eac;
      expv[51] = 43'h443246631f6;
      expv[52] = 43'h6c0d5e2b061;
      expv[53] = 43'h239cbf40eaf;
      expv[54] = 43'h4e25fe83692;
      expv[55] = 43'h0f65efeb827;
      expv[56] = 43'h7a4dcd52270;
      expv[57] = 43'h14e28fc7372;
      expv[58] = 43'h7366ec3f240;
      expv[59] = 43'h406ab881e97;
      expv[60] = 43'h25eb544c82d;
      expv[61] = 43'h3a6cd7ae352;
      expv[62] = 43'h73883b86ca1;
      expv[63] = 43'h68e04ad4781;
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
