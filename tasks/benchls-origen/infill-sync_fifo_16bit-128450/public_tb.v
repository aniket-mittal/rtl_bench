// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128450 dut (
    .clk(clk),
    .srst(in_vec[18:18]),
    .din(in_vec[17:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .dout(out_vec[18:3]),
    .full(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .prog_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h62a85;
    stim[1] = 19'h5931d;
    stim[2] = 19'h3ba47;
    stim[3] = 19'h01477;
    stim[4] = 19'h14e69;
    stim[5] = 19'h3c4b1;
    stim[6] = 19'h0eb9e;
    stim[7] = 19'h57ea7;
    stim[8] = 19'h1c62e;
    stim[9] = 19'h3c3dc;
    stim[10] = 19'h26e53;
    stim[11] = 19'h0b935;
    stim[12] = 19'h1d183;
    stim[13] = 19'h3603f;
    stim[14] = 19'h27c7f;
    stim[15] = 19'h2269b;
    stim[16] = 19'h1373a;
    stim[17] = 19'h20c8d;
    stim[18] = 19'h14b21;
    stim[19] = 19'h06252;
    stim[20] = 19'h0e1b4;
    stim[21] = 19'h3ecf8;
    stim[22] = 19'h3760c;
    stim[23] = 19'h2ef98;
    stim[24] = 19'h06dbc;
    stim[25] = 19'h06591;
    stim[26] = 19'h2086e;
    stim[27] = 19'h14fe2;
    stim[28] = 19'h297fa;
    stim[29] = 19'h27b78;
    stim[30] = 19'h1152c;
    stim[31] = 19'h35961;
    stim[32] = 19'h2b2d6;
    stim[33] = 19'h3a548;
    stim[34] = 19'h2df87;
    stim[35] = 19'h301c1;
    stim[36] = 19'h5ad12;
    stim[37] = 19'h0a9d6;
    stim[38] = 19'h02064;
    stim[39] = 19'h134b1;
    stim[40] = 19'h18cad;
    stim[41] = 19'h2f1c7;
    stim[42] = 19'h726ef;
    stim[43] = 19'h0289b;
    stim[44] = 19'h1dfba;
    stim[45] = 19'h23b26;
    stim[46] = 19'h29849;
    stim[47] = 19'h0f702;
    stim[48] = 19'h38d09;
    stim[49] = 19'h177c8;
    stim[50] = 19'h2c193;
    stim[51] = 19'h098c2;
    stim[52] = 19'h36d34;
    stim[53] = 19'h3c561;
    stim[54] = 19'h0fcc5;
    stim[55] = 19'h36d90;
    stim[56] = 19'h27a2b;
    stim[57] = 19'h1b10f;
    stim[58] = 19'h01099;
    stim[59] = 19'h16e19;
    stim[60] = 19'h04d24;
    stim[61] = 19'h39958;
    stim[62] = 19'h1fe04;
    stim[63] = 19'h3ab92;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'h00002;
      expv[2] = 19'h00002;
      expv[3] = 19'h00000;
      expv[4] = 19'h77488;
      expv[5] = 19'h028ea;
      expv[6] = 19'h028ea;
      expv[7] = 19'h028e8;
      expv[8] = 19'h00002;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h38c58;
      expv[12] = 19'h4dca2;
      expv[13] = 19'h4dca0;
      expv[14] = 19'h3a300;
      expv[15] = 19'h6c078;
      expv[16] = 19'h4f8f8;
      expv[17] = 19'h4f8f8;
      expv[18] = 19'h44d30;
      expv[19] = 19'h26e72;
      expv[20] = 19'h26e70;
      expv[21] = 19'h26e70;
      expv[22] = 19'h26e70;
      expv[23] = 19'h26e70;
      expv[24] = 19'h26e70;
      expv[25] = 19'h26e70;
      expv[26] = 19'h0c4a2;
      expv[27] = 19'h0c4a0;
      expv[28] = 19'h0c4a0;
      expv[29] = 19'h0c4a0;
      expv[30] = 19'h0c4a0;
      expv[31] = 19'h0c4a0;
      expv[32] = 19'h410d8;
      expv[33] = 19'h410d8;
      expv[34] = 19'h410d8;
      expv[35] = 19'h29fc0;
      expv[36] = 19'h52ff0;
      expv[37] = 19'h00002;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h153aa;
      expv[41] = 19'h153aa;
      expv[42] = 19'h153a8;
      expv[43] = 19'h00002;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h05130;
      expv[48] = 19'h05130;
      expv[49] = 19'h3bf70;
      expv[50] = 19'h3bf70;
      expv[51] = 19'h47648;
      expv[52] = 19'h47648;
      expv[53] = 19'h47648;
      expv[54] = 19'h1ee00;
      expv[55] = 19'h58320;
      expv[56] = 19'h58320;
      expv[57] = 19'h13180;
      expv[58] = 19'h4f450;
      expv[59] = 19'h3621a;
      expv[60] = 19'h3621a;
      expv[61] = 19'h3621a;
      expv[62] = 19'h3621a;
      expv[63] = 19'h3621a;
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
