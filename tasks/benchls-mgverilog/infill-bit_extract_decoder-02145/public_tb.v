// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02145 dut (
    .AA(in_vec[6:0]),
    .DOUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h14;
    stim[1] = 7'h15;
    stim[2] = 7'h1d;
    stim[3] = 7'h75;
    stim[4] = 7'h4f;
    stim[5] = 7'h2a;
    stim[6] = 7'h06;
    stim[7] = 7'h78;
    stim[8] = 7'h24;
    stim[9] = 7'h7a;
    stim[10] = 7'h62;
    stim[11] = 7'h7f;
    stim[12] = 7'h5e;
    stim[13] = 7'h5e;
    stim[14] = 7'h04;
    stim[15] = 7'h2c;
    stim[16] = 7'h3c;
    stim[17] = 7'h0c;
    stim[18] = 7'h6a;
    stim[19] = 7'h05;
    stim[20] = 7'h6b;
    stim[21] = 7'h6b;
    stim[22] = 7'h20;
    stim[23] = 7'h3f;
    stim[24] = 7'h42;
    stim[25] = 7'h46;
    stim[26] = 7'h60;
    stim[27] = 7'h01;
    stim[28] = 7'h09;
    stim[29] = 7'h46;
    stim[30] = 7'h5b;
    stim[31] = 7'h62;
    stim[32] = 7'h58;
    stim[33] = 7'h19;
    stim[34] = 7'h43;
    stim[35] = 7'h0e;
    stim[36] = 7'h15;
    stim[37] = 7'h4b;
    stim[38] = 7'h4a;
    stim[39] = 7'h2d;
    stim[40] = 7'h4d;
    stim[41] = 7'h77;
    stim[42] = 7'h04;
    stim[43] = 7'h2a;
    stim[44] = 7'h3d;
    stim[45] = 7'h6c;
    stim[46] = 7'h10;
    stim[47] = 7'h18;
    stim[48] = 7'h11;
    stim[49] = 7'h00;
    stim[50] = 7'h31;
    stim[51] = 7'h09;
    stim[52] = 7'h71;
    stim[53] = 7'h5c;
    stim[54] = 7'h4e;
    stim[55] = 7'h40;
    stim[56] = 7'h0e;
    stim[57] = 7'h54;
    stim[58] = 7'h50;
    stim[59] = 7'h01;
    stim[60] = 7'h30;
    stim[61] = 7'h20;
    stim[62] = 7'h39;
    stim[63] = 7'h63;
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
      expv[0] = 32'hfff00000;
      expv[1] = 32'hffe00000;
      expv[2] = 32'he0000000;
      expv[3] = 32'h001fffff;
      expv[4] = 32'h0000ffff;
      expv[5] = 32'h00000400;
      expv[6] = 32'hffffffc0;
      expv[7] = 32'h00ffffff;
      expv[8] = 32'h00000010;
      expv[9] = 32'h03ffffff;
      expv[10] = 32'h00000003;
      expv[11] = 32'h7fffffff;
      expv[12] = 32'h7fffffff;
      expv[13] = 32'h7fffffff;
      expv[14] = 32'hfffffff0;
      expv[15] = 32'h00001000;
      expv[16] = 32'h10000000;
      expv[17] = 32'hfffff000;
      expv[18] = 32'h000003ff;
      expv[19] = 32'hffffffe0;
      expv[20] = 32'h000007ff;
      expv[21] = 32'h000007ff;
      expv[22] = 32'h00000001;
      expv[23] = 32'h80000000;
      expv[24] = 32'h00000007;
      expv[25] = 32'h0000007f;
      expv[26] = 32'hffffffff;
      expv[27] = 32'hfffffffe;
      expv[28] = 32'hfffffe00;
      expv[29] = 32'h0000007f;
      expv[30] = 32'h0fffffff;
      expv[31] = 32'h00000003;
      expv[32] = 32'h01ffffff;
      expv[33] = 32'hfe000000;
      expv[34] = 32'h0000000f;
      expv[35] = 32'hffffc000;
      expv[36] = 32'hffe00000;
      expv[37] = 32'h00000fff;
      expv[38] = 32'h000007ff;
      expv[39] = 32'h00002000;
      expv[40] = 32'h00003fff;
      expv[41] = 32'h007fffff;
      expv[42] = 32'hfffffff0;
      expv[43] = 32'h00000400;
      expv[44] = 32'h20000000;
      expv[45] = 32'h00000fff;
      expv[46] = 32'hffff0000;
      expv[47] = 32'hff000000;
      expv[48] = 32'hfffe0000;
      expv[49] = 32'hffffffff;
      expv[50] = 32'h00020000;
      expv[51] = 32'hfffffe00;
      expv[52] = 32'h0001ffff;
      expv[53] = 32'h1fffffff;
      expv[54] = 32'h00007fff;
      expv[55] = 32'h00000001;
      expv[56] = 32'hffffc000;
      expv[57] = 32'h001fffff;
      expv[58] = 32'h0001ffff;
      expv[59] = 32'hfffffffe;
      expv[60] = 32'h00010000;
      expv[61] = 32'h00000001;
      expv[62] = 32'h02000000;
      expv[63] = 32'h00000007;
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
