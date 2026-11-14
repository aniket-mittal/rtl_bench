// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
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
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h285d3cea;
    stim[1] = 30'h1757994c;
    stim[2] = 30'h0b767a31;
    stim[3] = 30'h15b37187;
    stim[4] = 30'h1eb577d2;
    stim[5] = 30'h1cbac619;
    stim[6] = 30'h29e35946;
    stim[7] = 30'h3b92b61a;
    stim[8] = 30'h2d7bc704;
    stim[9] = 30'h3cc59cb9;
    stim[10] = 30'h0f971593;
    stim[11] = 30'h08e57cd0;
    stim[12] = 30'h33eb9e38;
    stim[13] = 30'h2538a606;
    stim[14] = 30'h397fb8a9;
    stim[15] = 30'h3ede8119;
    stim[16] = 30'h082df34a;
    stim[17] = 30'h1f05df94;
    stim[18] = 30'h30190c1e;
    stim[19] = 30'h184daee4;
    stim[20] = 30'h14a218dd;
    stim[21] = 30'h03252e6e;
    stim[22] = 30'h3b927ed8;
    stim[23] = 30'h11e15a55;
    stim[24] = 30'h1798cc8c;
    stim[25] = 30'h13878c25;
    stim[26] = 30'h23defea8;
    stim[27] = 30'h36e00bf8;
    stim[28] = 30'h0b103aed;
    stim[29] = 30'h2f6ff062;
    stim[30] = 30'h3cbc5a1e;
    stim[31] = 30'h1e1ed4b6;
    stim[32] = 30'h08f0ef54;
    stim[33] = 30'h0d139592;
    stim[34] = 30'h172d69d0;
    stim[35] = 30'h2bcf9833;
    stim[36] = 30'h21773ab1;
    stim[37] = 30'h07730750;
    stim[38] = 30'h39ee5641;
    stim[39] = 30'h1fbb61a5;
    stim[40] = 30'h2c95570d;
    stim[41] = 30'h3c1c0a5d;
    stim[42] = 30'h31741684;
    stim[43] = 30'h362acb2d;
    stim[44] = 30'h1d91cfb7;
    stim[45] = 30'h21a9b2ed;
    stim[46] = 30'h3085d044;
    stim[47] = 30'h1d559f64;
    stim[48] = 30'h2c406760;
    stim[49] = 30'h3606b83f;
    stim[50] = 30'h2910fc3d;
    stim[51] = 30'h2deac27b;
    stim[52] = 30'h3a2fb40a;
    stim[53] = 30'h0d518c02;
    stim[54] = 30'h0b1e48ca;
    stim[55] = 30'h07a2d80e;
    stim[56] = 30'h262775a1;
    stim[57] = 30'h295478f3;
    stim[58] = 30'h375fd326;
    stim[59] = 30'h1e44083e;
    stim[60] = 30'h3924e289;
    stim[61] = 30'h2d6f176a;
    stim[62] = 30'h1ce310ad;
    stim[63] = 30'h1b2a5961;
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
      expv[0] = 32'ha14af3ab;
      expv[1] = 32'h5d606533;
      expv[2] = 32'h2de7e8c7;
      expv[3] = 32'h56f3c61f;
      expv[4] = 32'h7aebdf4b;
      expv[5] = 32'h72d51867;
      expv[6] = 32'ha7b3651b;
      expv[7] = 32'hee74d86b;
      expv[8] = 32'hb5d11c13;
      expv[9] = 32'hf32872e7;
      expv[10] = 32'h3e62564f;
      expv[11] = 32'h23abf343;
      expv[12] = 32'hcf9078e3;
      expv[13] = 32'h94dc981b;
      expv[14] = 32'he5c0e2a7;
      expv[15] = 32'hfb440467;
      expv[16] = 32'h2089cd2b;
      expv[17] = 32'h7c297e53;
      expv[18] = 32'hc05a307b;
      expv[19] = 32'h6108bb93;
      expv[20] = 32'h52b66377;
      expv[21] = 32'h0caab9bb;
      expv[22] = 32'hee77fb63;
      expv[23] = 32'h47bb6957;
      expv[24] = 32'h5e5d3233;
      expv[25] = 32'h4e203097;
      expv[26] = 32'h8f45faa3;
      expv[27] = 32'hdbbe2fe3;
      expv[28] = 32'h2c7eebb7;
      expv[29] = 32'hbd81c18b;
      expv[30] = 32'hf2cf687b;
      expv[31] = 32'h784552db;
      expv[32] = 32'h23fdbd53;
      expv[33] = 32'h3470564b;
      expv[34] = 32'h5c8ba743;
      expv[35] = 32'haf0060cf;
      expv[36] = 32'h85e2eac7;
      expv[37] = 32'h1df21d43;
      expv[38] = 32'he7875907;
      expv[39] = 32'h7ed38697;
      expv[40] = 32'hb26b5c37;
      expv[41] = 32'hf04e2977;
      expv[42] = 32'hc5ee5a13;
      expv[43] = 32'hd8952cb7;
      expv[44] = 32'h76793edf;
      expv[45] = 32'h8698cbb7;
      expv[46] = 32'hc2294113;
      expv[47] = 32'h75687d93;
      expv[48] = 32'hb13f9d83;
      expv[49] = 32'hd824e0ff;
      expv[50] = 32'ha47df0f7;
      expv[51] = 32'hb79509ef;
      expv[52] = 32'he880d02b;
      expv[53] = 32'h3578300b;
      expv[54] = 32'h2c47232b;
      expv[55] = 32'h1eb5603b;
      expv[56] = 32'h98a3d687;
      expv[57] = 32'ha56fe3cf;
      expv[58] = 32'hdd414c9b;
      expv[59] = 32'h792e20fb;
      expv[60] = 32'he4ad8a27;
      expv[61] = 32'hb5825dab;
      expv[62] = 32'h73b242b7;
      expv[63] = 32'h6c976587;
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
