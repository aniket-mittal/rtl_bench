// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01893 dut (
    .clk(clk),
    .rst_n(in_vec[8:8]),
    .indata(in_vec[7:0]),
    .outdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0e5;
    stim[1] = 9'h08e;
    stim[2] = 9'h14e;
    stim[3] = 9'h1f6;
    stim[4] = 9'h150;
    stim[5] = 9'h1d2;
    stim[6] = 9'h1de;
    stim[7] = 9'h171;
    stim[8] = 9'h11b;
    stim[9] = 9'h1dc;
    stim[10] = 9'h1ea;
    stim[11] = 9'h1c1;
    stim[12] = 9'h179;
    stim[13] = 9'h1d1;
    stim[14] = 9'h132;
    stim[15] = 9'h1e8;
    stim[16] = 9'h1fa;
    stim[17] = 9'h18c;
    stim[18] = 9'h1c4;
    stim[19] = 9'h1b1;
    stim[20] = 9'h1b5;
    stim[21] = 9'h161;
    stim[22] = 9'h1da;
    stim[23] = 9'h11a;
    stim[24] = 9'h1f3;
    stim[25] = 9'h121;
    stim[26] = 9'h1da;
    stim[27] = 9'h144;
    stim[28] = 9'h1b5;
    stim[29] = 9'h13c;
    stim[30] = 9'h13c;
    stim[31] = 9'h188;
    stim[32] = 9'h143;
    stim[33] = 9'h150;
    stim[34] = 9'h113;
    stim[35] = 9'h1ea;
    stim[36] = 9'h193;
    stim[37] = 9'h1ad;
    stim[38] = 9'h020;
    stim[39] = 9'h173;
    stim[40] = 9'h11b;
    stim[41] = 9'h14d;
    stim[42] = 9'h1a1;
    stim[43] = 9'h135;
    stim[44] = 9'h1de;
    stim[45] = 9'h152;
    stim[46] = 9'h1dd;
    stim[47] = 9'h1fc;
    stim[48] = 9'h154;
    stim[49] = 9'h1e8;
    stim[50] = 9'h117;
    stim[51] = 9'h177;
    stim[52] = 9'h1ac;
    stim[53] = 9'h157;
    stim[54] = 9'h110;
    stim[55] = 9'h1a6;
    stim[56] = 9'h1cb;
    stim[57] = 9'h134;
    stim[58] = 9'h144;
    stim[59] = 9'h15d;
    stim[60] = 9'h109;
    stim[61] = 9'h131;
    stim[62] = 9'h1d1;
    stim[63] = 9'h1da;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h4e;
      expv[4] = 8'hf6;
      expv[5] = 8'h50;
      expv[6] = 8'hd2;
      expv[7] = 8'hde;
      expv[8] = 8'h71;
      expv[9] = 8'h1b;
      expv[10] = 8'hdc;
      expv[11] = 8'hea;
      expv[12] = 8'hc1;
      expv[13] = 8'h79;
      expv[14] = 8'hd1;
      expv[15] = 8'h32;
      expv[16] = 8'he8;
      expv[17] = 8'hfa;
      expv[18] = 8'h8c;
      expv[19] = 8'hc4;
      expv[20] = 8'hb1;
      expv[21] = 8'hb5;
      expv[22] = 8'h61;
      expv[23] = 8'hda;
      expv[24] = 8'h1a;
      expv[25] = 8'hf3;
      expv[26] = 8'h21;
      expv[27] = 8'hda;
      expv[28] = 8'h44;
      expv[29] = 8'hb5;
      expv[30] = 8'h3c;
      expv[31] = 8'h3c;
      expv[32] = 8'h88;
      expv[33] = 8'h43;
      expv[34] = 8'h50;
      expv[35] = 8'h13;
      expv[36] = 8'hea;
      expv[37] = 8'h93;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h73;
      expv[41] = 8'h1b;
      expv[42] = 8'h4d;
      expv[43] = 8'ha1;
      expv[44] = 8'h35;
      expv[45] = 8'hde;
      expv[46] = 8'h52;
      expv[47] = 8'hdd;
      expv[48] = 8'hfc;
      expv[49] = 8'h54;
      expv[50] = 8'he8;
      expv[51] = 8'h17;
      expv[52] = 8'h77;
      expv[53] = 8'hac;
      expv[54] = 8'h57;
      expv[55] = 8'h10;
      expv[56] = 8'ha6;
      expv[57] = 8'hcb;
      expv[58] = 8'h34;
      expv[59] = 8'h44;
      expv[60] = 8'h5d;
      expv[61] = 8'h09;
      expv[62] = 8'h31;
      expv[63] = 8'hd1;
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
