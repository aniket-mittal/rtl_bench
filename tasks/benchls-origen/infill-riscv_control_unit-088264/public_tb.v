// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_088264 dut (
    .opcode(in_vec[4:0]),
    .branch(out_vec[11:11]),
    .memread(out_vec[10:10]),
    .memtoreg(out_vec[9:9]),
    .aluop(out_vec[8:7]),
    .memwrite(out_vec[6:6]),
    .alusrc(out_vec[5:5]),
    .regwrite(out_vec[4:4]),
    .i_type(out_vec[3:3]),
    .AJ_control(out_vec[2:1]),
    .lui_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h11;
    stim[1] = 5'h06;
    stim[2] = 5'h06;
    stim[3] = 5'h05;
    stim[4] = 5'h0a;
    stim[5] = 5'h08;
    stim[6] = 5'h15;
    stim[7] = 5'h01;
    stim[8] = 5'h06;
    stim[9] = 5'h15;
    stim[10] = 5'h0b;
    stim[11] = 5'h07;
    stim[12] = 5'h16;
    stim[13] = 5'h08;
    stim[14] = 5'h01;
    stim[15] = 5'h18;
    stim[16] = 5'h1c;
    stim[17] = 5'h1a;
    stim[18] = 5'h14;
    stim[19] = 5'h0b;
    stim[20] = 5'h05;
    stim[21] = 5'h05;
    stim[22] = 5'h03;
    stim[23] = 5'h15;
    stim[24] = 5'h06;
    stim[25] = 5'h05;
    stim[26] = 5'h1a;
    stim[27] = 5'h15;
    stim[28] = 5'h1d;
    stim[29] = 5'h1a;
    stim[30] = 5'h06;
    stim[31] = 5'h09;
    stim[32] = 5'h0e;
    stim[33] = 5'h18;
    stim[34] = 5'h11;
    stim[35] = 5'h08;
    stim[36] = 5'h0e;
    stim[37] = 5'h13;
    stim[38] = 5'h0c;
    stim[39] = 5'h17;
    stim[40] = 5'h05;
    stim[41] = 5'h1f;
    stim[42] = 5'h0c;
    stim[43] = 5'h05;
    stim[44] = 5'h1e;
    stim[45] = 5'h07;
    stim[46] = 5'h09;
    stim[47] = 5'h05;
    stim[48] = 5'h11;
    stim[49] = 5'h1c;
    stim[50] = 5'h12;
    stim[51] = 5'h0e;
    stim[52] = 5'h09;
    stim[53] = 5'h1a;
    stim[54] = 5'h08;
    stim[55] = 5'h07;
    stim[56] = 5'h0a;
    stim[57] = 5'h0e;
    stim[58] = 5'h19;
    stim[59] = 5'h10;
    stim[60] = 5'h09;
    stim[61] = 5'h14;
    stim[62] = 5'h12;
    stim[63] = 5'h12;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h036;
      expv[4] = 12'h000;
      expv[5] = 12'h060;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h060;
      expv[14] = 12'h000;
      expv[15] = 12'h880;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h036;
      expv[21] = 12'h036;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h036;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h880;
      expv[34] = 12'h000;
      expv[35] = 12'h060;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h110;
      expv[39] = 12'h000;
      expv[40] = 12'h036;
      expv[41] = 12'h000;
      expv[42] = 12'h110;
      expv[43] = 12'h036;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h036;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h060;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h83c;
      expv[59] = 12'h000;
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
