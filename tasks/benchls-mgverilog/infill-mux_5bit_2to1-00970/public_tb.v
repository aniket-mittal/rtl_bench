// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00970 dut (
    .A(in_vec[10:6]),
    .B(in_vec[5:1]),
    .S(in_vec[0:0]),
    .MO(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h0cc;
    stim[1] = 11'h26c;
    stim[2] = 11'h4d7;
    stim[3] = 11'h7bb;
    stim[4] = 11'h68b;
    stim[5] = 11'h0fe;
    stim[6] = 11'h7b1;
    stim[7] = 11'h37d;
    stim[8] = 11'h188;
    stim[9] = 11'h542;
    stim[10] = 11'h536;
    stim[11] = 11'h2a4;
    stim[12] = 11'h1e7;
    stim[13] = 11'h01b;
    stim[14] = 11'h7a9;
    stim[15] = 11'h35e;
    stim[16] = 11'h781;
    stim[17] = 11'h08c;
    stim[18] = 11'h0ad;
    stim[19] = 11'h5b5;
    stim[20] = 11'h048;
    stim[21] = 11'h236;
    stim[22] = 11'h25f;
    stim[23] = 11'h280;
    stim[24] = 11'h398;
    stim[25] = 11'h283;
    stim[26] = 11'h234;
    stim[27] = 11'h003;
    stim[28] = 11'h536;
    stim[29] = 11'h21f;
    stim[30] = 11'h3ae;
    stim[31] = 11'h50b;
    stim[32] = 11'h53b;
    stim[33] = 11'h79c;
    stim[34] = 11'h2e5;
    stim[35] = 11'h5d0;
    stim[36] = 11'h05f;
    stim[37] = 11'h312;
    stim[38] = 11'h3fd;
    stim[39] = 11'h645;
    stim[40] = 11'h440;
    stim[41] = 11'h1df;
    stim[42] = 11'h715;
    stim[43] = 11'h0cf;
    stim[44] = 11'h057;
    stim[45] = 11'h409;
    stim[46] = 11'h3dd;
    stim[47] = 11'h104;
    stim[48] = 11'h33e;
    stim[49] = 11'h06b;
    stim[50] = 11'h592;
    stim[51] = 11'h445;
    stim[52] = 11'h7ff;
    stim[53] = 11'h211;
    stim[54] = 11'h4d0;
    stim[55] = 11'h2e3;
    stim[56] = 11'h56a;
    stim[57] = 11'h734;
    stim[58] = 11'h010;
    stim[59] = 11'h5dc;
    stim[60] = 11'h615;
    stim[61] = 11'h7cd;
    stim[62] = 11'h199;
    stim[63] = 11'h0ec;
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
      expv[0] = 5'h03;
      expv[1] = 5'h09;
      expv[2] = 5'h0b;
      expv[3] = 5'h1d;
      expv[4] = 5'h05;
      expv[5] = 5'h03;
      expv[6] = 5'h18;
      expv[7] = 5'h1e;
      expv[8] = 5'h06;
      expv[9] = 5'h15;
      expv[10] = 5'h14;
      expv[11] = 5'h0a;
      expv[12] = 5'h13;
      expv[13] = 5'h0d;
      expv[14] = 5'h14;
      expv[15] = 5'h0d;
      expv[16] = 5'h00;
      expv[17] = 5'h02;
      expv[18] = 5'h16;
      expv[19] = 5'h1a;
      expv[20] = 5'h01;
      expv[21] = 5'h08;
      expv[22] = 5'h0f;
      expv[23] = 5'h0a;
      expv[24] = 5'h0e;
      expv[25] = 5'h01;
      expv[26] = 5'h08;
      expv[27] = 5'h01;
      expv[28] = 5'h14;
      expv[29] = 5'h0f;
      expv[30] = 5'h0e;
      expv[31] = 5'h05;
      expv[32] = 5'h1d;
      expv[33] = 5'h1e;
      expv[34] = 5'h12;
      expv[35] = 5'h17;
      expv[36] = 5'h0f;
      expv[37] = 5'h0c;
      expv[38] = 5'h1e;
      expv[39] = 5'h02;
      expv[40] = 5'h11;
      expv[41] = 5'h0f;
      expv[42] = 5'h0a;
      expv[43] = 5'h07;
      expv[44] = 5'h0b;
      expv[45] = 5'h04;
      expv[46] = 5'h0e;
      expv[47] = 5'h04;
      expv[48] = 5'h0c;
      expv[49] = 5'h15;
      expv[50] = 5'h16;
      expv[51] = 5'h02;
      expv[52] = 5'h1f;
      expv[53] = 5'h08;
      expv[54] = 5'h13;
      expv[55] = 5'h11;
      expv[56] = 5'h15;
      expv[57] = 5'h1c;
      expv[58] = 5'h00;
      expv[59] = 5'h17;
      expv[60] = 5'h0a;
      expv[61] = 5'h06;
      expv[62] = 5'h0c;
      expv[63] = 5'h03;
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
