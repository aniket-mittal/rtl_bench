// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_001782 dut (
    .clk(clk),
    .clk_25mHz(in_vec[31:31]),
    .reset(in_vec[30:30]),
    .border0(in_vec[29:29]),
    .border2(in_vec[28:28]),
    .xCount(in_vec[27:18]),
    .yCount(in_vec[17:8]),
    .data_in(in_vec[7:0]),
    .draw_bar(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h49d67d94;
    stim[1] = 32'hdfc4117c;
    stim[2] = 32'hb276840f;
    stim[3] = 32'h3441315c;
    stim[4] = 32'h33fc72bd;
    stim[5] = 32'h1293f037;
    stim[6] = 32'h27937347;
    stim[7] = 32'h90716a81;
    stim[8] = 32'h2b56e48d;
    stim[9] = 32'h040753df;
    stim[10] = 32'ha62f3d4f;
    stim[11] = 32'h3111dc5f;
    stim[12] = 32'h0c8fbfa1;
    stim[13] = 32'hbc87eb18;
    stim[14] = 32'h8d7a0255;
    stim[15] = 32'h3ed5f883;
    stim[16] = 32'ha944d269;
    stim[17] = 32'hb577054e;
    stim[18] = 32'h8aa7c942;
    stim[19] = 32'h97b5a027;
    stim[20] = 32'h9a700bdb;
    stim[21] = 32'h30401301;
    stim[22] = 32'ha66bbcd8;
    stim[23] = 32'h123e65ba;
    stim[24] = 32'h90bb4a60;
    stim[25] = 32'h8e45c49c;
    stim[26] = 32'h88bbd9e0;
    stim[27] = 32'ha0156ccb;
    stim[28] = 32'h899c878a;
    stim[29] = 32'hbc07c479;
    stim[30] = 32'h850bfc38;
    stim[31] = 32'haddacfed;
    stim[32] = 32'h9e36c4a1;
    stim[33] = 32'h31c8a5d7;
    stim[34] = 32'h34edb54c;
    stim[35] = 32'h32942338;
    stim[36] = 32'h39fe6e94;
    stim[37] = 32'h3a0bb80e;
    stim[38] = 32'haf4b8726;
    stim[39] = 32'h85685982;
    stim[40] = 32'h3f2e6bba;
    stim[41] = 32'h1d4e1757;
    stim[42] = 32'h005088c8;
    stim[43] = 32'h95f0dd7a;
    stim[44] = 32'h27275c01;
    stim[45] = 32'h91106351;
    stim[46] = 32'ha2b4d2fa;
    stim[47] = 32'h38b0abfc;
    stim[48] = 32'h3aff7170;
    stim[49] = 32'h3c558e7c;
    stim[50] = 32'h3d199368;
    stim[51] = 32'h811cb07f;
    stim[52] = 32'hbff1d20e;
    stim[53] = 32'hbd83c5fb;
    stim[54] = 32'hbfae9062;
    stim[55] = 32'ha9587850;
    stim[56] = 32'h324532eb;
    stim[57] = 32'h113062b7;
    stim[58] = 32'h8070867b;
    stim[59] = 32'hb00f5c96;
    stim[60] = 32'h39b384fe;
    stim[61] = 32'h00cd2fc0;
    stim[62] = 32'hbc79e778;
    stim[63] = 32'h3e49ab27;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
