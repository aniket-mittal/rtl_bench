// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039183 dut (
    .clk(clk),
    .enable(in_vec[21:21]),
    .gr_x(in_vec[20:10]),
    .gr_y(in_vec[9:0]),
    .out_five(out_vec[2:2]),
    .out_ten(out_vec[1:1]),
    .out_f_teen(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h367dee;
    stim[1] = 22'h19f950;
    stim[2] = 22'h29ebf6;
    stim[3] = 22'h1ec9e6;
    stim[4] = 22'h1f6169;
    stim[5] = 22'h2060fe;
    stim[6] = 22'h2da070;
    stim[7] = 22'h1f5686;
    stim[8] = 22'h20a192;
    stim[9] = 22'h1fd375;
    stim[10] = 22'h36596a;
    stim[11] = 22'h35f294;
    stim[12] = 22'h205ac4;
    stim[13] = 22'h03c492;
    stim[14] = 22'h025c94;
    stim[15] = 22'h0fb7fc;
    stim[16] = 22'h025ed6;
    stim[17] = 22'h277085;
    stim[18] = 22'h1f41e7;
    stim[19] = 22'h219bfb;
    stim[20] = 22'h32da6a;
    stim[21] = 22'h065987;
    stim[22] = 22'h0df407;
    stim[23] = 22'h3b1a8c;
    stim[24] = 22'h1fcce9;
    stim[25] = 22'h1892ea;
    stim[26] = 22'h22c63c;
    stim[27] = 22'h2cdc0e;
    stim[28] = 22'h31c3b4;
    stim[29] = 22'h152e2f;
    stim[30] = 22'h1adfd5;
    stim[31] = 22'h37a442;
    stim[32] = 22'h01ecfe;
    stim[33] = 22'h0e3a03;
    stim[34] = 22'h168ffa;
    stim[35] = 22'h1633ac;
    stim[36] = 22'h2f1017;
    stim[37] = 22'h2828a5;
    stim[38] = 22'h01fa8f;
    stim[39] = 22'h26eb9b;
    stim[40] = 22'h071e93;
    stim[41] = 22'h2c7df0;
    stim[42] = 22'h1049f7;
    stim[43] = 22'h328104;
    stim[44] = 22'h2abc1e;
    stim[45] = 22'h1ea007;
    stim[46] = 22'h1fa02a;
    stim[47] = 22'h3c0c7b;
    stim[48] = 22'h3a263f;
    stim[49] = 22'h27d991;
    stim[50] = 22'h02b5ed;
    stim[51] = 22'h0acbe4;
    stim[52] = 22'h099430;
    stim[53] = 22'h0e918e;
    stim[54] = 22'h2df92d;
    stim[55] = 22'h2aefbe;
    stim[56] = 22'h31edfc;
    stim[57] = 22'h381b0f;
    stim[58] = 22'h12eb0c;
    stim[59] = 22'h1bf91e;
    stim[60] = 22'h3bc694;
    stim[61] = 22'h153bb6;
    stim[62] = 22'h17f39f;
    stim[63] = 22'h1a8b16;
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
      expv[0] = 3'hx;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h1;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
