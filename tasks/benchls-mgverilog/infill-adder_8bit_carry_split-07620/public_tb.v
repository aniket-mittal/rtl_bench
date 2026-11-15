// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07620 dut (
    .in1(in_vec[15:8]),
    .in2(in_vec[7:0]),
    .res(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hae67;
    stim[1] = 16'ha173;
    stim[2] = 16'hdd3c;
    stim[3] = 16'h6822;
    stim[4] = 16'h5213;
    stim[5] = 16'hc404;
    stim[6] = 16'hca8e;
    stim[7] = 16'h988d;
    stim[8] = 16'h2ab8;
    stim[9] = 16'h5f28;
    stim[10] = 16'hb54d;
    stim[11] = 16'hf90f;
    stim[12] = 16'hc05a;
    stim[13] = 16'h699d;
    stim[14] = 16'h968f;
    stim[15] = 16'h2809;
    stim[16] = 16'h1a8e;
    stim[17] = 16'h2ef3;
    stim[18] = 16'hfc6e;
    stim[19] = 16'h8647;
    stim[20] = 16'h28ff;
    stim[21] = 16'h7f66;
    stim[22] = 16'he3e4;
    stim[23] = 16'h1f62;
    stim[24] = 16'hb889;
    stim[25] = 16'hf668;
    stim[26] = 16'h2340;
    stim[27] = 16'h96a2;
    stim[28] = 16'h3e9c;
    stim[29] = 16'h226a;
    stim[30] = 16'h131b;
    stim[31] = 16'hc984;
    stim[32] = 16'h4f51;
    stim[33] = 16'hcb6d;
    stim[34] = 16'h9459;
    stim[35] = 16'h0ccf;
    stim[36] = 16'h990c;
    stim[37] = 16'he3e1;
    stim[38] = 16'he53b;
    stim[39] = 16'h1a24;
    stim[40] = 16'he592;
    stim[41] = 16'h7dcd;
    stim[42] = 16'hcbe7;
    stim[43] = 16'h82ed;
    stim[44] = 16'h844d;
    stim[45] = 16'h14de;
    stim[46] = 16'h2588;
    stim[47] = 16'hd046;
    stim[48] = 16'h6770;
    stim[49] = 16'hc3cf;
    stim[50] = 16'hbdf8;
    stim[51] = 16'h1c8f;
    stim[52] = 16'h0538;
    stim[53] = 16'hbb0a;
    stim[54] = 16'h74e1;
    stim[55] = 16'h9b64;
    stim[56] = 16'hf969;
    stim[57] = 16'he611;
    stim[58] = 16'h686e;
    stim[59] = 16'h63e8;
    stim[60] = 16'h5bfe;
    stim[61] = 16'h68fc;
    stim[62] = 16'hb184;
    stim[63] = 16'h3e2e;
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
      expv[0] = 9'h115;
      expv[1] = 9'h114;
      expv[2] = 9'h119;
      expv[3] = 9'h08a;
      expv[4] = 9'h065;
      expv[5] = 9'h0c8;
      expv[6] = 9'h158;
      expv[7] = 9'h125;
      expv[8] = 9'h0e2;
      expv[9] = 9'h047;
      expv[10] = 9'h0c2;
      expv[11] = 9'h0c8;
      expv[12] = 9'h11a;
      expv[13] = 9'h0c6;
      expv[14] = 9'h125;
      expv[15] = 9'h031;
      expv[16] = 9'h0a8;
      expv[17] = 9'h111;
      expv[18] = 9'h16a;
      expv[19] = 9'h0cd;
      expv[20] = 9'h127;
      expv[21] = 9'h0e5;
      expv[22] = 9'h1c7;
      expv[23] = 9'h071;
      expv[24] = 9'h101;
      expv[25] = 9'h15e;
      expv[26] = 9'h063;
      expv[27] = 9'h138;
      expv[28] = 9'h0da;
      expv[29] = 9'h08c;
      expv[30] = 9'h02e;
      expv[31] = 9'h14d;
      expv[32] = 9'h090;
      expv[33] = 9'h138;
      expv[34] = 9'h0ed;
      expv[35] = 9'h0db;
      expv[36] = 9'h0a5;
      expv[37] = 9'h1c4;
      expv[38] = 9'h110;
      expv[39] = 9'h03e;
      expv[40] = 9'h177;
      expv[41] = 9'h10a;
      expv[42] = 9'h1a2;
      expv[43] = 9'h16f;
      expv[44] = 9'h0d1;
      expv[45] = 9'h0f2;
      expv[46] = 9'h0ad;
      expv[47] = 9'h116;
      expv[48] = 9'h0d7;
      expv[49] = 9'h182;
      expv[50] = 9'h1b5;
      expv[51] = 9'h0ab;
      expv[52] = 9'h03d;
      expv[53] = 9'h085;
      expv[54] = 9'h155;
      expv[55] = 9'h0ff;
      expv[56] = 9'h162;
      expv[57] = 9'h0f7;
      expv[58] = 9'h0d6;
      expv[59] = 9'h14b;
      expv[60] = 9'h159;
      expv[61] = 9'h164;
      expv[62] = 9'h135;
      expv[63] = 9'h06c;
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
