// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .areset(in_vec[25:25]),
    .predict_valid(in_vec[24:24]),
    .predict_pc(in_vec[23:17]),
    .train_valid(in_vec[16:16]),
    .train_taken(in_vec[15:15]),
    .train_mispredicted(in_vec[14:14]),
    .train_history(in_vec[13:7]),
    .train_pc(in_vec[6:0]),
    .predict_taken(out_vec[7:7]),
    .predict_history(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h3900192;
    stim[1] = 26'h28ab478;
    stim[2] = 26'h066d149;
    stim[3] = 26'h101f54b;
    stim[4] = 26'h3d810f0;
    stim[5] = 26'h1856e29;
    stim[6] = 26'h0382839;
    stim[7] = 26'h1b06294;
    stim[8] = 26'h0dcea60;
    stim[9] = 26'h0dcb85c;
    stim[10] = 26'h0a4686b;
    stim[11] = 26'h1aebd74;
    stim[12] = 26'h03185b7;
    stim[13] = 26'h0725b81;
    stim[14] = 26'h02982a7;
    stim[15] = 26'h1771f5d;
    stim[16] = 26'h1f85780;
    stim[17] = 26'h0252404;
    stim[18] = 26'h0d602f6;
    stim[19] = 26'h038317f;
    stim[20] = 26'h0e87740;
    stim[21] = 26'h1cf86ba;
    stim[22] = 26'h1b7a66e;
    stim[23] = 26'h1dcbd81;
    stim[24] = 26'h03c1945;
    stim[25] = 26'h065c060;
    stim[26] = 26'h1be2911;
    stim[27] = 26'h0e6c947;
    stim[28] = 26'h074e6e5;
    stim[29] = 26'h18489e2;
    stim[30] = 26'h1deb7ab;
    stim[31] = 26'h10ed1f8;
    stim[32] = 26'h0e0a902;
    stim[33] = 26'h064539e;
    stim[34] = 26'h01fd2f4;
    stim[35] = 26'h1ac0cab;
    stim[36] = 26'h06f7566;
    stim[37] = 26'h3c45694;
    stim[38] = 26'h0b8b914;
    stim[39] = 26'h027761b;
    stim[40] = 26'h1636cd9;
    stim[41] = 26'h0bea480;
    stim[42] = 26'h1bbc6ad;
    stim[43] = 26'h0e26b51;
    stim[44] = 26'h1c9ca74;
    stim[45] = 26'h1da6af8;
    stim[46] = 26'h11be556;
    stim[47] = 26'h199fd2f;
    stim[48] = 26'h1746e53;
    stim[49] = 26'h15dbd45;
    stim[50] = 26'h00eba41;
    stim[51] = 26'h04f035f;
    stim[52] = 26'h08936f8;
    stim[53] = 26'h13879b7;
    stim[54] = 26'h0fcf1ad;
    stim[55] = 26'h0b1f1b2;
    stim[56] = 26'h1096be1;
    stim[57] = 26'h09c226a;
    stim[58] = 26'h1f430dc;
    stim[59] = 26'h1bd683a;
    stim[60] = 26'h1e3c113;
    stim[61] = 26'h131edcc;
    stim[62] = 26'h09df478;
    stim[63] = 26'h144ff84;
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
      expv[0] = 8'h00;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'hxx;
      expv[7] = 8'h38;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'h70;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'h60;
      expv[16] = 8'hc0;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'h01;
      expv[22] = 8'h02;
      expv[23] = 8'h04;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'h01;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'h02;
      expv[30] = 8'h04;
      expv[31] = 8'h08;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'h4b;
      expv[36] = 8'hxx;
      expv[37] = 8'h00;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'h58;
      expv[41] = 8'hxx;
      expv[42] = 8'h32;
      expv[43] = 8'hxx;
      expv[44] = 8'h1b;
      expv[45] = 8'h29;
      expv[46] = 8'h52;
      expv[47] = 8'h15;
      expv[48] = 8'h75;
      expv[49] = 8'h6a;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'h54;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'h47;
      expv[57] = 8'hxx;
      expv[58] = 8'h2e;
      expv[59] = 8'h5c;
      expv[60] = 8'ha0;
      expv[61] = 8'h05;
      expv[62] = 8'hxx;
      expv[63] = 8'h51;
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
