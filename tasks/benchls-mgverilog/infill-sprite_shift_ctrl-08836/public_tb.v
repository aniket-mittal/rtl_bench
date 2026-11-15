// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08836 dut (
    .clk(clk),
    .reset(in_vec[28:28]),
    .aen(in_vec[27:27]),
    .address(in_vec[26:25]),
    .hpos(in_vec[24:16]),
    .data_in(in_vec[15:0]),
    .sprdata(out_vec[2:1]),
    .attach(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h1d828431;
    stim[1] = 29'h160bb944;
    stim[2] = 29'h0d7fc540;
    stim[3] = 29'h09806bfc;
    stim[4] = 29'h06ab2823;
    stim[5] = 29'h01fa522e;
    stim[6] = 29'h0196fa9a;
    stim[7] = 29'h0ccb5693;
    stim[8] = 29'h0d31648a;
    stim[9] = 29'h00387fe0;
    stim[10] = 29'h0c30e8a3;
    stim[11] = 29'h0a0c00fd;
    stim[12] = 29'h0e34bfa0;
    stim[13] = 29'h05122cdc;
    stim[14] = 29'h0db86bfb;
    stim[15] = 29'h0d8ad7b5;
    stim[16] = 29'h094734ae;
    stim[17] = 29'h0b211ea5;
    stim[18] = 29'h0f89a686;
    stim[19] = 29'h00627006;
    stim[20] = 29'h00cc3f47;
    stim[21] = 29'h07a82bf8;
    stim[22] = 29'h0e03cf77;
    stim[23] = 29'h09de8f21;
    stim[24] = 29'h051b6791;
    stim[25] = 29'h0ad0ea4c;
    stim[26] = 29'h070a1eb3;
    stim[27] = 29'h0b9a0221;
    stim[28] = 29'h04f62ff0;
    stim[29] = 29'h0b4b1219;
    stim[30] = 29'h02fa3de7;
    stim[31] = 29'h04474e1f;
    stim[32] = 29'h0804d982;
    stim[33] = 29'h023c9870;
    stim[34] = 29'h025ef923;
    stim[35] = 29'h0b54ef09;
    stim[36] = 29'h0afc6adf;
    stim[37] = 29'h0f4e118a;
    stim[38] = 29'h0c100ae3;
    stim[39] = 29'h03bbc348;
    stim[40] = 29'h05d18d6c;
    stim[41] = 29'h0e223b85;
    stim[42] = 29'h008a3617;
    stim[43] = 29'h1c5e4b80;
    stim[44] = 29'h0de3d0ac;
    stim[45] = 29'h03c478ab;
    stim[46] = 29'h0163a1b8;
    stim[47] = 29'h039bb19a;
    stim[48] = 29'h0153f5e6;
    stim[49] = 29'h0ac966b6;
    stim[50] = 29'h0361b038;
    stim[51] = 29'h0e8ec786;
    stim[52] = 29'h0174367e;
    stim[53] = 29'h0765d081;
    stim[54] = 29'h0696a3a2;
    stim[55] = 29'h0f664d3c;
    stim[56] = 29'h0f2293c6;
    stim[57] = 29'h0d619645;
    stim[58] = 29'h077c20fe;
    stim[59] = 29'h02856bf9;
    stim[60] = 29'h094f9878;
    stim[61] = 29'h0a019115;
    stim[62] = 29'h08b884dc;
    stim[63] = 29'h0f2ad759;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'hx;
      expv[8] = 3'hx;
      expv[9] = 3'hx;
      expv[10] = 3'hx;
      expv[11] = 3'hx;
      expv[12] = 3'hx;
      expv[13] = 3'hx;
      expv[14] = 3'hx;
      expv[15] = 3'hx;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h1;
      expv[24] = 3'h1;
      expv[25] = 3'h1;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h1;
      expv[55] = 3'h1;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
