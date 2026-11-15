// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220862 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .ld(in_vec[18:18]),
    .acc(in_vec[17:17]),
    .ce(in_vec[16:16]),
    .phase_in(in_vec[15:0]),
    .phase_out(out_vec[16:1]),
    .phase_out_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hb5e17;
    stim[1] = 20'hf3fe3;
    stim[2] = 20'h58a4e;
    stim[3] = 20'h00fef;
    stim[4] = 20'h27f75;
    stim[5] = 20'h3485d;
    stim[6] = 20'h2050f;
    stim[7] = 20'h6a9c4;
    stim[8] = 20'h5ee24;
    stim[9] = 20'h2aebd;
    stim[10] = 20'h2797f;
    stim[11] = 20'h5c6ab;
    stim[12] = 20'h1485e;
    stim[13] = 20'h6e63e;
    stim[14] = 20'h27692;
    stim[15] = 20'h1f740;
    stim[16] = 20'h1f7f5;
    stim[17] = 20'h38f77;
    stim[18] = 20'h40104;
    stim[19] = 20'h7ef40;
    stim[20] = 20'h1bbf3;
    stim[21] = 20'h26e26;
    stim[22] = 20'h05901;
    stim[23] = 20'h7db6b;
    stim[24] = 20'h6c129;
    stim[25] = 20'h365f2;
    stim[26] = 20'h3b02e;
    stim[27] = 20'h48593;
    stim[28] = 20'h4102e;
    stim[29] = 20'h4db94;
    stim[30] = 20'h692ed;
    stim[31] = 20'h0d813;
    stim[32] = 20'h52164;
    stim[33] = 20'h789e3;
    stim[34] = 20'h4101b;
    stim[35] = 20'h50d96;
    stim[36] = 20'h3e7a5;
    stim[37] = 20'h37fc7;
    stim[38] = 20'h2eace;
    stim[39] = 20'h422e3;
    stim[40] = 20'h1935a;
    stim[41] = 20'h36137;
    stim[42] = 20'h400a8;
    stim[43] = 20'h1372a;
    stim[44] = 20'h01530;
    stim[45] = 20'h7d611;
    stim[46] = 20'h374e4;
    stim[47] = 20'h5beec;
    stim[48] = 20'ha830b;
    stim[49] = 20'h436e4;
    stim[50] = 20'h55a84;
    stim[51] = 20'h095f1;
    stim[52] = 20'h5561e;
    stim[53] = 20'h72bc4;
    stim[54] = 20'h6b08e;
    stim[55] = 20'h103ad;
    stim[56] = 20'h04082;
    stim[57] = 20'h66ab3;
    stim[58] = 20'h164d5;
    stim[59] = 20'h3ca61;
    stim[60] = 20'h77d7e;
    stim[61] = 20'h4a19f;
    stim[62] = 20'h2e48d;
    stim[63] = 20'h79b88;
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
      expv[6] = 17'h0008a;
      expv[7] = 17'h0008a;
      expv[8] = 17'h0008a;
      expv[9] = 17'h0008a;
      expv[10] = 17'h0008a;
      expv[11] = 17'h0008a;
      expv[12] = 17'h0008a;
      expv[13] = 17'h0008a;
      expv[14] = 17'h0008a;
      expv[15] = 17'h0008a;
      expv[16] = 17'h0008a;
      expv[17] = 17'h0008a;
      expv[18] = 17'h000e6;
      expv[19] = 17'h000e6;
      expv[20] = 17'h00001;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00899;
      expv[25] = 17'h00898;
      expv[26] = 17'h000c0;
      expv[27] = 17'h03c04;
      expv[28] = 17'h03c04;
      expv[29] = 17'h03c04;
      expv[30] = 17'h03c04;
      expv[31] = 17'h03c04;
      expv[32] = 17'h03c04;
      expv[33] = 17'h03c04;
      expv[34] = 17'h00021;
      expv[35] = 17'h00020;
      expv[36] = 17'h00020;
      expv[37] = 17'h0000c;
      expv[38] = 17'h017fc;
      expv[39] = 17'h017fc;
      expv[40] = 17'h017fc;
      expv[41] = 17'h017fc;
      expv[42] = 17'h00022;
      expv[43] = 17'h00022;
      expv[44] = 17'h00022;
      expv[45] = 17'h00022;
      expv[46] = 17'h00001;
      expv[47] = 17'h01dfd;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00057;
      expv[55] = 17'h00056;
      expv[56] = 17'h00056;
      expv[57] = 17'h00056;
      expv[58] = 17'h00056;
      expv[59] = 17'h00056;
      expv[60] = 17'h0006a;
      expv[61] = 17'h0eb51;
      expv[62] = 17'h0eb50;
      expv[63] = 17'h0eb50;
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
