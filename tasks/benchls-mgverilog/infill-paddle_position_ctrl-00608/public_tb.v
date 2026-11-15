// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00608 dut (
    .clock(clk),
    .reset(in_vec[15:15]),
    .enable(in_vec[14:14]),
    .rotary_event(in_vec[13:13]),
    .rotary_right(in_vec[12:12]),
    .speed(in_vec[11:7]),
    .radius(in_vec[6:1]),
    .middle(in_vec[0:0]),
    .paddle_x(out_vec[19:10]),
    .paddle_y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h8767;
    stim[1] = 16'hd38e;
    stim[2] = 16'h559e;
    stim[3] = 16'h6ff7;
    stim[4] = 16'h7fe5;
    stim[5] = 16'h0713;
    stim[6] = 16'h53eb;
    stim[7] = 16'h2900;
    stim[8] = 16'h065e;
    stim[9] = 16'h2c46;
    stim[10] = 16'h561b;
    stim[11] = 16'h3516;
    stim[12] = 16'h4fc0;
    stim[13] = 16'h3548;
    stim[14] = 16'h444f;
    stim[15] = 16'h7155;
    stim[16] = 16'h2b0d;
    stim[17] = 16'h5027;
    stim[18] = 16'h12d5;
    stim[19] = 16'h6439;
    stim[20] = 16'h414c;
    stim[21] = 16'h1d44;
    stim[22] = 16'h5124;
    stim[23] = 16'h1c82;
    stim[24] = 16'h2b39;
    stim[25] = 16'h4aaf;
    stim[26] = 16'h4c24;
    stim[27] = 16'h18f1;
    stim[28] = 16'h0ce4;
    stim[29] = 16'h3649;
    stim[30] = 16'h2f27;
    stim[31] = 16'h7abc;
    stim[32] = 16'h725a;
    stim[33] = 16'h34cd;
    stim[34] = 16'h56b9;
    stim[35] = 16'h0d46;
    stim[36] = 16'h3ddb;
    stim[37] = 16'h3784;
    stim[38] = 16'h1620;
    stim[39] = 16'h604a;
    stim[40] = 16'hbeb5;
    stim[41] = 16'h0799;
    stim[42] = 16'h72ba;
    stim[43] = 16'h50e7;
    stim[44] = 16'h1578;
    stim[45] = 16'h07c6;
    stim[46] = 16'h1d5a;
    stim[47] = 16'h3051;
    stim[48] = 16'h4436;
    stim[49] = 16'h271c;
    stim[50] = 16'h4fb8;
    stim[51] = 16'h2e66;
    stim[52] = 16'h7dc8;
    stim[53] = 16'h735f;
    stim[54] = 16'h42cb;
    stim[55] = 16'h0c77;
    stim[56] = 16'h5f3a;
    stim[57] = 16'h2067;
    stim[58] = 16'h3227;
    stim[59] = 16'h1928;
    stim[60] = 16'h2346;
    stim[61] = 16'h1b55;
    stim[62] = 16'h06c9;
    stim[63] = 16'h59b2;
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
      expv[0] = 20'hxxxe8;
      expv[1] = 20'h501d8;
      expv[2] = 20'h501d8;
      expv[3] = 20'h500e8;
      expv[4] = 20'h398e8;
      expv[5] = 20'h4dce8;
      expv[6] = 20'h4dce8;
      expv[7] = 20'h4ddd8;
      expv[8] = 20'h4ddd8;
      expv[9] = 20'h4ddd8;
      expv[10] = 20'h4dce8;
      expv[11] = 20'h4ddd8;
      expv[12] = 20'h4ddd8;
      expv[13] = 20'h4ddd8;
      expv[14] = 20'h4dce8;
      expv[15] = 20'h4dce8;
      expv[16] = 20'h58ce8;
      expv[17] = 20'h58ce8;
      expv[18] = 20'h58ce8;
      expv[19] = 20'h58ce8;
      expv[20] = 20'h4fdd8;
      expv[21] = 20'h4fdd8;
      expv[22] = 20'h4fdd8;
      expv[23] = 20'h4fdd8;
      expv[24] = 20'h4fce8;
      expv[25] = 20'h4fce8;
      expv[26] = 20'h4fdd8;
      expv[27] = 20'h4fce8;
      expv[28] = 20'h4fdd8;
      expv[29] = 20'h4fce8;
      expv[30] = 20'h4fce8;
      expv[31] = 20'h4fdd8;
      expv[32] = 20'h5c9d8;
      expv[33] = 20'h68ce8;
      expv[34] = 20'h68ce8;
      expv[35] = 20'h68dd8;
      expv[36] = 20'h68ce8;
      expv[37] = 20'h68dd8;
      expv[38] = 20'h68dd8;
      expv[39] = 20'h68dd8;
      expv[40] = 20'h5f8e8;
      expv[41] = 20'h500e8;
      expv[42] = 20'h501d8;
      expv[43] = 20'h588e8;
      expv[44] = 20'h589d8;
      expv[45] = 20'h589d8;
      expv[46] = 20'h589d8;
      expv[47] = 20'h588e8;
      expv[48] = 20'h589d8;
      expv[49] = 20'h589d8;
      expv[50] = 20'h589d8;
      expv[51] = 20'h589d8;
      expv[52] = 20'h589d8;
      expv[53] = 20'h684e8;
      expv[54] = 20'h758e8;
      expv[55] = 20'h6ece8;
      expv[56] = 20'h695d8;
      expv[57] = 20'h694e8;
      expv[58] = 20'h694e8;
      expv[59] = 20'h695d8;
      expv[60] = 20'h695d8;
      expv[61] = 20'h694e8;
      expv[62] = 20'h694e8;
      expv[63] = 20'h695d8;
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
