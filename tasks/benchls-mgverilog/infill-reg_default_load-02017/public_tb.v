// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02017 dut (
    .Clk(clk),
    .DataIn(in_vec[17:10]),
    .Write(in_vec[9:9]),
    .Reset(in_vec[8:8]),
    .Default(in_vec[7:0]),
    .DataOut(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h36145;
    stim[1] = 18'h10fe6;
    stim[2] = 18'h2fa1a;
    stim[3] = 18'h08c4e;
    stim[4] = 18'h24ce7;
    stim[5] = 18'h28a78;
    stim[6] = 18'h2d00e;
    stim[7] = 18'h12001;
    stim[8] = 18'h0f69a;
    stim[9] = 18'h0de8b;
    stim[10] = 18'h24e45;
    stim[11] = 18'h278cf;
    stim[12] = 18'h1381a;
    stim[13] = 18'h0a499;
    stim[14] = 18'h35a01;
    stim[15] = 18'h09650;
    stim[16] = 18'h11c18;
    stim[17] = 18'h3f091;
    stim[18] = 18'h12813;
    stim[19] = 18'h1da7d;
    stim[20] = 18'h0c851;
    stim[21] = 18'h346e8;
    stim[22] = 18'h2f4b1;
    stim[23] = 18'h336c4;
    stim[24] = 18'h134cf;
    stim[25] = 18'h29c09;
    stim[26] = 18'h0146b;
    stim[27] = 18'h03825;
    stim[28] = 18'h3785d;
    stim[29] = 18'h1c214;
    stim[30] = 18'h38448;
    stim[31] = 18'h236dc;
    stim[32] = 18'h02c32;
    stim[33] = 18'h1ae24;
    stim[34] = 18'h0948a;
    stim[35] = 18'h2685c;
    stim[36] = 18'h05875;
    stim[37] = 18'h02c1b;
    stim[38] = 18'h1a4e3;
    stim[39] = 18'h1681c;
    stim[40] = 18'h162f7;
    stim[41] = 18'h1c2a4;
    stim[42] = 18'h39273;
    stim[43] = 18'h120c5;
    stim[44] = 18'h08cc4;
    stim[45] = 18'h2ba0b;
    stim[46] = 18'h242d0;
    stim[47] = 18'h258c9;
    stim[48] = 18'h1fe9f;
    stim[49] = 18'h37094;
    stim[50] = 18'h14832;
    stim[51] = 18'h2645f;
    stim[52] = 18'h0486c;
    stim[53] = 18'h1f031;
    stim[54] = 18'h2fa20;
    stim[55] = 18'h3554e;
    stim[56] = 18'h29704;
    stim[57] = 18'h28ee5;
    stim[58] = 18'h3d801;
    stim[59] = 18'h03e6b;
    stim[60] = 18'h23eed;
    stim[61] = 18'h2d890;
    stim[62] = 18'h0fe0b;
    stim[63] = 18'h01a72;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h45;
      expv[2] = 8'he6;
      expv[3] = 8'hbe;
      expv[4] = 8'hbe;
      expv[5] = 8'hbe;
      expv[6] = 8'ha2;
      expv[7] = 8'ha2;
      expv[8] = 8'ha2;
      expv[9] = 8'h3d;
      expv[10] = 8'h37;
      expv[11] = 8'h93;
      expv[12] = 8'h93;
      expv[13] = 8'h93;
      expv[14] = 8'h93;
      expv[15] = 8'hd6;
      expv[16] = 8'h25;
      expv[17] = 8'h25;
      expv[18] = 8'h25;
      expv[19] = 8'h25;
      expv[20] = 8'h76;
      expv[21] = 8'h76;
      expv[22] = 8'hd1;
      expv[23] = 8'hd1;
      expv[24] = 8'hcd;
      expv[25] = 8'hcd;
      expv[26] = 8'hcd;
      expv[27] = 8'hcd;
      expv[28] = 8'hcd;
      expv[29] = 8'hcd;
      expv[30] = 8'h70;
      expv[31] = 8'h70;
      expv[32] = 8'h8d;
      expv[33] = 8'h8d;
      expv[34] = 8'h6b;
      expv[35] = 8'h6b;
      expv[36] = 8'h6b;
      expv[37] = 8'h6b;
      expv[38] = 8'h6b;
      expv[39] = 8'h6b;
      expv[40] = 8'h6b;
      expv[41] = 8'h58;
      expv[42] = 8'h70;
      expv[43] = 8'he4;
      expv[44] = 8'he4;
      expv[45] = 8'he4;
      expv[46] = 8'hae;
      expv[47] = 8'h90;
      expv[48] = 8'h90;
      expv[49] = 8'h7f;
      expv[50] = 8'h7f;
      expv[51] = 8'h7f;
      expv[52] = 8'h7f;
      expv[53] = 8'h7f;
      expv[54] = 8'h7f;
      expv[55] = 8'hbe;
      expv[56] = 8'h4e;
      expv[57] = 8'h04;
      expv[58] = 8'ha3;
      expv[59] = 8'ha3;
      expv[60] = 8'h0f;
      expv[61] = 8'h8f;
      expv[62] = 8'h8f;
      expv[63] = 8'h3f;
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
