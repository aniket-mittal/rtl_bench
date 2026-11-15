// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115981 dut (
    .clk(clk),
    .rst_n(in_vec[18:18]),
    .wrt(in_vec[17:17]),
    .MISO(in_vec[16:16]),
    .cmd(in_vec[15:0]),
    .done(out_vec[19:19]),
    .SS_n(out_vec[18:18]),
    .MOSI(out_vec[17:17]),
    .SCLK(out_vec[16:16]),
    .rd_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h03b2d;
    stim[1] = 19'h14220;
    stim[2] = 19'h5f487;
    stim[3] = 19'h6bce8;
    stim[4] = 19'h74b5e;
    stim[5] = 19'h579c5;
    stim[6] = 19'h70060;
    stim[7] = 19'h79d2c;
    stim[8] = 19'h79cc7;
    stim[9] = 19'h7dedd;
    stim[10] = 19'h42c31;
    stim[11] = 19'h4066a;
    stim[12] = 19'h6f2fe;
    stim[13] = 19'h44927;
    stim[14] = 19'h55b49;
    stim[15] = 19'h4d4bb;
    stim[16] = 19'h7a09f;
    stim[17] = 19'h44707;
    stim[18] = 19'h79e7b;
    stim[19] = 19'h4163a;
    stim[20] = 19'h6849a;
    stim[21] = 19'h4bcbe;
    stim[22] = 19'h5be03;
    stim[23] = 19'h65d0a;
    stim[24] = 19'h5ca34;
    stim[25] = 19'h77555;
    stim[26] = 19'h42014;
    stim[27] = 19'h7fac4;
    stim[28] = 19'h50cbf;
    stim[29] = 19'h534be;
    stim[30] = 19'h5222b;
    stim[31] = 19'h4bf60;
    stim[32] = 19'h68884;
    stim[33] = 19'h69381;
    stim[34] = 19'h540a5;
    stim[35] = 19'h69830;
    stim[36] = 19'h58a46;
    stim[37] = 19'h4b922;
    stim[38] = 19'h756ea;
    stim[39] = 19'h5320a;
    stim[40] = 19'h4fca6;
    stim[41] = 19'h748af;
    stim[42] = 19'h4f834;
    stim[43] = 19'h6e970;
    stim[44] = 19'h44658;
    stim[45] = 19'h5aaf2;
    stim[46] = 19'h4b5be;
    stim[47] = 19'h76230;
    stim[48] = 19'h4511f;
    stim[49] = 19'h4f9df;
    stim[50] = 19'h7ae72;
    stim[51] = 19'h5a6a8;
    stim[52] = 19'h66e08;
    stim[53] = 19'h70559;
    stim[54] = 19'h7e4d1;
    stim[55] = 19'h68393;
    stim[56] = 19'h6683f;
    stim[57] = 19'h73ad2;
    stim[58] = 19'h5bff8;
    stim[59] = 19'h4eca9;
    stim[60] = 19'h61c42;
    stim[61] = 19'h4eece;
    stim[62] = 19'h459f0;
    stim[63] = 19'h5d425;
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
      expv[0] = 20'h40000;
      expv[1] = 20'h40000;
      expv[2] = 20'h40000;
      expv[3] = 20'h40000;
      expv[4] = 20'h60000;
      expv[5] = 20'h20000;
      expv[6] = 20'h20000;
      expv[7] = 20'h20000;
      expv[8] = 20'h20000;
      expv[9] = 20'h20000;
      expv[10] = 20'h20000;
      expv[11] = 20'h20000;
      expv[12] = 20'h20000;
      expv[13] = 20'h20000;
      expv[14] = 20'h20000;
      expv[15] = 20'h20000;
      expv[16] = 20'h20000;
      expv[17] = 20'h20000;
      expv[18] = 20'h20000;
      expv[19] = 20'h20000;
      expv[20] = 20'h30000;
      expv[21] = 20'h30000;
      expv[22] = 20'h30000;
      expv[23] = 20'h30000;
      expv[24] = 20'h30000;
      expv[25] = 20'h30000;
      expv[26] = 20'h30000;
      expv[27] = 20'h30000;
      expv[28] = 20'h30000;
      expv[29] = 20'h30000;
      expv[30] = 20'h30000;
      expv[31] = 20'h30000;
      expv[32] = 20'h30000;
      expv[33] = 20'h30000;
      expv[34] = 20'h30000;
      expv[35] = 20'h30000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h10000;
      expv[53] = 20'h10000;
      expv[54] = 20'h10000;
      expv[55] = 20'h10000;
      expv[56] = 20'h10000;
      expv[57] = 20'h10000;
      expv[58] = 20'h10000;
      expv[59] = 20'h10000;
      expv[60] = 20'h10000;
      expv[61] = 20'h10000;
      expv[62] = 20'h10000;
      expv[63] = 20'h10000;
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
