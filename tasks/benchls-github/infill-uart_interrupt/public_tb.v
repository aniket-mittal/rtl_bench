// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  uart_interrupt dut (
    .clk_i(clk),
    .rstn_i(in_vec[22:22]),
    .IER_i(in_vec[21:19]),
    .error_i(in_vec[18:18]),
    .rx_elements_i(in_vec[17:12]),
    .tx_elements_i(in_vec[11:6]),
    .trigger_level_i(in_vec[5:4]),
    .clr_int_i(in_vec[3:0]),
    .interrupt_o(out_vec[4:4]),
    .IIR_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h7d5bc0;
    stim[1] = 23'h49faeb;
    stim[2] = 23'h1f0ee3;
    stim[3] = 23'h33b114;
    stim[4] = 23'h05344f;
    stim[5] = 23'h26ea89;
    stim[6] = 23'h102a62;
    stim[7] = 23'h0f5f42;
    stim[8] = 23'h29f606;
    stim[9] = 23'h3c7cf4;
    stim[10] = 23'h62aa1f;
    stim[11] = 23'h1b1870;
    stim[12] = 23'h09634e;
    stim[13] = 23'h2dedcc;
    stim[14] = 23'h36c08c;
    stim[15] = 23'h0beb44;
    stim[16] = 23'h224153;
    stim[17] = 23'h3e5d86;
    stim[18] = 23'h1920b0;
    stim[19] = 23'h2ecc99;
    stim[20] = 23'h275399;
    stim[21] = 23'h2e41e6;
    stim[22] = 23'h05ca2d;
    stim[23] = 23'h3bdc08;
    stim[24] = 23'h37f3a6;
    stim[25] = 23'h332019;
    stim[26] = 23'h1523c8;
    stim[27] = 23'h0ec1ac;
    stim[28] = 23'h0dabbe;
    stim[29] = 23'h083356;
    stim[30] = 23'h027fec;
    stim[31] = 23'h262089;
    stim[32] = 23'h003b1e;
    stim[33] = 23'h096508;
    stim[34] = 23'h07b16a;
    stim[35] = 23'h18cd09;
    stim[36] = 23'h0e9838;
    stim[37] = 23'h07488d;
    stim[38] = 23'h227548;
    stim[39] = 23'h0536a1;
    stim[40] = 23'h5adade;
    stim[41] = 23'h135663;
    stim[42] = 23'h0342f4;
    stim[43] = 23'h2bf3f9;
    stim[44] = 23'h2e55e5;
    stim[45] = 23'h26538a;
    stim[46] = 23'h0e14aa;
    stim[47] = 23'h0f55ea;
    stim[48] = 23'h31aeb0;
    stim[49] = 23'h117e0d;
    stim[50] = 23'h17b6a4;
    stim[51] = 23'h27c309;
    stim[52] = 23'h313e78;
    stim[53] = 23'h20ad48;
    stim[54] = 23'h0a2434;
    stim[55] = 23'h1b2778;
    stim[56] = 23'h127c2f;
    stim[57] = 23'h3379f0;
    stim[58] = 23'h1c4882;
    stim[59] = 23'h1747f0;
    stim[60] = 23'h0dfa39;
    stim[61] = 23'h010654;
    stim[62] = 23'h27ca16;
    stim[63] = 23'h21d31f;
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
      expv[0] = 5'h00;
      expv[1] = 5'h1c;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
