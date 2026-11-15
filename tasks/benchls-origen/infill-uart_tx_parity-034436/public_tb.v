// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034436 dut (
    .clk(clk),
    .send_flag(in_vec[7:7]),
    .send_data(in_vec[6:0]),
    .out_serial_bit(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h38;
    stim[1] = 8'h8d;
    stim[2] = 8'ha0;
    stim[3] = 8'h98;
    stim[4] = 8'h65;
    stim[5] = 8'hbb;
    stim[6] = 8'h2e;
    stim[7] = 8'hc9;
    stim[8] = 8'hf4;
    stim[9] = 8'h5d;
    stim[10] = 8'he2;
    stim[11] = 8'h9a;
    stim[12] = 8'h1c;
    stim[13] = 8'h66;
    stim[14] = 8'h77;
    stim[15] = 8'h13;
    stim[16] = 8'hae;
    stim[17] = 8'hf4;
    stim[18] = 8'h12;
    stim[19] = 8'ha9;
    stim[20] = 8'h19;
    stim[21] = 8'h2e;
    stim[22] = 8'hfd;
    stim[23] = 8'he5;
    stim[24] = 8'h0a;
    stim[25] = 8'h74;
    stim[26] = 8'h5e;
    stim[27] = 8'hfa;
    stim[28] = 8'h98;
    stim[29] = 8'h57;
    stim[30] = 8'hf7;
    stim[31] = 8'h26;
    stim[32] = 8'hb3;
    stim[33] = 8'h2d;
    stim[34] = 8'h66;
    stim[35] = 8'h59;
    stim[36] = 8'hdf;
    stim[37] = 8'h54;
    stim[38] = 8'hc6;
    stim[39] = 8'h98;
    stim[40] = 8'ha3;
    stim[41] = 8'hb0;
    stim[42] = 8'h0e;
    stim[43] = 8'h0e;
    stim[44] = 8'hd8;
    stim[45] = 8'h9f;
    stim[46] = 8'h11;
    stim[47] = 8'hf5;
    stim[48] = 8'h73;
    stim[49] = 8'h55;
    stim[50] = 8'h35;
    stim[51] = 8'h5e;
    stim[52] = 8'he4;
    stim[53] = 8'h6a;
    stim[54] = 8'he3;
    stim[55] = 8'h4a;
    stim[56] = 8'hab;
    stim[57] = 8'ha8;
    stim[58] = 8'h78;
    stim[59] = 8'h23;
    stim[60] = 8'h58;
    stim[61] = 8'h2c;
    stim[62] = 8'hef;
    stim[63] = 8'ha6;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
