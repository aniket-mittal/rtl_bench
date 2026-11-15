// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161642 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .npc_sel(out_vec[18:17]),
    .regwr(out_vec[16:16]),
    .regdst(out_vec[15:15]),
    .extop(out_vec[14:14]),
    .alusrc(out_vec[13:13]),
    .aluctr(out_vec[12:11]),
    .memwr(out_vec[10:10]),
    .memtoreg(out_vec[9:9]),
    .addu(out_vec[8:8]),
    .subu(out_vec[7:7]),
    .ori(out_vec[6:6]),
    .lw(out_vec[5:5]),
    .sw(out_vec[4:4]),
    .beq(out_vec[3:3]),
    .lui(out_vec[2:2]),
    .j(out_vec[1:1]),
    .jal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb67;
    stim[1] = 12'hd15;
    stim[2] = 12'h8f2;
    stim[3] = 12'haa9;
    stim[4] = 12'hdc5;
    stim[5] = 12'h2ad;
    stim[6] = 12'h7bf;
    stim[7] = 12'h454;
    stim[8] = 12'hccd;
    stim[9] = 12'h208;
    stim[10] = 12'h236;
    stim[11] = 12'hc46;
    stim[12] = 12'hd58;
    stim[13] = 12'h19c;
    stim[14] = 12'h041;
    stim[15] = 12'he4f;
    stim[16] = 12'h8c0;
    stim[17] = 12'hca0;
    stim[18] = 12'h1e7;
    stim[19] = 12'hf4d;
    stim[20] = 12'h0a1;
    stim[21] = 12'h712;
    stim[22] = 12'h29e;
    stim[23] = 12'h3d5;
    stim[24] = 12'hdbe;
    stim[25] = 12'h90c;
    stim[26] = 12'hd7f;
    stim[27] = 12'h7a2;
    stim[28] = 12'h76b;
    stim[29] = 12'h65e;
    stim[30] = 12'h8dd;
    stim[31] = 12'h4a2;
    stim[32] = 12'hbb3;
    stim[33] = 12'h5c2;
    stim[34] = 12'h102;
    stim[35] = 12'he62;
    stim[36] = 12'hf82;
    stim[37] = 12'h2bb;
    stim[38] = 12'ha10;
    stim[39] = 12'hbfc;
    stim[40] = 12'h2ca;
    stim[41] = 12'h8f5;
    stim[42] = 12'hfec;
    stim[43] = 12'h0f5;
    stim[44] = 12'hcbe;
    stim[45] = 12'ha1a;
    stim[46] = 12'h951;
    stim[47] = 12'he4a;
    stim[48] = 12'ha10;
    stim[49] = 12'hb01;
    stim[50] = 12'h683;
    stim[51] = 12'h39b;
    stim[52] = 12'hfbc;
    stim[53] = 12'ha2c;
    stim[54] = 12'h190;
    stim[55] = 12'h451;
    stim[56] = 12'he1f;
    stim[57] = 12'h4e0;
    stim[58] = 12'h448;
    stim[59] = 12'hb85;
    stim[60] = 12'hfa1;
    stim[61] = 12'h1df;
    stim[62] = 12'h940;
    stim[63] = 12'h2e9;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h16220;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h16220;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h40002;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h13804;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h16220;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h24808;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h16220;
      expv[42] = 19'h00000;
      expv[43] = 19'h70001;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h00000;
      expv[55] = 19'h00000;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
