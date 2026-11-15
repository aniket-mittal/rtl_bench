// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029148 dut (
    .clk(clk),
    .reset(in_vec[26:26]),
    .clear_error(in_vec[25:25]),
    .ack(in_vec[24:24]),
    .transfer_complete(in_vec[23:23]),
    .rom_data(in_vec[22:0]),
    .data_out(out_vec[29:7]),
    .rom_address(out_vec[6:2]),
    .auto_init_complete(out_vec[1:1]),
    .auto_init_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h6f2b0b5;
    stim[1] = 27'h7efe43c;
    stim[2] = 27'h1b0a69a;
    stim[3] = 27'h496906b;
    stim[4] = 27'h0803ccc;
    stim[5] = 27'h05db288;
    stim[6] = 27'h18a9735;
    stim[7] = 27'h333debb;
    stim[8] = 27'h26bfda3;
    stim[9] = 27'h3b2a6e7;
    stim[10] = 27'h292a845;
    stim[11] = 27'h27d0ffd;
    stim[12] = 27'h3434294;
    stim[13] = 27'h33b865f;
    stim[14] = 27'h0553109;
    stim[15] = 27'h0ea44da;
    stim[16] = 27'h10fca73;
    stim[17] = 27'h08c63ef;
    stim[18] = 27'h321074b;
    stim[19] = 27'h0d22539;
    stim[20] = 27'h0b16639;
    stim[21] = 27'h00b3a06;
    stim[22] = 27'h27076ff;
    stim[23] = 27'h28ddb65;
    stim[24] = 27'h227ae03;
    stim[25] = 27'h3accb1b;
    stim[26] = 27'h04f1308;
    stim[27] = 27'h1c25969;
    stim[28] = 27'h18be0cc;
    stim[29] = 27'h0693b25;
    stim[30] = 27'h1726948;
    stim[31] = 27'h2173606;
    stim[32] = 27'h1bd2a5e;
    stim[33] = 27'h3174068;
    stim[34] = 27'h306d724;
    stim[35] = 27'h0bc5861;
    stim[36] = 27'h3c23271;
    stim[37] = 27'h1200bd7;
    stim[38] = 27'h0846a77;
    stim[39] = 27'h3b9802e;
    stim[40] = 27'h189a626;
    stim[41] = 27'h25265a3;
    stim[42] = 27'h0fb9fcf;
    stim[43] = 27'h2fd93e1;
    stim[44] = 27'h3377dbe;
    stim[45] = 27'h3ef9649;
    stim[46] = 27'h28297c8;
    stim[47] = 27'h12a6e13;
    stim[48] = 27'h3daab35;
    stim[49] = 27'h1439dca;
    stim[50] = 27'h11be2d4;
    stim[51] = 27'h389dc1d;
    stim[52] = 27'h3c47f97;
    stim[53] = 27'h193e186;
    stim[54] = 27'h275f2a2;
    stim[55] = 27'h1d8e70a;
    stim[56] = 27'h3180d3c;
    stim[57] = 27'h20b46d1;
    stim[58] = 27'h36b8556;
    stim[59] = 27'h36b02db;
    stim[60] = 27'h24d344a;
    stim[61] = 27'h309728e;
    stim[62] = 27'h2aef870;
    stim[63] = 27'h0429504;
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
      expv[0] = 30'h00000000;
      expv[1] = 30'h00000000;
      expv[2] = 30'h00000000;
      expv[3] = 30'h00000000;
      expv[4] = 30'h00000000;
      expv[5] = 30'h001e6600;
      expv[6] = 30'h2ed94400;
      expv[7] = 30'h054b9a84;
      expv[8] = 30'h19ef5d85;
      expv[9] = 30'h19ef5d84;
      expv[10] = 30'h19537384;
      expv[11] = 30'h09542288;
      expv[12] = 30'h3e87fe88;
      expv[13] = 30'h21a14a09;
      expv[14] = 30'h21a14a08;
      expv[15] = 30'h2a988488;
      expv[16] = 30'h35226d0c;
      expv[17] = 30'h07e5398d;
      expv[18] = 30'h07e5398d;
      expv[19] = 30'h07e5398c;
      expv[20] = 30'h29129c8c;
      expv[21] = 30'h18b31c90;
      expv[22] = 30'h059d0310;
      expv[23] = 30'h383b7f90;
      expv[24] = 30'h06edb294;
      expv[25] = 30'h13d70194;
      expv[26] = 30'h16658d98;
      expv[27] = 30'h27898418;
      expv[28] = 30'h212cb49c;
      expv[29] = 30'h05f06620;
      expv[30] = 30'h349d92a0;
      expv[31] = 30'h3934a421;
      expv[32] = 30'h3934a420;
      expv[33] = 30'h1e952f20;
      expv[34] = 30'h0ba03421;
      expv[35] = 30'h0ba03420;
      expv[36] = 30'h1e2c30a0;
      expv[37] = 30'h211938a4;
      expv[38] = 30'h1005eba5;
      expv[39] = 30'h1005eba5;
      expv[40] = 30'h1005eba4;
      expv[41] = 30'h04d31324;
      expv[42] = 30'h2932d1a4;
      expv[43] = 30'h3dcfe7a8;
      expv[44] = 30'h3ec9f0ac;
      expv[45] = 30'h1bbedf2d;
      expv[46] = 30'h1bbedf2c;
      expv[47] = 30'h014be42c;
      expv[48] = 30'h153709ad;
      expv[49] = 30'h153709ac;
      expv[50] = 30'h21cee52c;
      expv[51] = 30'h0df16a2d;
      expv[52] = 30'h0df16a2c;
      expv[53] = 30'h223fcbac;
      expv[54] = 30'h09f0c330;
      expv[55] = 30'h3af95130;
      expv[56] = 30'h2c738534;
      expv[57] = 30'h0c069e35;
      expv[58] = 30'h0c069e34;
      expv[59] = 30'h35c2ab34;
      expv[60] = 30'h35816db5;
      expv[61] = 30'h35816db4;
      expv[62] = 30'h04b94734;
      expv[63] = 30'h177c3838;
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
