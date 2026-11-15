// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08174 dut (
    .CLK(clk),
    .process_CE(in_vec[32:32]),
    .inp(in_vec[31:0]),
    .process_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1bbd58051;
    stim[1] = 33'h0c9756ffb;
    stim[2] = 33'h1008a02e4;
    stim[3] = 33'h04f4b0a05;
    stim[4] = 33'h0c3b7e729;
    stim[5] = 33'h12b151378;
    stim[6] = 33'h19b3a7566;
    stim[7] = 33'h1e8721b7a;
    stim[8] = 33'h0c0771bce;
    stim[9] = 33'h1c392ab3e;
    stim[10] = 33'h12368ea19;
    stim[11] = 33'h1acfd8574;
    stim[12] = 33'h11427597f;
    stim[13] = 33'h0a8c4d669;
    stim[14] = 33'h1c8549880;
    stim[15] = 33'h02fbce4c3;
    stim[16] = 33'h151ff7f52;
    stim[17] = 33'h12a5c7571;
    stim[18] = 33'h0ddef2de9;
    stim[19] = 33'h1017d076e;
    stim[20] = 33'h0d1f58aaa;
    stim[21] = 33'h13463988f;
    stim[22] = 33'h009efc170;
    stim[23] = 33'h1a75c0e65;
    stim[24] = 33'h1ed5b8e0c;
    stim[25] = 33'h1e85ab8ac;
    stim[26] = 33'h0b51a6353;
    stim[27] = 33'h10dc6bc5e;
    stim[28] = 33'h00faa788d;
    stim[29] = 33'h180a45c9c;
    stim[30] = 33'h1991708aa;
    stim[31] = 33'h002470607;
    stim[32] = 33'h13c8365d2;
    stim[33] = 33'h11f072df9;
    stim[34] = 33'h05426c8bb;
    stim[35] = 33'h03e8c75d7;
    stim[36] = 33'h0049a855b;
    stim[37] = 33'h0900598ff;
    stim[38] = 33'h039c1212a;
    stim[39] = 33'h19a68d85d;
    stim[40] = 33'h12d653a3c;
    stim[41] = 33'h1447e74c9;
    stim[42] = 33'h1ef0b6d62;
    stim[43] = 33'h19b4d897f;
    stim[44] = 33'h02004b692;
    stim[45] = 33'h161f4d844;
    stim[46] = 33'h0905c3d01;
    stim[47] = 33'h136599bb5;
    stim[48] = 33'h100870c70;
    stim[49] = 33'h0fe7eb4d2;
    stim[50] = 33'h178772df5;
    stim[51] = 33'h06c92f1a3;
    stim[52] = 33'h1a5a8d29c;
    stim[53] = 33'h1bdc28d29;
    stim[54] = 33'h1b2f79fb0;
    stim[55] = 33'h07685425d;
    stim[56] = 33'h1c2f323c4;
    stim[57] = 33'h126a35a05;
    stim[58] = 33'h1e205cc51;
    stim[59] = 33'h105ee881f;
    stim[60] = 33'h1cf7e5ce7;
    stim[61] = 33'h1a329ccec;
    stim[62] = 33'h1f6e157f7;
    stim[63] = 33'h0fc190a86;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h3c26;
      expv[2] = 16'h3c26;
      expv[3] = 16'h036e;
      expv[4] = 16'h036e;
      expv[5] = 16'h036e;
      expv[6] = 16'h3e8d;
      expv[7] = 16'h10a0;
      expv[8] = 16'h03ec;
      expv[9] = 16'h03ec;
      expv[10] = 16'h6ed0;
      expv[11] = 16'h0d81;
      expv[12] = 16'h3271;
      expv[13] = 16'h6da6;
      expv[14] = 16'h6da6;
      expv[15] = 16'h60d4;
      expv[16] = 16'h60d4;
      expv[17] = 16'hd151;
      expv[18] = 16'h9fcd;
      expv[19] = 16'h9fcd;
      expv[20] = 16'h08eb;
      expv[21] = 16'h08eb;
      expv[22] = 16'hccf2;
      expv[23] = 16'hccf2;
      expv[24] = 16'hb5c1;
      expv[25] = 16'h7b67;
      expv[26] = 16'ha106;
      expv[27] = 16'ha106;
      expv[28] = 16'hca24;
      expv[29] = 16'hca24;
      expv[30] = 16'hdd40;
      expv[31] = 16'ha1c1;
      expv[32] = 16'ha1c1;
      expv[33] = 16'ha255;
      expv[34] = 16'h4d00;
      expv[35] = 16'h4d00;
      expv[36] = 16'h4d00;
      expv[37] = 16'h4d00;
      expv[38] = 16'h4d00;
      expv[39] = 16'h4d00;
      expv[40] = 16'h72c5;
      expv[41] = 16'h67a1;
      expv[42] = 16'hb947;
      expv[43] = 16'h5c6d;
      expv[44] = 16'h24cc;
      expv[45] = 16'h24cc;
      expv[46] = 16'h3a38;
      expv[47] = 16'h3a38;
      expv[48] = 16'hd20e;
      expv[49] = 16'h0cf7;
      expv[50] = 16'h0cf7;
      expv[51] = 16'ha66c;
      expv[52] = 16'ha66c;
      expv[53] = 16'h7844;
      expv[54] = 16'h4aeb;
      expv[55] = 16'h52a7;
      expv[56] = 16'h52a7;
      expv[57] = 16'he6b7;
      expv[58] = 16'h80a8;
      expv[59] = 16'hae56;
      expv[60] = 16'h8e0d;
      expv[61] = 16'h2c65;
      expv[62] = 16'h7015;
      expv[63] = 16'h4ed8;
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
