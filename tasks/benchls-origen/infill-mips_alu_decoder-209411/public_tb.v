// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_209411 dut (
    .alu_op(in_vec[7:6]),
    .funct(in_vec[5:0]),
    .alu_ctrl(out_vec[5:3]),
    .hi_lo(out_vec[2:2]),
    .jr(out_vec[1:1]),
    .mf_hi_lo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h43;
    stim[1] = 8'hb2;
    stim[2] = 8'h00;
    stim[3] = 8'ha5;
    stim[4] = 8'hca;
    stim[5] = 8'h50;
    stim[6] = 8'hac;
    stim[7] = 8'hf3;
    stim[8] = 8'h3e;
    stim[9] = 8'h75;
    stim[10] = 8'hef;
    stim[11] = 8'h14;
    stim[12] = 8'hc1;
    stim[13] = 8'h3b;
    stim[14] = 8'h89;
    stim[15] = 8'he5;
    stim[16] = 8'hce;
    stim[17] = 8'h2c;
    stim[18] = 8'h80;
    stim[19] = 8'h1e;
    stim[20] = 8'ha7;
    stim[21] = 8'hc5;
    stim[22] = 8'h95;
    stim[23] = 8'h27;
    stim[24] = 8'hed;
    stim[25] = 8'h4c;
    stim[26] = 8'hb6;
    stim[27] = 8'h27;
    stim[28] = 8'h59;
    stim[29] = 8'h5a;
    stim[30] = 8'h11;
    stim[31] = 8'h2c;
    stim[32] = 8'hd3;
    stim[33] = 8'hdc;
    stim[34] = 8'h35;
    stim[35] = 8'hc8;
    stim[36] = 8'hd2;
    stim[37] = 8'h69;
    stim[38] = 8'hc8;
    stim[39] = 8'h84;
    stim[40] = 8'h0a;
    stim[41] = 8'h6d;
    stim[42] = 8'h33;
    stim[43] = 8'hd2;
    stim[44] = 8'h3a;
    stim[45] = 8'h53;
    stim[46] = 8'h38;
    stim[47] = 8'h66;
    stim[48] = 8'h6d;
    stim[49] = 8'h56;
    stim[50] = 8'h62;
    stim[51] = 8'hf1;
    stim[52] = 8'hb6;
    stim[53] = 8'hf4;
    stim[54] = 8'h32;
    stim[55] = 8'hf7;
    stim[56] = 8'h42;
    stim[57] = 8'h22;
    stim[58] = 8'he5;
    stim[59] = 8'h01;
    stim[60] = 8'ha7;
    stim[61] = 8'he8;
    stim[62] = 8'hdb;
    stim[63] = 8'hbb;
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
      expv[0] = 6'h30;
      expv[1] = 6'hxx;
      expv[2] = 6'h10;
      expv[3] = 6'h08;
      expv[4] = 6'hxx;
      expv[5] = 6'h30;
      expv[6] = 6'hxx;
      expv[7] = 6'hxx;
      expv[8] = 6'h10;
      expv[9] = 6'h30;
      expv[10] = 6'hxx;
      expv[11] = 6'h10;
      expv[12] = 6'hxx;
      expv[13] = 6'h10;
      expv[14] = 6'hxx;
      expv[15] = 6'h08;
      expv[16] = 6'hxx;
      expv[17] = 6'h10;
      expv[18] = 6'h18;
      expv[19] = 6'h10;
      expv[20] = 6'hxx;
      expv[21] = 6'hxx;
      expv[22] = 6'hxx;
      expv[23] = 6'h10;
      expv[24] = 6'hxx;
      expv[25] = 6'h30;
      expv[26] = 6'hxx;
      expv[27] = 6'h10;
      expv[28] = 6'h30;
      expv[29] = 6'h30;
      expv[30] = 6'h10;
      expv[31] = 6'h10;
      expv[32] = 6'hxx;
      expv[33] = 6'hxx;
      expv[34] = 6'h10;
      expv[35] = 6'hxx;
      expv[36] = 6'hxx;
      expv[37] = 6'h30;
      expv[38] = 6'hxx;
      expv[39] = 6'hxx;
      expv[40] = 6'h10;
      expv[41] = 6'h30;
      expv[42] = 6'h10;
      expv[43] = 6'hxx;
      expv[44] = 6'h10;
      expv[45] = 6'h30;
      expv[46] = 6'h10;
      expv[47] = 6'h30;
      expv[48] = 6'h30;
      expv[49] = 6'h30;
      expv[50] = 6'h30;
      expv[51] = 6'hxx;
      expv[52] = 6'hxx;
      expv[53] = 6'hxx;
      expv[54] = 6'h10;
      expv[55] = 6'hxx;
      expv[56] = 6'h30;
      expv[57] = 6'h10;
      expv[58] = 6'h08;
      expv[59] = 6'h10;
      expv[60] = 6'hxx;
      expv[61] = 6'hxx;
      expv[62] = 6'hxx;
      expv[63] = 6'hxx;
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
