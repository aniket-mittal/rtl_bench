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

  dut dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h8947;
    stim[1] = 16'hfa4c;
    stim[2] = 16'h1efc;
    stim[3] = 16'hacce;
    stim[4] = 16'h8e4b;
    stim[5] = 16'hcba1;
    stim[6] = 16'he359;
    stim[7] = 16'h88e1;
    stim[8] = 16'hefa3;
    stim[9] = 16'h7ffb;
    stim[10] = 16'h40e3;
    stim[11] = 16'hf145;
    stim[12] = 16'h1d22;
    stim[13] = 16'h403c;
    stim[14] = 16'h5314;
    stim[15] = 16'hc38d;
    stim[16] = 16'hb975;
    stim[17] = 16'haeb4;
    stim[18] = 16'h1df8;
    stim[19] = 16'h716a;
    stim[20] = 16'h03e6;
    stim[21] = 16'h8ca0;
    stim[22] = 16'hfaaf;
    stim[23] = 16'h64ce;
    stim[24] = 16'h049f;
    stim[25] = 16'hc25a;
    stim[26] = 16'hccbe;
    stim[27] = 16'ha6df;
    stim[28] = 16'h6a04;
    stim[29] = 16'h9ffa;
    stim[30] = 16'h4ad4;
    stim[31] = 16'h6245;
    stim[32] = 16'hc47f;
    stim[33] = 16'h6c18;
    stim[34] = 16'he074;
    stim[35] = 16'hc6a5;
    stim[36] = 16'h4ad5;
    stim[37] = 16'hcb39;
    stim[38] = 16'hd397;
    stim[39] = 16'h3d2a;
    stim[40] = 16'h6f7d;
    stim[41] = 16'hdacf;
    stim[42] = 16'h0c32;
    stim[43] = 16'h152e;
    stim[44] = 16'h1f0c;
    stim[45] = 16'hf320;
    stim[46] = 16'h4758;
    stim[47] = 16'h8a33;
    stim[48] = 16'h18b9;
    stim[49] = 16'hbbde;
    stim[50] = 16'hcccf;
    stim[51] = 16'h12e5;
    stim[52] = 16'h0a30;
    stim[53] = 16'h8ca4;
    stim[54] = 16'hd8b5;
    stim[55] = 16'h51a3;
    stim[56] = 16'hfaf9;
    stim[57] = 16'h0876;
    stim[58] = 16'h19ae;
    stim[59] = 16'h60ba;
    stim[60] = 16'h32f0;
    stim[61] = 16'hfde6;
    stim[62] = 16'h827b;
    stim[63] = 16'hd0fe;
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
      expv[0] = 9'h084;
      expv[1] = 9'h15c;
      expv[2] = 9'h044;
      expv[3] = 9'h1bc;
      expv[4] = 9'h086;
      expv[5] = 9'h055;
      expv[6] = 9'h114;
      expv[7] = 9'h14e;
      expv[8] = 9'h099;
      expv[9] = 9'h108;
      expv[10] = 9'h0ba;
      expv[11] = 9'h158;
      expv[12] = 9'h1f7;
      expv[13] = 9'h008;
      expv[14] = 9'h07e;
      expv[15] = 9'h06d;
      expv[16] = 9'h088;
      expv[17] = 9'h1f4;
      expv[18] = 9'h04a;
      expv[19] = 9'h00e;
      expv[20] = 9'h03a;
      expv[21] = 9'h1d8;
      expv[22] = 9'h097;
      expv[23] = 9'h12c;
      expv[24] = 9'h0ca;
      expv[25] = 9'h0d0;
      expv[26] = 9'h01d;
      expv[27] = 9'h18e;
      expv[28] = 9'h0cc;
      expv[29] = 9'h14a;
      expv[30] = 9'h0ec;
      expv[31] = 9'h03a;
      expv[32] = 9'h08a;
      expv[33] = 9'h0a8;
      expv[34] = 9'h0d8;
      expv[35] = 9'h043;
      expv[36] = 9'h0ea;
      expv[37] = 9'h124;
      expv[38] = 9'h079;
      expv[39] = 9'h026;
      expv[40] = 9'h1e5;
      expv[41] = 9'h017;
      expv[42] = 9'h1b5;
      expv[43] = 9'h1cf;
      expv[44] = 9'h026;
      expv[45] = 9'h1a6;
      expv[46] = 9'h1df;
      expv[47] = 9'h0ae;
      expv[48] = 9'h0be;
      expv[49] = 9'h1ba;
      expv[50] = 9'h1fa;
      expv[51] = 9'h05a;
      expv[52] = 9'h1b5;
      expv[53] = 9'h1d0;
      expv[54] = 9'h047;
      expv[55] = 9'h15c;
      expv[56] = 9'h003;
      expv[57] = 9'h125;
      expv[58] = 9'h0d6;
      expv[59] = 9'h14c;
      expv[60] = 9'h084;
      expv[61] = 9'h02f;
      expv[62] = 9'h00e;
      expv[63] = 9'h1a4;
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
