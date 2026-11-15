// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_195332 dut (
    .i_Op(in_vec[10:5]),
    .i_co0(in_vec[4:0]),
    .o_RegDst(out_vec[11:11]),
    .o_RegWrite(out_vec[10:10]),
    .o_ExtOp(out_vec[9:9]),
    .o_ALUSrc(out_vec[8:8]),
    .o_WE(out_vec[7:7]),
    .o_MemtoReg(out_vec[6:5]),
    .o_beq(out_vec[4:4]),
    .o_bne(out_vec[3:3]),
    .o_j(out_vec[2:2]),
    .o_mtc0(out_vec[1:1]),
    .o_eret(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h48a;
    stim[1] = 11'h66d;
    stim[2] = 11'h35d;
    stim[3] = 11'h2d3;
    stim[4] = 11'h133;
    stim[5] = 11'h0f4;
    stim[6] = 11'h084;
    stim[7] = 11'h0b8;
    stim[8] = 11'h2b2;
    stim[9] = 11'h5f3;
    stim[10] = 11'h015;
    stim[11] = 11'h4ff;
    stim[12] = 11'h0f8;
    stim[13] = 11'h25a;
    stim[14] = 11'h170;
    stim[15] = 11'h78a;
    stim[16] = 11'h39f;
    stim[17] = 11'h574;
    stim[18] = 11'h123;
    stim[19] = 11'h3f6;
    stim[20] = 11'h5bf;
    stim[21] = 11'h48f;
    stim[22] = 11'h742;
    stim[23] = 11'h2d4;
    stim[24] = 11'h45e;
    stim[25] = 11'h36b;
    stim[26] = 11'h687;
    stim[27] = 11'h6ea;
    stim[28] = 11'h464;
    stim[29] = 11'h102;
    stim[30] = 11'h3d8;
    stim[31] = 11'h39a;
    stim[32] = 11'h794;
    stim[33] = 11'h209;
    stim[34] = 11'h57c;
    stim[35] = 11'h276;
    stim[36] = 11'h481;
    stim[37] = 11'h758;
    stim[38] = 11'h35d;
    stim[39] = 11'h2f7;
    stim[40] = 11'h7f0;
    stim[41] = 11'h035;
    stim[42] = 11'h131;
    stim[43] = 11'h3e9;
    stim[44] = 11'h246;
    stim[45] = 11'h191;
    stim[46] = 11'h218;
    stim[47] = 11'h177;
    stim[48] = 11'h0df;
    stim[49] = 11'h572;
    stim[50] = 11'h108;
    stim[51] = 11'h2c0;
    stim[52] = 11'h1c3;
    stim[53] = 11'h198;
    stim[54] = 11'h460;
    stim[55] = 11'h43e;
    stim[56] = 11'h6ea;
    stim[57] = 11'h478;
    stim[58] = 11'h0bb;
    stim[59] = 11'h492;
    stim[60] = 11'h7fb;
    stim[61] = 11'h7f8;
    stim[62] = 11'h359;
    stim[63] = 11'h676;
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
      expv[0] = 12'h520;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h010;
      expv[7] = 12'h008;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'hc00;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h380;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h520;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h720;
      expv[29] = 12'h700;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h380;
      expv[35] = 12'h000;
      expv[36] = 12'h520;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h380;
      expv[50] = 12'h700;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h720;
      expv[55] = 12'h720;
      expv[56] = 12'h000;
      expv[57] = 12'h720;
      expv[58] = 12'h008;
      expv[59] = 12'h520;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
