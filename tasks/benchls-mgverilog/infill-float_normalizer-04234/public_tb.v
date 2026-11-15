// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04234 dut (
    .clk(clk),
    .rst(in_vec[31:31]),
    .arg_0(in_vec[30:10]),
    .arg_1(in_vec[9:9]),
    .arg_2(in_vec[8:8]),
    .arg_3(in_vec[7:3]),
    .arg_4(in_vec[2:2]),
    .arg_5(in_vec[1:1]),
    .arg_6(in_vec[0:0]),
    .ret_0(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'he1ab304b;
    stim[1] = 32'hd045002c;
    stim[2] = 32'h3c1aa3f5;
    stim[3] = 32'h18fb3673;
    stim[4] = 32'h4728c8f9;
    stim[5] = 32'h445c4072;
    stim[6] = 32'h61fade2e;
    stim[7] = 32'h1f552d9b;
    stim[8] = 32'h0ebf8078;
    stim[9] = 32'h41ba6b6c;
    stim[10] = 32'h670a3cce;
    stim[11] = 32'h66c00a0d;
    stim[12] = 32'h0b01ab3c;
    stim[13] = 32'h7c8b862e;
    stim[14] = 32'h0aadf465;
    stim[15] = 32'h4fbfa75f;
    stim[16] = 32'h34a8df01;
    stim[17] = 32'h64eb6444;
    stim[18] = 32'hd1bfb311;
    stim[19] = 32'h1386ad1f;
    stim[20] = 32'h678da61e;
    stim[21] = 32'h436e5008;
    stim[22] = 32'h7bdf4021;
    stim[23] = 32'h7942cb4d;
    stim[24] = 32'h30abe9e5;
    stim[25] = 32'h19622ba3;
    stim[26] = 32'h7daad2c5;
    stim[27] = 32'h35f28b99;
    stim[28] = 32'h7b31262b;
    stim[29] = 32'h67bd5764;
    stim[30] = 32'h38c9b29a;
    stim[31] = 32'h1f5aa73e;
    stim[32] = 32'h3df5dd80;
    stim[33] = 32'h107c3d5d;
    stim[34] = 32'h5f3030bd;
    stim[35] = 32'h7f2641df;
    stim[36] = 32'h0cddc419;
    stim[37] = 32'h15fc2080;
    stim[38] = 32'h5f9e2644;
    stim[39] = 32'h674d9339;
    stim[40] = 32'h0c8b8a50;
    stim[41] = 32'h648bcb17;
    stim[42] = 32'he1b29b0c;
    stim[43] = 32'h41fa5ccb;
    stim[44] = 32'h50bf1b10;
    stim[45] = 32'h5965f2a5;
    stim[46] = 32'h74de6513;
    stim[47] = 32'h9484832b;
    stim[48] = 32'h15fcf425;
    stim[49] = 32'h3ca1b91c;
    stim[50] = 32'h5a9123eb;
    stim[51] = 32'h15bd9acf;
    stim[52] = 32'h1c805680;
    stim[53] = 32'h7e4b8446;
    stim[54] = 32'h6a11a69a;
    stim[55] = 32'h2646f00f;
    stim[56] = 32'h218ab7a5;
    stim[57] = 32'h16f31421;
    stim[58] = 32'h32bcdc26;
    stim[59] = 32'h14db270d;
    stim[60] = 32'h048978e7;
    stim[61] = 32'h444214c2;
    stim[62] = 32'h19a9fcdf;
    stim[63] = 32'h21e5c4ce;
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
      expv[0] = 16'h261a;
      expv[1] = 16'h1504;
      expv[2] = 16'h7550;
      expv[3] = 16'hb98f;
      expv[4] = 16'h7e32;
      expv[5] = 16'h3b10;
      expv[6] = 16'h96b7;
      expv[7] = 16'h4df5;
      expv[8] = 16'h3ceb;
      expv[9] = 16'hb41b;
      expv[10] = 16'he68f;
      expv[11] = 16'h0402;
      expv[12] = 16'h9cb0;
      expv[13] = 16'h96e1;
      expv[14] = 16'ha7e8;
      expv[15] = 16'hacfb;
      expv[16] = 16'h8000;
      expv[17] = 16'h224e;
      expv[18] = 16'h8bec;
      expv[19] = 16'h0d38;
      expv[20] = 16'h8f69;
      expv[21] = 16'h0436;
      expv[22] = 16'h13d0;
      expv[23] = 16'h24b2;
      expv[24] = 16'hedf4;
      expv[25] = 16'hd196;
      expv[26] = 16'h62b4;
      expv[27] = 16'hc944;
      expv[28] = 16'h97b3;
      expv[29] = 16'hb27b;
      expv[30] = 16'h48d8;
      expv[31] = 16'h16a4;
      expv[32] = 16'h43df;
      expv[33] = 16'ha43c;
      expv[34] = 16'hdc0c;
      expv[35] = 16'h6ff2;
      expv[36] = 16'h0388;
      expv[37] = 16'h415f;
      expv[38] = 16'ha1f9;
      expv[39] = 16'h9f64;
      expv[40] = 16'ha8c8;
      expv[41] = 16'h8a48;
      expv[42] = 16'h861b;
      expv[43] = 16'h641f;
      expv[44] = 16'h890b;
      expv[45] = 16'h517c;
      expv[46] = 16'h0b4d;
      expv[47] = 16'h9548;
      expv[48] = 16'h88f4;
      expv[49] = 16'h0fca;
      expv[50] = 16'hf5a9;
      expv[51] = 16'he55b;
      expv[52] = 16'hc1c8;
      expv[53] = 16'ha2e1;
      expv[54] = 16'h4c69;
      expv[55] = 16'h0664;
      expv[56] = 16'h4d5a;
      expv[57] = 16'h0b14;
      expv[58] = 16'h8e6e;
      expv[59] = 16'h0000;
      expv[60] = 16'h7048;
      expv[61] = 16'h6085;
      expv[62] = 16'h6d9a;
      expv[63] = 16'he2e2;
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
