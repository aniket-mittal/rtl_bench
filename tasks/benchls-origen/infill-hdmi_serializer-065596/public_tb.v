// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065596 dut (
    .i_pxlclk(clk),
    .i_serclk(in_vec[31:31]),
    .i_rstn(in_vec[30:30]),
    .i_enc_b(in_vec[29:20]),
    .i_enc_g(in_vec[19:10]),
    .i_enc_r(in_vec[9:0]),
    .o_ser_re(out_vec[5:3]),
    .o_ser_fe(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hab7b66d4;
    stim[1] = 32'h0c9f8281;
    stim[2] = 32'h7d82a822;
    stim[3] = 32'hc9043555;
    stim[4] = 32'hd355501f;
    stim[5] = 32'h6b3ca10a;
    stim[6] = 32'he63db0df;
    stim[7] = 32'hfa69a064;
    stim[8] = 32'hcb1608fa;
    stim[9] = 32'h5e09c626;
    stim[10] = 32'h53618596;
    stim[11] = 32'h4c7ab8fd;
    stim[12] = 32'h517935f4;
    stim[13] = 32'h6d2809af;
    stim[14] = 32'h5bb3208a;
    stim[15] = 32'he4fc28c3;
    stim[16] = 32'h48c86eae;
    stim[17] = 32'h7eeb45e2;
    stim[18] = 32'hedd16f01;
    stim[19] = 32'h78cadf58;
    stim[20] = 32'h5e605d11;
    stim[21] = 32'h671e5e3a;
    stim[22] = 32'h449078d5;
    stim[23] = 32'h5f3619b3;
    stim[24] = 32'h49f972c9;
    stim[25] = 32'h563c389a;
    stim[26] = 32'hc3b96002;
    stim[27] = 32'heeaff122;
    stim[28] = 32'h5dff41aa;
    stim[29] = 32'h56d49a31;
    stim[30] = 32'he96f057a;
    stim[31] = 32'hd3eb6288;
    stim[32] = 32'h73cf7f40;
    stim[33] = 32'he92a193a;
    stim[34] = 32'he7dc19db;
    stim[35] = 32'h4f75bdce;
    stim[36] = 32'hecf67631;
    stim[37] = 32'h5c64e15e;
    stim[38] = 32'h607fb222;
    stim[39] = 32'hc7c5cca9;
    stim[40] = 32'hde0544e4;
    stim[41] = 32'hde8ca305;
    stim[42] = 32'h79b12e6f;
    stim[43] = 32'h783dba46;
    stim[44] = 32'hf90ea857;
    stim[45] = 32'h479debfc;
    stim[46] = 32'hd5d3a215;
    stim[47] = 32'he2576740;
    stim[48] = 32'he4bcbe30;
    stim[49] = 32'h71e66f28;
    stim[50] = 32'h419f7e71;
    stim[51] = 32'heda11fb1;
    stim[52] = 32'hdcc61bf6;
    stim[53] = 32'h5c2d4e5a;
    stim[54] = 32'he0a1630c;
    stim[55] = 32'hf25ea046;
    stim[56] = 32'h62c7b4d4;
    stim[57] = 32'h7d99fea3;
    stim[58] = 32'h7dcc02bb;
    stim[59] = 32'h6be3102d;
    stim[60] = 32'he1f3d4dc;
    stim[61] = 32'hf5e33549;
    stim[62] = 32'h7dc5a7a3;
    stim[63] = 32'hf3aca156;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h0f;
      expv[31] = 6'h0f;
      expv[32] = 6'h0f;
      expv[33] = 6'h16;
      expv[34] = 6'h16;
      expv[35] = 6'h16;
      expv[36] = 6'h21;
      expv[37] = 6'h21;
      expv[38] = 6'h21;
      expv[39] = 6'h0c;
      expv[40] = 6'h0c;
      expv[41] = 6'h0c;
      expv[42] = 6'h0c;
      expv[43] = 6'h0c;
      expv[44] = 6'h1a;
      expv[45] = 6'h1a;
      expv[46] = 6'h0f;
      expv[47] = 6'h0f;
      expv[48] = 6'h0f;
      expv[49] = 6'h0f;
      expv[50] = 6'h0f;
      expv[51] = 6'h32;
      expv[52] = 6'h32;
      expv[53] = 6'h32;
      expv[54] = 6'h02;
      expv[55] = 6'h02;
      expv[56] = 6'h02;
      expv[57] = 6'h02;
      expv[58] = 6'h02;
      expv[59] = 6'h02;
      expv[60] = 6'h31;
      expv[61] = 6'h31;
      expv[62] = 6'h31;
      expv[63] = 6'h1f;
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
