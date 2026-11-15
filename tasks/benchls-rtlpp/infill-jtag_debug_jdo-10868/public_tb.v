// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10868 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h31e8e3d0762;
    stim[1] = 42'h1731e2fcec5;
    stim[2] = 42'h06a18dcb20f;
    stim[3] = 42'h34db6632079;
    stim[4] = 42'h093c5706c7d;
    stim[5] = 42'h36525cc44cd;
    stim[6] = 42'h15bf02ba0bd;
    stim[7] = 42'h21adc3fc3b8;
    stim[8] = 42'h3aa94611772;
    stim[9] = 42'h04bea8be2cf;
    stim[10] = 42'h24487697c39;
    stim[11] = 42'h3c82c251a6e;
    stim[12] = 42'h1de0757ab0e;
    stim[13] = 42'h0f46675d33a;
    stim[14] = 42'h2c957955805;
    stim[15] = 42'h0daf76d5329;
    stim[16] = 42'h3f1e153e562;
    stim[17] = 42'h107748202aa;
    stim[18] = 42'h2cca7a5f439;
    stim[19] = 42'h1a4c9d89d18;
    stim[20] = 42'h3d70314cc9c;
    stim[21] = 42'h249f0019ca5;
    stim[22] = 42'h141a9076329;
    stim[23] = 42'h3ba386863c0;
    stim[24] = 42'h0d49597fabe;
    stim[25] = 42'h38e167039f8;
    stim[26] = 42'h3519db097ac;
    stim[27] = 42'h1d07531b27c;
    stim[28] = 42'h2d4c9162af4;
    stim[29] = 42'h3b7daf7da7e;
    stim[30] = 42'h08c60949d34;
    stim[31] = 42'h30192debc75;
    stim[32] = 42'h0cc702be733;
    stim[33] = 42'h3e100182fd8;
    stim[34] = 42'h33d40eb9683;
    stim[35] = 42'h37d117b582b;
    stim[36] = 42'h2befd2c276e;
    stim[37] = 42'h3d0a14c5a9d;
    stim[38] = 42'h20c52d2580a;
    stim[39] = 42'h107e855047c;
    stim[40] = 42'h2e8d856b3d2;
    stim[41] = 42'h2235ba68350;
    stim[42] = 42'h0b533ec3686;
    stim[43] = 42'h0ab250052dc;
    stim[44] = 42'h3cd64f09715;
    stim[45] = 42'h1508a910a92;
    stim[46] = 42'h1c1074fb438;
    stim[47] = 42'h0c5d5496079;
    stim[48] = 42'h21fe70d0e9b;
    stim[49] = 42'h2595e56b152;
    stim[50] = 42'h361fd0e823c;
    stim[51] = 42'h1806bdeff88;
    stim[52] = 42'h26c4b9d4e7e;
    stim[53] = 42'h29f57a47057;
    stim[54] = 42'h2022b62ecba;
    stim[55] = 42'h3c4158d359e;
    stim[56] = 42'h17ecf0d8761;
    stim[57] = 42'h2252be7db76;
    stim[58] = 42'h38555b9275d;
    stim[59] = 42'h3f21a4369f9;
    stim[60] = 42'h0c5b3b6b28b;
    stim[61] = 42'h3d3eb7ae0c5;
    stim[62] = 42'h022251f1957;
    stim[63] = 42'h1a96eab0bc8;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'h6525cc44cc20;
      expv[7] = 48'h6525cc44cc00;
      expv[8] = 48'h6525cc44cc00;
      expv[9] = 48'h6525cc44cc00;
      expv[10] = 48'h6525cc44cc00;
      expv[11] = 48'h6525cc44cc00;
      expv[12] = 48'hc82c251a6c01;
      expv[13] = 48'hc82c251a6c00;
      expv[14] = 48'hc82c251a6c00;
      expv[15] = 48'hc95795580400;
      expv[16] = 48'hc95795580400;
      expv[17] = 48'hc95795580400;
      expv[18] = 48'hc95795580400;
      expv[19] = 48'hc95795580400;
      expv[20] = 48'ha4c9d89d1800;
      expv[21] = 48'ha4c9d89d1800;
      expv[22] = 48'ha4c9d89d1800;
      expv[23] = 48'ha4c9d89d1800;
      expv[24] = 48'ha4c9d89d1800;
      expv[25] = 48'ha4c9d89d1800;
      expv[26] = 48'ha4c9d89d1800;
      expv[27] = 48'ha4c9d89d1800;
      expv[28] = 48'hd07531b27c40;
      expv[29] = 48'hd07531b27c00;
      expv[30] = 48'hd07531b27c00;
      expv[31] = 48'hd07531b27c00;
      expv[32] = 48'hd07531b27c00;
      expv[33] = 48'hcc702be73001;
      expv[34] = 48'hcc702be73000;
      expv[35] = 48'hcc702be73000;
      expv[36] = 48'h7d117b582810;
      expv[37] = 48'h7d117b582800;
      expv[38] = 48'hd0a14c5a9c00;
      expv[39] = 48'hd0a14c5a9c00;
      expv[40] = 48'hd0a14c5a9c00;
      expv[41] = 48'hd0a14c5a9c00;
      expv[42] = 48'h235ba6835008;
      expv[43] = 48'h235ba6835000;
      expv[44] = 48'hab250052de00;
      expv[45] = 48'hab250052dc00;
      expv[46] = 48'h508a910a9004;
      expv[47] = 48'h508a910a9000;
      expv[48] = 48'h508a910a9000;
      expv[49] = 48'h1fe70d0e9840;
      expv[50] = 48'h1fe70d0e9800;
      expv[51] = 48'h1fe70d0e9800;
      expv[52] = 48'h806bdeff8810;
      expv[53] = 48'h806bdeff8800;
      expv[54] = 48'h806bdeff8800;
      expv[55] = 48'h806bdeff8800;
      expv[56] = 48'hc4158d359c00;
      expv[57] = 48'hc4158d359c00;
      expv[58] = 48'hc4158d359c00;
      expv[59] = 48'hc4158d359c00;
      expv[60] = 48'hc4158d359c00;
      expv[61] = 48'hc5b3b6b28810;
      expv[62] = 48'hc5b3b6b28800;
      expv[63] = 48'hc5b3b6b28800;
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
