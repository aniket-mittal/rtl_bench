// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_101552 dut (
    .displayValue(in_vec[18:3]),
    .digitSelect(in_vec[2:0]),
    .displayDigit(out_vec[11:8]),
    .LEDs(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7c686;
    stim[1] = 19'h116d3;
    stim[2] = 19'h36f2f;
    stim[3] = 19'h5d2eb;
    stim[4] = 19'h032fc;
    stim[5] = 19'h10a75;
    stim[6] = 19'h127a4;
    stim[7] = 19'h55dbc;
    stim[8] = 19'h43fbb;
    stim[9] = 19'h251bb;
    stim[10] = 19'h6298a;
    stim[11] = 19'h156c8;
    stim[12] = 19'h3208e;
    stim[13] = 19'h0cc17;
    stim[14] = 19'h5a0fc;
    stim[15] = 19'h2301d;
    stim[16] = 19'h4c9a0;
    stim[17] = 19'h4b0a2;
    stim[18] = 19'h7a805;
    stim[19] = 19'h36a63;
    stim[20] = 19'h25e79;
    stim[21] = 19'h08e98;
    stim[22] = 19'h6d5a5;
    stim[23] = 19'h48fa0;
    stim[24] = 19'h22023;
    stim[25] = 19'h1c5ee;
    stim[26] = 19'h2ea81;
    stim[27] = 19'h75c7f;
    stim[28] = 19'h0738a;
    stim[29] = 19'h28df3;
    stim[30] = 19'h371a4;
    stim[31] = 19'h1b80c;
    stim[32] = 19'h7acc7;
    stim[33] = 19'h1c06a;
    stim[34] = 19'h1d35d;
    stim[35] = 19'h69693;
    stim[36] = 19'h4ed65;
    stim[37] = 19'h0317c;
    stim[38] = 19'h38123;
    stim[39] = 19'h4674d;
    stim[40] = 19'h483bc;
    stim[41] = 19'h65147;
    stim[42] = 19'h1bd78;
    stim[43] = 19'h005c4;
    stim[44] = 19'h3a42e;
    stim[45] = 19'h13b0e;
    stim[46] = 19'h6cd64;
    stim[47] = 19'h7ee0e;
    stim[48] = 19'h01cfd;
    stim[49] = 19'h18375;
    stim[50] = 19'h494e5;
    stim[51] = 19'h02c94;
    stim[52] = 19'h3e4e5;
    stim[53] = 19'h4fd7b;
    stim[54] = 19'h3815b;
    stim[55] = 19'h0a7b5;
    stim[56] = 19'h31fd9;
    stim[57] = 19'h1232b;
    stim[58] = 19'h36cf5;
    stim[59] = 19'h4785e;
    stim[60] = 19'h3e9ef;
    stim[61] = 19'h796b8;
    stim[62] = 19'h7043a;
    stim[63] = 19'h556da;
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
      expv[0] = 12'h600;
      expv[1] = 12'h900;
      expv[2] = 12'h300;
      expv[3] = 12'h700;
      expv[4] = 12'h106;
      expv[5] = 12'h600;
      expv[6] = 12'h924;
      expv[7] = 12'h3ab;
      expv[8] = 12'h800;
      expv[9] = 12'h900;
      expv[10] = 12'h100;
      expv[11] = 12'h900;
      expv[12] = 12'h700;
      expv[13] = 12'h000;
      expv[14] = 12'h6b4;
      expv[15] = 12'h300;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h900;
      expv[20] = 12'h000;
      expv[21] = 12'h300;
      expv[22] = 12'h800;
      expv[23] = 12'h400;
      expv[24] = 12'h400;
      expv[25] = 12'h500;
      expv[26] = 12'h800;
      expv[27] = 12'h300;
      expv[28] = 12'h700;
      expv[29] = 12'h900;
      expv[30] = 12'h86e;
      expv[31] = 12'h437;
      expv[32] = 12'h200;
      expv[33] = 12'h900;
      expv[34] = 12'h500;
      expv[35] = 12'h900;
      expv[36] = 12'h400;
      expv[37] = 12'h106;
      expv[38] = 12'h700;
      expv[39] = 12'h300;
      expv[40] = 12'h690;
      expv[41] = 12'h200;
      expv[42] = 12'h500;
      expv[43] = 12'h000;
      expv[44] = 12'h900;
      expv[45] = 12'h100;
      expv[46] = 12'h5d9;
      expv[47] = 12'h100;
      expv[48] = 12'h700;
      expv[49] = 12'h800;
      expv[50] = 12'h200;
      expv[51] = 12'h105;
      expv[52] = 12'h000;
      expv[53] = 12'h800;
      expv[54] = 12'h700;
      expv[55] = 12'h600;
      expv[56] = 12'h900;
      expv[57] = 12'h300;
      expv[58] = 12'h200;
      expv[59] = 12'h900;
      expv[60] = 12'h100;
      expv[61] = 12'h700;
      expv[62] = 12'h900;
      expv[63] = 12'h900;
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
