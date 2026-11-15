// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00322 dut (
    .flags(in_vec[15:8]),
    .val(in_vec[7:0]),
    .adjust(out_vec[9:2]),
    .cdaa(out_vec[1:1]),
    .hdaa(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h4a70;
    stim[1] = 16'h0b36;
    stim[2] = 16'hd439;
    stim[3] = 16'h756c;
    stim[4] = 16'hbf5e;
    stim[5] = 16'h2e0a;
    stim[6] = 16'h25f8;
    stim[7] = 16'he549;
    stim[8] = 16'hbe27;
    stim[9] = 16'h0329;
    stim[10] = 16'hd56b;
    stim[11] = 16'h5086;
    stim[12] = 16'h9ebe;
    stim[13] = 16'hf066;
    stim[14] = 16'haf6a;
    stim[15] = 16'heac0;
    stim[16] = 16'h8a14;
    stim[17] = 16'h9fbc;
    stim[18] = 16'h622d;
    stim[19] = 16'h05a2;
    stim[20] = 16'hbea8;
    stim[21] = 16'he702;
    stim[22] = 16'h4573;
    stim[23] = 16'hafff;
    stim[24] = 16'h1680;
    stim[25] = 16'hc128;
    stim[26] = 16'hd550;
    stim[27] = 16'h3fc5;
    stim[28] = 16'he613;
    stim[29] = 16'h5311;
    stim[30] = 16'h2871;
    stim[31] = 16'h1fc4;
    stim[32] = 16'hb4cd;
    stim[33] = 16'h0549;
    stim[34] = 16'h6f66;
    stim[35] = 16'h9a7f;
    stim[36] = 16'hf808;
    stim[37] = 16'h6121;
    stim[38] = 16'hd79e;
    stim[39] = 16'hf177;
    stim[40] = 16'h8e48;
    stim[41] = 16'h6c6e;
    stim[42] = 16'h996a;
    stim[43] = 16'h1df1;
    stim[44] = 16'ha91e;
    stim[45] = 16'h8090;
    stim[46] = 16'hc772;
    stim[47] = 16'hef65;
    stim[48] = 16'h399c;
    stim[49] = 16'h1465;
    stim[50] = 16'hcac1;
    stim[51] = 16'hcd27;
    stim[52] = 16'hcf2c;
    stim[53] = 16'h25e7;
    stim[54] = 16'h9531;
    stim[55] = 16'h9a7e;
    stim[56] = 16'he98e;
    stim[57] = 16'h2944;
    stim[58] = 16'hffc3;
    stim[59] = 16'h7d52;
    stim[60] = 16'h2194;
    stim[61] = 16'h79f8;
    stim[62] = 16'h8440;
    stim[63] = 16'hbfc2;
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
      expv[0] = 10'h000;
      expv[1] = 10'h282;
      expv[2] = 10'h018;
      expv[3] = 10'h19b;
      expv[4] = 10'h26a;
      expv[5] = 10'h3e8;
      expv[6] = 10'h182;
      expv[7] = 10'h182;
      expv[8] = 10'h3e8;
      expv[9] = 10'h282;
      expv[10] = 10'h19b;
      expv[11] = 10'h018;
      expv[12] = 10'h26a;
      expv[13] = 10'h018;
      expv[14] = 10'h26a;
      expv[15] = 10'h282;
      expv[16] = 10'h000;
      expv[17] = 10'h26a;
      expv[18] = 10'h3e8;
      expv[19] = 10'h182;
      expv[20] = 10'h26a;
      expv[21] = 10'h282;
      expv[22] = 10'h182;
      expv[23] = 10'h26a;
      expv[24] = 10'h3e9;
      expv[25] = 10'h182;
      expv[26] = 10'h19a;
      expv[27] = 10'h26b;
      expv[28] = 10'h000;
      expv[29] = 10'h26b;
      expv[30] = 10'h000;
      expv[31] = 10'h26b;
      expv[32] = 10'h19b;
      expv[33] = 10'h182;
      expv[34] = 10'h282;
      expv[35] = 10'h3e8;
      expv[36] = 10'h018;
      expv[37] = 10'h182;
      expv[38] = 10'h26a;
      expv[39] = 10'h19a;
      expv[40] = 10'h000;
      expv[41] = 10'h019;
      expv[42] = 10'h19b;
      expv[43] = 10'h19a;
      expv[44] = 10'h19b;
      expv[45] = 10'h000;
      expv[46] = 10'h282;
      expv[47] = 10'h282;
      expv[48] = 10'h19b;
      expv[49] = 10'h018;
      expv[50] = 10'h282;
      expv[51] = 10'h182;
      expv[52] = 10'h26a;
      expv[53] = 10'h182;
      expv[54] = 10'h19a;
      expv[55] = 10'h3e8;
      expv[56] = 10'h19b;
      expv[57] = 10'h182;
      expv[58] = 10'h26b;
      expv[59] = 10'h19a;
      expv[60] = 10'h182;
      expv[61] = 10'h19a;
      expv[62] = 10'h000;
      expv[63] = 10'h26b;
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
