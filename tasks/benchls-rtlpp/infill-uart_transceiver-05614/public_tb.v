// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05614 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .rx(in_vec[26:26]),
    .transmit(in_vec[25:25]),
    .tx_byte(in_vec[24:17]),
    .baud(in_vec[16:1]),
    .recv_ack(in_vec[0:0]),
    .tx(out_vec[12:12]),
    .received(out_vec[11:11]),
    .rx_byte(out_vec[10:3]),
    .is_receiving(out_vec[2:2]),
    .is_transmitting(out_vec[1:1]),
    .recv_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h9f6fb12;
    stim[1] = 28'hf6a8bff;
    stim[2] = 28'h09d59e1;
    stim[3] = 28'h0c53101;
    stim[4] = 28'h183be98;
    stim[5] = 28'h05e9674;
    stim[6] = 28'h6827c7f;
    stim[7] = 28'h572aa8b;
    stim[8] = 28'h3fffc60;
    stim[9] = 28'h49db27a;
    stim[10] = 28'h2eeac79;
    stim[11] = 28'h0b84d8f;
    stim[12] = 28'h5b37745;
    stim[13] = 28'h48eff3b;
    stim[14] = 28'h6bc0a51;
    stim[15] = 28'h895a045;
    stim[16] = 28'h5a21c61;
    stim[17] = 28'h7c53e93;
    stim[18] = 28'h3e5d5d6;
    stim[19] = 28'h173cd0b;
    stim[20] = 28'h22a83d1;
    stim[21] = 28'h47e5a8c;
    stim[22] = 28'h6795cdf;
    stim[23] = 28'h3168001;
    stim[24] = 28'h23c169e;
    stim[25] = 28'h7eeda73;
    stim[26] = 28'h383afbc;
    stim[27] = 28'h312e5fe;
    stim[28] = 28'h430802b;
    stim[29] = 28'h6142f57;
    stim[30] = 28'h7509b4b;
    stim[31] = 28'h5a972cf;
    stim[32] = 28'h3cb94ee;
    stim[33] = 28'h46cfe3a;
    stim[34] = 28'h5e31716;
    stim[35] = 28'h79246f1;
    stim[36] = 28'h5d15447;
    stim[37] = 28'h35ea615;
    stim[38] = 28'h6911ee8;
    stim[39] = 28'h24a8fc6;
    stim[40] = 28'h558c2cf;
    stim[41] = 28'h2fa3b77;
    stim[42] = 28'h5f3c6db;
    stim[43] = 28'h7dc81bc;
    stim[44] = 28'h3d0e37f;
    stim[45] = 28'h2670c0e;
    stim[46] = 28'h44310cd;
    stim[47] = 28'h1fcc50c;
    stim[48] = 28'h11575aa;
    stim[49] = 28'h0eab386;
    stim[50] = 28'h453be6f;
    stim[51] = 28'h6d87a54;
    stim[52] = 28'h4751a96;
    stim[53] = 28'h53e1b16;
    stim[54] = 28'h0524407;
    stim[55] = 28'h007016e;
    stim[56] = 28'h052f946;
    stim[57] = 28'h390019d;
    stim[58] = 28'h4736bdc;
    stim[59] = 28'h581c5f5;
    stim[60] = 28'h25d36f0;
    stim[61] = 28'h792db74;
    stim[62] = 28'h7cd4a55;
    stim[63] = 28'h47fa4d3;
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
      expv[0] = 13'h1002;
      expv[1] = 13'h1002;
      expv[2] = 13'h1002;
      expv[3] = 13'h1006;
      expv[4] = 13'h1006;
      expv[5] = 13'h1006;
      expv[6] = 13'h1006;
      expv[7] = 13'h1006;
      expv[8] = 13'h1006;
      expv[9] = 13'h1006;
      expv[10] = 13'h1006;
      expv[11] = 13'h1006;
      expv[12] = 13'h1006;
      expv[13] = 13'h1006;
      expv[14] = 13'h1006;
      expv[15] = 13'h1002;
      expv[16] = 13'h1002;
      expv[17] = 13'h1002;
      expv[18] = 13'h1002;
      expv[19] = 13'h1006;
      expv[20] = 13'h1006;
      expv[21] = 13'h1006;
      expv[22] = 13'h1006;
      expv[23] = 13'h1006;
      expv[24] = 13'h1006;
      expv[25] = 13'h1006;
      expv[26] = 13'h1006;
      expv[27] = 13'h1006;
      expv[28] = 13'h1006;
      expv[29] = 13'h1006;
      expv[30] = 13'h1006;
      expv[31] = 13'h1006;
      expv[32] = 13'h1006;
      expv[33] = 13'h1006;
      expv[34] = 13'h1006;
      expv[35] = 13'h1006;
      expv[36] = 13'h1006;
      expv[37] = 13'h1006;
      expv[38] = 13'h1006;
      expv[39] = 13'h1006;
      expv[40] = 13'h1006;
      expv[41] = 13'h1006;
      expv[42] = 13'h1006;
      expv[43] = 13'h1006;
      expv[44] = 13'h1006;
      expv[45] = 13'h1006;
      expv[46] = 13'h1006;
      expv[47] = 13'h1006;
      expv[48] = 13'h1006;
      expv[49] = 13'h1006;
      expv[50] = 13'h1006;
      expv[51] = 13'h1006;
      expv[52] = 13'h1006;
      expv[53] = 13'h1006;
      expv[54] = 13'h1006;
      expv[55] = 13'h1006;
      expv[56] = 13'h1006;
      expv[57] = 13'h1006;
      expv[58] = 13'h1006;
      expv[59] = 13'h1006;
      expv[60] = 13'h1006;
      expv[61] = 13'h1006;
      expv[62] = 13'h1006;
      expv[63] = 13'h1006;
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
