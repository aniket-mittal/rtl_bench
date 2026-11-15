// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07635 dut (
    .clk(clk),
    .data_in(in_vec[20:6]),
    .lz_pos(in_vec[5:0]),
    .data_out(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h010128;
    stim[1] = 21'h172d36;
    stim[2] = 21'h05724e;
    stim[3] = 21'h0c78b5;
    stim[4] = 21'h0b2441;
    stim[5] = 21'h1a0ba2;
    stim[6] = 21'h1e9fc3;
    stim[7] = 21'h1f30fc;
    stim[8] = 21'h1a26a1;
    stim[9] = 21'h1cd33b;
    stim[10] = 21'h162e11;
    stim[11] = 21'h1ae777;
    stim[12] = 21'h0abcd1;
    stim[13] = 21'h0f6d6b;
    stim[14] = 21'h0487db;
    stim[15] = 21'h057c97;
    stim[16] = 21'h01c278;
    stim[17] = 21'h070ffc;
    stim[18] = 21'h08cfc6;
    stim[19] = 21'h15f0ad;
    stim[20] = 21'h06c9bf;
    stim[21] = 21'h011608;
    stim[22] = 21'h13aa5e;
    stim[23] = 21'h19ad36;
    stim[24] = 21'h1c260c;
    stim[25] = 21'h041be1;
    stim[26] = 21'h1c9903;
    stim[27] = 21'h05da06;
    stim[28] = 21'h0b68cb;
    stim[29] = 21'h1dcb59;
    stim[30] = 21'h0941a8;
    stim[31] = 21'h1e0930;
    stim[32] = 21'h01eded;
    stim[33] = 21'h1f8478;
    stim[34] = 21'h021237;
    stim[35] = 21'h06db45;
    stim[36] = 21'h1c4191;
    stim[37] = 21'h075435;
    stim[38] = 21'h0af4e3;
    stim[39] = 21'h063b9a;
    stim[40] = 21'h1d7aa4;
    stim[41] = 21'h0ce119;
    stim[42] = 21'h0919f2;
    stim[43] = 21'h02510e;
    stim[44] = 21'h030d7a;
    stim[45] = 21'h0baf65;
    stim[46] = 21'h036156;
    stim[47] = 21'h1afa6a;
    stim[48] = 21'h1229a0;
    stim[49] = 21'h1ef3e3;
    stim[50] = 21'h1d9e62;
    stim[51] = 21'h16e085;
    stim[52] = 21'h184982;
    stim[53] = 21'h19b1af;
    stim[54] = 21'h06be1b;
    stim[55] = 21'h12db3d;
    stim[56] = 21'h10cd4c;
    stim[57] = 21'h0eae4c;
    stim[58] = 21'h1ce67f;
    stim[59] = 21'h048fc6;
    stim[60] = 21'h1b3a78;
    stim[61] = 21'h1cb187;
    stim[62] = 21'h04c140;
    stim[63] = 21'h0a9e9c;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h1010;
      expv[3] = 15'h169d;
      expv[4] = 15'h4954;
      expv[5] = 15'h23c6;
      expv[6] = 15'h449a;
      expv[7] = 15'h3a0b;
      expv[8] = 15'h3f2f;
      expv[9] = 15'h619f;
      expv[10] = 15'h0c8b;
      expv[11] = 15'h1967;
      expv[12] = 15'h0c8d;
      expv[13] = 15'h5ceb;
      expv[14] = 15'h67aa;
      expv[15] = 15'h56de;
      expv[16] = 15'h7c24;
      expv[17] = 15'h23d4;
      expv[18] = 15'h0870;
      expv[19] = 15'h7e1c;
      expv[20] = 15'h7e62;
      expv[21] = 15'h21f5;
      expv[22] = 15'h326c;
      expv[23] = 15'h0d10;
      expv[24] = 15'h4ab9;
      expv[25] = 15'h16b3;
      expv[26] = 15'h0c87;
      expv[27] = 15'h7b04;
      expv[28] = 15'h1327;
      expv[29] = 15'h0b74;
      expv[30] = 15'h62da;
      expv[31] = 15'h5a77;
      expv[32] = 15'h3052;
      expv[33] = 15'h120f;
      expv[34] = 15'h72f0;
      expv[35] = 15'h443f;
      expv[36] = 15'h0908;
      expv[37] = 15'h5b6c;
      expv[38] = 15'h3047;
      expv[39] = 15'h055c;
      expv[40] = 15'h65ea;
      expv[41] = 15'h3b8c;
      expv[42] = 15'h2bd7;
      expv[43] = 15'h10e6;
      expv[44] = 15'h7312;
      expv[45] = 15'h0148;
      expv[46] = 15'h5618;
      expv[47] = 15'h5eba;
      expv[48] = 15'h50d8;
      expv[49] = 15'h4beb;
      expv[50] = 15'h3289;
      expv[51] = 15'h79ef;
      expv[52] = 15'h4f37;
      expv[53] = 15'h20ed;
      expv[54] = 15'h3241;
      expv[55] = 15'h31b3;
      expv[56] = 15'h0fac;
      expv[57] = 15'h1b69;
      expv[58] = 15'h5661;
      expv[59] = 15'h4eae;
      expv[60] = 15'h4ce7;
      expv[61] = 15'h7a24;
      expv[62] = 15'h4b9b;
      expv[63] = 15'h31a7;
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
