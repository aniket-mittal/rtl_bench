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

  rtlpp_05843 dut (
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
    stim[0] = 22'h29343f;
    stim[1] = 22'h110ff3;
    stim[2] = 22'h22265c;
    stim[3] = 22'h3608db;
    stim[4] = 22'h221527;
    stim[5] = 22'h26c599;
    stim[6] = 22'h164d18;
    stim[7] = 22'h36eaee;
    stim[8] = 22'h0fe28b;
    stim[9] = 22'h0e490e;
    stim[10] = 22'h335eac;
    stim[11] = 22'h2f6224;
    stim[12] = 22'h0374c5;
    stim[13] = 22'h125d59;
    stim[14] = 22'h22f932;
    stim[15] = 22'h0ba30b;
    stim[16] = 22'h2fcf9c;
    stim[17] = 22'h16e182;
    stim[18] = 22'h3be8bb;
    stim[19] = 22'h0b92b1;
    stim[20] = 22'h377b0c;
    stim[21] = 22'h17af9a;
    stim[22] = 22'h160a20;
    stim[23] = 22'h15ee08;
    stim[24] = 22'h1b785d;
    stim[25] = 22'h3be674;
    stim[26] = 22'h2b2b51;
    stim[27] = 22'h0250ea;
    stim[28] = 22'h1ed86e;
    stim[29] = 22'h16a2c3;
    stim[30] = 22'h1fbaf9;
    stim[31] = 22'h3a65c9;
    stim[32] = 22'h26140b;
    stim[33] = 22'h320997;
    stim[34] = 22'h0a6c8d;
    stim[35] = 22'h0e386d;
    stim[36] = 22'h12eac6;
    stim[37] = 22'h22dfd6;
    stim[38] = 22'h2bca75;
    stim[39] = 22'h2ebc0f;
    stim[40] = 22'h1e874b;
    stim[41] = 22'h2f772c;
    stim[42] = 22'h1adf13;
    stim[43] = 22'h0ac1fd;
    stim[44] = 22'h139937;
    stim[45] = 22'h0fe7ef;
    stim[46] = 22'h1a08b4;
    stim[47] = 22'h1fef85;
    stim[48] = 22'h273fb7;
    stim[49] = 22'h2fbd77;
    stim[50] = 22'h3f8678;
    stim[51] = 22'h1efad3;
    stim[52] = 22'h2a46f2;
    stim[53] = 22'h3f0e4e;
    stim[54] = 22'h2352e0;
    stim[55] = 22'h33b9cb;
    stim[56] = 22'h3ab2b8;
    stim[57] = 22'h26ebea;
    stim[58] = 22'h125b5d;
    stim[59] = 22'h3f42b8;
    stim[60] = 22'h356ccf;
    stim[61] = 22'h2afc5e;
    stim[62] = 22'h3af894;
    stim[63] = 22'h0b9f0b;
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
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h0c34f;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00002;
      expv[14] = 17'h04d18;
      expv[15] = 17'h0c34f;
      expv[16] = 17'h0000e;
      expv[17] = 17'h00000;
      expv[18] = 17'h04d18;
      expv[19] = 17'h00000;
      expv[20] = 17'h0000e;
      expv[21] = 17'h00000;
      expv[22] = 17'h0e182;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h0d86e;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h0a2c3;
      expv[38] = 17'h0a2c3;
      expv[39] = 17'h0d86e;
      expv[40] = 17'h0d86e;
      expv[41] = 17'h0d86e;
      expv[42] = 17'h0d86e;
      expv[43] = 17'h0874b;
      expv[44] = 17'h0000d;
      expv[45] = 17'h0a2c3;
      expv[46] = 17'h0000d;
      expv[47] = 17'h0874b;
      expv[48] = 17'h0874b;
      expv[49] = 17'h0a2c0;
      expv[50] = 17'h0d86e;
      expv[51] = 17'h00000;
      expv[52] = 17'h0874b;
      expv[53] = 17'h0d86e;
      expv[54] = 17'h00000;
      expv[55] = 17'h0a2c0;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h0a2c0;
      expv[59] = 17'h0a2c3;
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
