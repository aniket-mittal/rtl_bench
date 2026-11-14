// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h001549a7;
    stim[1] = 32'h769a2b17;
    stim[2] = 32'haeab0e74;
    stim[3] = 32'h7b8ca1a7;
    stim[4] = 32'h9535a154;
    stim[5] = 32'hdfd861a9;
    stim[6] = 32'h6e151a41;
    stim[7] = 32'h27742f9c;
    stim[8] = 32'h42a845a4;
    stim[9] = 32'hef7a4a8a;
    stim[10] = 32'h065b5a51;
    stim[11] = 32'h3ee8244c;
    stim[12] = 32'h2a26d822;
    stim[13] = 32'h7f63aa68;
    stim[14] = 32'h58b57540;
    stim[15] = 32'h8e86da73;
    stim[16] = 32'ha05567b7;
    stim[17] = 32'h5273b274;
    stim[18] = 32'h99671136;
    stim[19] = 32'h331c308d;
    stim[20] = 32'h614be267;
    stim[21] = 32'h3e5b8f46;
    stim[22] = 32'h82e94cbd;
    stim[23] = 32'h9adf0214;
    stim[24] = 32'h1f5206f6;
    stim[25] = 32'he892c3ac;
    stim[26] = 32'h2bd24fb2;
    stim[27] = 32'h9f9015e0;
    stim[28] = 32'h7804b27d;
    stim[29] = 32'h5b263d86;
    stim[30] = 32'h814fac2a;
    stim[31] = 32'h9d5028fc;
    stim[32] = 32'h5a94ac53;
    stim[33] = 32'h230ffb73;
    stim[34] = 32'h4e871343;
    stim[35] = 32'h5c592619;
    stim[36] = 32'h2326fcfa;
    stim[37] = 32'h262a8de6;
    stim[38] = 32'h77406e69;
    stim[39] = 32'h9f0302ae;
    stim[40] = 32'hde6d46c8;
    stim[41] = 32'h080b4d36;
    stim[42] = 32'h61d7f7cb;
    stim[43] = 32'h3777fd6b;
    stim[44] = 32'h5ec07fbb;
    stim[45] = 32'h8bbaf668;
    stim[46] = 32'hc32f73b1;
    stim[47] = 32'h238f683d;
    stim[48] = 32'h9f97f06d;
    stim[49] = 32'h60b7953d;
    stim[50] = 32'h1591b267;
    stim[51] = 32'hb0f72a36;
    stim[52] = 32'h9b982c90;
    stim[53] = 32'h0f55252a;
    stim[54] = 32'hce842e7f;
    stim[55] = 32'hed65f363;
    stim[56] = 32'h11455f9b;
    stim[57] = 32'h3a09b790;
    stim[58] = 32'h7cbdef00;
    stim[59] = 32'h9548b417;
    stim[60] = 32'h062139cb;
    stim[61] = 32'h80ce649f;
    stim[62] = 32'h5714dfbe;
    stim[63] = 32'he70f20ab;
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
      expv[0] = 32'h001549a7;
      expv[1] = 32'h769a2b17;
      expv[2] = 32'haeab0e74;
      expv[3] = 32'h7b8ca1a7;
      expv[4] = 32'h9535a154;
      expv[5] = 32'hdfd861a9;
      expv[6] = 32'h6e151a41;
      expv[7] = 32'h27742f9c;
      expv[8] = 32'h42a845a4;
      expv[9] = 32'hef7a4a8a;
      expv[10] = 32'h065b5a51;
      expv[11] = 32'h3ee8244c;
      expv[12] = 32'h2a26d822;
      expv[13] = 32'h7f63aa68;
      expv[14] = 32'h58b57540;
      expv[15] = 32'h8e86da73;
      expv[16] = 32'ha05567b7;
      expv[17] = 32'h5273b274;
      expv[18] = 32'h99671136;
      expv[19] = 32'h331c308d;
      expv[20] = 32'h614be267;
      expv[21] = 32'h3e5b8f46;
      expv[22] = 32'h82e94cbd;
      expv[23] = 32'h9adf0214;
      expv[24] = 32'h1f5206f6;
      expv[25] = 32'he892c3ac;
      expv[26] = 32'h2bd24fb2;
      expv[27] = 32'h9f9015e0;
      expv[28] = 32'h7804b27d;
      expv[29] = 32'h5b263d86;
      expv[30] = 32'h814fac2a;
      expv[31] = 32'h9d5028fc;
      expv[32] = 32'h5a94ac53;
      expv[33] = 32'h230ffb73;
      expv[34] = 32'h4e871343;
      expv[35] = 32'h5c592619;
      expv[36] = 32'h2326fcfa;
      expv[37] = 32'h262a8de6;
      expv[38] = 32'h77406e69;
      expv[39] = 32'h9f0302ae;
      expv[40] = 32'hde6d46c8;
      expv[41] = 32'h080b4d36;
      expv[42] = 32'h61d7f7cb;
      expv[43] = 32'h3777fd6b;
      expv[44] = 32'h5ec07fbb;
      expv[45] = 32'h8bbaf668;
      expv[46] = 32'hc32f73b1;
      expv[47] = 32'h238f683d;
      expv[48] = 32'h9f97f06d;
      expv[49] = 32'h60b7953d;
      expv[50] = 32'h1591b267;
      expv[51] = 32'hb0f72a36;
      expv[52] = 32'h9b982c90;
      expv[53] = 32'h0f55252a;
      expv[54] = 32'hce842e7f;
      expv[55] = 32'hed65f363;
      expv[56] = 32'h11455f9b;
      expv[57] = 32'h3a09b790;
      expv[58] = 32'h7cbdef00;
      expv[59] = 32'h9548b417;
      expv[60] = 32'h062139cb;
      expv[61] = 32'h80ce649f;
      expv[62] = 32'h5714dfbe;
      expv[63] = 32'he70f20ab;
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
