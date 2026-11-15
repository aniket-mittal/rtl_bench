// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_150627 dut (
    .wr_clk(clk),
    .wr_reset_l(in_vec[7:7]),
    .we(in_vec[6:6]),
    .rd_clk(in_vec[5:5]),
    .rd_reset_l(in_vec[4:4]),
    .re(in_vec[3:3]),
    .din(in_vec[2:0]),
    .full(out_vec[6:6]),
    .ovf(out_vec[5:5]),
    .ne(out_vec[4:4]),
    .unf(out_vec[3:3]),
    .dout(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hef;
    stim[1] = 8'ha8;
    stim[2] = 8'h48;
    stim[3] = 8'h27;
    stim[4] = 8'h54;
    stim[5] = 8'h63;
    stim[6] = 8'h0f;
    stim[7] = 8'h28;
    stim[8] = 8'h3d;
    stim[9] = 8'h10;
    stim[10] = 8'h36;
    stim[11] = 8'h3b;
    stim[12] = 8'h22;
    stim[13] = 8'h3b;
    stim[14] = 8'h4e;
    stim[15] = 8'h10;
    stim[16] = 8'h71;
    stim[17] = 8'h3c;
    stim[18] = 8'h31;
    stim[19] = 8'h62;
    stim[20] = 8'h76;
    stim[21] = 8'h6a;
    stim[22] = 8'h75;
    stim[23] = 8'h5b;
    stim[24] = 8'h5c;
    stim[25] = 8'h64;
    stim[26] = 8'h6d;
    stim[27] = 8'h04;
    stim[28] = 8'h7a;
    stim[29] = 8'h69;
    stim[30] = 8'h0f;
    stim[31] = 8'h79;
    stim[32] = 8'ha5;
    stim[33] = 8'h68;
    stim[34] = 8'h10;
    stim[35] = 8'h31;
    stim[36] = 8'h58;
    stim[37] = 8'h3d;
    stim[38] = 8'h07;
    stim[39] = 8'h4e;
    stim[40] = 8'h49;
    stim[41] = 8'h1b;
    stim[42] = 8'h55;
    stim[43] = 8'h08;
    stim[44] = 8'h20;
    stim[45] = 8'h64;
    stim[46] = 8'h3a;
    stim[47] = 8'h0e;
    stim[48] = 8'h57;
    stim[49] = 8'h75;
    stim[50] = 8'h56;
    stim[51] = 8'h04;
    stim[52] = 8'h19;
    stim[53] = 8'h35;
    stim[54] = 8'h5a;
    stim[55] = 8'h3b;
    stim[56] = 8'h1b;
    stim[57] = 8'h01;
    stim[58] = 8'h3d;
    stim[59] = 8'h75;
    stim[60] = 8'h26;
    stim[61] = 8'h01;
    stim[62] = 8'h46;
    stim[63] = 8'h6d;
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
      expv[0] = 7'h0x;
      expv[1] = 7'h17;
      expv[2] = 7'h0f;
      expv[3] = 7'h00;
      expv[4] = 7'h00;
      expv[5] = 7'h04;
      expv[6] = 7'h0b;
      expv[7] = 7'h0b;
      expv[8] = 7'h0b;
      expv[9] = 7'h03;
      expv[10] = 7'h03;
      expv[11] = 7'h0b;
      expv[12] = 7'h03;
      expv[13] = 7'h0b;
      expv[14] = 7'h0b;
      expv[15] = 7'h06;
      expv[16] = 7'h06;
      expv[17] = 7'h09;
      expv[18] = 7'h01;
      expv[19] = 7'h01;
      expv[20] = 7'h02;
      expv[21] = 7'h0e;
      expv[22] = 7'h02;
      expv[23] = 7'h0d;
      expv[24] = 7'h0b;
      expv[25] = 7'h04;
      expv[26] = 7'h0c;
      expv[27] = 7'h05;
      expv[28] = 7'h1x;
      expv[29] = 7'h0a;
      expv[30] = 7'h09;
      expv[31] = 7'h1x;
      expv[32] = 7'h01;
      expv[33] = 7'h09;
      expv[34] = 7'h00;
      expv[35] = 7'h00;
      expv[36] = 7'h08;
      expv[37] = 7'h1x;
      expv[38] = 7'h00;
      expv[39] = 7'h08;
      expv[40] = 7'h0e;
      expv[41] = 7'h09;
      expv[42] = 7'h01;
      expv[43] = 7'h0d;
      expv[44] = 7'h05;
      expv[45] = 7'h05;
      expv[46] = 7'h0c;
      expv[47] = 7'h0c;
      expv[48] = 7'h04;
      expv[49] = 7'h07;
      expv[50] = 7'h05;
      expv[51] = 7'h06;
      expv[52] = 7'h0e;
      expv[53] = 7'h06;
      expv[54] = 7'h0e;
      expv[55] = 7'h1x;
      expv[56] = 7'h1x;
      expv[57] = 7'h02;
      expv[58] = 7'h1x;
      expv[59] = 7'h1x;
      expv[60] = 7'h05;
      expv[61] = 7'h05;
      expv[62] = 7'h05;
      expv[63] = 7'h0e;
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
