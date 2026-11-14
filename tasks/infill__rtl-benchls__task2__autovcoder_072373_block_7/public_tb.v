// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072373 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h98c;
    stim[1] = 12'hd76;
    stim[2] = 12'h0da;
    stim[3] = 12'h720;
    stim[4] = 12'h181;
    stim[5] = 12'h716;
    stim[6] = 12'h3a8;
    stim[7] = 12'h0eb;
    stim[8] = 12'h535;
    stim[9] = 12'h672;
    stim[10] = 12'h148;
    stim[11] = 12'h532;
    stim[12] = 12'hbcf;
    stim[13] = 12'h1cf;
    stim[14] = 12'h2f4;
    stim[15] = 12'h41b;
    stim[16] = 12'h21f;
    stim[17] = 12'h3ba;
    stim[18] = 12'h3ef;
    stim[19] = 12'h376;
    stim[20] = 12'h2b0;
    stim[21] = 12'h167;
    stim[22] = 12'h5d2;
    stim[23] = 12'h574;
    stim[24] = 12'h16c;
    stim[25] = 12'h208;
    stim[26] = 12'h3f6;
    stim[27] = 12'h7cb;
    stim[28] = 12'h11f;
    stim[29] = 12'h16a;
    stim[30] = 12'h1e9;
    stim[31] = 12'h7af;
    stim[32] = 12'h29c;
    stim[33] = 12'h06d;
    stim[34] = 12'h5df;
    stim[35] = 12'h68f;
    stim[36] = 12'h1a5;
    stim[37] = 12'h216;
    stim[38] = 12'h455;
    stim[39] = 12'h096;
    stim[40] = 12'h63e;
    stim[41] = 12'h3a6;
    stim[42] = 12'h117;
    stim[43] = 12'h0ab;
    stim[44] = 12'h1dd;
    stim[45] = 12'h4ee;
    stim[46] = 12'h205;
    stim[47] = 12'h0f2;
    stim[48] = 12'h775;
    stim[49] = 12'h7d0;
    stim[50] = 12'h2a9;
    stim[51] = 12'h224;
    stim[52] = 12'h060;
    stim[53] = 12'h411;
    stim[54] = 12'h37a;
    stim[55] = 12'h095;
    stim[56] = 12'h5b4;
    stim[57] = 12'h4a2;
    stim[58] = 12'h5d5;
    stim[59] = 12'h64a;
    stim[60] = 12'h5d6;
    stim[61] = 12'h4a4;
    stim[62] = 12'h70b;
    stim[63] = 12'h243;
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
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h176;
      expv[5] = 10'h176;
      expv[6] = 10'h320;
      expv[7] = 10'h320;
      expv[8] = 10'h320;
      expv[9] = 10'h320;
      expv[10] = 10'h316;
      expv[11] = 10'h316;
      expv[12] = 10'h316;
      expv[13] = 10'h100;
      expv[14] = 10'h100;
      expv[15] = 10'h100;
      expv[16] = 10'h132;
      expv[17] = 10'h132;
      expv[18] = 10'h132;
      expv[19] = 10'h132;
      expv[20] = 10'h132;
      expv[21] = 10'h132;
      expv[22] = 10'h132;
      expv[23] = 10'h132;
      expv[24] = 10'h3d2;
      expv[25] = 10'h3d2;
      expv[26] = 10'h3d2;
      expv[27] = 10'h3d2;
      expv[28] = 10'h374;
      expv[29] = 10'h374;
      expv[30] = 10'h374;
      expv[31] = 10'h374;
      expv[32] = 10'h3cb;
      expv[33] = 10'h3cb;
      expv[34] = 10'h3cb;
      expv[35] = 10'h3cb;
      expv[36] = 10'h3af;
      expv[37] = 10'h3af;
      expv[38] = 10'h3af;
      expv[39] = 10'h3af;
      expv[40] = 10'h3af;
      expv[41] = 10'h3df;
      expv[42] = 10'h3df;
      expv[43] = 10'h3df;
      expv[44] = 10'h3df;
      expv[45] = 10'h3df;
      expv[46] = 10'h3df;
      expv[47] = 10'h3df;
      expv[48] = 10'h3df;
      expv[49] = 10'h1df;
      expv[50] = 10'h375;
      expv[51] = 10'h375;
      expv[52] = 10'h375;
      expv[53] = 10'h375;
      expv[54] = 10'h375;
      expv[55] = 10'h375;
      expv[56] = 10'h375;
      expv[57] = 10'h375;
      expv[58] = 10'h375;
      expv[59] = 10'h375;
      expv[60] = 10'h3d0;
      expv[61] = 10'h3d0;
      expv[62] = 10'h3d0;
      expv[63] = 10'h3b4;
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
