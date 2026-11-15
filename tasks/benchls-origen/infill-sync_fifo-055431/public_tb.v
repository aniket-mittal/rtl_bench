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

  origen_055431 dut (
    .clk(clk),
    .rst(in_vec[6:6]),
    .data_in(in_vec[5:2]),
    .write(in_vec[1:1]),
    .read(in_vec[0:0]),
    .data_out(out_vec[5:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h56;
    stim[1] = 7'h53;
    stim[2] = 7'h39;
    stim[3] = 7'h29;
    stim[4] = 7'h08;
    stim[5] = 7'h05;
    stim[6] = 7'h30;
    stim[7] = 7'h28;
    stim[8] = 7'h3d;
    stim[9] = 7'h2b;
    stim[10] = 7'h32;
    stim[11] = 7'h2f;
    stim[12] = 7'h37;
    stim[13] = 7'h34;
    stim[14] = 7'h59;
    stim[15] = 7'h26;
    stim[16] = 7'h37;
    stim[17] = 7'h35;
    stim[18] = 7'h13;
    stim[19] = 7'h21;
    stim[20] = 7'h2b;
    stim[21] = 7'h3b;
    stim[22] = 7'h18;
    stim[23] = 7'h07;
    stim[24] = 7'h38;
    stim[25] = 7'h08;
    stim[26] = 7'h26;
    stim[27] = 7'h0c;
    stim[28] = 7'h07;
    stim[29] = 7'h0d;
    stim[30] = 7'h2d;
    stim[31] = 7'h31;
    stim[32] = 7'h30;
    stim[33] = 7'h2c;
    stim[34] = 7'h1f;
    stim[35] = 7'h01;
    stim[36] = 7'h05;
    stim[37] = 7'h17;
    stim[38] = 7'h11;
    stim[39] = 7'h10;
    stim[40] = 7'h07;
    stim[41] = 7'h03;
    stim[42] = 7'h27;
    stim[43] = 7'h06;
    stim[44] = 7'h21;
    stim[45] = 7'h3f;
    stim[46] = 7'h1d;
    stim[47] = 7'h11;
    stim[48] = 7'h02;
    stim[49] = 7'h2a;
    stim[50] = 7'h15;
    stim[51] = 7'h21;
    stim[52] = 7'h21;
    stim[53] = 7'h36;
    stim[54] = 7'h22;
    stim[55] = 7'h26;
    stim[56] = 7'h0d;
    stim[57] = 7'h26;
    stim[58] = 7'h10;
    stim[59] = 7'h14;
    stim[60] = 7'h26;
    stim[61] = 7'h1e;
    stim[62] = 7'h32;
    stim[63] = 7'h03;
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
      expv[1] = 6'hxx;
      expv[2] = 6'hxx;
      expv[3] = 6'hxx;
      expv[4] = 6'hxx;
      expv[5] = 6'hxx;
      expv[6] = 6'hxx;
      expv[7] = 6'hxx;
      expv[8] = 6'hxx;
      expv[9] = 6'hxx;
      expv[10] = 6'hxx;
      expv[11] = 6'hxx;
      expv[12] = 6'hxx;
      expv[13] = 6'hxx;
      expv[14] = 6'hxx;
      expv[15] = 6'hxx;
      expv[16] = 6'hxx;
      expv[17] = 6'hxx;
      expv[18] = 6'h24;
      expv[19] = 6'h24;
      expv[20] = 6'h34;
      expv[21] = 6'h34;
      expv[22] = 6'h35;
      expv[23] = 6'h35;
      expv[24] = 6'h35;
      expv[25] = 6'h34;
      expv[26] = 6'h34;
      expv[27] = 6'h34;
      expv[28] = 6'h34;
      expv[29] = 6'h34;
      expv[30] = 6'h04;
      expv[31] = 6'h24;
      expv[32] = 6'hxx;
      expv[33] = 6'hxx;
      expv[34] = 6'hxx;
      expv[35] = 6'hxx;
      expv[36] = 6'hxx;
      expv[37] = 6'hxx;
      expv[38] = 6'hxx;
      expv[39] = 6'hxx;
      expv[40] = 6'hxx;
      expv[41] = 6'hxx;
      expv[42] = 6'hxx;
      expv[43] = 6'hxx;
      expv[44] = 6'hxx;
      expv[45] = 6'h24;
      expv[46] = 6'h24;
      expv[47] = 6'h34;
      expv[48] = 6'h04;
      expv[49] = 6'h04;
      expv[50] = 6'h04;
      expv[51] = 6'h24;
      expv[52] = 6'h04;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h28;
      expv[58] = 6'h28;
      expv[59] = 6'h28;
      expv[60] = 6'h28;
      expv[61] = 6'h28;
      expv[62] = 6'h28;
      expv[63] = 6'h28;
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
