// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116079 dut (
    .Intr_Mode(in_vec[11:10]),
    .I_Function_S(in_vec[9:4]),
    .Rdestiny(in_vec[3:0]),
    .wFlag_bools(out_vec[15:14]),
    .PCS(out_vec[13:13]),
    .wregister_boolean(out_vec[12:12]),
    .wmemory_boolean(out_vec[11:11]),
    .MemtoReg(out_vec[10:10]),
    .B_ALU_selec(out_vec[9:9]),
    .Imm_selec(out_vec[8:7]),
    .registers_selec_mux(out_vec[6:5]),
    .ALU_selec(out_vec[4:1]),
    .mov_selec(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h1f6;
    stim[1] = 12'h16d;
    stim[2] = 12'h978;
    stim[3] = 12'hab2;
    stim[4] = 12'h244;
    stim[5] = 12'h5af;
    stim[6] = 12'h98f;
    stim[7] = 12'hc87;
    stim[8] = 12'hc24;
    stim[9] = 12'h68e;
    stim[10] = 12'hcdf;
    stim[11] = 12'h5db;
    stim[12] = 12'h26e;
    stim[13] = 12'h718;
    stim[14] = 12'hdb4;
    stim[15] = 12'hfc3;
    stim[16] = 12'h8c3;
    stim[17] = 12'h7b9;
    stim[18] = 12'h5fa;
    stim[19] = 12'hfde;
    stim[20] = 12'h68c;
    stim[21] = 12'h923;
    stim[22] = 12'h090;
    stim[23] = 12'h405;
    stim[24] = 12'h400;
    stim[25] = 12'h3bf;
    stim[26] = 12'hb3d;
    stim[27] = 12'h7ef;
    stim[28] = 12'he64;
    stim[29] = 12'h948;
    stim[30] = 12'hc3e;
    stim[31] = 12'h088;
    stim[32] = 12'h128;
    stim[33] = 12'hf96;
    stim[34] = 12'hb3e;
    stim[35] = 12'h566;
    stim[36] = 12'h871;
    stim[37] = 12'ha8f;
    stim[38] = 12'h059;
    stim[39] = 12'ha16;
    stim[40] = 12'h514;
    stim[41] = 12'h276;
    stim[42] = 12'h356;
    stim[43] = 12'ha6e;
    stim[44] = 12'h09a;
    stim[45] = 12'hdeb;
    stim[46] = 12'h000;
    stim[47] = 12'hf67;
    stim[48] = 12'h394;
    stim[49] = 12'hc7e;
    stim[50] = 12'h903;
    stim[51] = 12'h881;
    stim[52] = 12'h682;
    stim[53] = 12'hefa;
    stim[54] = 12'hd04;
    stim[55] = 12'hd24;
    stim[56] = 12'h7de;
    stim[57] = 12'h266;
    stim[58] = 12'h7d6;
    stim[59] = 12'h32c;
    stim[60] = 12'h970;
    stim[61] = 12'h7c6;
    stim[62] = 12'hdd2;
    stim[63] = 12'h379;
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
      expv[0] = 16'h0420;
      expv[1] = 16'h0420;
      expv[2] = 16'h1120;
      expv[3] = 16'h1120;
      expv[4] = 16'h8402;
      expv[5] = 16'h0e80;
      expv[6] = 16'h1120;
      expv[7] = 16'h8100;
      expv[8] = 16'h811e;
      expv[9] = 16'h0e80;
      expv[10] = 16'h011e;
      expv[11] = 16'h0e80;
      expv[12] = 16'h841e;
      expv[13] = 16'h0e81;
      expv[14] = 16'h011e;
      expv[15] = 16'h811e;
      expv[16] = 16'h1120;
      expv[17] = 16'h0e80;
      expv[18] = 16'h0e80;
      expv[19] = 16'h011e;
      expv[20] = 16'h0e80;
      expv[21] = 16'h1120;
      expv[22] = 16'h0520;
      expv[23] = 16'h0e80;
      expv[24] = 16'h0e80;
      expv[25] = 16'h0000;
      expv[26] = 16'h1120;
      expv[27] = 16'h0e80;
      expv[28] = 16'h811e;
      expv[29] = 16'h1120;
      expv[30] = 16'h011e;
      expv[31] = 16'h0520;
      expv[32] = 16'h0420;
      expv[33] = 16'h0106;
      expv[34] = 16'h1120;
      expv[35] = 16'h0e80;
      expv[36] = 16'h1120;
      expv[37] = 16'h1120;
      expv[38] = 16'h0520;
      expv[39] = 16'h1120;
      expv[40] = 16'h0e81;
      expv[41] = 16'h041e;
      expv[42] = 16'h0000;
      expv[43] = 16'h1120;
      expv[44] = 16'h0520;
      expv[45] = 16'h811e;
      expv[46] = 16'h0520;
      expv[47] = 16'h811e;
      expv[48] = 16'h0000;
      expv[49] = 16'h011e;
      expv[50] = 16'h1121;
      expv[51] = 16'h1120;
      expv[52] = 16'h0e80;
      expv[53] = 16'h011e;
      expv[54] = 16'h0119;
      expv[55] = 16'h811e;
      expv[56] = 16'h0e80;
      expv[57] = 16'h841e;
      expv[58] = 16'h0e80;
      expv[59] = 16'h0000;
      expv[60] = 16'h1120;
      expv[61] = 16'h0e80;
      expv[62] = 16'h011e;
      expv[63] = 16'h0000;
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
