// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04543 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .write_buffer(in_vec[2:2]),
    .reset_buffer(in_vec[1:1]),
    .en_16_x_baud(in_vec[0:0]),
    .serial_out(out_vec[2:2]),
    .buffer_full(out_vec[1:1]),
    .buffer_half_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h43f;
    stim[1] = 11'h5da;
    stim[2] = 11'h43d;
    stim[3] = 11'h4f0;
    stim[4] = 11'h030;
    stim[5] = 11'h268;
    stim[6] = 11'h3ec;
    stim[7] = 11'h1c8;
    stim[8] = 11'h0c9;
    stim[9] = 11'h428;
    stim[10] = 11'h6f4;
    stim[11] = 11'h1b4;
    stim[12] = 11'h190;
    stim[13] = 11'h7c9;
    stim[14] = 11'h5ad;
    stim[15] = 11'h76c;
    stim[16] = 11'h339;
    stim[17] = 11'h70d;
    stim[18] = 11'h210;
    stim[19] = 11'h14d;
    stim[20] = 11'h3ad;
    stim[21] = 11'h2dd;
    stim[22] = 11'h125;
    stim[23] = 11'h135;
    stim[24] = 11'h050;
    stim[25] = 11'h1c9;
    stim[26] = 11'h7d5;
    stim[27] = 11'h3a0;
    stim[28] = 11'h042;
    stim[29] = 11'h4d8;
    stim[30] = 11'h519;
    stim[31] = 11'h708;
    stim[32] = 11'h290;
    stim[33] = 11'h020;
    stim[34] = 11'h6c4;
    stim[35] = 11'h359;
    stim[36] = 11'h0f4;
    stim[37] = 11'h611;
    stim[38] = 11'h599;
    stim[39] = 11'h319;
    stim[40] = 11'h7cd;
    stim[41] = 11'h646;
    stim[42] = 11'h250;
    stim[43] = 11'h754;
    stim[44] = 11'h435;
    stim[45] = 11'h2b1;
    stim[46] = 11'h780;
    stim[47] = 11'h33d;
    stim[48] = 11'h045;
    stim[49] = 11'h000;
    stim[50] = 11'h281;
    stim[51] = 11'h755;
    stim[52] = 11'h784;
    stim[53] = 11'h214;
    stim[54] = 11'h4dc;
    stim[55] = 11'h5f5;
    stim[56] = 11'h01d;
    stim[57] = 11'h4f5;
    stim[58] = 11'h0b5;
    stim[59] = 11'h59d;
    stim[60] = 11'h261;
    stim[61] = 11'h1f4;
    stim[62] = 11'h194;
    stim[63] = 11'h121;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'hx;
      expv[8] = 3'hx;
      expv[9] = 3'hx;
      expv[10] = 3'hx;
      expv[11] = 3'hx;
      expv[12] = 3'hx;
      expv[13] = 3'hx;
      expv[14] = 3'hx;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h1;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h1;
      expv[24] = 3'h5;
      expv[25] = 3'h5;
      expv[26] = 3'h5;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h1;
      expv[56] = 3'h5;
      expv[57] = 3'h5;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h1;
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
