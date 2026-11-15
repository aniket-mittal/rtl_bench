// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031867 dut (
    .clk(clk),
    .rst(in_vec[76:76]),
    .memWriteA(in_vec[75:75]),
    .memWriteB(in_vec[74:74]),
    .addrA(in_vec[73:69]),
    .addrB(in_vec[68:64]),
    .dataInA(in_vec[63:32]),
    .dataInB(in_vec[31:0]),
    .dataOutA(out_vec[63:32]),
    .dataOutB(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h1b01bd4a6b03dce92292;
    stim[1] = 77'h17922ccbec4530277958;
    stim[2] = 77'h08150f890bd84582f52f;
    stim[3] = 77'h046fe0a516e4477fd468;
    stim[4] = 77'h0d4fd9a93e742c8eb317;
    stim[5] = 77'h0b8f91802114087ec99d;
    stim[6] = 77'h011c1f1a09dfd9d84a74;
    stim[7] = 77'h0b36897096a342742456;
    stim[8] = 77'h087face6cce14fe57550;
    stim[9] = 77'h0a3ee5333b9ebb38a761;
    stim[10] = 77'h01661b8509a5075ba98c;
    stim[11] = 77'h0854a8bf8b569ebb58ac;
    stim[12] = 77'h01b14e7e89147bbe992e;
    stim[13] = 77'h0c99cbff82b2c61e24ef;
    stim[14] = 77'h0870146cfe17271fc5dc;
    stim[15] = 77'h0eba949dfac59f360407;
    stim[16] = 77'h0081973bee8ce0351237;
    stim[17] = 77'h04a005bd492576329b81;
    stim[18] = 77'h0e8643a5cad8b4c10894;
    stim[19] = 77'h00489cc4ce8987e2eacb;
    stim[20] = 77'h090b4d58fe6b730c8e9c;
    stim[21] = 77'h0a98feea4dd2bb226580;
    stim[22] = 77'h0d49cb26a85dc379665d;
    stim[23] = 77'h0c11cb0d95d9a2e9ee25;
    stim[24] = 77'h0d4a9d494243ed1272d2;
    stim[25] = 77'h0ec7f7bbf54b597ca864;
    stim[26] = 77'h023d7bf817e895f31f2b;
    stim[27] = 77'h0d4f76aaa62ae67cefb2;
    stim[28] = 77'h0e318d7984a80e8b7584;
    stim[29] = 77'h0be6ceae1b28e47ccd4b;
    stim[30] = 77'h053959136295f20bc403;
    stim[31] = 77'h0bc3a6ff792e2fbe1ee5;
    stim[32] = 77'h02c67f020ddbdb062003;
    stim[33] = 77'h09d6df72e1febcda476b;
    stim[34] = 77'h01bf605517bf62fcac50;
    stim[35] = 77'h03126c12ef2d5dd000ff;
    stim[36] = 77'h072b167e27b745058793;
    stim[37] = 77'h0ba8b63b53f05733ed14;
    stim[38] = 77'h0cc62264796fc8fceb63;
    stim[39] = 77'h0a36c851e32d13c01ab4;
    stim[40] = 77'h0fb3d570145f5275d3b3;
    stim[41] = 77'h0773fa6e35c10135d458;
    stim[42] = 77'h03a86da4ddd5639d392d;
    stim[43] = 77'h02cc8952c48e07945d54;
    stim[44] = 77'h045760306c13b1148255;
    stim[45] = 77'h0ccf7e1f2639ee665883;
    stim[46] = 77'h0b4deb2124c6ae9eac9f;
    stim[47] = 77'h09db4244ded4645b610d;
    stim[48] = 77'h0c335c1441f97911bb7d;
    stim[49] = 77'h07da40025d24ec7f5ceb;
    stim[50] = 77'h0567f84921e8a4ead9ae;
    stim[51] = 77'h0663414931f439577f52;
    stim[52] = 77'h0538ce7c0226da6befa0;
    stim[53] = 77'h017feeb36b42c3057e9a;
    stim[54] = 77'h09f90225c329d3886eef;
    stim[55] = 77'h040f90cc85c504d8000b;
    stim[56] = 77'h0eec250f68c5f0b4c559;
    stim[57] = 77'h04ee0076f0fd1f653261;
    stim[58] = 77'h1c52efc4f0211c0710d8;
    stim[59] = 77'h01ee59f0e5bb441140c1;
    stim[60] = 77'h05997b55831ad09da393;
    stim[61] = 77'h0ad9baf3868cf8a332fa;
    stim[62] = 77'h086217bf8b535e3cc535;
    stim[63] = 77'h14450c93c8a7bb83a5e7;
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
      expv[0] = 64'h00000000xxxxxxxx;
      expv[1] = 64'hxxxxxxxx00000000;
      expv[2] = 64'h00000000xxxxxxxx;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h000000002c8eb317;
      expv[6] = 64'hxxxxxxxx91802114;
      expv[7] = 64'h00000000xxxxxxxx;
      expv[8] = 64'h00000000xxxxxxxx;
      expv[9] = 64'h00000000xxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'h00000000xxxxxxxx;
      expv[12] = 64'hxxxxxxxxe5333b9e;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h00000000xxxxxxxx;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'hcbff82b2xxxxxxxx;
      expv[17] = 64'hxxxxxxxx00000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'ha8bf8b56xxxxxxxx;
      expv[20] = 64'h00000000xxxxxxxx;
      expv[21] = 64'h00000000xxxxxxxx;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'ha2e9ee25xxxxxxxx;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h00000000b4c10894;
      expv[30] = 64'hc379665d00000000;
      expv[31] = 64'h00000000146cfe17;
      expv[32] = 64'hf7bbf54bb4c10894;
      expv[33] = 64'h00000000f7bbf54b;
      expv[34] = 64'hxxxxxxxxceae1b28;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hf20bc40300000000;
      expv[37] = 64'h000000004d58fe6b;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h00000000f7bbf54b;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'hxxxxxxxx00000000;
      expv[42] = 64'hd570145f4d58fe6b;
      expv[43] = 64'hf7bbf54bxxxxxxxx;
      expv[44] = 64'ha8bf8b5600000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h00000000xxxxxxxx;
      expv[47] = 64'h00000000xxxxxxxx;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'ha6ff792e00000000;
      expv[50] = 64'h4505879300000000;
      expv[51] = 64'h7911bb7d00000000;
      expv[52] = 64'hc379665d00000000;
      expv[53] = 64'h45058793ceae1b28;
      expv[54] = 64'h00000000f20bc403;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'ha4ead9ae00000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h04d8000b1f653261;
      expv[60] = 64'hf0b4c55900000000;
      expv[61] = 64'h00000000d09da393;
      expv[62] = 64'h00000000a8bf8b56;
      expv[63] = 64'ha8bf8b5600000000;
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
