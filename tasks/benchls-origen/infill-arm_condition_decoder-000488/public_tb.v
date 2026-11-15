// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000488 dut (
    .nzcv(in_vec[15:12]),
    .opfunc(in_vec[11:0]),
    .reg_write(out_vec[11:11]),
    .mem_to_reg(out_vec[10:10]),
    .mem_write(out_vec[9:9]),
    .pc_src(out_vec[8:8]),
    .update_nzcv(out_vec[7:7]),
    .link(out_vec[6:6]),
    .alu_src(out_vec[5:4]),
    .alu_op(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hbe76;
    stim[1] = 16'h13d7;
    stim[2] = 16'h96ba;
    stim[3] = 16'h5881;
    stim[4] = 16'h91c8;
    stim[5] = 16'h7d7c;
    stim[6] = 16'hb021;
    stim[7] = 16'h1d82;
    stim[8] = 16'h2567;
    stim[9] = 16'h4878;
    stim[10] = 16'h5d89;
    stim[11] = 16'ha25c;
    stim[12] = 16'hc55f;
    stim[13] = 16'h3afd;
    stim[14] = 16'h8d34;
    stim[15] = 16'h287b;
    stim[16] = 16'hb973;
    stim[17] = 16'h7a64;
    stim[18] = 16'h85e5;
    stim[19] = 16'h6564;
    stim[20] = 16'h5138;
    stim[21] = 16'hd09a;
    stim[22] = 16'h7929;
    stim[23] = 16'h97f3;
    stim[24] = 16'h16c6;
    stim[25] = 16'h4a02;
    stim[26] = 16'hebea;
    stim[27] = 16'h3784;
    stim[28] = 16'h5142;
    stim[29] = 16'hb5b7;
    stim[30] = 16'h860b;
    stim[31] = 16'h859d;
    stim[32] = 16'h3c23;
    stim[33] = 16'ha769;
    stim[34] = 16'h9c76;
    stim[35] = 16'h7ad9;
    stim[36] = 16'hbb9a;
    stim[37] = 16'h1875;
    stim[38] = 16'h25f9;
    stim[39] = 16'h4a38;
    stim[40] = 16'h11b2;
    stim[41] = 16'h8c36;
    stim[42] = 16'h25e5;
    stim[43] = 16'h5148;
    stim[44] = 16'hbfba;
    stim[45] = 16'h5a25;
    stim[46] = 16'h225d;
    stim[47] = 16'h17f0;
    stim[48] = 16'h40b4;
    stim[49] = 16'hc53d;
    stim[50] = 16'h27f6;
    stim[51] = 16'h790b;
    stim[52] = 16'hdae8;
    stim[53] = 16'h82d4;
    stim[54] = 16'hf759;
    stim[55] = 16'h58b3;
    stim[56] = 16'had17;
    stim[57] = 16'hb391;
    stim[58] = 16'h5602;
    stim[59] = 16'h7ae8;
    stim[60] = 16'h55b4;
    stim[61] = 16'h1a9a;
    stim[62] = 16'he565;
    stim[63] = 16'h9a2f;
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
      expv[0] = 12'h210;
      expv[1] = 12'hxxx;
      expv[2] = 12'h940;
      expv[3] = 12'h000;
      expv[4] = 12'hxxx;
      expv[5] = 12'h210;
      expv[6] = 12'h000;
      expv[7] = 12'hxxx;
      expv[8] = 12'h210;
      expv[9] = 12'h000;
      expv[10] = 12'hxxx;
      expv[11] = 12'hc10;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h894;
      expv[15] = 12'h210;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h210;
      expv[20] = 12'h000;
      expv[21] = 12'hxxx;
      expv[22] = 12'h819;
      expv[23] = 12'h000;
      expv[24] = 12'hxxx;
      expv[25] = 12'h802;
      expv[26] = 12'hxxx;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h210;
      expv[34] = 12'h210;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'hxxx;
      expv[39] = 12'h898;
      expv[40] = 12'h940;
      expv[41] = 12'h000;
      expv[42] = 12'hxxx;
      expv[43] = 12'h000;
      expv[44] = 12'h940;
      expv[45] = 12'h000;
      expv[46] = 12'hc10;
      expv[47] = 12'h000;
      expv[48] = 12'h940;
      expv[49] = 12'h000;
      expv[50] = 12'hxxx;
      expv[51] = 12'h80b;
      expv[52] = 12'hxxx;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h887;
      expv[57] = 12'h000;
      expv[58] = 12'h802;
      expv[59] = 12'h000;
      expv[60] = 12'h940;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h81f;
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
