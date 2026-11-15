// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11403 dut (
    .CLK(clk),
    .RESETn(in_vec[10:10]),
    .DATA_IN(in_vec[9:2]),
    .PUSH(in_vec[1:1]),
    .POP(in_vec[0:0]),
    .DATA_OUT(out_vec[9:2]),
    .FULL(out_vec[1:1]),
    .EMPTY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h289;
    stim[1] = 11'h143;
    stim[2] = 11'h7ab;
    stim[3] = 11'h67c;
    stim[4] = 11'h66a;
    stim[5] = 11'h680;
    stim[6] = 11'h715;
    stim[7] = 11'h420;
    stim[8] = 11'h57e;
    stim[9] = 11'h71c;
    stim[10] = 11'h434;
    stim[11] = 11'h6ef;
    stim[12] = 11'h41f;
    stim[13] = 11'h4de;
    stim[14] = 11'h7d4;
    stim[15] = 11'h53a;
    stim[16] = 11'h4c8;
    stim[17] = 11'h612;
    stim[18] = 11'h534;
    stim[19] = 11'h76e;
    stim[20] = 11'h6fa;
    stim[21] = 11'h46d;
    stim[22] = 11'h6f6;
    stim[23] = 11'h63d;
    stim[24] = 11'h6a0;
    stim[25] = 11'h64f;
    stim[26] = 11'h4e2;
    stim[27] = 11'h5ba;
    stim[28] = 11'h74d;
    stim[29] = 11'h71d;
    stim[30] = 11'h6ed;
    stim[31] = 11'h4d1;
    stim[32] = 11'h411;
    stim[33] = 11'h7a5;
    stim[34] = 11'h5a1;
    stim[35] = 11'h79f;
    stim[36] = 11'h5bd;
    stim[37] = 11'h473;
    stim[38] = 11'h747;
    stim[39] = 11'h464;
    stim[40] = 11'h700;
    stim[41] = 11'h7b4;
    stim[42] = 11'h78a;
    stim[43] = 11'h7b7;
    stim[44] = 11'h7bc;
    stim[45] = 11'h5d5;
    stim[46] = 11'h452;
    stim[47] = 11'h6c2;
    stim[48] = 11'h506;
    stim[49] = 11'h60e;
    stim[50] = 11'h55b;
    stim[51] = 11'h788;
    stim[52] = 11'h4d8;
    stim[53] = 11'h4e0;
    stim[54] = 11'h4bd;
    stim[55] = 11'h774;
    stim[56] = 11'h734;
    stim[57] = 11'h650;
    stim[58] = 11'h659;
    stim[59] = 11'h5a5;
    stim[60] = 11'h45d;
    stim[61] = 11'h561;
    stim[62] = 11'h6eb;
    stim[63] = 11'h748;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h143;
      expv[4] = 10'h3ab;
      expv[5] = 10'h3ab;
      expv[6] = 10'h3ab;
      expv[7] = 10'h3ab;
      expv[8] = 10'h3ab;
      expv[9] = 10'h3ab;
      expv[10] = 10'h3ab;
      expv[11] = 10'h3ab;
      expv[12] = 10'h3a8;
      expv[13] = 10'hxxx;
      expv[14] = 10'h01f;
      expv[15] = 10'h01f;
      expv[16] = 10'h01f;
      expv[17] = 10'h01f;
      expv[18] = 10'h01f;
      expv[19] = 10'h01f;
      expv[20] = 10'h01f;
      expv[21] = 10'h01f;
      expv[22] = 10'h01f;
      expv[23] = 10'h01f;
      expv[24] = 10'h01f;
      expv[25] = 10'h01f;
      expv[26] = 10'h01c;
      expv[27] = 10'hxxx;
      expv[28] = 10'h0e2;
      expv[29] = 10'h0e0;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
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
