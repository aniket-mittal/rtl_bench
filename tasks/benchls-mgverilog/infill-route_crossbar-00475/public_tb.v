// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00475 dut (
    .clock(clk),
    .reset_l(in_vec[7:7]),
    .selectRoute(in_vec[6:4]),
    .tx3_in(in_vec[3:3]),
    .tx2_in(in_vec[2:2]),
    .tx1_in(in_vec[1:1]),
    .tx0_in(in_vec[0:0]),
    .rx3_out(out_vec[3:3]),
    .rx2_out(out_vec[2:2]),
    .rx1_out(out_vec[1:1]),
    .rx0_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h9f;
    stim[1] = 8'hfe;
    stim[2] = 8'h79;
    stim[3] = 8'h71;
    stim[4] = 8'h4e;
    stim[5] = 8'h3c;
    stim[6] = 8'h7d;
    stim[7] = 8'h5a;
    stim[8] = 8'h67;
    stim[9] = 8'h7a;
    stim[10] = 8'h46;
    stim[11] = 8'h59;
    stim[12] = 8'h25;
    stim[13] = 8'h2e;
    stim[14] = 8'h51;
    stim[15] = 8'hdb;
    stim[16] = 8'h56;
    stim[17] = 8'h21;
    stim[18] = 8'h6a;
    stim[19] = 8'ha7;
    stim[20] = 8'h5b;
    stim[21] = 8'h20;
    stim[22] = 8'h64;
    stim[23] = 8'h29;
    stim[24] = 8'h45;
    stim[25] = 8'h60;
    stim[26] = 8'h62;
    stim[27] = 8'h19;
    stim[28] = 8'h4c;
    stim[29] = 8'h7f;
    stim[30] = 8'h38;
    stim[31] = 8'h68;
    stim[32] = 8'h12;
    stim[33] = 8'h4d;
    stim[34] = 8'h16;
    stim[35] = 8'h1c;
    stim[36] = 8'h02;
    stim[37] = 8'h6e;
    stim[38] = 8'h6d;
    stim[39] = 8'h41;
    stim[40] = 8'h2d;
    stim[41] = 8'h18;
    stim[42] = 8'h47;
    stim[43] = 8'h66;
    stim[44] = 8'h1a;
    stim[45] = 8'h65;
    stim[46] = 8'h75;
    stim[47] = 8'h39;
    stim[48] = 8'h2f;
    stim[49] = 8'h6d;
    stim[50] = 8'h17;
    stim[51] = 8'h27;
    stim[52] = 8'h44;
    stim[53] = 8'h3d;
    stim[54] = 8'h13;
    stim[55] = 8'h34;
    stim[56] = 8'h27;
    stim[57] = 8'h2b;
    stim[58] = 8'h37;
    stim[59] = 8'h7a;
    stim[60] = 8'h31;
    stim[61] = 8'h2a;
    stim[62] = 8'h0b;
    stim[63] = 8'h69;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
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
