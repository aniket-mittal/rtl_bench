// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027023 dut (
    .clk(clk),
    .sw(in_vec[5:4]),
    .butt1(in_vec[3:3]),
    .butt2(in_vec[2:2]),
    .butt3(in_vec[1:1]),
    .butt4(in_vec[0:0]),
    .led(out_vec[30:27]),
    .R_time_out(out_vec[26:18]),
    .G_time_out(out_vec[17:9]),
    .B_time_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h18;
    stim[1] = 6'h08;
    stim[2] = 6'h22;
    stim[3] = 6'h20;
    stim[4] = 6'h15;
    stim[5] = 6'h29;
    stim[6] = 6'h1a;
    stim[7] = 6'h02;
    stim[8] = 6'h24;
    stim[9] = 6'h30;
    stim[10] = 6'h33;
    stim[11] = 6'h06;
    stim[12] = 6'h14;
    stim[13] = 6'h2e;
    stim[14] = 6'h17;
    stim[15] = 6'h39;
    stim[16] = 6'h21;
    stim[17] = 6'h06;
    stim[18] = 6'h30;
    stim[19] = 6'h2f;
    stim[20] = 6'h06;
    stim[21] = 6'h0b;
    stim[22] = 6'h0a;
    stim[23] = 6'h36;
    stim[24] = 6'h02;
    stim[25] = 6'h2b;
    stim[26] = 6'h01;
    stim[27] = 6'h12;
    stim[28] = 6'h18;
    stim[29] = 6'h23;
    stim[30] = 6'h05;
    stim[31] = 6'h11;
    stim[32] = 6'h06;
    stim[33] = 6'h02;
    stim[34] = 6'h1a;
    stim[35] = 6'h06;
    stim[36] = 6'h1c;
    stim[37] = 6'h3e;
    stim[38] = 6'h19;
    stim[39] = 6'h34;
    stim[40] = 6'h2b;
    stim[41] = 6'h32;
    stim[42] = 6'h0b;
    stim[43] = 6'h20;
    stim[44] = 6'h36;
    stim[45] = 6'h30;
    stim[46] = 6'h00;
    stim[47] = 6'h00;
    stim[48] = 6'h23;
    stim[49] = 6'h31;
    stim[50] = 6'h31;
    stim[51] = 6'h01;
    stim[52] = 6'h0d;
    stim[53] = 6'h00;
    stim[54] = 6'h3f;
    stim[55] = 6'h01;
    stim[56] = 6'h27;
    stim[57] = 6'h09;
    stim[58] = 6'h24;
    stim[59] = 6'h2f;
    stim[60] = 6'h17;
    stim[61] = 6'h38;
    stim[62] = 6'h31;
    stim[63] = 6'h12;
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
      expv[0] = 31'hxxxxxxxx;
      expv[1] = 31'hxxxxxxxx;
      expv[2] = 31'h0xxxxxxx;
      expv[3] = 31'h0xxxxxxx;
      expv[4] = 31'h0xxxxxxx;
      expv[5] = 31'h0xxxxxxx;
      expv[6] = 31'h0xxxxxxx;
      expv[7] = 31'h0xxxxxxx;
      expv[8] = 31'h00000000;
      expv[9] = 31'h00000000;
      expv[10] = 31'h00000000;
      expv[11] = 31'h00000000;
      expv[12] = 31'h00500014;
      expv[13] = 31'h08500014;
      expv[14] = 31'h00500014;
      expv[15] = 31'h08500014;
      expv[16] = 31'h08500014;
      expv[17] = 31'h08500014;
      expv[18] = 31'h00a00000;
      expv[19] = 31'h00a00000;
      expv[20] = 31'h00a00000;
      expv[21] = 31'h00a02800;
      expv[22] = 31'h00a02800;
      expv[23] = 31'h00a02800;
      expv[24] = 31'h00a02800;
      expv[25] = 31'h00000000;
      expv[26] = 31'h00000000;
      expv[27] = 31'h00000000;
      expv[28] = 31'h00000000;
      expv[29] = 31'h08000000;
      expv[30] = 31'h08000000;
      expv[31] = 31'h00505014;
      expv[32] = 31'h08505014;
      expv[33] = 31'h00005014;
      expv[34] = 31'h00000000;
      expv[35] = 31'h00000000;
      expv[36] = 31'h00505014;
      expv[37] = 31'h08505014;
      expv[38] = 31'h08505014;
      expv[39] = 31'h08505014;
      expv[40] = 31'h10505014;
      expv[41] = 31'h10505014;
      expv[42] = 31'h10505014;
      expv[43] = 31'h00505014;
      expv[44] = 31'h00505014;
      expv[45] = 31'h00505014;
      expv[46] = 31'h08505014;
      expv[47] = 31'h00000000;
      expv[48] = 31'h00000000;
      expv[49] = 31'h00000000;
      expv[50] = 31'h08000000;
      expv[51] = 31'h00000000;
      expv[52] = 31'h00000000;
      expv[53] = 31'h00000000;
      expv[54] = 31'h00000000;
      expv[55] = 31'h00000000;
      expv[56] = 31'h00000000;
      expv[57] = 31'h00000000;
      expv[58] = 31'h00000000;
      expv[59] = 31'h00000000;
      expv[60] = 31'h00000000;
      expv[61] = 31'h00000000;
      expv[62] = 31'h00000000;
      expv[63] = 31'h00000000;
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
