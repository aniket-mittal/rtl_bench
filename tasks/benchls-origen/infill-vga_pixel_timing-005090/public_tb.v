// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005090 dut (
    .pclk(clk),
    .reset(in_vec[24:24]),
    .vga_data(in_vec[23:0]),
    .row(out_vec[46:42]),
    .col(out_vec[41:35]),
    .height(out_vec[34:31]),
    .width(out_vec[30:27]),
    .hsync(out_vec[26:26]),
    .vsync(out_vec[25:25]),
    .valid(out_vec[24:24]),
    .vga_r(out_vec[23:16]),
    .vga_g(out_vec[15:8]),
    .vga_b(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h145ef17;
    stim[1] = 25'h10a528c;
    stim[2] = 25'h0c3b599;
    stim[3] = 25'h035a5b7;
    stim[4] = 25'h0fcd113;
    stim[5] = 25'h0dff2ee;
    stim[6] = 25'h0de6402;
    stim[7] = 25'h07e792f;
    stim[8] = 25'h09ec1c8;
    stim[9] = 25'h0d80ba3;
    stim[10] = 25'h07410ae;
    stim[11] = 25'h08a57b9;
    stim[12] = 25'h02dc219;
    stim[13] = 25'h076d7f7;
    stim[14] = 25'h0e73f7e;
    stim[15] = 25'h035bd36;
    stim[16] = 25'h0f802e4;
    stim[17] = 25'h05e9867;
    stim[18] = 25'h0d64762;
    stim[19] = 25'h017ee46;
    stim[20] = 25'h022ee5c;
    stim[21] = 25'h0eca891;
    stim[22] = 25'h0a9d159;
    stim[23] = 25'h0086fd0;
    stim[24] = 25'h0cf61d0;
    stim[25] = 25'h0d0a6ff;
    stim[26] = 25'h04a6d7e;
    stim[27] = 25'h100a5e2;
    stim[28] = 25'h092ad11;
    stim[29] = 25'h095698d;
    stim[30] = 25'h0ec7ab9;
    stim[31] = 25'h060a2e3;
    stim[32] = 25'h07a50be;
    stim[33] = 25'h0abe5db;
    stim[34] = 25'h048881e;
    stim[35] = 25'h098e300;
    stim[36] = 25'h0d0d1b7;
    stim[37] = 25'h0d8391a;
    stim[38] = 25'h03e9252;
    stim[39] = 25'h0eae344;
    stim[40] = 25'h09f9742;
    stim[41] = 25'h0e42718;
    stim[42] = 25'h0a15a36;
    stim[43] = 25'h0e7e132;
    stim[44] = 25'h032716e;
    stim[45] = 25'h081ecaa;
    stim[46] = 25'h09a986e;
    stim[47] = 25'h0d777be;
    stim[48] = 25'h0da81df;
    stim[49] = 25'h0be0e15;
    stim[50] = 25'h0c7524d;
    stim[51] = 25'h0c878b9;
    stim[52] = 25'h0c81ab4;
    stim[53] = 25'h0fc6a9f;
    stim[54] = 25'h00a702a;
    stim[55] = 25'h0d29834;
    stim[56] = 25'h085b315;
    stim[57] = 25'h0bef262;
    stim[58] = 25'h08ad27f;
    stim[59] = 25'h041bbf8;
    stim[60] = 25'h0cfb58f;
    stim[61] = 25'h0ccd0f3;
    stim[62] = 25'h078de0f;
    stim[63] = 25'h0572f9d;
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
      expv[0] = 47'h00000645ef17;
      expv[1] = 47'h0000060a528c;
      expv[2] = 47'h000006c3b599;
      expv[3] = 47'h00000035a5b7;
      expv[4] = 47'h000000fcd113;
      expv[5] = 47'h000000dff2ee;
      expv[6] = 47'h000000de6402;
      expv[7] = 47'h0000007e792f;
      expv[8] = 47'h0000009ec1c8;
      expv[9] = 47'h000000d80ba3;
      expv[10] = 47'h0000007410ae;
      expv[11] = 47'h0000008a57b9;
      expv[12] = 47'h0000002dc219;
      expv[13] = 47'h00000076d7f7;
      expv[14] = 47'h000000e73f7e;
      expv[15] = 47'h00000035bd36;
      expv[16] = 47'h000000f802e4;
      expv[17] = 47'h0000005e9867;
      expv[18] = 47'h000000d64762;
      expv[19] = 47'h00000017ee46;
      expv[20] = 47'h00000022ee5c;
      expv[21] = 47'h000000eca891;
      expv[22] = 47'h000000a9d159;
      expv[23] = 47'h000000086fd0;
      expv[24] = 47'h000000cf61d0;
      expv[25] = 47'h000000d0a6ff;
      expv[26] = 47'h0000004a6d7e;
      expv[27] = 47'h00000600a5e2;
      expv[28] = 47'h00000692ad11;
      expv[29] = 47'h00000095698d;
      expv[30] = 47'h000000ec7ab9;
      expv[31] = 47'h00000060a2e3;
      expv[32] = 47'h0000007a50be;
      expv[33] = 47'h000000abe5db;
      expv[34] = 47'h00000048881e;
      expv[35] = 47'h00000098e300;
      expv[36] = 47'h000000d0d1b7;
      expv[37] = 47'h000000d8391a;
      expv[38] = 47'h0000003e9252;
      expv[39] = 47'h000000eae344;
      expv[40] = 47'h0000009f9742;
      expv[41] = 47'h000000e42718;
      expv[42] = 47'h000000a15a36;
      expv[43] = 47'h000000e7e132;
      expv[44] = 47'h00000032716e;
      expv[45] = 47'h00000081ecaa;
      expv[46] = 47'h0000009a986e;
      expv[47] = 47'h000000d777be;
      expv[48] = 47'h000000da81df;
      expv[49] = 47'h000000be0e15;
      expv[50] = 47'h000000c7524d;
      expv[51] = 47'h000000c878b9;
      expv[52] = 47'h000000c81ab4;
      expv[53] = 47'h000000fc6a9f;
      expv[54] = 47'h0000000a702a;
      expv[55] = 47'h000000d29834;
      expv[56] = 47'h00000085b315;
      expv[57] = 47'h000000bef262;
      expv[58] = 47'h0000008ad27f;
      expv[59] = 47'h00000041bbf8;
      expv[60] = 47'h000000cfb58f;
      expv[61] = 47'h000000ccd0f3;
      expv[62] = 47'h00000078de0f;
      expv[63] = 47'h000000572f9d;
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
