// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_100015 dut (
    .PCLK(clk),
    .RESET(in_vec[19:19]),
    .PENABLE(in_vec[18:18]),
    .PSEL(in_vec[17:17]),
    .PWRITE(in_vec[16:16]),
    .PADDR(in_vec[15:8]),
    .PWDATA(in_vec[7:0]),
    .PRDATA(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h854f1;
    stim[1] = 20'haa57c;
    stim[2] = 20'h1b1c5;
    stim[3] = 20'hdb4c2;
    stim[4] = 20'h70c59;
    stim[5] = 20'h56d6e;
    stim[6] = 20'h0612b;
    stim[7] = 20'h381cd;
    stim[8] = 20'h32be7;
    stim[9] = 20'h53297;
    stim[10] = 20'h4e8be;
    stim[11] = 20'h7884e;
    stim[12] = 20'h3d9d1;
    stim[13] = 20'h6c312;
    stim[14] = 20'h4cda1;
    stim[15] = 20'h20ecd;
    stim[16] = 20'h09a8d;
    stim[17] = 20'h18583;
    stim[18] = 20'h7c2a6;
    stim[19] = 20'h21496;
    stim[20] = 20'h6b852;
    stim[21] = 20'h732c6;
    stim[22] = 20'h45b22;
    stim[23] = 20'h6597a;
    stim[24] = 20'h56760;
    stim[25] = 20'h683e1;
    stim[26] = 20'h49da6;
    stim[27] = 20'h15273;
    stim[28] = 20'h022cd;
    stim[29] = 20'h2e7a7;
    stim[30] = 20'h663cc;
    stim[31] = 20'h2ff9e;
    stim[32] = 20'h5dac6;
    stim[33] = 20'h5e63a;
    stim[34] = 20'h3c65b;
    stim[35] = 20'h43d72;
    stim[36] = 20'h4192a;
    stim[37] = 20'h459d0;
    stim[38] = 20'h001a9;
    stim[39] = 20'h690f5;
    stim[40] = 20'h3e4e4;
    stim[41] = 20'h7602c;
    stim[42] = 20'h06694;
    stim[43] = 20'h7102f;
    stim[44] = 20'h598d7;
    stim[45] = 20'h5ed59;
    stim[46] = 20'h08f30;
    stim[47] = 20'h03939;
    stim[48] = 20'h0ad26;
    stim[49] = 20'h593fb;
    stim[50] = 20'h4e0b9;
    stim[51] = 20'h3ae32;
    stim[52] = 20'h6b24c;
    stim[53] = 20'h32769;
    stim[54] = 20'h3d859;
    stim[55] = 20'h669fb;
    stim[56] = 20'h0b5d2;
    stim[57] = 20'h11d0d;
    stim[58] = 20'h7f45f;
    stim[59] = 20'h0a913;
    stim[60] = 20'h5dde6;
    stim[61] = 20'h025e7;
    stim[62] = 20'h1f9c6;
    stim[63] = 20'h01977;
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
      expv[0] = 4'h0;
      expv[1] = 4'hx;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
