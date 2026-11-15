// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089972 dut (
    .clk(clk),
    .reset_n(in_vec[6:6]),
    .sensor_entrance(in_vec[5:5]),
    .sensor_exit(in_vec[4:4]),
    .password_1(in_vec[3:2]),
    .password_2(in_vec[1:0]),
    .GREEN_LED(out_vec[15:15]),
    .RED_LED(out_vec[14:14]),
    .HEX_1(out_vec[13:7]),
    .HEX_2(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h1e;
    stim[1] = 7'h3b;
    stim[2] = 7'h6c;
    stim[3] = 7'h6b;
    stim[4] = 7'h4e;
    stim[5] = 7'h52;
    stim[6] = 7'h63;
    stim[7] = 7'h7a;
    stim[8] = 7'h42;
    stim[9] = 7'h48;
    stim[10] = 7'h70;
    stim[11] = 7'h4f;
    stim[12] = 7'h6c;
    stim[13] = 7'h6b;
    stim[14] = 7'h56;
    stim[15] = 7'h62;
    stim[16] = 7'h6f;
    stim[17] = 7'h52;
    stim[18] = 7'h6a;
    stim[19] = 7'h46;
    stim[20] = 7'h53;
    stim[21] = 7'h69;
    stim[22] = 7'h4d;
    stim[23] = 7'h50;
    stim[24] = 7'h44;
    stim[25] = 7'h65;
    stim[26] = 7'h49;
    stim[27] = 7'h43;
    stim[28] = 7'h61;
    stim[29] = 7'h51;
    stim[30] = 7'h5b;
    stim[31] = 7'h64;
    stim[32] = 7'h49;
    stim[33] = 7'h5f;
    stim[34] = 7'h56;
    stim[35] = 7'h72;
    stim[36] = 7'h46;
    stim[37] = 7'h7f;
    stim[38] = 7'h4e;
    stim[39] = 7'h7b;
    stim[40] = 7'h6d;
    stim[41] = 7'h7a;
    stim[42] = 7'h74;
    stim[43] = 7'h79;
    stim[44] = 7'h55;
    stim[45] = 7'h77;
    stim[46] = 7'h7c;
    stim[47] = 7'h7e;
    stim[48] = 7'h6a;
    stim[49] = 7'h69;
    stim[50] = 7'h61;
    stim[51] = 7'h43;
    stim[52] = 7'h6f;
    stim[53] = 7'h54;
    stim[54] = 7'h55;
    stim[55] = 7'h7a;
    stim[56] = 7'h71;
    stim[57] = 7'h6d;
    stim[58] = 7'h70;
    stim[59] = 7'h48;
    stim[60] = 7'h70;
    stim[61] = 7'h47;
    stim[62] = 7'h52;
    stim[63] = 7'h55;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h3fff;
      expv[2] = 16'h3fff;
      expv[3] = 16'h432b;
      expv[4] = 16'h432b;
      expv[5] = 16'h432b;
      expv[6] = 16'h432b;
      expv[7] = 16'h0306;
      expv[8] = 16'h4306;
      expv[9] = 16'h0306;
      expv[10] = 16'h4306;
      expv[11] = 16'h0306;
      expv[12] = 16'h4306;
      expv[13] = 16'h0306;
      expv[14] = 16'h4306;
      expv[15] = 16'h8140;
      expv[16] = 16'h0140;
      expv[17] = 16'h8140;
      expv[18] = 16'h3fff;
      expv[19] = 16'h432b;
      expv[20] = 16'h432b;
      expv[21] = 16'h432b;
      expv[22] = 16'h432b;
      expv[23] = 16'h0306;
      expv[24] = 16'h4306;
      expv[25] = 16'h0306;
      expv[26] = 16'h4306;
      expv[27] = 16'h0306;
      expv[28] = 16'h4306;
      expv[29] = 16'h0306;
      expv[30] = 16'h4306;
      expv[31] = 16'h0306;
      expv[32] = 16'h4306;
      expv[33] = 16'h0306;
      expv[34] = 16'h4306;
      expv[35] = 16'h8140;
      expv[36] = 16'h490c;
      expv[37] = 16'h8140;
      expv[38] = 16'h490c;
      expv[39] = 16'h090c;
      expv[40] = 16'h490c;
      expv[41] = 16'h090c;
      expv[42] = 16'h490c;
      expv[43] = 16'h090c;
      expv[44] = 16'h490c;
      expv[45] = 16'h090c;
      expv[46] = 16'h490c;
      expv[47] = 16'h090c;
      expv[48] = 16'h490c;
      expv[49] = 16'h090c;
      expv[50] = 16'h490c;
      expv[51] = 16'h090c;
      expv[52] = 16'h490c;
      expv[53] = 16'h090c;
      expv[54] = 16'h490c;
      expv[55] = 16'h090c;
      expv[56] = 16'h490c;
      expv[57] = 16'h090c;
      expv[58] = 16'h490c;
      expv[59] = 16'h090c;
      expv[60] = 16'h490c;
      expv[61] = 16'h090c;
      expv[62] = 16'h490c;
      expv[63] = 16'h090c;
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
