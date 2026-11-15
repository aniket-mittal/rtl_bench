// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_054448 dut (
    .digit0(in_vec[7:4]),
    .digit1(in_vec[3:0]),
    .LSD(out_vec[13:7]),
    .MSD(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h1a;
    stim[1] = 8'hf5;
    stim[2] = 8'h6f;
    stim[3] = 8'h30;
    stim[4] = 8'h0e;
    stim[5] = 8'h88;
    stim[6] = 8'h1b;
    stim[7] = 8'ha5;
    stim[8] = 8'h72;
    stim[9] = 8'h63;
    stim[10] = 8'h60;
    stim[11] = 8'hde;
    stim[12] = 8'hde;
    stim[13] = 8'hc8;
    stim[14] = 8'hdc;
    stim[15] = 8'h25;
    stim[16] = 8'h8f;
    stim[17] = 8'hb5;
    stim[18] = 8'he3;
    stim[19] = 8'he6;
    stim[20] = 8'h53;
    stim[21] = 8'h5c;
    stim[22] = 8'h46;
    stim[23] = 8'h20;
    stim[24] = 8'h28;
    stim[25] = 8'h81;
    stim[26] = 8'h7e;
    stim[27] = 8'h0d;
    stim[28] = 8'hca;
    stim[29] = 8'heb;
    stim[30] = 8'hc4;
    stim[31] = 8'ha3;
    stim[32] = 8'haf;
    stim[33] = 8'h19;
    stim[34] = 8'h3f;
    stim[35] = 8'h7b;
    stim[36] = 8'h08;
    stim[37] = 8'h35;
    stim[38] = 8'h6c;
    stim[39] = 8'h61;
    stim[40] = 8'h03;
    stim[41] = 8'h41;
    stim[42] = 8'h4d;
    stim[43] = 8'ha1;
    stim[44] = 8'h2a;
    stim[45] = 8'h5c;
    stim[46] = 8'h87;
    stim[47] = 8'h9b;
    stim[48] = 8'h61;
    stim[49] = 8'hbc;
    stim[50] = 8'h5c;
    stim[51] = 8'hcd;
    stim[52] = 8'he7;
    stim[53] = 8'h7f;
    stim[54] = 8'h27;
    stim[55] = 8'h26;
    stim[56] = 8'hf0;
    stim[57] = 8'h0c;
    stim[58] = 8'hcd;
    stim[59] = 8'h5d;
    stim[60] = 8'h64;
    stim[61] = 8'h75;
    stim[62] = 8'h8a;
    stim[63] = 8'hed;
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
      expv[0] = 14'h3c88;
      expv[1] = 14'h0712;
      expv[2] = 14'h010e;
      expv[3] = 14'h1840;
      expv[4] = 14'h2006;
      expv[5] = 14'h0000;
      expv[6] = 14'h3c83;
      expv[7] = 14'h0412;
      expv[8] = 14'h3c24;
      expv[9] = 14'h0130;
      expv[10] = 14'h0140;
      expv[11] = 14'h1086;
      expv[12] = 14'h1086;
      expv[13] = 14'h2300;
      expv[14] = 14'h10c6;
      expv[15] = 14'h1212;
      expv[16] = 14'h000e;
      expv[17] = 14'h0192;
      expv[18] = 14'h0330;
      expv[19] = 14'h0302;
      expv[20] = 14'h0930;
      expv[21] = 14'h0946;
      expv[22] = 14'h0c82;
      expv[23] = 14'h1240;
      expv[24] = 14'h1200;
      expv[25] = 14'h0079;
      expv[26] = 14'h3c06;
      expv[27] = 14'h2021;
      expv[28] = 14'h2308;
      expv[29] = 14'h0303;
      expv[30] = 14'h2319;
      expv[31] = 14'h0430;
      expv[32] = 14'h040e;
      expv[33] = 14'h3c90;
      expv[34] = 14'h180e;
      expv[35] = 14'h3c03;
      expv[36] = 14'h2000;
      expv[37] = 14'h1812;
      expv[38] = 14'h0146;
      expv[39] = 14'h0179;
      expv[40] = 14'h2030;
      expv[41] = 14'h0cf9;
      expv[42] = 14'h0ca1;
      expv[43] = 14'h0479;
      expv[44] = 14'h1208;
      expv[45] = 14'h0946;
      expv[46] = 14'h0078;
      expv[47] = 14'h0803;
      expv[48] = 14'h0179;
      expv[49] = 14'h01c6;
      expv[50] = 14'h0946;
      expv[51] = 14'h2321;
      expv[52] = 14'h0378;
      expv[53] = 14'h3c0e;
      expv[54] = 14'h1278;
      expv[55] = 14'h1202;
      expv[56] = 14'h0740;
      expv[57] = 14'h2046;
      expv[58] = 14'h2321;
      expv[59] = 14'h0921;
      expv[60] = 14'h0119;
      expv[61] = 14'h3c12;
      expv[62] = 14'h0008;
      expv[63] = 14'h0321;
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
