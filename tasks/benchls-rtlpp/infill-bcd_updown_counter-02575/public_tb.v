// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02575 dut (
    .clk(clk),
    .reset(in_vec[7:7]),
    .up(in_vec[6:6]),
    .en(in_vec[5:5]),
    .load(in_vec[4:4]),
    .value(in_vec[3:0]),
    .bcd(out_vec[5:2]),
    .co(out_vec[1:1]),
    .fs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hf8;
    stim[1] = 8'hde;
    stim[2] = 8'h7a;
    stim[3] = 8'h54;
    stim[4] = 8'h04;
    stim[5] = 8'h14;
    stim[6] = 8'h21;
    stim[7] = 8'h42;
    stim[8] = 8'h36;
    stim[9] = 8'h1e;
    stim[10] = 8'h64;
    stim[11] = 8'h4f;
    stim[12] = 8'h73;
    stim[13] = 8'h20;
    stim[14] = 8'h45;
    stim[15] = 8'h1c;
    stim[16] = 8'h17;
    stim[17] = 8'h33;
    stim[18] = 8'h5f;
    stim[19] = 8'h7c;
    stim[20] = 8'h36;
    stim[21] = 8'h3a;
    stim[22] = 8'h4f;
    stim[23] = 8'h4c;
    stim[24] = 8'h47;
    stim[25] = 8'hce;
    stim[26] = 8'h32;
    stim[27] = 8'h05;
    stim[28] = 8'h0d;
    stim[29] = 8'h1f;
    stim[30] = 8'h1d;
    stim[31] = 8'h78;
    stim[32] = 8'h5d;
    stim[33] = 8'h17;
    stim[34] = 8'h36;
    stim[35] = 8'h69;
    stim[36] = 8'h53;
    stim[37] = 8'h38;
    stim[38] = 8'h78;
    stim[39] = 8'h06;
    stim[40] = 8'h73;
    stim[41] = 8'h4b;
    stim[42] = 8'h11;
    stim[43] = 8'h20;
    stim[44] = 8'h75;
    stim[45] = 8'h05;
    stim[46] = 8'h47;
    stim[47] = 8'h63;
    stim[48] = 8'h34;
    stim[49] = 8'h30;
    stim[50] = 8'h66;
    stim[51] = 8'h12;
    stim[52] = 8'h23;
    stim[53] = 8'h3c;
    stim[54] = 8'h74;
    stim[55] = 8'h77;
    stim[56] = 8'h38;
    stim[57] = 8'h7a;
    stim[58] = 8'h22;
    stim[59] = 8'h24;
    stim[60] = 8'h44;
    stim[61] = 8'h07;
    stim[62] = 8'h46;
    stim[63] = 8'h34;
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
      expv[0] = 6'hxx;
      expv[1] = 6'h20;
      expv[2] = 6'h38;
      expv[3] = 6'h28;
      expv[4] = 6'h10;
      expv[5] = 6'h10;
      expv[6] = 6'h10;
      expv[7] = 6'h0c;
      expv[8] = 6'h0c;
      expv[9] = 6'h18;
      expv[10] = 6'h38;
      expv[11] = 6'h3c;
      expv[12] = 6'h3c;
      expv[13] = 6'h0c;
      expv[14] = 6'h08;
      expv[15] = 6'h08;
      expv[16] = 6'h30;
      expv[17] = 6'h1c;
      expv[18] = 6'h0c;
      expv[19] = 6'h3c;
      expv[20] = 6'h30;
      expv[21] = 6'h18;
      expv[22] = 6'h28;
      expv[23] = 6'h28;
      expv[24] = 6'h28;
      expv[25] = 6'h28;
      expv[26] = 6'h38;
      expv[27] = 6'h08;
      expv[28] = 6'h08;
      expv[29] = 6'h08;
      expv[30] = 6'h3c;
      expv[31] = 6'h34;
      expv[32] = 6'h20;
      expv[33] = 6'h34;
      expv[34] = 6'h1c;
      expv[35] = 6'h18;
      expv[36] = 6'h1c;
      expv[37] = 6'h0c;
      expv[38] = 6'h20;
      expv[39] = 6'h20;
      expv[40] = 6'h20;
      expv[41] = 6'h0c;
      expv[42] = 6'h0c;
      expv[43] = 6'h04;
      expv[44] = 6'h00;
      expv[45] = 6'h14;
      expv[46] = 6'h14;
      expv[47] = 6'h14;
      expv[48] = 6'h18;
      expv[49] = 6'h10;
      expv[50] = 6'h00;
      expv[51] = 6'h04;
      expv[52] = 6'h08;
      expv[53] = 6'h04;
      expv[54] = 6'h30;
      expv[55] = 6'h10;
      expv[56] = 6'h1c;
      expv[57] = 6'h20;
      expv[58] = 6'h28;
      expv[59] = 6'h24;
      expv[60] = 6'h20;
      expv[61] = 6'h20;
      expv[62] = 6'h20;
      expv[63] = 6'h20;
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
