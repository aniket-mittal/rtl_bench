// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004074 dut (
    .sys_clk_i(clk),
    .sys_rst_i(in_vec[41:41]),
    .sys_int_i(in_vec[40:40]),
    .sys_exc_i(in_vec[39:39]),
    .rIWBSTB(in_vec[38:38]),
    .iwb_ack_i(in_vec[37:37]),
    .rDWBSTB(in_vec[36:36]),
    .dwb_ack_i(in_vec[35:35]),
    .rBRA(in_vec[34:34]),
    .rDLY(in_vec[33:33]),
    .iwb_dat_i(in_vec[32:1]),
    .rMSR_IE(in_vec[0:0]),
    .rFSM(out_vec[6:5]),
    .nclk(out_vec[4:4]),
    .prst(out_vec[3:3]),
    .prun(out_vec[2:2]),
    .frun(out_vec[1:1]),
    .drun(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h2090a231514;
    stim[1] = 42'h3b2a60b35d2;
    stim[2] = 42'h0a6b05d2b1e;
    stim[3] = 42'h1a25d2848b0;
    stim[4] = 42'h18d1d5cd746;
    stim[5] = 42'h18e43ba6216;
    stim[6] = 42'h22bf55e6275;
    stim[7] = 42'h0856a4ac6b6;
    stim[8] = 42'h075e3ca589e;
    stim[9] = 42'h04b39f760b3;
    stim[10] = 42'h0e1d70a5798;
    stim[11] = 42'h02a9881f369;
    stim[12] = 42'h0782d98970b;
    stim[13] = 42'h0bd93026f10;
    stim[14] = 42'h19821003e23;
    stim[15] = 42'h00e31a2506d;
    stim[16] = 42'h0bb5154447c;
    stim[17] = 42'h03c95ba77ca;
    stim[18] = 42'h07e3b2f9f9a;
    stim[19] = 42'h0886e84250f;
    stim[20] = 42'h1905cd7c2b7;
    stim[21] = 42'h05d7bc60216;
    stim[22] = 42'h1b0df33603c;
    stim[23] = 42'h08af766e710;
    stim[24] = 42'h01ef7d414d1;
    stim[25] = 42'h1ac84797d65;
    stim[26] = 42'h044528e4cc8;
    stim[27] = 42'h0b36bba744e;
    stim[28] = 42'h07dba61b125;
    stim[29] = 42'h00963eb67f6;
    stim[30] = 42'h10ce5e9d74c;
    stim[31] = 42'h1a508e25781;
    stim[32] = 42'h108096891ed;
    stim[33] = 42'h11b908602c2;
    stim[34] = 42'h04a8d5ed8d6;
    stim[35] = 42'h0e93188192f;
    stim[36] = 42'h01c81c98aba;
    stim[37] = 42'h0a2c8149bbf;
    stim[38] = 42'h13639a52242;
    stim[39] = 42'h04082707a20;
    stim[40] = 42'h10a00eedef2;
    stim[41] = 42'h12c2c0453ed;
    stim[42] = 42'h166dac27694;
    stim[43] = 42'h13ab88ef5bc;
    stim[44] = 42'h1efbab60d9b;
    stim[45] = 42'h0ff61f79f77;
    stim[46] = 42'h03ef217bbfe;
    stim[47] = 42'h08248a92a1f;
    stim[48] = 42'h0df0597a7df;
    stim[49] = 42'h1dbf3e7f3f1;
    stim[50] = 42'h0aed9fab650;
    stim[51] = 42'h0cf3e15501e;
    stim[52] = 42'h18a00de5ed4;
    stim[53] = 42'h05ba44fcb44;
    stim[54] = 42'h0a9cc4d4c9a;
    stim[55] = 42'h1a4a943613f;
    stim[56] = 42'h1070bdc3b69;
    stim[57] = 42'h1daec447f70;
    stim[58] = 42'h05cb1ca0d0d;
    stim[59] = 42'h194d1ec7e1e;
    stim[60] = 42'h02955941a75;
    stim[61] = 42'h1f6c92f34d6;
    stim[62] = 42'h09ae599a999;
    stim[63] = 42'h1cb94da22f9;
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
      expv[0] = 7'hxx;
      expv[1] = 7'hxx;
      expv[2] = 7'hxx;
      expv[3] = 7'hxx;
      expv[4] = 7'h08;
      expv[5] = 7'h09;
      expv[6] = 7'h0a;
      expv[7] = 7'h0c;
      expv[8] = 7'h08;
      expv[9] = 7'h0a;
      expv[10] = 7'h0f;
      expv[11] = 7'h0a;
      expv[12] = 7'h0f;
      expv[13] = 7'h08;
      expv[14] = 7'h0f;
      expv[15] = 7'h09;
      expv[16] = 7'h0a;
      expv[17] = 7'h08;
      expv[18] = 7'h0d;
      expv[19] = 7'h0b;
      expv[20] = 7'h0b;
      expv[21] = 7'h08;
      expv[22] = 7'h0b;
      expv[23] = 7'h0a;
      expv[24] = 7'h0d;
      expv[25] = 7'h08;
      expv[26] = 7'h08;
      expv[27] = 7'h0a;
      expv[28] = 7'h0c;
      expv[29] = 7'h0b;
      expv[30] = 7'h08;
      expv[31] = 7'h08;
      expv[32] = 7'h0b;
      expv[33] = 7'h0e;
      expv[34] = 7'h0a;
      expv[35] = 7'h0b;
      expv[36] = 7'h0c;
      expv[37] = 7'h0a;
      expv[38] = 7'h09;
      expv[39] = 7'h0b;
      expv[40] = 7'h0a;
      expv[41] = 7'h08;
      expv[42] = 7'h0d;
      expv[43] = 7'h0a;
      expv[44] = 7'h09;
      expv[45] = 7'h0d;
      expv[46] = 7'h09;
      expv[47] = 7'h0e;
      expv[48] = 7'h09;
      expv[49] = 7'h0a;
      expv[50] = 7'h09;
      expv[51] = 7'h09;
      expv[52] = 7'h0a;
      expv[53] = 7'h0a;
      expv[54] = 7'h0b;
      expv[55] = 7'h08;
      expv[56] = 7'h0d;
      expv[57] = 7'h0a;
      expv[58] = 7'h08;
      expv[59] = 7'h08;
      expv[60] = 7'h0b;
      expv[61] = 7'h09;
      expv[62] = 7'h0e;
      expv[63] = 7'h0a;
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
