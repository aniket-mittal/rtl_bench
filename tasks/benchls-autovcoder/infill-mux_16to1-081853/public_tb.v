// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_081853 dut (
    .in0(in_vec[19:19]),
    .in1(in_vec[18:18]),
    .in2(in_vec[17:17]),
    .in3(in_vec[16:16]),
    .in4(in_vec[15:15]),
    .in5(in_vec[14:14]),
    .in6(in_vec[13:13]),
    .in7(in_vec[12:12]),
    .in8(in_vec[11:11]),
    .in9(in_vec[10:10]),
    .in10(in_vec[9:9]),
    .in11(in_vec[8:8]),
    .in12(in_vec[7:7]),
    .in13(in_vec[6:6]),
    .in14(in_vec[5:5]),
    .in15(in_vec[4:4]),
    .sel(in_vec[3:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h5e199;
    stim[1] = 20'hfc8e0;
    stim[2] = 20'h0ccc1;
    stim[3] = 20'hee949;
    stim[4] = 20'h37672;
    stim[5] = 20'h43238;
    stim[6] = 20'hf2c60;
    stim[7] = 20'h50bdd;
    stim[8] = 20'hdbdb2;
    stim[9] = 20'hc9f8b;
    stim[10] = 20'h889f2;
    stim[11] = 20'hafa1d;
    stim[12] = 20'hdc54c;
    stim[13] = 20'h0b3c4;
    stim[14] = 20'h879e5;
    stim[15] = 20'h29864;
    stim[16] = 20'hd99ad;
    stim[17] = 20'h4d3e4;
    stim[18] = 20'ha0274;
    stim[19] = 20'h92c99;
    stim[20] = 20'h13f9c;
    stim[21] = 20'h678bd;
    stim[22] = 20'he9f69;
    stim[23] = 20'hf1170;
    stim[24] = 20'hb8fef;
    stim[25] = 20'h9ae06;
    stim[26] = 20'hc76ee;
    stim[27] = 20'hf9658;
    stim[28] = 20'h4b91b;
    stim[29] = 20'h40532;
    stim[30] = 20'h44ef3;
    stim[31] = 20'hb6bb9;
    stim[32] = 20'hae4a9;
    stim[33] = 20'hb0898;
    stim[34] = 20'h2d65e;
    stim[35] = 20'h682ca;
    stim[36] = 20'h9424a;
    stim[37] = 20'h99215;
    stim[38] = 20'hc58a4;
    stim[39] = 20'h4b18c;
    stim[40] = 20'h4a59d;
    stim[41] = 20'he616a;
    stim[42] = 20'h2a0cd;
    stim[43] = 20'hc3145;
    stim[44] = 20'hdb080;
    stim[45] = 20'h794ff;
    stim[46] = 20'hf43e4;
    stim[47] = 20'hade59;
    stim[48] = 20'h3a4d9;
    stim[49] = 20'h35b79;
    stim[50] = 20'h61408;
    stim[51] = 20'had950;
    stim[52] = 20'had295;
    stim[53] = 20'h578f6;
    stim[54] = 20'h78bd9;
    stim[55] = 20'hbf469;
    stim[56] = 20'hf7dad;
    stim[57] = 20'h61140;
    stim[58] = 20'h72cc1;
    stim[59] = 20'h9db20;
    stim[60] = 20'h0ad90;
    stim[61] = 20'h53ce0;
    stim[62] = 20'hbef57;
    stim[63] = 20'hff32a;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
