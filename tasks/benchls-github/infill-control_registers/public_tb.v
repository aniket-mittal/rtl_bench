// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  control_registers dut (
    .clk(clk),
    .en(in_vec[7:7]),
    .ce(in_vec[6:6]),
    .wnr(in_vec[5:5]),
    .a(in_vec[4:1]),
    .din(in_vec[0:0]),
    .dout(out_vec[8:1]),
    .picoblaze_reset(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb5;
    stim[1] = 8'he3;
    stim[2] = 8'ha3;
    stim[3] = 8'h9c;
    stim[4] = 8'h06;
    stim[5] = 8'h24;
    stim[6] = 8'he4;
    stim[7] = 8'h61;
    stim[8] = 8'h53;
    stim[9] = 8'hb8;
    stim[10] = 8'hae;
    stim[11] = 8'ha5;
    stim[12] = 8'hf0;
    stim[13] = 8'h66;
    stim[14] = 8'h77;
    stim[15] = 8'hc9;
    stim[16] = 8'h35;
    stim[17] = 8'h5e;
    stim[18] = 8'h96;
    stim[19] = 8'h4c;
    stim[20] = 8'h58;
    stim[21] = 8'h9e;
    stim[22] = 8'h3c;
    stim[23] = 8'ha6;
    stim[24] = 8'hec;
    stim[25] = 8'h98;
    stim[26] = 8'hcc;
    stim[27] = 8'hc5;
    stim[28] = 8'h73;
    stim[29] = 8'h48;
    stim[30] = 8'h34;
    stim[31] = 8'he0;
    stim[32] = 8'h08;
    stim[33] = 8'h06;
    stim[34] = 8'h86;
    stim[35] = 8'hb5;
    stim[36] = 8'h43;
    stim[37] = 8'hb4;
    stim[38] = 8'h16;
    stim[39] = 8'h27;
    stim[40] = 8'h9e;
    stim[41] = 8'h93;
    stim[42] = 8'hd4;
    stim[43] = 8'h50;
    stim[44] = 8'h73;
    stim[45] = 8'h4a;
    stim[46] = 8'h5a;
    stim[47] = 8'hf9;
    stim[48] = 8'h2a;
    stim[49] = 8'h04;
    stim[50] = 8'hab;
    stim[51] = 8'hb7;
    stim[52] = 8'hd9;
    stim[53] = 8'h0b;
    stim[54] = 8'h24;
    stim[55] = 8'h11;
    stim[56] = 8'ha7;
    stim[57] = 8'h59;
    stim[58] = 8'h7b;
    stim[59] = 8'h46;
    stim[60] = 8'h7b;
    stim[61] = 8'hb5;
    stim[62] = 8'ha1;
    stim[63] = 8'h19;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h000;
      expv[2] = 9'h001;
      expv[3] = 9'h001;
      expv[4] = 9'h001;
      expv[5] = 9'h001;
      expv[6] = 9'h001;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h001;
      expv[49] = 9'h001;
      expv[50] = 9'h001;
      expv[51] = 9'h001;
      expv[52] = 9'h001;
      expv[53] = 9'h001;
      expv[54] = 9'h001;
      expv[55] = 9'h001;
      expv[56] = 9'h001;
      expv[57] = 9'h001;
      expv[58] = 9'h001;
      expv[59] = 9'h001;
      expv[60] = 9'h001;
      expv[61] = 9'h001;
      expv[62] = 9'h001;
      expv[63] = 9'h001;
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
