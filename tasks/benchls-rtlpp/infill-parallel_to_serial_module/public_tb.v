// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  parallel_to_serial_module dut (
    .clk5x(clk),
    .clk1x(in_vec[11:11]),
    .rst(in_vec[10:10]),
    .din(in_vec[9:0]),
    .dout_p(out_vec[1:1]),
    .dout_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hcdd;
    stim[1] = 12'h594;
    stim[2] = 12'h8d5;
    stim[3] = 12'h085;
    stim[4] = 12'ha39;
    stim[5] = 12'h302;
    stim[6] = 12'h06b;
    stim[7] = 12'hb87;
    stim[8] = 12'h164;
    stim[9] = 12'h9e7;
    stim[10] = 12'h04d;
    stim[11] = 12'ha93;
    stim[12] = 12'h0fc;
    stim[13] = 12'h30c;
    stim[14] = 12'h149;
    stim[15] = 12'hb36;
    stim[16] = 12'hbe1;
    stim[17] = 12'h0e8;
    stim[18] = 12'h30d;
    stim[19] = 12'h96c;
    stim[20] = 12'hb8b;
    stim[21] = 12'hb79;
    stim[22] = 12'h34a;
    stim[23] = 12'h9a6;
    stim[24] = 12'h824;
    stim[25] = 12'h150;
    stim[26] = 12'h90e;
    stim[27] = 12'h0ae;
    stim[28] = 12'h06c;
    stim[29] = 12'hdc6;
    stim[30] = 12'h81c;
    stim[31] = 12'h9f3;
    stim[32] = 12'h1c9;
    stim[33] = 12'h3c3;
    stim[34] = 12'h1c4;
    stim[35] = 12'hbfc;
    stim[36] = 12'h1ae;
    stim[37] = 12'h86f;
    stim[38] = 12'h85b;
    stim[39] = 12'h151;
    stim[40] = 12'h856;
    stim[41] = 12'h3d4;
    stim[42] = 12'h067;
    stim[43] = 12'h1da;
    stim[44] = 12'h87d;
    stim[45] = 12'hab1;
    stim[46] = 12'h9d5;
    stim[47] = 12'ha4a;
    stim[48] = 12'ha9c;
    stim[49] = 12'ha38;
    stim[50] = 12'ha45;
    stim[51] = 12'h367;
    stim[52] = 12'h1ad;
    stim[53] = 12'h233;
    stim[54] = 12'h211;
    stim[55] = 12'h917;
    stim[56] = 12'h1d7;
    stim[57] = 12'h345;
    stim[58] = 12'h86b;
    stim[59] = 12'h2be;
    stim[60] = 12'h130;
    stim[61] = 12'h9e6;
    stim[62] = 12'h0fa;
    stim[63] = 12'hba1;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h1;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h1;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h2;
      expv[16] = 2'h1;
      expv[17] = 2'h2;
      expv[18] = 2'h1;
      expv[19] = 2'h2;
      expv[20] = 2'h1;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h1;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h2;
      expv[44] = 2'h1;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
