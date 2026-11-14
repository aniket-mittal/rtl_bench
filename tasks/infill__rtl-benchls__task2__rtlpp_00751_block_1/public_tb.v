// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00751 dut (
    .i_data_A(in_vec[67:36]),
    .i_data_B(in_vec[35:4]),
    .i_alu_control(in_vec[3:0]),
    .o_zero_flag(out_vec[32:32]),
    .o_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h607fd15e5782a097b;
    stim[1] = 68'hd285275c5e272c89d;
    stim[2] = 68'h61d1ba91e6183b654;
    stim[3] = 68'h29001180971707d09;
    stim[4] = 68'hb2e1480eeea83d25b;
    stim[5] = 68'hd64d6121929dea99c;
    stim[6] = 68'hb79b96da986f5d32f;
    stim[7] = 68'h9c1cccff20fad7128;
    stim[8] = 68'h1d8eab55055cd4cf1;
    stim[9] = 68'hfb1576412de3f1187;
    stim[10] = 68'hd1e05dcae95e8ff87;
    stim[11] = 68'h37906d91d8a52ad6b;
    stim[12] = 68'hdf61677ec0ab7ece9;
    stim[13] = 68'h2c24cc3e156620da7;
    stim[14] = 68'hd298f8774849e9ee4;
    stim[15] = 68'hb4cca48454551bdb1;
    stim[16] = 68'he902caef420d491b1;
    stim[17] = 68'h6a96cd57d988dee33;
    stim[18] = 68'hf77dcf83b8f14fd17;
    stim[19] = 68'he6957dcb754dd832d;
    stim[20] = 68'hfe9e5501bea056016;
    stim[21] = 68'h8270236b8fd920385;
    stim[22] = 68'h130752ac214b89f2c;
    stim[23] = 68'h293e0284255db94a7;
    stim[24] = 68'hd0f3ffad44e20d4e5;
    stim[25] = 68'h1ab0269e44222173a;
    stim[26] = 68'hbefa87a5ca64ebfbe;
    stim[27] = 68'hf93b36a229990a42a;
    stim[28] = 68'h32f6241b36ab7c3f3;
    stim[29] = 68'hf14915bdb50d418a0;
    stim[30] = 68'hfad1c43ad118817e6;
    stim[31] = 68'hf23292ff4dc1c4aef;
    stim[32] = 68'hd1450acc3d9c32c33;
    stim[33] = 68'h902d00a5b08f0b2b1;
    stim[34] = 68'ha650a79711863d3da;
    stim[35] = 68'he3c653ce9e6252f32;
    stim[36] = 68'he6de7e4856ba50e0e;
    stim[37] = 68'hd03a438dc590758bb;
    stim[38] = 68'h0c2147f2aefe8402b;
    stim[39] = 68'ha3f132fb5fc340216;
    stim[40] = 68'h88951382cc00fd9c7;
    stim[41] = 68'h136af3305b782fbd3;
    stim[42] = 68'ha269964316e42a60c;
    stim[43] = 68'h02eebaeda92ab6c75;
    stim[44] = 68'h9d4400a059fbaaf21;
    stim[45] = 68'h65901717cf45cee34;
    stim[46] = 68'h7a39d2b432316f0df;
    stim[47] = 68'h89834ba7c22b4ba58;
    stim[48] = 68'hed821914c29fd57b1;
    stim[49] = 68'h509531110403bfcea;
    stim[50] = 68'h9611d2fe77dcc3421;
    stim[51] = 68'h65728cd6a46de1372;
    stim[52] = 68'h1ae2c8670f5f3d0bb;
    stim[53] = 68'h26e402dac58ead7d4;
    stim[54] = 68'h6432a6ab293c24a30;
    stim[55] = 68'h5e30e647a600b0c89;
    stim[56] = 68'he00e4a3e860473c13;
    stim[57] = 68'h39e7ee337d3f8c846;
    stim[58] = 68'h818b278e4dcc4d2f0;
    stim[59] = 68'h5756e436e9debee7d;
    stim[60] = 68'hef7402bc94686e975;
    stim[61] = 68'h6c652442a9a9fbff5;
    stim[62] = 68'h3281c3379ef8da6eb;
    stim[63] = 68'h92fce0f50e808ea7d;
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
      expv[0] = 33'h05e0a825d;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'h01826440a;
      expv[3] = 33'h0971707d0;
      expv[4] = 33'h0f497baa0;
      expv[5] = 33'h0494ef54c;
      expv[6] = 33'hxxxxxxxxx;
      expv[7] = 33'h100000000;
      expv[8] = 33'h01ddeffdf;
      expv[9] = 33'h100000000;
      expv[10] = 33'h000000001;
      expv[11] = 33'h0956b6c52;
      expv[12] = 33'h000000003;
      expv[13] = 33'h100000000;
      expv[14] = 33'h025260600;
      expv[15] = 33'h0f4ddbfdf;
      expv[16] = 33'h0eb0fcbff;
      expv[17] = 33'h0b31e13b4;
      expv[18] = 33'h100000000;
      expv[19] = 33'hxxxxxxxxx;
      expv[20] = 33'h03ffdff00;
      expv[21] = 33'hxxxxxxxxx;
      expv[22] = 33'h0000214b8;
      expv[23] = 33'h100000000;
      expv[24] = 33'hxxxxxxxxx;
      expv[25] = 33'h0d108885c;
      expv[26] = 33'hxxxxxxxxx;
      expv[27] = 33'h0a6642908;
      expv[28] = 33'h0045d5824;
      expv[29] = 33'h0b1090188;
      expv[30] = 33'h029b942bc;
      expv[31] = 33'hxxxxxxxxx;
      expv[32] = 33'h0ecd9380f;
      expv[33] = 33'h0b0af0baf;
      expv[34] = 33'h09e88c31e;
      expv[35] = 33'h08228a6c1;
      expv[36] = 33'hxxxxxxxxx;
      expv[37] = 33'h0ac5e2c83;
      expv[38] = 33'h0a100abbf;
      expv[39] = 33'h0442df2da;
      expv[40] = 33'h000000001;
      expv[41] = 33'h04812dc8d;
      expv[42] = 33'h002dc854c;
      expv[43] = 33'hxxxxxxxxx;
      expv[44] = 33'h0ddffaaf2;
      expv[45] = 33'h0102a2008;
      expv[46] = 33'hxxxxxxxxx;
      expv[47] = 33'h015a5d280;
      expv[48] = 33'h0ef9fdd7f;
      expv[49] = 33'h07f9c0807;
      expv[50] = 33'h0f7ddd3fe;
      expv[51] = 33'h009e06e0d;
      expv[52] = 33'h0161ebe7a;
      expv[53] = 33'h018115000;
      expv[54] = 33'h0203024a3;
      expv[55] = 33'h0014c0161;
      expv[56] = 33'h0660a39ff;
      expv[57] = 33'h0bca861af;
      expv[58] = 33'h00188050e;
      expv[59] = 33'hxxxxxxxxx;
      expv[60] = 33'hxxxxxxxxx;
      expv[61] = 33'hxxxxxxxxx;
      expv[62] = 33'h0f1b4dd3d;
      expv[63] = 33'hxxxxxxxxx;
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
