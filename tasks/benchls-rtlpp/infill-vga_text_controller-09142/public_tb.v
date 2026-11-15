// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09142 dut (
    .Clock(clk),
    .Reset_L(in_vec[21:21]),
    .CPU_WANNA_DO(in_vec[20:20]),
    .Address(in_vec[19:8]),
    .Data(in_vec[7:0]),
    .crx_oreg(out_vec[59:52]),
    .cry_oreg(out_vec[51:44]),
    .ctl_oreg(out_vec[43:36]),
    .ram_weA(out_vec[35:35]),
    .ram_weB(out_vec[34:34]),
    .VGABLANKING_L(out_vec[33:33]),
    .ram_diA(out_vec[32:25]),
    .ram_adA(out_vec[24:13]),
    .ram_diB(out_vec[12:5]),
    .vga_state(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3f7ad4;
    stim[1] = 22'h35ef14;
    stim[2] = 22'h1867da;
    stim[3] = 22'h1f295a;
    stim[4] = 22'h05564f;
    stim[5] = 22'h138fb5;
    stim[6] = 22'h0a2ba7;
    stim[7] = 22'h07e4e9;
    stim[8] = 22'h018c7b;
    stim[9] = 22'h0dced1;
    stim[10] = 22'h0ee5e8;
    stim[11] = 22'h04db88;
    stim[12] = 22'h08cc77;
    stim[13] = 22'h0b98c1;
    stim[14] = 22'h0cb2e2;
    stim[15] = 22'h1ab8dc;
    stim[16] = 22'h1f1af7;
    stim[17] = 22'h0f0f55;
    stim[18] = 22'h09b9bb;
    stim[19] = 22'h0851da;
    stim[20] = 22'h1227b9;
    stim[21] = 22'h0849eb;
    stim[22] = 22'h17574c;
    stim[23] = 22'h0b71ad;
    stim[24] = 22'h1b2968;
    stim[25] = 22'h0a0b4e;
    stim[26] = 22'h18e0c0;
    stim[27] = 22'h1783e3;
    stim[28] = 22'h08c98f;
    stim[29] = 22'h1b25c2;
    stim[30] = 22'h06c3d9;
    stim[31] = 22'h024f7a;
    stim[32] = 22'h1651b0;
    stim[33] = 22'h1e83b3;
    stim[34] = 22'h12480c;
    stim[35] = 22'h0345bd;
    stim[36] = 22'h18af8a;
    stim[37] = 22'h151354;
    stim[38] = 22'h1fc075;
    stim[39] = 22'h0fe52b;
    stim[40] = 22'h0ace5d;
    stim[41] = 22'h14e8a1;
    stim[42] = 22'h0622db;
    stim[43] = 22'h1e3e19;
    stim[44] = 22'h027f55;
    stim[45] = 22'h1d755f;
    stim[46] = 22'h026dca;
    stim[47] = 22'h1e5349;
    stim[48] = 22'h128a97;
    stim[49] = 22'h164ce1;
    stim[50] = 22'h017fb0;
    stim[51] = 22'h1628b6;
    stim[52] = 22'h173ccd;
    stim[53] = 22'h04c090;
    stim[54] = 22'h1781bf;
    stim[55] = 22'h0ddad8;
    stim[56] = 22'h0f56d9;
    stim[57] = 22'h143806;
    stim[58] = 22'h06d3e4;
    stim[59] = 22'h0c6b4b;
    stim[60] = 22'h013d0d;
    stim[61] = 22'h0a97f9;
    stim[62] = 22'h15b1ae;
    stim[63] = 22'h13519f;
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
      expv[0] = 60'hxxxxxxxxxxxxxxx;
      expv[1] = 60'h2814f3200000000;
      expv[2] = 60'h2814f3200000000;
      expv[3] = 60'h2814f3200000000;
      expv[4] = 60'h2814f3200000000;
      expv[5] = 60'h2814f3200000000;
      expv[6] = 60'h2814f3200000000;
      expv[7] = 60'h2814f3200000000;
      expv[8] = 60'h2814f3200000000;
      expv[9] = 60'h2814f3200000000;
      expv[10] = 60'h2814f3200000000;
      expv[11] = 60'h2814f3200000000;
      expv[12] = 60'h2814f3200000000;
      expv[13] = 60'h2814f3200000000;
      expv[14] = 60'h2814f3200000000;
      expv[15] = 60'h2814f3200000000;
      expv[16] = 60'h2814f3200000000;
      expv[17] = 60'h2814f3200000000;
      expv[18] = 60'h2814f3200000000;
      expv[19] = 60'h2814f3200000000;
      expv[20] = 60'h2814f3200000000;
      expv[21] = 60'h2814f3200000000;
      expv[22] = 60'h2814f3200000000;
      expv[23] = 60'h2814f3200000000;
      expv[24] = 60'h2814f3200000000;
      expv[25] = 60'h2814f3200000000;
      expv[26] = 60'h2814f3200000000;
      expv[27] = 60'h2814f3200000000;
      expv[28] = 60'h2814f3200000000;
      expv[29] = 60'h2814f3200000000;
      expv[30] = 60'h2814f3200000000;
      expv[31] = 60'h2814f3200000000;
      expv[32] = 60'h2814f3200000000;
      expv[33] = 60'h2814f3200000000;
      expv[34] = 60'h2814f3200000000;
      expv[35] = 60'h2814f3200000000;
      expv[36] = 60'h2814f3200000000;
      expv[37] = 60'h2814f3200000000;
      expv[38] = 60'h2814f3200000000;
      expv[39] = 60'h2814f3200000000;
      expv[40] = 60'h2814f3200000000;
      expv[41] = 60'h2814f3200000000;
      expv[42] = 60'h2814f3200000000;
      expv[43] = 60'h2814f3200000000;
      expv[44] = 60'h2814f3200000000;
      expv[45] = 60'h2814f3200000000;
      expv[46] = 60'h2814f3200000000;
      expv[47] = 60'h2814f3200000000;
      expv[48] = 60'h2814f3200000000;
      expv[49] = 60'h2814f3200000000;
      expv[50] = 60'h2814f3200000000;
      expv[51] = 60'h2814f3200000000;
      expv[52] = 60'h2814f3200000000;
      expv[53] = 60'h2814f3200000000;
      expv[54] = 60'h2814f3200000000;
      expv[55] = 60'h2814f3200000000;
      expv[56] = 60'h2814f3200000000;
      expv[57] = 60'h2814f3200000000;
      expv[58] = 60'h2814f3200000000;
      expv[59] = 60'h2814f3200000000;
      expv[60] = 60'h2814f3200000000;
      expv[61] = 60'h2814f3200000000;
      expv[62] = 60'h2814f3200000000;
      expv[63] = 60'h2814f3200000000;
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
