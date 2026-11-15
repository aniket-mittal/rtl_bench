// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07943 dut (
    .CLK(clk),
    .RESET(in_vec[23:23]),
    .CE_N(in_vec[22:22]),
    .CE_P(in_vec[21:21]),
    .A(in_vec[20:20]),
    .DI(in_vec[19:12]),
    .CS_n(in_vec[11:11]),
    .WR_n(in_vec[10:10]),
    .RD_n(in_vec[9:9]),
    .MEM_DO(in_vec[8:1]),
    .MEM_WAIT(in_vec[0:0]),
    .DO(out_vec[68:61]),
    .MEM_ADDR(out_vec[60:40]),
    .MEM_DI(out_vec[39:32]),
    .MEM_RD(out_vec[31:31]),
    .MEM_WR(out_vec[30:30]),
    .OUTL(out_vec[29:15]),
    .OUTR(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'ha89e21;
    stim[1] = 24'hd96573;
    stim[2] = 24'h627017;
    stim[3] = 24'h0897a9;
    stim[4] = 24'h49cf4b;
    stim[5] = 24'h2d1c3d;
    stim[6] = 24'h178d8e;
    stim[7] = 24'h173494;
    stim[8] = 24'h6251e6;
    stim[9] = 24'h2f1181;
    stim[10] = 24'h1afe27;
    stim[11] = 24'h3a3a2c;
    stim[12] = 24'h37bb9b;
    stim[13] = 24'h4f78fe;
    stim[14] = 24'h543978;
    stim[15] = 24'h1cd9bd;
    stim[16] = 24'h550b27;
    stim[17] = 24'h25fbff;
    stim[18] = 24'h75ab71;
    stim[19] = 24'h5efb13;
    stim[20] = 24'h7dd64f;
    stim[21] = 24'h276e15;
    stim[22] = 24'h0d0b80;
    stim[23] = 24'h197339;
    stim[24] = 24'h0d7355;
    stim[25] = 24'h04771d;
    stim[26] = 24'h4dc6b7;
    stim[27] = 24'h114b1d;
    stim[28] = 24'h6dff98;
    stim[29] = 24'h5528ea;
    stim[30] = 24'h3e1d44;
    stim[31] = 24'h792c4c;
    stim[32] = 24'h1eaea1;
    stim[33] = 24'h5a34fe;
    stim[34] = 24'h2e0f02;
    stim[35] = 24'h00e632;
    stim[36] = 24'h76d79c;
    stim[37] = 24'h2469a2;
    stim[38] = 24'h1096c7;
    stim[39] = 24'h45fd53;
    stim[40] = 24'h23918d;
    stim[41] = 24'h1adc88;
    stim[42] = 24'h306e06;
    stim[43] = 24'h3bcbfc;
    stim[44] = 24'h0d93f0;
    stim[45] = 24'h5f3b6b;
    stim[46] = 24'h40ded8;
    stim[47] = 24'h0275e7;
    stim[48] = 24'h3f9f43;
    stim[49] = 24'h1f6390;
    stim[50] = 24'h02a46e;
    stim[51] = 24'h2634ac;
    stim[52] = 24'hb18d76;
    stim[53] = 24'h40caab;
    stim[54] = 24'h379257;
    stim[55] = 24'h119b2c;
    stim[56] = 24'h2a9ea2;
    stim[57] = 24'h4394e5;
    stim[58] = 24'h44fa16;
    stim[59] = 24'h3afc15;
    stim[60] = 24'h1581e1;
    stim[61] = 24'h6daa4a;
    stim[62] = 24'h4ba697;
    stim[63] = 24'h4b7397;
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
      expv[0] = 69'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 69'hxfx0xxxxxxxxxxxxxx;
      expv[2] = 69'h0000xxxxxxxxxxxxxx;
      expv[3] = 69'h0000xxxxxxxxxxxxxx;
      expv[4] = 69'h0000xxxxxxxxxxxxxx;
      expv[5] = 69'h0000xxxxxxxxxxxxxx;
      expv[6] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[7] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[8] = 69'h0000xxxxxxxxxxxxxx;
      expv[9] = 69'h0000xxxxxxxxxxxxxx;
      expv[10] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[11] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[12] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[13] = 69'h0000xxxxxxxxxxxxxx;
      expv[14] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[15] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[16] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[17] = 69'h0000xxxxxxxxxxxxxx;
      expv[18] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[19] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[20] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[21] = 69'h0000xxxxxxxxxxxxxx;
      expv[22] = 69'h0000xxxxxxxxxxxxxx;
      expv[23] = 69'h1fx0xxxxxxxxxxxxxx;
      expv[24] = 69'h0000xxxxxxxxxxxxxx;
      expv[25] = 69'h0000xxxxxxxxxxxxxx;
      expv[26] = 69'h0000xxxxxxxxxxxxxx;
      expv[27] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[28] = 69'h0000xxxxxxxxxxxxxx;
      expv[29] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[30] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[31] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[32] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[33] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[34] = 69'h0000xxxxxxxxxxxxxx;
      expv[35] = 69'h0000xxxxxxxxxxxxxx;
      expv[36] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[37] = 69'h0000xxxxxxxxxxxxxx;
      expv[38] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[39] = 69'h0000xxxxxxxxxxxxxx;
      expv[40] = 69'h0000xxxxxxxxxxxxxx;
      expv[41] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[42] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[43] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[44] = 69'h0000xxxxxxxxxxxxxx;
      expv[45] = 69'h1fe0xxxxxxxxxxxxxx;
      expv[46] = 69'h0000xxxxxxxxxxxxxx;
      expv[47] = 69'h0000xxxxxxxxxxxxxx;
      expv[48] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[49] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[50] = 69'h0000xxxxxxxxxxxxxx;
      expv[51] = 69'h0000xxxxxxxxxxxxxx;
      expv[52] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[53] = 69'h0000xxxxxxxxxxxxxx;
      expv[54] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[55] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[56] = 69'h0000xxxxxxxxxxxxxx;
      expv[57] = 69'h0000xxxxxxxxxxxxxx;
      expv[58] = 69'h0000xxxxxxxxxxxxxx;
      expv[59] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[60] = 69'h0fe0xxxxxxxxxxxxxx;
      expv[61] = 69'h0000xxxxxxxxxxxxxx;
      expv[62] = 69'h0000xxxxxxxxxxxxxx;
      expv[63] = 69'h0000xxxxxxxxxxxxxx;
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
