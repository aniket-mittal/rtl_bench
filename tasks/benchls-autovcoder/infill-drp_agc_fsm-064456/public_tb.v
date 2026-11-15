// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_064456 dut (
    .clk(clk),
    .lock0(in_vec[21:21]),
    .lock1(in_vec[20:20]),
    .lock2(in_vec[19:19]),
    .lock3(in_vec[18:18]),
    .reset(in_vec[17:17]),
    .ready(in_vec[16:16]),
    .di0(in_vec[15:0]),
    .holds(out_vec[36:33]),
    .DI(out_vec[32:17]),
    .Address(out_vec[16:8]),
    .state(out_vec[7:4]),
    .done(out_vec[3:3]),
    .kill(out_vec[2:2]),
    .rd_drp(out_vec[1:1]),
    .wr_drp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h36d417;
    stim[1] = 22'h076fc6;
    stim[2] = 22'h2c560d;
    stim[3] = 22'h355077;
    stim[4] = 22'h18fd2c;
    stim[5] = 22'h1567fc;
    stim[6] = 22'h1c663c;
    stim[7] = 22'h099a25;
    stim[8] = 22'h2c06fd;
    stim[9] = 22'h0c4e67;
    stim[10] = 22'h251bf9;
    stim[11] = 22'h09e30d;
    stim[12] = 22'h15f990;
    stim[13] = 22'h10f903;
    stim[14] = 22'h25f3d1;
    stim[15] = 22'h38d919;
    stim[16] = 22'h0d9202;
    stim[17] = 22'h05b797;
    stim[18] = 22'h1dc8d8;
    stim[19] = 22'h01f278;
    stim[20] = 22'h383612;
    stim[21] = 22'h097b8d;
    stim[22] = 22'h35833e;
    stim[23] = 22'h318882;
    stim[24] = 22'h09fadd;
    stim[25] = 22'h2d7377;
    stim[26] = 22'h24af1e;
    stim[27] = 22'h1b602a;
    stim[28] = 22'h299049;
    stim[29] = 22'h09ba50;
    stim[30] = 22'h3ce192;
    stim[31] = 22'h0536e9;
    stim[32] = 22'h34cafa;
    stim[33] = 22'h2122da;
    stim[34] = 22'h311053;
    stim[35] = 22'h3da252;
    stim[36] = 22'h18ce16;
    stim[37] = 22'h3d73b0;
    stim[38] = 22'h21ac62;
    stim[39] = 22'h040bb7;
    stim[40] = 22'h2907d0;
    stim[41] = 22'h24eb61;
    stim[42] = 22'h24fdb4;
    stim[43] = 22'h34876c;
    stim[44] = 22'h2ca94e;
    stim[45] = 22'h109a55;
    stim[46] = 22'h29fa30;
    stim[47] = 22'h29e5a7;
    stim[48] = 22'h04c791;
    stim[49] = 22'h3c2b9d;
    stim[50] = 22'h21b98d;
    stim[51] = 22'h05def3;
    stim[52] = 22'h18a725;
    stim[53] = 22'h385a56;
    stim[54] = 22'h3491f8;
    stim[55] = 22'h347856;
    stim[56] = 22'h3e7a15;
    stim[57] = 22'h1d65e6;
    stim[58] = 22'h3416a0;
    stim[59] = 22'h3596d7;
    stim[60] = 22'h04d7cb;
    stim[61] = 22'h0c98aa;
    stim[62] = 22'h215ff0;
    stim[63] = 22'h3dca34;
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
      expv[0] = 37'h0000000000;
      expv[1] = 37'h00000000a0;
      expv[2] = 37'h00000000a0;
      expv[3] = 37'h0000000010;
      expv[4] = 37'h0000001e20;
      expv[5] = 37'h0000001e32;
      expv[6] = 37'h0000001e40;
      expv[7] = 37'h0000001e50;
      expv[8] = 37'h00cff01e60;
      expv[9] = 37'h00cff01e71;
      expv[10] = 37'h00cff01e70;
      expv[11] = 37'h00cff01e80;
      expv[12] = 37'h00cff01e40;
      expv[13] = 37'h00cff01e50;
      expv[14] = 37'h00cff01e60;
      expv[15] = 37'h00cff01e71;
      expv[16] = 37'h00cff01e70;
      expv[17] = 37'h00cff01e80;
      expv[18] = 37'h00cff01e48;
      expv[19] = 37'h00cff01e58;
      expv[20] = 37'h00cff01e58;
      expv[21] = 37'h00cff01e68;
      expv[22] = 37'h00cff01e79;
      expv[23] = 37'h00cff01e88;
      expv[24] = 37'h00cff01e98;
      expv[25] = 37'h160000009c;
      expv[26] = 37'h160000009c;
      expv[27] = 37'h160000009c;
      expv[28] = 37'h00000000a0;
      expv[29] = 37'h0000000010;
      expv[30] = 37'h0000001e20;
      expv[31] = 37'h0000001e32;
      expv[32] = 37'h0000001e40;
      expv[33] = 37'h0000001e50;
      expv[34] = 37'h006dd01e60;
      expv[35] = 37'h006dd01e71;
      expv[36] = 37'h006dd01e80;
      expv[37] = 37'h006dd01e40;
      expv[38] = 37'h006dd01e50;
      expv[39] = 37'h006dd01e60;
      expv[40] = 37'h006dd01e71;
      expv[41] = 37'h006dd01e80;
      expv[42] = 37'h006dd01e40;
      expv[43] = 37'h006dd01e50;
      expv[44] = 37'h006dd01e60;
      expv[45] = 37'h006dd01e71;
      expv[46] = 37'h006dd01e70;
      expv[47] = 37'h006dd01e80;
      expv[48] = 37'h006dd01e40;
      expv[49] = 37'h006dd01e50;
      expv[50] = 37'h006dd01e60;
      expv[51] = 37'h006dd01e71;
      expv[52] = 37'h006dd01e80;
      expv[53] = 37'h006dd01e40;
      expv[54] = 37'h006dd01e50;
      expv[55] = 37'h006dd21e60;
      expv[56] = 37'h006dd21e71;
      expv[57] = 37'h00000000a0;
      expv[58] = 37'h0000000010;
      expv[59] = 37'h0000001e20;
      expv[60] = 37'h0000001e32;
      expv[61] = 37'h0000001e30;
      expv[62] = 37'h0000001e30;
      expv[63] = 37'h0000001e40;
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
