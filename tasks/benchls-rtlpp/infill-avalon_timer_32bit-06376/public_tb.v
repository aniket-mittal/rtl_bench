// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06376 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h158a07;
    stim[1] = 22'h10284c;
    stim[2] = 22'h04d213;
    stim[3] = 22'h2f18ee;
    stim[4] = 22'h3377eb;
    stim[5] = 22'h1635e3;
    stim[6] = 22'h0f1d2f;
    stim[7] = 22'h2adde6;
    stim[8] = 22'h0e1779;
    stim[9] = 22'h027e4f;
    stim[10] = 22'h3f1f77;
    stim[11] = 22'h0f59d2;
    stim[12] = 22'h2b7f1a;
    stim[13] = 22'h3ea244;
    stim[14] = 22'h03af04;
    stim[15] = 22'h1afcc6;
    stim[16] = 22'h3a2de2;
    stim[17] = 22'h16e98e;
    stim[18] = 22'h1fc898;
    stim[19] = 22'h3ba905;
    stim[20] = 22'h073dd2;
    stim[21] = 22'h332d75;
    stim[22] = 22'h03883d;
    stim[23] = 22'h06fe4f;
    stim[24] = 22'h2e9598;
    stim[25] = 22'h129b8f;
    stim[26] = 22'h0a7e5e;
    stim[27] = 22'h17873b;
    stim[28] = 22'h3332c5;
    stim[29] = 22'h1fdcb1;
    stim[30] = 22'h126d95;
    stim[31] = 22'h16d985;
    stim[32] = 22'h27c5da;
    stim[33] = 22'h33d608;
    stim[34] = 22'h2a6c34;
    stim[35] = 22'h3af96e;
    stim[36] = 22'h1f847b;
    stim[37] = 22'h13178c;
    stim[38] = 22'h0ac991;
    stim[39] = 22'h22ee18;
    stim[40] = 22'h261829;
    stim[41] = 22'h3a8b3e;
    stim[42] = 22'h0a4f4e;
    stim[43] = 22'h0a7563;
    stim[44] = 22'h160868;
    stim[45] = 22'h2a7ce0;
    stim[46] = 22'h26bed2;
    stim[47] = 22'h0ecd5e;
    stim[48] = 22'h3e94a3;
    stim[49] = 22'h23f00f;
    stim[50] = 22'h2f35f7;
    stim[51] = 22'h3f195c;
    stim[52] = 22'h3a7295;
    stim[53] = 22'h2fdb2f;
    stim[54] = 22'h26b07d;
    stim[55] = 22'h1614e5;
    stim[56] = 22'h23a279;
    stim[57] = 22'h2ea2a7;
    stim[58] = 22'h3ecf27;
    stim[59] = 22'h33027f;
    stim[60] = 22'h2e4800;
    stim[61] = 22'h162ee8;
    stim[62] = 22'h306b15;
    stim[63] = 22'h2f003c;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h0c34f;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00009;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h035e3;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h0e98e;
      expv[27] = 17'h00009;
      expv[28] = 17'h0e98e;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h0e98e;
      expv[32] = 17'h0e98e;
      expv[33] = 17'h0e98e;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h0d985;
      expv[39] = 17'h00009;
      expv[40] = 17'h0e98e;
      expv[41] = 17'h0e98e;
      expv[42] = 17'h00000;
      expv[43] = 17'h00009;
      expv[44] = 17'h00009;
      expv[45] = 17'h0d985;
      expv[46] = 17'h00000;
      expv[47] = 17'h0d985;
      expv[48] = 17'h00009;
      expv[49] = 17'h00000;
      expv[50] = 17'h00868;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00868;
      expv[56] = 17'h00868;
      expv[57] = 17'h00862;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
