// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194864 dut (
    .clk(clk),
    .rst_n(in_vec[28:28]),
    .de(in_vec[27:27]),
    .hsync(in_vec[26:26]),
    .vsync(in_vec[25:25]),
    .pclk(in_vec[24:24]),
    .rgb(in_vec[23:0]),
    .rgb0(out_vec[24:1]),
    .start(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h09897133;
    stim[1] = 29'h03ea37c2;
    stim[2] = 29'h137b06df;
    stim[3] = 29'h1fc257b1;
    stim[4] = 29'h1300f77f;
    stim[5] = 29'h1f5619a8;
    stim[6] = 29'h102e3d60;
    stim[7] = 29'h13928702;
    stim[8] = 29'h1c6a5cf8;
    stim[9] = 29'h1be92b36;
    stim[10] = 29'h14e89d36;
    stim[11] = 29'h1fcf27d7;
    stim[12] = 29'h1caf7a61;
    stim[13] = 29'h1f9b060d;
    stim[14] = 29'h1c333571;
    stim[15] = 29'h17fb3177;
    stim[16] = 29'h1de4dd54;
    stim[17] = 29'h19062e70;
    stim[18] = 29'h1c381b33;
    stim[19] = 29'h139a84b1;
    stim[20] = 29'h19efe724;
    stim[21] = 29'h11b78235;
    stim[22] = 29'h150daa7b;
    stim[23] = 29'h12d1d8d0;
    stim[24] = 29'h14f1c6d3;
    stim[25] = 29'h17900bea;
    stim[26] = 29'h1006beeb;
    stim[27] = 29'h13b15e5e;
    stim[28] = 29'h1164860a;
    stim[29] = 29'h1721a94d;
    stim[30] = 29'h15cf5183;
    stim[31] = 29'h1a011fa1;
    stim[32] = 29'h1968c159;
    stim[33] = 29'h1d3042f6;
    stim[34] = 29'h10ff948d;
    stim[35] = 29'h11690881;
    stim[36] = 29'h1c2fda62;
    stim[37] = 29'h1ef693bc;
    stim[38] = 29'h1f02e4cb;
    stim[39] = 29'h1f554bc4;
    stim[40] = 29'h126eabdc;
    stim[41] = 29'h1d1f800f;
    stim[42] = 29'h1d83eb98;
    stim[43] = 29'h11fa912f;
    stim[44] = 29'h15a24faa;
    stim[45] = 29'h1afe996d;
    stim[46] = 29'h10cce7d0;
    stim[47] = 29'h1b8df8a5;
    stim[48] = 29'h0d9faa9d;
    stim[49] = 29'h09725a7c;
    stim[50] = 29'h16fc5689;
    stim[51] = 29'h1feb595b;
    stim[52] = 29'h17d39d53;
    stim[53] = 29'h14bdcc6b;
    stim[54] = 29'h1adb568a;
    stim[55] = 29'h1f7954cf;
    stim[56] = 29'h19b4f500;
    stim[57] = 29'h1bff47bc;
    stim[58] = 29'h179f4d2f;
    stim[59] = 29'h1bb29385;
    stim[60] = 29'h17bb2b69;
    stim[61] = 29'h10676222;
    stim[62] = 29'h16e06125;
    stim[63] = 29'h1faff31b;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h001eeff;
      expv[6] = 25'h001eefe;
      expv[7] = 25'h001eefe;
      expv[8] = 25'h001eefe;
      expv[9] = 25'h001eefe;
      expv[10] = 25'h1d2566d;
      expv[11] = 25'h1d2566d;
      expv[12] = 25'h1d2566c;
      expv[13] = 25'h1d2566c;
      expv[14] = 25'h1d2566c;
      expv[15] = 25'h1d2566c;
      expv[16] = 25'h1d2566c;
      expv[17] = 25'h1d2566c;
      expv[18] = 25'h00c5ce1;
      expv[19] = 25'h00c5ce0;
      expv[20] = 25'h00c5ce0;
      expv[21] = 25'h00c5ce0;
      expv[22] = 25'h16f046b;
      expv[23] = 25'h16f046a;
      expv[24] = 25'h16f046a;
      expv[25] = 25'h16f046a;
      expv[26] = 25'h16f046a;
      expv[27] = 25'h16f046a;
      expv[28] = 25'h16f046a;
      expv[29] = 25'h16f046a;
      expv[30] = 25'h16f046a;
      expv[31] = 25'h16f046a;
      expv[32] = 25'h16f046a;
      expv[33] = 25'h16f046a;
      expv[34] = 25'h16f046a;
      expv[35] = 25'h16f046a;
      expv[36] = 25'h16f046a;
      expv[37] = 25'h16f046a;
      expv[38] = 25'h1ed2779;
      expv[39] = 25'h1ed2779;
      expv[40] = 25'h1ed2778;
      expv[41] = 25'h1ed2778;
      expv[42] = 25'h1ed2778;
      expv[43] = 25'h107d731;
      expv[44] = 25'h107d730;
      expv[45] = 25'h107d730;
      expv[46] = 25'h107d730;
      expv[47] = 25'h107d730;
      expv[48] = 25'h0000000;
      expv[49] = 25'h0000000;
      expv[50] = 25'h0000000;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000000;
      expv[53] = 25'h1a73aa7;
      expv[54] = 25'h1a73aa6;
      expv[55] = 25'h1a73aa6;
      expv[56] = 25'h1a73aa6;
      expv[57] = 25'h1a73aa6;
      expv[58] = 25'h1a73aa6;
      expv[59] = 25'h1a73aa6;
      expv[60] = 25'h1a73aa6;
      expv[61] = 25'h17656d3;
      expv[62] = 25'h17656d2;
      expv[63] = 25'h17656d2;
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
