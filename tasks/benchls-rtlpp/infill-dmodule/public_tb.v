// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Dmodule dut (
    .A(in_vec[15:12]),
    .B(in_vec[11:8]),
    .Bb(in_vec[7:4]),
    .S(in_vec[3:0]),
    .D(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'he217;
    stim[1] = 16'h0ff1;
    stim[2] = 16'hbed2;
    stim[3] = 16'h1ea2;
    stim[4] = 16'ha842;
    stim[5] = 16'he026;
    stim[6] = 16'h3bfc;
    stim[7] = 16'h3a27;
    stim[8] = 16'h8156;
    stim[9] = 16'h7307;
    stim[10] = 16'h1445;
    stim[11] = 16'hbaa5;
    stim[12] = 16'h4389;
    stim[13] = 16'h4c8c;
    stim[14] = 16'h8900;
    stim[15] = 16'h3427;
    stim[16] = 16'h213e;
    stim[17] = 16'hcaec;
    stim[18] = 16'h40a0;
    stim[19] = 16'h64d5;
    stim[20] = 16'h3b86;
    stim[21] = 16'h166e;
    stim[22] = 16'h148f;
    stim[23] = 16'h798f;
    stim[24] = 16'he95b;
    stim[25] = 16'h12f8;
    stim[26] = 16'h4bca;
    stim[27] = 16'h9568;
    stim[28] = 16'hddb0;
    stim[29] = 16'he96c;
    stim[30] = 16'h4bf1;
    stim[31] = 16'h0641;
    stim[32] = 16'he9c1;
    stim[33] = 16'h7bd5;
    stim[34] = 16'hdd60;
    stim[35] = 16'hc65b;
    stim[36] = 16'h11bb;
    stim[37] = 16'h5aac;
    stim[38] = 16'h4803;
    stim[39] = 16'h9cb3;
    stim[40] = 16'h2dc1;
    stim[41] = 16'h0876;
    stim[42] = 16'h5d9f;
    stim[43] = 16'hf30b;
    stim[44] = 16'h2719;
    stim[45] = 16'h4338;
    stim[46] = 16'hd9ec;
    stim[47] = 16'hb58a;
    stim[48] = 16'hef58;
    stim[49] = 16'h4149;
    stim[50] = 16'h6e3e;
    stim[51] = 16'h60ec;
    stim[52] = 16'h09a1;
    stim[53] = 16'hfc80;
    stim[54] = 16'h7874;
    stim[55] = 16'h2147;
    stim[56] = 16'hed49;
    stim[57] = 16'h6c03;
    stim[58] = 16'h1c59;
    stim[59] = 16'h4e13;
    stim[60] = 16'hb9b9;
    stim[61] = 16'ha909;
    stim[62] = 16'hac4b;
    stim[63] = 16'h81d2;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h4;
      expv[4] = 4'h1;
      expv[5] = 4'h1;
      expv[6] = 4'hc;
      expv[7] = 4'h4;
      expv[8] = 4'h2;
      expv[9] = 4'h8;
      expv[10] = 4'ha;
      expv[11] = 4'h4;
      expv[12] = 4'h8;
      expv[13] = 4'hb;
      expv[14] = 4'h7;
      expv[15] = 4'h8;
      expv[16] = 4'hc;
      expv[17] = 4'h3;
      expv[18] = 4'hb;
      expv[19] = 4'h9;
      expv[20] = 4'h4;
      expv[21] = 4'h8;
      expv[22] = 4'h2;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'he;
      expv[26] = 4'h3;
      expv[27] = 4'h6;
      expv[28] = 4'h2;
      expv[29] = 4'h1;
      expv[30] = 4'h0;
      expv[31] = 4'h9;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h2;
      expv[35] = 4'h0;
      expv[36] = 4'h4;
      expv[37] = 4'ha;
      expv[38] = 4'h3;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h8;
      expv[42] = 4'h2;
      expv[43] = 4'h0;
      expv[44] = 4'h8;
      expv[45] = 4'hb;
      expv[46] = 4'h2;
      expv[47] = 4'h4;
      expv[48] = 4'h1;
      expv[49] = 4'ha;
      expv[50] = 4'h8;
      expv[51] = 4'h9;
      expv[52] = 4'h6;
      expv[53] = 4'h0;
      expv[54] = 4'h8;
      expv[55] = 4'h8;
      expv[56] = 4'h0;
      expv[57] = 4'h1;
      expv[58] = 4'h2;
      expv[59] = 4'h0;
      expv[60] = 4'h4;
      expv[61] = 4'h4;
      expv[62] = 4'h1;
      expv[63] = 4'h2;
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
