// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05413 dut (
    .A(in_vec[22:12]),
    .B(in_vec[11:1]),
    .cIn(in_vec[0:0]),
    .out(out_vec[11:1]),
    .cOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h58de61;
    stim[1] = 23'h278705;
    stim[2] = 23'h747817;
    stim[3] = 23'h06b356;
    stim[4] = 23'h684b78;
    stim[5] = 23'h49679b;
    stim[6] = 23'h422376;
    stim[7] = 23'h13f457;
    stim[8] = 23'h36d6df;
    stim[9] = 23'h6df270;
    stim[10] = 23'h1fc4a4;
    stim[11] = 23'h70d7fa;
    stim[12] = 23'h4b2a54;
    stim[13] = 23'h4e2b49;
    stim[14] = 23'h012a0a;
    stim[15] = 23'h1b773b;
    stim[16] = 23'h6a414c;
    stim[17] = 23'h293cf7;
    stim[18] = 23'h343e7b;
    stim[19] = 23'h7f778c;
    stim[20] = 23'h2d915b;
    stim[21] = 23'h51cdf7;
    stim[22] = 23'h57332e;
    stim[23] = 23'h3af5af;
    stim[24] = 23'h4a3ce9;
    stim[25] = 23'h204a07;
    stim[26] = 23'h412a5f;
    stim[27] = 23'h36ccd1;
    stim[28] = 23'h7e9eb3;
    stim[29] = 23'h0bf6ed;
    stim[30] = 23'h5fac00;
    stim[31] = 23'h00ffc1;
    stim[32] = 23'h76cace;
    stim[33] = 23'h7555ae;
    stim[34] = 23'h504837;
    stim[35] = 23'h514d55;
    stim[36] = 23'h2186fb;
    stim[37] = 23'h449ca7;
    stim[38] = 23'h10fd97;
    stim[39] = 23'h34d68a;
    stim[40] = 23'h1a3d50;
    stim[41] = 23'h3ee300;
    stim[42] = 23'h15cc57;
    stim[43] = 23'h7ee1de;
    stim[44] = 23'h0f5304;
    stim[45] = 23'h44b7b9;
    stim[46] = 23'h6b67a4;
    stim[47] = 23'h1afb24;
    stim[48] = 23'h7fb956;
    stim[49] = 23'h00dee5;
    stim[50] = 23'h16f0b4;
    stim[51] = 23'h607314;
    stim[52] = 23'h287d96;
    stim[53] = 23'h5b405c;
    stim[54] = 23'h488938;
    stim[55] = 23'h367fda;
    stim[56] = 23'h2fbd54;
    stim[57] = 23'h16585e;
    stim[58] = 23'h3c7fc6;
    stim[59] = 23'h6f4150;
    stim[60] = 23'h2a680b;
    stim[61] = 23'h2a23ad;
    stim[62] = 23'h1afc4d;
    stim[63] = 23'h662b6a;
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
      expv[0] = 12'h97d;
      expv[1] = 12'hbf6;
      expv[2] = 12'h6a7;
      expv[3] = 12'h42c;
      expv[4] = 12'h881;
      expv[5] = 12'h0c9;
      expv[6] = 12'hbba;
      expv[7] = 12'h6d6;
      expv[8] = 12'hdba;
      expv[9] = 12'h02f;
      expv[10] = 12'h89c;
      expv[11] = 12'h615;
      expv[12] = 12'h3b9;
      expv[13] = 12'h50f;
      expv[14] = 12'ha2e;
      expv[15] = 12'haaa;
      expv[16] = 12'he94;
      expv[17] = 12'h21f;
      expv[18] = 12'h503;
      expv[19] = 12'h77b;
      expv[20] = 12'h70e;
      expv[21] = 12'h831;
      expv[22] = 12'he14;
      expv[23] = 12'hd0e;
      expv[24] = 12'h631;
      expv[25] = 12'he10;
      expv[26] = 12'h285;
      expv[27] = 12'h3ab;
      expv[28] = 12'he87;
      expv[29] = 12'h86c;
      expv[30] = 12'h7f5;
      expv[31] = 12'hfe0;
      expv[32] = 12'h9a7;
      expv[33] = 12'h459;
      expv[34] = 12'h241;
      expv[35] = 12'h77f;
      expv[36] = 12'hb2c;
      expv[37] = 12'h53b;
      expv[38] = 12'hfb6;
      expv[39] = 12'hd24;
      expv[40] = 12'h097;
      expv[41] = 12'hadc;
      expv[42] = 12'hf10;
      expv[43] = 12'h1bb;
      expv[44] = 12'h4ee;
      expv[45] = 12'h051;
      expv[46] = 12'h511;
      expv[47] = 12'he82;
      expv[48] = 12'h94d;
      expv[49] = 12'hf00;
      expv[50] = 12'h392;
      expv[51] = 12'hf22;
      expv[52] = 12'h2a5;
      expv[53] = 12'hbc4;
      expv[54] = 12'h249;
      expv[55] = 12'h6a9;
      expv[56] = 12'h34b;
      expv[57] = 12'hb28;
      expv[58] = 12'h755;
      expv[59] = 12'hf38;
      expv[60] = 12'hd58;
      expv[61] = 12'h8f2;
      expv[62] = 12'hfac;
      expv[63] = 12'h82f;
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
