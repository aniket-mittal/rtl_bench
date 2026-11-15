// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186032 dut (
    .opcode(in_vec[5:0]),
    .branch(out_vec[10:10]),
    .jump(out_vec[9:9]),
    .reg_dst(out_vec[8:8]),
    .we_reg(out_vec[7:7]),
    .alu_src(out_vec[6:6]),
    .we_dm(out_vec[5:5]),
    .dm2reg(out_vec[4:4]),
    .alu_op(out_vec[3:2]),
    .jal_wa_mux_sel(out_vec[1:1]),
    .jal_wd_mux_sel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h12;
    stim[1] = 6'h19;
    stim[2] = 6'h13;
    stim[3] = 6'h2e;
    stim[4] = 6'h23;
    stim[5] = 6'h1b;
    stim[6] = 6'h3d;
    stim[7] = 6'h39;
    stim[8] = 6'h3b;
    stim[9] = 6'h3a;
    stim[10] = 6'h02;
    stim[11] = 6'h1d;
    stim[12] = 6'h33;
    stim[13] = 6'h17;
    stim[14] = 6'h2b;
    stim[15] = 6'h06;
    stim[16] = 6'h04;
    stim[17] = 6'h1a;
    stim[18] = 6'h26;
    stim[19] = 6'h2f;
    stim[20] = 6'h1c;
    stim[21] = 6'h39;
    stim[22] = 6'h28;
    stim[23] = 6'h15;
    stim[24] = 6'h31;
    stim[25] = 6'h0a;
    stim[26] = 6'h06;
    stim[27] = 6'h2a;
    stim[28] = 6'h29;
    stim[29] = 6'h3f;
    stim[30] = 6'h1f;
    stim[31] = 6'h11;
    stim[32] = 6'h2d;
    stim[33] = 6'h3d;
    stim[34] = 6'h0a;
    stim[35] = 6'h03;
    stim[36] = 6'h2c;
    stim[37] = 6'h14;
    stim[38] = 6'h32;
    stim[39] = 6'h14;
    stim[40] = 6'h17;
    stim[41] = 6'h1e;
    stim[42] = 6'h31;
    stim[43] = 6'h0d;
    stim[44] = 6'h1a;
    stim[45] = 6'h00;
    stim[46] = 6'h02;
    stim[47] = 6'h2b;
    stim[48] = 6'h2d;
    stim[49] = 6'h12;
    stim[50] = 6'h17;
    stim[51] = 6'h3a;
    stim[52] = 6'h2d;
    stim[53] = 6'h27;
    stim[54] = 6'h00;
    stim[55] = 6'h35;
    stim[56] = 6'h2d;
    stim[57] = 6'h22;
    stim[58] = 6'h11;
    stim[59] = 6'h13;
    stim[60] = 6'h05;
    stim[61] = 6'h1b;
    stim[62] = 6'h1c;
    stim[63] = 6'h03;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'h0d0;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'hxxx;
      expv[10] = 11'hxxx;
      expv[11] = 11'hxxx;
      expv[12] = 11'hxxx;
      expv[13] = 11'hxxx;
      expv[14] = 11'hxx0;
      expv[15] = 11'hxxx;
      expv[16] = 11'hxx4;
      expv[17] = 11'hxxx;
      expv[18] = 11'hxxx;
      expv[19] = 11'hxxx;
      expv[20] = 11'hxxx;
      expv[21] = 11'hxxx;
      expv[22] = 11'hxxx;
      expv[23] = 11'hxxx;
      expv[24] = 11'hxxx;
      expv[25] = 11'hxxx;
      expv[26] = 11'hxxx;
      expv[27] = 11'hxxx;
      expv[28] = 11'hxxx;
      expv[29] = 11'hxxx;
      expv[30] = 11'hxxx;
      expv[31] = 11'hxxx;
      expv[32] = 11'hxxx;
      expv[33] = 11'hxxx;
      expv[34] = 11'hxxx;
      expv[35] = 11'h2xx;
      expv[36] = 11'hxxx;
      expv[37] = 11'hxxx;
      expv[38] = 11'hxxx;
      expv[39] = 11'hxxx;
      expv[40] = 11'hxxx;
      expv[41] = 11'hxxx;
      expv[42] = 11'hxxx;
      expv[43] = 11'hxxx;
      expv[44] = 11'hxxx;
      expv[45] = 11'h188;
      expv[46] = 11'hxxx;
      expv[47] = 11'hxx0;
      expv[48] = 11'hxxx;
      expv[49] = 11'hxxx;
      expv[50] = 11'hxxx;
      expv[51] = 11'hxxx;
      expv[52] = 11'hxxx;
      expv[53] = 11'hxxx;
      expv[54] = 11'h188;
      expv[55] = 11'hxxx;
      expv[56] = 11'hxxx;
      expv[57] = 11'hxxx;
      expv[58] = 11'hxxx;
      expv[59] = 11'hxxx;
      expv[60] = 11'hxxx;
      expv[61] = 11'hxxx;
      expv[62] = 11'hxxx;
      expv[63] = 11'h2xx;
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
