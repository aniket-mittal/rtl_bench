// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  compressor_42 dut (
    .p0(in_vec[39:32]),
    .p1(in_vec[31:24]),
    .p2(in_vec[23:16]),
    .p3(in_vec[15:8]),
    .cin(in_vec[7:0]),
    .s(out_vec[23:16]),
    .ca(out_vec[15:8]),
    .cout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hc93b572496;
    stim[1] = 40'h7b8efa1653;
    stim[2] = 40'h7bf9ff9b5a;
    stim[3] = 40'h8bacd0cf16;
    stim[4] = 40'h1e13bc7f7e;
    stim[5] = 40'hd993a43716;
    stim[6] = 40'h28da250fa8;
    stim[7] = 40'hf7b8bb2774;
    stim[8] = 40'h7e15363ad2;
    stim[9] = 40'ha9186b9998;
    stim[10] = 40'hd1c00a1da9;
    stim[11] = 40'ha46c0061c8;
    stim[12] = 40'h3952ec52ae;
    stim[13] = 40'h43d4b2d972;
    stim[14] = 40'hb7ef29293b;
    stim[15] = 40'hcee8cf40c5;
    stim[16] = 40'h19a61ff513;
    stim[17] = 40'h8308f781cb;
    stim[18] = 40'ha3c92e81dc;
    stim[19] = 40'h915310590d;
    stim[20] = 40'hf1c450ced6;
    stim[21] = 40'hedb0363e20;
    stim[22] = 40'h979c0b5bd1;
    stim[23] = 40'h71bc9b3fca;
    stim[24] = 40'hd698065cd6;
    stim[25] = 40'hb42f78dc5e;
    stim[26] = 40'hd2fc33704a;
    stim[27] = 40'h9da7685de4;
    stim[28] = 40'h3a4a5e0bd7;
    stim[29] = 40'hdad0f2cb13;
    stim[30] = 40'h3663f7487d;
    stim[31] = 40'h973a14b242;
    stim[32] = 40'h226468994e;
    stim[33] = 40'h22c61d3d2e;
    stim[34] = 40'h153a85b6a4;
    stim[35] = 40'h80a9e0a5d6;
    stim[36] = 40'hccf94f3dc4;
    stim[37] = 40'h4a56b2f9e8;
    stim[38] = 40'hea9fe02da0;
    stim[39] = 40'hd4135423e0;
    stim[40] = 40'h02b56fe2f7;
    stim[41] = 40'h1dfbd70a4b;
    stim[42] = 40'h91c928b40e;
    stim[43] = 40'h9c944d004b;
    stim[44] = 40'h6c3071bd45;
    stim[45] = 40'h3dfd353722;
    stim[46] = 40'hab01840f85;
    stim[47] = 40'haf9e19a262;
    stim[48] = 40'h077ca1813d;
    stim[49] = 40'h900d4d06e7;
    stim[50] = 40'hfe83084ca4;
    stim[51] = 40'h6034ab4e42;
    stim[52] = 40'h02f0f888d8;
    stim[53] = 40'hbbb1e054bb;
    stim[54] = 40'h2e0b47b997;
    stim[55] = 40'h5d8cf6435d;
    stim[56] = 40'h94529a5165;
    stim[57] = 40'h9c91b27317;
    stim[58] = 40'hc25fa925a4;
    stim[59] = 40'hc764e9af8d;
    stim[60] = 40'hc8e4602580;
    stim[61] = 40'hfff5728e4a;
    stim[62] = 40'h4556ed8930;
    stim[63] = 40'h6bdff296ac;
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
      expv[0] = 24'h17a45b;
      expv[1] = 24'h4a17fa;
      expv[2] = 24'hbc5bfb;
      expv[3] = 24'h2ed788;
      expv[4] = 24'hb07f1e;
      expv[5] = 24'hcf3691;
      expv[6] = 24'h708f28;
      expv[7] = 24'ha774bb;
      expv[8] = 24'hb55a36;
      expv[9] = 24'hdb9829;
      expv[10] = 24'haf19c0;
      expv[11] = 24'h61c824;
      expv[12] = 24'h7b8678;
      expv[13] = 24'h8e71d2;
      expv[14] = 24'h6339af;
      expv[15] = 24'h6cc1ce;
      expv[16] = 24'h46b11f;
      expv[17] = 24'h36c983;
      expv[18] = 24'h19c4ab;
      expv[19] = 24'h865911;
      expv[20] = 24'h7dc6d0;
      expv[21] = 24'h752ab4;
      expv[22] = 24'h8a519f;
      expv[23] = 24'ha35eb9;
      expv[24] = 24'hc25c96;
      expv[25] = 24'h61de3c;
      expv[26] = 24'h2758f2;
      expv[27] = 24'heb54ad;
      expv[28] = 24'hf20f5a;
      expv[29] = 24'h20dbd2;
      expv[30] = 24'h976877;
      expv[31] = 24'h49b216;
      expv[32] = 24'hf90e60;
      expv[33] = 24'hea3d06;
      expv[34] = 24'hb8a615;
      expv[35] = 24'hbac5a0;
      expv[36] = 24'h837ccd;
      expv[37] = 24'hbfe852;
      expv[38] = 24'h18a5ea;
      expv[39] = 24'h50a354;
      expv[40] = 24'hcdf227;
      expv[41] = 24'h700bdf;
      expv[42] = 24'hca3489;
      expv[43] = 24'h0e419c;
      expv[44] = 24'hd52d70;
      expv[45] = 24'he0373d;
      expv[46] = 24'ha40f81;
      expv[47] = 24'he8229f;
      expv[48] = 24'h669925;
      expv[49] = 24'h31c60d;
      expv[50] = 24'h9d648a;
      expv[51] = 24'hf34e20;
      expv[52] = 24'h5a88f0;
      expv[53] = 24'h05fab1;
      expv[54] = 24'h4cb30f;
      expv[55] = 24'h3947dc;
      expv[56] = 24'h685592;
      expv[57] = 24'hdb3790;
      expv[58] = 24'hb524cb;
      expv[59] = 24'h688fe5;
      expv[60] = 24'he904e0;
      expv[61] = 24'hbc4af7;
      expv[62] = 24'h47b845;
      expv[63] = 24'h7c86fb;
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
