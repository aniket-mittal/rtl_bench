// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_069956 dut (
    .clk_p_buf0(clk),
    .reset_n(in_vec[14:14]),
    .test_enable(in_vec[13:13]),
    .nfrzdrv(in_vec[12:12]),
    .couple_enable(in_vec[11:11]),
    .filter_code(in_vec[10:10]),
    .int_clk_out(in_vec[9:8]),
    .phy_clk_phs(in_vec[7:0]),
    .slow_clk_ph_p(out_vec[26:19]),
    .slow_clk_ph_n(out_vec[18:11]),
    .test_enable_buf(out_vec[10:10]),
    .test_enable_frz(out_vec[9:9]),
    .test_enable_n(out_vec[8:8]),
    .l_reset_n(out_vec[7:7]),
    .clk_out(out_vec[6:5]),
    .dft_mux_sel_n(out_vec[4:4]),
    .dft_mux_sel_p(out_vec[3:3]),
    .pon(out_vec[2:2]),
    .non(out_vec[1:1]),
    .int_clk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h2c92;
    stim[1] = 15'h1872;
    stim[2] = 15'h6c4d;
    stim[3] = 15'h7c1b;
    stim[4] = 15'h4e87;
    stim[5] = 15'h6c21;
    stim[6] = 15'h7437;
    stim[7] = 15'h4493;
    stim[8] = 15'h7d99;
    stim[9] = 15'h49bd;
    stim[10] = 15'h6206;
    stim[11] = 15'h5320;
    stim[12] = 15'h61a7;
    stim[13] = 15'h5c31;
    stim[14] = 15'h70dc;
    stim[15] = 15'h4346;
    stim[16] = 15'h63e9;
    stim[17] = 15'h5271;
    stim[18] = 15'h72bb;
    stim[19] = 15'h4405;
    stim[20] = 15'h4855;
    stim[21] = 15'h6d7a;
    stim[22] = 15'h6fee;
    stim[23] = 15'h4bbc;
    stim[24] = 15'h665d;
    stim[25] = 15'h681c;
    stim[26] = 15'h581f;
    stim[27] = 15'h5215;
    stim[28] = 15'h6ce3;
    stim[29] = 15'h4b57;
    stim[30] = 15'h5d59;
    stim[31] = 15'h4774;
    stim[32] = 15'h5b5e;
    stim[33] = 15'h7c34;
    stim[34] = 15'h4f92;
    stim[35] = 15'h5a98;
    stim[36] = 15'h5093;
    stim[37] = 15'h4f3f;
    stim[38] = 15'h7f4d;
    stim[39] = 15'h608b;
    stim[40] = 15'h56d0;
    stim[41] = 15'h5a64;
    stim[42] = 15'h47a1;
    stim[43] = 15'h6d6a;
    stim[44] = 15'h73f4;
    stim[45] = 15'h4bd2;
    stim[46] = 15'h5d98;
    stim[47] = 15'h70c2;
    stim[48] = 15'h4341;
    stim[49] = 15'h7fc3;
    stim[50] = 15'h5923;
    stim[51] = 15'h7b3c;
    stim[52] = 15'h691f;
    stim[53] = 15'h511e;
    stim[54] = 15'h5931;
    stim[55] = 15'h76ce;
    stim[56] = 15'h55e7;
    stim[57] = 15'h650e;
    stim[58] = 15'h6ade;
    stim[59] = 15'h59bf;
    stim[60] = 15'h43c4;
    stim[61] = 15'h4d2e;
    stim[62] = 15'h6d1a;
    stim[63] = 15'h7bc1;
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
      expv[0] = 27'hxxxxxxx;
      expv[1] = 27'hxxxxxxx;
      expv[2] = 27'hxxxxxxx;
      expv[3] = 27'hxxxxx8x;
      expv[4] = 27'hxxxxx9x;
      expv[5] = 27'h7f8068x;
      expv[6] = 27'h7f8068x;
      expv[7] = 27'h7f8039x;
      expv[8] = 27'h7f8068x;
      expv[9] = 27'h7f8039x;
      expv[10] = 27'h7f8069x;
      expv[11] = 27'h7f8019x;
      expv[12] = 27'h7f8069x;
      expv[13] = 27'h7f8019x;
      expv[14] = 27'h7f8069x;
      expv[15] = 27'h7f8039x;
      expv[16] = 27'h7f8069x;
      expv[17] = 27'h7f8019x;
      expv[18] = 27'h7f8069x;
      expv[19] = 27'h7f8039x;
      expv[20] = 27'h7f8039x;
      expv[21] = 27'h7f8068x;
      expv[22] = 27'h7f8068c;
      expv[23] = 27'h7f8039a;
      expv[24] = 27'h7f8068c;
      expv[25] = 27'h7f80694;
      expv[26] = 27'h7f8019a;
      expv[27] = 27'h7f8019c;
      expv[28] = 27'h7f8068c;
      expv[29] = 27'h7f8039a;
      expv[30] = 27'h7f8019a;
      expv[31] = 27'h7f8039c;
      expv[32] = 27'h7f8019a;
      expv[33] = 27'h7f8068c;
      expv[34] = 27'h7f8039a;
      expv[35] = 27'h7f8019a;
      expv[36] = 27'h7f8019c;
      expv[37] = 27'h7f8039a;
      expv[38] = 27'h7f8068c;
      expv[39] = 27'h7f80694;
      expv[40] = 27'h7f8019c;
      expv[41] = 27'h7f8019a;
      expv[42] = 27'h7f8039c;
      expv[43] = 27'h7f8068c;
      expv[44] = 27'h7f80694;
      expv[45] = 27'h7f8039a;
      expv[46] = 27'h7f8019a;
      expv[47] = 27'h7f80694;
      expv[48] = 27'h7f8039c;
      expv[49] = 27'h7f8068c;
      expv[50] = 27'h7f8019a;
      expv[51] = 27'h7f80694;
      expv[52] = 27'h7f80694;
      expv[53] = 27'h7f8019c;
      expv[54] = 27'h7f8019a;
      expv[55] = 27'h7f8068c;
      expv[56] = 27'h7f8019c;
      expv[57] = 27'h7f8068c;
      expv[58] = 27'h7f80694;
      expv[59] = 27'h7f8019a;
      expv[60] = 27'h7f8039c;
      expv[61] = 27'h7f8039a;
      expv[62] = 27'h7f8068c;
      expv[63] = 27'h7f80694;
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
