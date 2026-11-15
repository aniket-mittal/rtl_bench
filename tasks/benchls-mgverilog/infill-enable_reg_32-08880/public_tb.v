// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08880 dut (
    .clock(clk),
    .in(in_vec[32:1]),
    .enable_l(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0cda3ab0d;
    stim[1] = 33'h0cd83595f;
    stim[2] = 33'h1fa5260fc;
    stim[3] = 33'h01a6e765d;
    stim[4] = 33'h1c2bd71c5;
    stim[5] = 33'h0f7260a80;
    stim[6] = 33'h1e2d8de51;
    stim[7] = 33'h1a3faa11c;
    stim[8] = 33'h14c66dd06;
    stim[9] = 33'h1a0ace07d;
    stim[10] = 33'h1c015f384;
    stim[11] = 33'h1a6504e44;
    stim[12] = 33'h0b7e43ed7;
    stim[13] = 33'h1d51b80f5;
    stim[14] = 33'h1ef9944af;
    stim[15] = 33'h19ae93a4f;
    stim[16] = 33'h0af614106;
    stim[17] = 33'h0568c49f4;
    stim[18] = 33'h0a553ff78;
    stim[19] = 33'h0a3f4662b;
    stim[20] = 33'h1c581c87e;
    stim[21] = 33'h1181ffa2b;
    stim[22] = 33'h0247b3703;
    stim[23] = 33'h0ace11ec3;
    stim[24] = 33'h0ddde477b;
    stim[25] = 33'h0f7df9cc5;
    stim[26] = 33'h100422f1c;
    stim[27] = 33'h1a828e8d3;
    stim[28] = 33'h0fcd0e49f;
    stim[29] = 33'h05b314f59;
    stim[30] = 33'h1a4b67d6c;
    stim[31] = 33'h0966fc507;
    stim[32] = 33'h1c01334df;
    stim[33] = 33'h00ab6a9d9;
    stim[34] = 33'h04b715b19;
    stim[35] = 33'h141bac968;
    stim[36] = 33'h0557a8b3e;
    stim[37] = 33'h176de1b37;
    stim[38] = 33'h01ee0ff57;
    stim[39] = 33'h078221e73;
    stim[40] = 33'h064c5042f;
    stim[41] = 33'h1d8f007f0;
    stim[42] = 33'h1d19bcffe;
    stim[43] = 33'h1637ffa9e;
    stim[44] = 33'h1d8ef45db;
    stim[45] = 33'h0f4c59775;
    stim[46] = 33'h0641cdf89;
    stim[47] = 33'h0bf0b113b;
    stim[48] = 33'h057a60ff8;
    stim[49] = 33'h051d9f680;
    stim[50] = 33'h185f455ce;
    stim[51] = 33'h167338a22;
    stim[52] = 33'h0c7a6c656;
    stim[53] = 33'h1975595da;
    stim[54] = 33'h0107c86ca;
    stim[55] = 33'h01c2bc588;
    stim[56] = 33'h0f5c812bf;
    stim[57] = 33'h05af4b2b2;
    stim[58] = 33'h0dca5a073;
    stim[59] = 33'h154f69273;
    stim[60] = 33'h109c28e29;
    stim[61] = 33'h097249600;
    stim[62] = 33'h17fe2e3e5;
    stim[63] = 33'h0366749ab;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hfd29307e;
      expv[4] = 32'hfd29307e;
      expv[5] = 32'hfd29307e;
      expv[6] = 32'h7b930540;
      expv[7] = 32'h7b930540;
      expv[8] = 32'hd1fd508e;
      expv[9] = 32'ha6336e83;
      expv[10] = 32'ha6336e83;
      expv[11] = 32'he00af9c2;
      expv[12] = 32'hd3282722;
      expv[13] = 32'hd3282722;
      expv[14] = 32'hd3282722;
      expv[15] = 32'hd3282722;
      expv[16] = 32'hd3282722;
      expv[17] = 32'h57b0a083;
      expv[18] = 32'h2b4624fa;
      expv[19] = 32'h52a9ffbc;
      expv[20] = 32'h52a9ffbc;
      expv[21] = 32'he2c0e43f;
      expv[22] = 32'he2c0e43f;
      expv[23] = 32'he2c0e43f;
      expv[24] = 32'he2c0e43f;
      expv[25] = 32'he2c0e43f;
      expv[26] = 32'he2c0e43f;
      expv[27] = 32'h8021178e;
      expv[28] = 32'h8021178e;
      expv[29] = 32'h8021178e;
      expv[30] = 32'h8021178e;
      expv[31] = 32'hd25b3eb6;
      expv[32] = 32'hd25b3eb6;
      expv[33] = 32'hd25b3eb6;
      expv[34] = 32'hd25b3eb6;
      expv[35] = 32'hd25b3eb6;
      expv[36] = 32'ha0dd64b4;
      expv[37] = 32'h2abd459f;
      expv[38] = 32'h2abd459f;
      expv[39] = 32'h2abd459f;
      expv[40] = 32'h2abd459f;
      expv[41] = 32'h2abd459f;
      expv[42] = 32'hec7803f8;
      expv[43] = 32'he8cde7ff;
      expv[44] = 32'hb1bffd4f;
      expv[45] = 32'hb1bffd4f;
      expv[46] = 32'hb1bffd4f;
      expv[47] = 32'hb1bffd4f;
      expv[48] = 32'hb1bffd4f;
      expv[49] = 32'h2bd307fc;
      expv[50] = 32'h28ecfb40;
      expv[51] = 32'hc2fa2ae7;
      expv[52] = 32'hb399c511;
      expv[53] = 32'h63d3632b;
      expv[54] = 32'hcbaacaed;
      expv[55] = 32'h083e4365;
      expv[56] = 32'h0e15e2c4;
      expv[57] = 32'h0e15e2c4;
      expv[58] = 32'h2d7a5959;
      expv[59] = 32'h2d7a5959;
      expv[60] = 32'h2d7a5959;
      expv[61] = 32'h2d7a5959;
      expv[62] = 32'h4b924b00;
      expv[63] = 32'h4b924b00;
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
