// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06643 dut (
    .iClock(clk),
    .iReset(in_vec[35:35]),
    .iOsc64(in_vec[34:34]),
    .iOsc256(in_vec[33:33]),
    .iOsc262k(in_vec[32:32]),
    .iNR21(in_vec[31:24]),
    .iNR22(in_vec[23:16]),
    .iNR23(in_vec[15:8]),
    .iNR24(in_vec[7:0]),
    .oOut(out_vec[5:1]),
    .oOnFlag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb01c09792;
    stim[1] = 36'h85f5dddfd;
    stim[2] = 36'h047a55fd1;
    stim[3] = 36'h60a24088e;
    stim[4] = 36'h77d21366f;
    stim[5] = 36'h09c2ffade;
    stim[6] = 36'h1d8674a0f;
    stim[7] = 36'h5305e8ef4;
    stim[8] = 36'h1e4dd4483;
    stim[9] = 36'h378214961;
    stim[10] = 36'h1f05fb0e4;
    stim[11] = 36'h065bb5eb8;
    stim[12] = 36'h5101743c7;
    stim[13] = 36'h755c932a0;
    stim[14] = 36'h1220fa348;
    stim[15] = 36'h15405cae8;
    stim[16] = 36'h3758cf4cf;
    stim[17] = 36'h1a43c9389;
    stim[18] = 36'h696b3be56;
    stim[19] = 36'h7a1dbbe00;
    stim[20] = 36'h4c2ee5a70;
    stim[21] = 36'h5d35dca03;
    stim[22] = 36'h0bba783aa;
    stim[23] = 36'h765cdc372;
    stim[24] = 36'h54e5933e4;
    stim[25] = 36'h6ec2c1f42;
    stim[26] = 36'h19adeb1d2;
    stim[27] = 36'h783a318d5;
    stim[28] = 36'h7f13d2519;
    stim[29] = 36'h12a4cb5f2;
    stim[30] = 36'h6648589b3;
    stim[31] = 36'h52002750d;
    stim[32] = 36'h148b7ce99;
    stim[33] = 36'h61362a3ae;
    stim[34] = 36'h6ef23d005;
    stim[35] = 36'h01feaaa59;
    stim[36] = 36'h5258cdd1b;
    stim[37] = 36'h1e4a86cd7;
    stim[38] = 36'h151587526;
    stim[39] = 36'h64632b550;
    stim[40] = 36'h6dcb2e53b;
    stim[41] = 36'h4ff255579;
    stim[42] = 36'h7e31936e0;
    stim[43] = 36'h10417af54;
    stim[44] = 36'hce99151c6;
    stim[45] = 36'h5f0e68668;
    stim[46] = 36'h2511f3976;
    stim[47] = 36'h2cc677163;
    stim[48] = 36'h299c9d02c;
    stim[49] = 36'h5805e7e5c;
    stim[50] = 36'h5367b80e9;
    stim[51] = 36'h47abbd63d;
    stim[52] = 36'h215c837bb;
    stim[53] = 36'h05f98a66d;
    stim[54] = 36'h7833eb61f;
    stim[55] = 36'h5c4c7dade;
    stim[56] = 36'h23533b40b;
    stim[57] = 36'h4ba6c9c67;
    stim[58] = 36'h05524bfcd;
    stim[59] = 36'h0d177684c;
    stim[60] = 36'h26d353abc;
    stim[61] = 36'h181f0226e;
    stim[62] = 36'h029329807;
    stim[63] = 36'h1cd0b8fe4;
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
      expv[0] = 6'hxx;
      expv[1] = 6'hxx;
      expv[2] = 6'h06;
      expv[3] = 6'h14;
      expv[4] = 6'h0a;
      expv[5] = 6'h1a;
      expv[6] = 6'h1a;
      expv[7] = 6'h1a;
      expv[8] = 6'h1a;
      expv[9] = 6'h14;
      expv[10] = 6'h04;
      expv[11] = 6'h04;
      expv[12] = 6'h14;
      expv[13] = 6'h08;
      expv[14] = 6'h1c;
      expv[15] = 6'h06;
      expv[16] = 6'h06;
      expv[17] = 6'h1e;
      expv[18] = 6'h0e;
      expv[19] = 6'h18;
      expv[20] = 6'h18;
      expv[21] = 6'h18;
      expv[22] = 6'h18;
      expv[23] = 6'h18;
      expv[24] = 6'h0a;
      expv[25] = 6'h0a;
      expv[26] = 6'h14;
      expv[27] = 6'h14;
      expv[28] = 6'h04;
      expv[29] = 6'h0a;
      expv[30] = 6'h0a;
      expv[31] = 6'h16;
      expv[32] = 6'h0e;
      expv[33] = 6'h0e;
      expv[34] = 6'h08;
      expv[35] = 6'h12;
      expv[36] = 6'h12;
      expv[37] = 6'h12;
      expv[38] = 6'h12;
      expv[39] = 6'h0a;
      expv[40] = 6'h0a;
      expv[41] = 6'h0a;
      expv[42] = 6'h0a;
      expv[43] = 6'h0a;
      expv[44] = 6'h1c;
      expv[45] = 6'h1a;
      expv[46] = 6'h0c;
      expv[47] = 6'h0c;
      expv[48] = 6'h0c;
      expv[49] = 6'h0c;
      expv[50] = 6'h0e;
      expv[51] = 6'h0e;
      expv[52] = 6'h10;
      expv[53] = 6'h10;
      expv[54] = 6'h06;
      expv[55] = 6'h06;
      expv[56] = 6'h06;
      expv[57] = 6'h06;
      expv[58] = 6'h06;
      expv[59] = 6'h06;
      expv[60] = 6'h1a;
      expv[61] = 6'h1a;
      expv[62] = 6'h18;
      expv[63] = 6'h18;
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
