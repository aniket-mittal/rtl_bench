// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01681 dut (
    .clk(clk),
    .ce(in_vec[22:22]),
    .enabled(in_vec[21:21]),
    .obj_size(in_vec[20:20]),
    .obj_patt(in_vec[19:19]),
    .cycle(in_vec[18:16]),
    .temp(in_vec[15:8]),
    .vram_data(in_vec[7:0]),
    .vram_addr(out_vec[43:31]),
    .load(out_vec[30:27]),
    .load_in(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h521c85;
    stim[1] = 23'h6ccd8c;
    stim[2] = 23'h4f325b;
    stim[3] = 23'h0b0dbe;
    stim[4] = 23'h314f08;
    stim[5] = 23'h02d445;
    stim[6] = 23'h3e4deb;
    stim[7] = 23'h47a531;
    stim[8] = 23'h64379e;
    stim[9] = 23'h51a130;
    stim[10] = 23'h511105;
    stim[11] = 23'h34c98e;
    stim[12] = 23'h154d57;
    stim[13] = 23'h7908e1;
    stim[14] = 23'h564bc5;
    stim[15] = 23'h751e28;
    stim[16] = 23'h6a9616;
    stim[17] = 23'h035905;
    stim[18] = 23'h024b50;
    stim[19] = 23'h2c86b0;
    stim[20] = 23'h2e678b;
    stim[21] = 23'h47ad10;
    stim[22] = 23'h1f90be;
    stim[23] = 23'h05e259;
    stim[24] = 23'h5775f8;
    stim[25] = 23'h7344b0;
    stim[26] = 23'h2df309;
    stim[27] = 23'h42a93f;
    stim[28] = 23'h6fc49d;
    stim[29] = 23'h264c23;
    stim[30] = 23'h0ee8a4;
    stim[31] = 23'h47ff0a;
    stim[32] = 23'h1a7aa2;
    stim[33] = 23'h53426b;
    stim[34] = 23'h026a51;
    stim[35] = 23'h706bb6;
    stim[36] = 23'h71f711;
    stim[37] = 23'h0b8176;
    stim[38] = 23'h38718b;
    stim[39] = 23'h781cd2;
    stim[40] = 23'h3ab14f;
    stim[41] = 23'h32cc67;
    stim[42] = 23'h280783;
    stim[43] = 23'h3158d2;
    stim[44] = 23'h36b85e;
    stim[45] = 23'h5ebccb;
    stim[46] = 23'h779bf0;
    stim[47] = 23'h081daf;
    stim[48] = 23'h6ab4ad;
    stim[49] = 23'h10e940;
    stim[50] = 23'h291b2e;
    stim[51] = 23'h11d57d;
    stim[52] = 23'h49a2ee;
    stim[53] = 23'h6cf8c9;
    stim[54] = 23'h4b3b49;
    stim[55] = 23'h4ca70b;
    stim[56] = 23'h5147ac;
    stim[57] = 23'h436e14;
    stim[58] = 23'h5ec8a6;
    stim[59] = 23'h4abe5c;
    stim[60] = 23'h3418fe;
    stim[61] = 23'h762c6e;
    stim[62] = 23'h2605a0;
    stim[63] = 23'h072032;
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
      expv[0] = 44'hxxxxxxxxxe0;
      expv[1] = 44'hxxxxxxxxx6a;
      expv[2] = 44'hxxxxxxxxx95;
      expv[3] = 44'hxxxxxxxxx6a;
      expv[4] = 44'hxxxx0x0x27e;
      expv[5] = 44'hxxxxxxxxxa0;
      expv[6] = 44'hxxxxxxxxx6a;
      expv[7] = 44'hxxxxxxxxx2b;
      expv[8] = 44'hxxxxxxxxxbf;
      expv[9] = 44'hxxxxxxxx50b;
      expv[10] = 44'hd0xxxxxxx8a;
      expv[11] = 44'h88xxxxxxx4a;
      expv[12] = 44'h88xxxxxxx6a;
      expv[13] = 44'h88xxxxxxx40;
      expv[14] = 44'h04xxxxxxx5e;
      expv[15] = 44'h04xxxxxx0f4;
      expv[16] = 44'h84xxxxxx4b4;
      expv[17] = 44'h04xx00002ca;
      expv[18] = 44'h04xx000025e;
      expv[19] = 44'h84xx0000434;
      expv[20] = 44'h84xx000033f;
      expv[21] = 44'h04xx000056b;
      expv[22] = 44'h04xx0000480;
      expv[23] = 44'h04xx0000715;
      expv[24] = 44'h04xx00003ab;
      expv[25] = 44'h04xx0000220;
      expv[26] = 44'h84xx000079f;
      expv[27] = 44'h04xx000054b;
      expv[28] = 44'h84xx0000620;
      expv[29] = 44'h04xx0000260;
      expv[30] = 44'h84xx0000741;
      expv[31] = 44'h04xx00007ff;
      expv[32] = 44'h04xx00003d5;
      expv[33] = 44'h04xx0000214;
      expv[34] = 44'h04xx0000355;
      expv[35] = 44'h04xx000035f;
      expv[36] = 44'h042000007bf;
      expv[37] = 44'hfbe0000040a;
      expv[38] = 44'hfb20000038b;
      expv[39] = 44'hfb2000000e0;
      expv[40] = 44'hfb58800058b;
      expv[41] = 44'hfb588000660;
      expv[42] = 44'hfb98000003e;
      expv[43] = 44'hfb1800002c0;
      expv[44] = 44'hfb5800005c1;
      expv[45] = 44'hfb5800005e1;
      expv[46] = 44'hfb5a00004de;
      expv[47] = 44'hfb9800000ea;
      expv[48] = 44'hfbd880005a1;
      expv[49] = 44'hfb18000074b;
      expv[50] = 44'hfb9800000de;
      expv[51] = 44'hfb1800006aa;
      expv[52] = 44'hfb980000515;
      expv[53] = 44'hd11800007c1;
      expv[54] = 44'hd15800001df;
      expv[55] = 44'hd118000053f;
      expv[56] = 44'h5118000023e;
      expv[57] = 44'h23d80000375;
      expv[58] = 44'ha3580000640;
      expv[59] = 44'ha3d800005f5;
      expv[60] = 44'ha31800000c0;
      expv[61] = 44'ha3580000161;
      expv[62] = 44'h23d8000002a;
      expv[63] = 44'h23d80000101;
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
