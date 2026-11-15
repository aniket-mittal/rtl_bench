// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_163381 dut (
    .opd_1(in_vec[19:12]),
    .opd_2(in_vec[11:4]),
    .opcode(in_vec[3:0]),
    .res(out_vec[17:2]),
    .c_flag(out_vec[1:1]),
    .z_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h1430d;
    stim[1] = 20'h7bcf2;
    stim[2] = 20'hbed54;
    stim[3] = 20'h1bf43;
    stim[4] = 20'h08f65;
    stim[5] = 20'h5953b;
    stim[6] = 20'h08fc4;
    stim[7] = 20'h27ddd;
    stim[8] = 20'hbede1;
    stim[9] = 20'h35106;
    stim[10] = 20'h3a744;
    stim[11] = 20'h78f74;
    stim[12] = 20'h4184c;
    stim[13] = 20'he33c4;
    stim[14] = 20'h8d0bc;
    stim[15] = 20'hba175;
    stim[16] = 20'h87ce5;
    stim[17] = 20'h4af01;
    stim[18] = 20'hb0e88;
    stim[19] = 20'hd7fb8;
    stim[20] = 20'heca49;
    stim[21] = 20'h61fdf;
    stim[22] = 20'h64dd3;
    stim[23] = 20'hd6da7;
    stim[24] = 20'hc68d9;
    stim[25] = 20'hde1c4;
    stim[26] = 20'h9d86c;
    stim[27] = 20'ha3b4f;
    stim[28] = 20'h6ad1b;
    stim[29] = 20'h70431;
    stim[30] = 20'h92af0;
    stim[31] = 20'h146c9;
    stim[32] = 20'h3f56c;
    stim[33] = 20'he0d7f;
    stim[34] = 20'h15b97;
    stim[35] = 20'hf1f87;
    stim[36] = 20'h8b922;
    stim[37] = 20'h27d34;
    stim[38] = 20'hc4d51;
    stim[39] = 20'h45dad;
    stim[40] = 20'hee48f;
    stim[41] = 20'hc6922;
    stim[42] = 20'h6496d;
    stim[43] = 20'ha8e85;
    stim[44] = 20'h32ecf;
    stim[45] = 20'hc8cf7;
    stim[46] = 20'h12b02;
    stim[47] = 20'h09336;
    stim[48] = 20'he9724;
    stim[49] = 20'h1d22c;
    stim[50] = 20'hdebfb;
    stim[51] = 20'h2065c;
    stim[52] = 20'h00d33;
    stim[53] = 20'hbda89;
    stim[54] = 20'hcfd1b;
    stim[55] = 20'hc5171;
    stim[56] = 20'h331bb;
    stim[57] = 20'ha7831;
    stim[58] = 20'h17536;
    stim[59] = 20'ha94d5;
    stim[60] = 20'h3ee94;
    stim[61] = 20'he2730;
    stim[62] = 20'h13994;
    stim[63] = 20'hc0369;
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
      expv[0] = 18'h00001;
      expv[1] = 18'h002b2;
      expv[2] = 18'h002f4;
      expv[3] = 18'h000a2;
      expv[4] = 18'h00024;
      expv[5] = 18'h002c8;
      expv[6] = 18'h0001c;
      expv[7] = 18'h00001;
      expv[8] = 18'h00272;
      expv[9] = 18'h000d4;
      expv[10] = 18'h000e4;
      expv[11] = 18'h001dc;
      expv[12] = 18'h00082;
      expv[13] = 18'h00388;
      expv[14] = 18'h0011a;
      expv[15] = 18'h002ec;
      expv[16] = 18'h00220;
      expv[17] = 18'h000ea;
      expv[18] = 18'h003e0;
      expv[19] = 18'h003fc;
      expv[20] = 18'h00120;
      expv[21] = 18'h00001;
      expv[22] = 18'h00222;
      expv[23] = 18'h00348;
      expv[24] = 18'h0012c;
      expv[25] = 18'h00374;
      expv[26] = 18'h0013a;
      expv[27] = 18'h00001;
      expv[28] = 18'h00350;
      expv[29] = 18'h002cc;
      expv[30] = 18'h00106;
      expv[31] = 18'h001e0;
      expv[32] = 18'h0007e;
      expv[33] = 18'h00001;
      expv[34] = 18'h00044;
      expv[35] = 18'h003c0;
      expv[36] = 18'h003e6;
      expv[37] = 18'h00098;
      expv[38] = 18'h00266;
      expv[39] = 18'h00001;
      expv[40] = 18'h00001;
      expv[41] = 18'h000d0;
      expv[42] = 18'h00001;
      expv[43] = 18'h002a4;
      expv[44] = 18'h00001;
      expv[45] = 18'h00320;
      expv[46] = 18'h0018a;
      expv[47] = 18'h00024;
      expv[48] = 18'h003a0;
      expv[49] = 18'h0003a;
      expv[50] = 18'h002f2;
      expv[51] = 18'h00040;
      expv[52] = 18'h000ba;
      expv[53] = 18'h00054;
      expv[54] = 18'h0027a;
      expv[55] = 18'h00374;
      expv[56] = 18'h00198;
      expv[57] = 18'h000aa;
      expv[58] = 18'h0005c;
      expv[59] = 18'h002a8;
      expv[60] = 18'h000f4;
      expv[61] = 18'h00156;
      expv[62] = 18'h00048;
      expv[63] = 18'h003d8;
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
