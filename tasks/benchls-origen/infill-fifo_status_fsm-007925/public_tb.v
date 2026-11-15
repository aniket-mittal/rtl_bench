// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007925 dut (
    .state(in_vec[6:4]),
    .data_count(in_vec[3:0]),
    .full(out_vec[5:5]),
    .empty(out_vec[4:4]),
    .wr_ack(out_vec[3:3]),
    .wr_err(out_vec[2:2]),
    .rd_ack(out_vec[1:1]),
    .rd_err(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h30;
    stim[1] = 7'h18;
    stim[2] = 7'h37;
    stim[3] = 7'h08;
    stim[4] = 7'h75;
    stim[5] = 7'h78;
    stim[6] = 7'h2d;
    stim[7] = 7'h6b;
    stim[8] = 7'h74;
    stim[9] = 7'h38;
    stim[10] = 7'h25;
    stim[11] = 7'h06;
    stim[12] = 7'h18;
    stim[13] = 7'h03;
    stim[14] = 7'h53;
    stim[15] = 7'h54;
    stim[16] = 7'h14;
    stim[17] = 7'h4f;
    stim[18] = 7'h36;
    stim[19] = 7'h11;
    stim[20] = 7'h56;
    stim[21] = 7'h41;
    stim[22] = 7'h08;
    stim[23] = 7'h3c;
    stim[24] = 7'h1a;
    stim[25] = 7'h2d;
    stim[26] = 7'h77;
    stim[27] = 7'h03;
    stim[28] = 7'h78;
    stim[29] = 7'h64;
    stim[30] = 7'h1d;
    stim[31] = 7'h56;
    stim[32] = 7'h4c;
    stim[33] = 7'h16;
    stim[34] = 7'h79;
    stim[35] = 7'h0e;
    stim[36] = 7'h4e;
    stim[37] = 7'h35;
    stim[38] = 7'h52;
    stim[39] = 7'h34;
    stim[40] = 7'h21;
    stim[41] = 7'h44;
    stim[42] = 7'h34;
    stim[43] = 7'h5a;
    stim[44] = 7'h2a;
    stim[45] = 7'h2f;
    stim[46] = 7'h5e;
    stim[47] = 7'h18;
    stim[48] = 7'h73;
    stim[49] = 7'h31;
    stim[50] = 7'h10;
    stim[51] = 7'h42;
    stim[52] = 7'h28;
    stim[53] = 7'h1c;
    stim[54] = 7'h29;
    stim[55] = 7'h38;
    stim[56] = 7'h14;
    stim[57] = 7'h7d;
    stim[58] = 7'h06;
    stim[59] = 7'h76;
    stim[60] = 7'h0f;
    stim[61] = 7'h25;
    stim[62] = 7'h38;
    stim[63] = 7'h2f;
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
      expv[0] = 6'h14;
      expv[1] = 6'h28;
      expv[2] = 6'h04;
      expv[3] = 6'h20;
      expv[4] = 6'h00;
      expv[5] = 6'h20;
      expv[6] = 6'h02;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h24;
      expv[10] = 6'h02;
      expv[11] = 6'h00;
      expv[12] = 6'h28;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h08;
      expv[17] = 6'h01;
      expv[18] = 6'h04;
      expv[19] = 6'h08;
      expv[20] = 6'h00;
      expv[21] = 6'h01;
      expv[22] = 6'h20;
      expv[23] = 6'h04;
      expv[24] = 6'h08;
      expv[25] = 6'h02;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h20;
      expv[29] = 6'h00;
      expv[30] = 6'h08;
      expv[31] = 6'h00;
      expv[32] = 6'h01;
      expv[33] = 6'h08;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h01;
      expv[37] = 6'h04;
      expv[38] = 6'h00;
      expv[39] = 6'h04;
      expv[40] = 6'h02;
      expv[41] = 6'h01;
      expv[42] = 6'h04;
      expv[43] = 6'h00;
      expv[44] = 6'h02;
      expv[45] = 6'h02;
      expv[46] = 6'h00;
      expv[47] = 6'h28;
      expv[48] = 6'h00;
      expv[49] = 6'h04;
      expv[50] = 6'h18;
      expv[51] = 6'h01;
      expv[52] = 6'h22;
      expv[53] = 6'h08;
      expv[54] = 6'h02;
      expv[55] = 6'h24;
      expv[56] = 6'h08;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h02;
      expv[62] = 6'h24;
      expv[63] = 6'h02;
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
