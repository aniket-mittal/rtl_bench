// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05598 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3de550;
    stim[1] = 22'h0cc947;
    stim[2] = 22'h07498c;
    stim[3] = 22'h07c3e8;
    stim[4] = 22'h13566c;
    stim[5] = 22'h2fa24e;
    stim[6] = 22'h2316c0;
    stim[7] = 22'h2b9499;
    stim[8] = 22'h0645a3;
    stim[9] = 22'h3b414c;
    stim[10] = 22'h026066;
    stim[11] = 22'h1f4497;
    stim[12] = 22'h3a2cfa;
    stim[13] = 22'h1a2609;
    stim[14] = 22'h035dda;
    stim[15] = 22'h0dc7af;
    stim[16] = 22'h1e6ac9;
    stim[17] = 22'h171fb8;
    stim[18] = 22'h22a255;
    stim[19] = 22'h3bf4a2;
    stim[20] = 22'h37ba3b;
    stim[21] = 22'h1ff389;
    stim[22] = 22'h1840ef;
    stim[23] = 22'h121fd4;
    stim[24] = 22'h17abdc;
    stim[25] = 22'h170377;
    stim[26] = 22'h066d02;
    stim[27] = 22'h1ec81d;
    stim[28] = 22'h0bc07b;
    stim[29] = 22'h0ef2a6;
    stim[30] = 22'h3a4b2a;
    stim[31] = 22'h03fbbe;
    stim[32] = 22'h3adf5f;
    stim[33] = 22'h326abc;
    stim[34] = 22'h2e1b0a;
    stim[35] = 22'h02eaba;
    stim[36] = 22'h0a8a19;
    stim[37] = 22'h0b7c5f;
    stim[38] = 22'h33db0d;
    stim[39] = 22'h3b5fe4;
    stim[40] = 22'h16fbcb;
    stim[41] = 22'h2e4415;
    stim[42] = 22'h3f686b;
    stim[43] = 22'h2ebc71;
    stim[44] = 22'h2fb183;
    stim[45] = 22'h0eae7b;
    stim[46] = 22'h03bc0f;
    stim[47] = 22'h0f0be6;
    stim[48] = 22'h3eafbc;
    stim[49] = 22'h367927;
    stim[50] = 22'h0ace28;
    stim[51] = 22'h136823;
    stim[52] = 22'h3308f3;
    stim[53] = 22'h156aff;
    stim[54] = 22'h26c135;
    stim[55] = 22'h3fd401;
    stim[56] = 22'h262326;
    stim[57] = 22'h1ac5b1;
    stim[58] = 22'h2a3c1f;
    stim[59] = 22'h1ff963;
    stim[60] = 22'h0a4e56;
    stim[61] = 22'h37c48f;
    stim[62] = 22'h069f54;
    stim[63] = 22'h3fd655;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h0c34f;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h0c34f;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00002;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00002;
      expv[37] = 17'h00006;
      expv[38] = 17'h00006;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h0c34f;
      expv[42] = 17'h0c81d;
      expv[43] = 17'h00000;
      expv[44] = 17'h0c81d;
      expv[45] = 17'h0c81d;
      expv[46] = 17'h00006;
      expv[47] = 17'h00000;
      expv[48] = 17'h0000b;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h0000b;
      expv[52] = 17'h0fbcb;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h0c34f;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
