// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157719 dut (
    .opcode(in_vec[5:0]),
    .aluop(out_vec[14:13]),
    .alusrc_a(out_vec[12:12]),
    .alusrc_b(out_vec[11:11]),
    .branch_eq(out_vec[10:10]),
    .branch_ne(out_vec[9:9]),
    .branch_ltz(out_vec[8:8]),
    .memread(out_vec[7:7]),
    .memtoreg(out_vec[6:6]),
    .memwrite(out_vec[5:5]),
    .regdst(out_vec[4:4]),
    .regwrite(out_vec[3:3]),
    .jump(out_vec[2:2]),
    .halt(out_vec[1:1]),
    .extsel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h05;
    stim[1] = 6'h28;
    stim[2] = 6'h2e;
    stim[3] = 6'h29;
    stim[4] = 6'h04;
    stim[5] = 6'h23;
    stim[6] = 6'h18;
    stim[7] = 6'h1a;
    stim[8] = 6'h01;
    stim[9] = 6'h09;
    stim[10] = 6'h04;
    stim[11] = 6'h27;
    stim[12] = 6'h05;
    stim[13] = 6'h08;
    stim[14] = 6'h10;
    stim[15] = 6'h24;
    stim[16] = 6'h07;
    stim[17] = 6'h2f;
    stim[18] = 6'h3c;
    stim[19] = 6'h23;
    stim[20] = 6'h01;
    stim[21] = 6'h21;
    stim[22] = 6'h1f;
    stim[23] = 6'h2d;
    stim[24] = 6'h37;
    stim[25] = 6'h16;
    stim[26] = 6'h0c;
    stim[27] = 6'h3a;
    stim[28] = 6'h0a;
    stim[29] = 6'h21;
    stim[30] = 6'h1d;
    stim[31] = 6'h25;
    stim[32] = 6'h04;
    stim[33] = 6'h12;
    stim[34] = 6'h2b;
    stim[35] = 6'h11;
    stim[36] = 6'h04;
    stim[37] = 6'h37;
    stim[38] = 6'h0c;
    stim[39] = 6'h20;
    stim[40] = 6'h35;
    stim[41] = 6'h01;
    stim[42] = 6'h34;
    stim[43] = 6'h1a;
    stim[44] = 6'h16;
    stim[45] = 6'h26;
    stim[46] = 6'h31;
    stim[47] = 6'h30;
    stim[48] = 6'h06;
    stim[49] = 6'h26;
    stim[50] = 6'h35;
    stim[51] = 6'h2f;
    stim[52] = 6'h2f;
    stim[53] = 6'h2f;
    stim[54] = 6'h19;
    stim[55] = 6'h08;
    stim[56] = 6'h08;
    stim[57] = 6'h23;
    stim[58] = 6'h1d;
    stim[59] = 6'h16;
    stim[60] = 6'h0b;
    stim[61] = 6'h15;
    stim[62] = 6'h13;
    stim[63] = 6'h1a;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h1000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h00c0;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0800;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h0000;
      expv[32] = 15'h0000;
      expv[33] = 15'h0800;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0820;
      expv[46] = 15'h2200;
      expv[47] = 15'h2400;
      expv[48] = 15'h0000;
      expv[49] = 15'h0820;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h0000;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
