// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07889 dut (
    .clk(clk),
    .rst(in_vec[26:26]),
    .arg_0(in_vec[25:25]),
    .arg_1(in_vec[24:17]),
    .arg_2(in_vec[16:9]),
    .arg_3(in_vec[8:0]),
    .ret_0(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h7f042d7;
    stim[1] = 27'h782618f;
    stim[2] = 27'h3eb2c9b;
    stim[3] = 27'h04c6ece;
    stim[4] = 27'h3e8c007;
    stim[5] = 27'h3791544;
    stim[6] = 27'h22abb20;
    stim[7] = 27'h1ea5828;
    stim[8] = 27'h16a2ab1;
    stim[9] = 27'h1314b8b;
    stim[10] = 27'h358c0c3;
    stim[11] = 27'h37385c1;
    stim[12] = 27'h18fd2ae;
    stim[13] = 27'h38ccc58;
    stim[14] = 27'h17cfd2e;
    stim[15] = 27'h0c331c9;
    stim[16] = 27'h2555a40;
    stim[17] = 27'h152126d;
    stim[18] = 27'h1c9163c;
    stim[19] = 27'h19d0142;
    stim[20] = 27'h2b6e7a2;
    stim[21] = 27'h3e110c3;
    stim[22] = 27'h211e183;
    stim[23] = 27'h1112150;
    stim[24] = 27'h0cb6a79;
    stim[25] = 27'h3c650d3;
    stim[26] = 27'h0f690a0;
    stim[27] = 27'h1c76e6f;
    stim[28] = 27'h066225f;
    stim[29] = 27'h1cc7f44;
    stim[30] = 27'h0017edd;
    stim[31] = 27'h14e1429;
    stim[32] = 27'h28512c7;
    stim[33] = 27'h18184a3;
    stim[34] = 27'h05d838b;
    stim[35] = 27'h25f6406;
    stim[36] = 27'h2ccc5a5;
    stim[37] = 27'h0f8139d;
    stim[38] = 27'h054bb11;
    stim[39] = 27'h6b2d6c5;
    stim[40] = 27'h0673333;
    stim[41] = 27'h0ca640e;
    stim[42] = 27'h0bff222;
    stim[43] = 27'h232c181;
    stim[44] = 27'h2b4a9f7;
    stim[45] = 27'h28832d4;
    stim[46] = 27'h1430d2b;
    stim[47] = 27'h38a1504;
    stim[48] = 27'h0fc037f;
    stim[49] = 27'h2445501;
    stim[50] = 27'h1931e58;
    stim[51] = 27'h1c3ad0b;
    stim[52] = 27'h2b080f3;
    stim[53] = 27'h273ca32;
    stim[54] = 27'h3558093;
    stim[55] = 27'h1684509;
    stim[56] = 27'h223a1c6;
    stim[57] = 27'h14562ba;
    stim[58] = 27'h308ff96;
    stim[59] = 27'h372c13d;
    stim[60] = 27'h332252e;
    stim[61] = 27'h12f3bfa;
    stim[62] = 27'h0381da6;
    stim[63] = 27'h07397d1;
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
      expv[0] = 16'hcd57;
      expv[1] = 16'hb9c7;
      expv[2] = 16'hff9b;
      expv[3] = 16'h0000;
      expv[4] = 16'hea87;
      expv[5] = 16'he422;
      expv[6] = 16'h8000;
      expv[7] = 16'h5128;
      expv[8] = 16'h25b1;
      expv[9] = 16'h5fc5;
      expv[10] = 16'hc6c3;
      expv[11] = 16'hfee0;
      expv[12] = 16'h7fae;
      expv[13] = 16'hd6d8;
      expv[14] = 16'h5f17;
      expv[15] = 16'h3de4;
      expv[16] = 16'hac40;
      expv[17] = 16'h19ed;
      expv[18] = 16'h783c;
      expv[19] = 16'h6821;
      expv[20] = 16'ha851;
      expv[21] = 16'hfcc3;
      expv[22] = 16'hbd41;
      expv[23] = 16'h4d28;
      expv[24] = 16'h4df9;
      expv[25] = 16'hc653;
      expv[26] = 16'h2220;
      expv[27] = 16'h7fef;
      expv[28] = 16'h0000;
      expv[29] = 16'h53a2;
      expv[30] = 16'h205d;
      expv[31] = 16'h1929;
      expv[32] = 16'ha647;
      expv[33] = 16'h7fa3;
      expv[34] = 16'h38c5;
      expv[35] = 16'hb106;
      expv[36] = 16'ha552;
      expv[37] = 16'h03ce;
      expv[38] = 16'h0488;
      expv[39] = 16'ha2c5;
      expv[40] = 16'h2719;
      expv[41] = 16'h0c0e;
      expv[42] = 16'h6ca2;
      expv[43] = 16'h8000;
      expv[44] = 16'h987b;
      expv[45] = 16'h8000;
      expv[46] = 16'h5495;
      expv[47] = 16'ha882;
      expv[48] = 16'h00bf;
      expv[49] = 16'h8000;
      expv[50] = 16'h6cd8;
      expv[51] = 16'h7f85;
      expv[52] = 16'h8cf3;
      expv[53] = 16'hcfb2;
      expv[54] = 16'hf593;
      expv[55] = 16'h2c04;
      expv[56] = 16'hb1e3;
      expv[57] = 16'h6a3a;
      expv[58] = 16'hc2cb;
      expv[59] = 16'hcd9e;
      expv[60] = 16'h9697;
      expv[61] = 16'h5b7d;
      expv[62] = 16'h0000;
      expv[63] = 16'h4368;
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
