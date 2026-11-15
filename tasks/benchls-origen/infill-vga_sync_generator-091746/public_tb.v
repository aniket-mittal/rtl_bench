// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091746 dut (
    .pclk(clk),
    .reset(in_vec[12:12]),
    .vga_data(in_vec[11:0]),
    .h_addr(out_vec[46:37]),
    .v_addr(out_vec[36:27]),
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
    stim[0] = 13'h1ca8;
    stim[1] = 13'h16ab;
    stim[2] = 13'h0579;
    stim[3] = 13'h0d8f;
    stim[4] = 13'h00b6;
    stim[5] = 13'h0bbe;
    stim[6] = 13'h0f90;
    stim[7] = 13'h0a11;
    stim[8] = 13'h0101;
    stim[9] = 13'h0d7e;
    stim[10] = 13'h09c1;
    stim[11] = 13'h0eb7;
    stim[12] = 13'h03f6;
    stim[13] = 13'h0f39;
    stim[14] = 13'h0dd1;
    stim[15] = 13'h0164;
    stim[16] = 13'h03a9;
    stim[17] = 13'h041a;
    stim[18] = 13'h0aec;
    stim[19] = 13'h0055;
    stim[20] = 13'h0ad4;
    stim[21] = 13'h0cee;
    stim[22] = 13'h069f;
    stim[23] = 13'h0414;
    stim[24] = 13'h0e47;
    stim[25] = 13'h082f;
    stim[26] = 13'h07de;
    stim[27] = 13'h01d4;
    stim[28] = 13'h0580;
    stim[29] = 13'h08f9;
    stim[30] = 13'h0a1d;
    stim[31] = 13'h0782;
    stim[32] = 13'h0b7b;
    stim[33] = 13'h0fd5;
    stim[34] = 13'h080c;
    stim[35] = 13'h0c6b;
    stim[36] = 13'h0b07;
    stim[37] = 13'h068a;
    stim[38] = 13'h037a;
    stim[39] = 13'h014c;
    stim[40] = 13'h0205;
    stim[41] = 13'h0195;
    stim[42] = 13'h0701;
    stim[43] = 13'h09c9;
    stim[44] = 13'h0145;
    stim[45] = 13'h0591;
    stim[46] = 13'h0bc8;
    stim[47] = 13'h0952;
    stim[48] = 13'h0491;
    stim[49] = 13'h0aef;
    stim[50] = 13'h0cea;
    stim[51] = 13'h0f69;
    stim[52] = 13'h04bf;
    stim[53] = 13'h0f4d;
    stim[54] = 13'h07b2;
    stim[55] = 13'h0528;
    stim[56] = 13'h06b2;
    stim[57] = 13'h0375;
    stim[58] = 13'h0312;
    stim[59] = 13'h0c65;
    stim[60] = 13'h0917;
    stim[61] = 13'h0863;
    stim[62] = 13'h1602;
    stim[63] = 13'h077f;
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
      expv[0] = 47'h000006000000;
      expv[1] = 47'h000006000000;
      expv[2] = 47'h000006000000;
      expv[3] = 47'h000000507090;
      expv[4] = 47'h000000d080f0;
      expv[5] = 47'h00000000b060;
      expv[6] = 47'h000000b0b0e0;
      expv[7] = 47'h000000f09000;
      expv[8] = 47'h000000a01010;
      expv[9] = 47'h000000100010;
      expv[10] = 47'h000000d070e0;
      expv[11] = 47'h00000090c010;
      expv[12] = 47'h000000e0b070;
      expv[13] = 47'h00000030f060;
      expv[14] = 47'h000000f03090;
      expv[15] = 47'h000000d0d010;
      expv[16] = 47'h000000106040;
      expv[17] = 47'h00000030a090;
      expv[18] = 47'h0000004010a0;
      expv[19] = 47'h000000a0e0c0;
      expv[20] = 47'h000004005050;
      expv[21] = 47'h000004a0d040;
      expv[22] = 47'h000004c0e0e0;
      expv[23] = 47'h0000046090f0;
      expv[24] = 47'h000004401040;
      expv[25] = 47'h000004e04070;
      expv[26] = 47'h0000048020f0;
      expv[27] = 47'h00000470d0e0;
      expv[28] = 47'h00000410d040;
      expv[29] = 47'h000004508000;
      expv[30] = 47'h00000480f090;
      expv[31] = 47'h000004a010d0;
      expv[32] = 47'h000004708020;
      expv[33] = 47'h000004b070b0;
      expv[34] = 47'h000004f0d050;
      expv[35] = 47'h0000048000c0;
      expv[36] = 47'h000004c060b0;
      expv[37] = 47'h000004b00070;
      expv[38] = 47'h0000046080a0;
      expv[39] = 47'h0000043070a0;
      expv[40] = 47'h0000041040c0;
      expv[41] = 47'h000004200050;
      expv[42] = 47'h000004109050;
      expv[43] = 47'h000004700010;
      expv[44] = 47'h00000490c090;
      expv[45] = 47'h000004104050;
      expv[46] = 47'h000004509010;
      expv[47] = 47'h000004b0c080;
      expv[48] = 47'h000004905020;
      expv[49] = 47'h000004409010;
      expv[50] = 47'h000004a0e0f0;
      expv[51] = 47'h000004c0e0a0;
      expv[52] = 47'h000004f06090;
      expv[53] = 47'h00000440b0f0;
      expv[54] = 47'h000004f040d0;
      expv[55] = 47'h00000470b020;
      expv[56] = 47'h000004502080;
      expv[57] = 47'h00000460b020;
      expv[58] = 47'h000004307050;
      expv[59] = 47'h000004301020;
      expv[60] = 47'h000004c06050;
      expv[61] = 47'h000004901070;
      expv[62] = 47'h000006000000;
      expv[63] = 47'h000006000000;
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
