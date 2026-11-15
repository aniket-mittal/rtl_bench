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

  rtlpp_02017 dut (
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
    stim[0] = 28'hc80c8d0;
    stim[1] = 28'h85acf9d;
    stim[2] = 28'h32d2351;
    stim[3] = 28'h665d931;
    stim[4] = 28'h6472d20;
    stim[5] = 28'h526b1de;
    stim[6] = 28'h63667d3;
    stim[7] = 28'h3284701;
    stim[8] = 28'h6a1b700;
    stim[9] = 28'hae13626;
    stim[10] = 28'h2463b9d;
    stim[11] = 28'h4967d24;
    stim[12] = 28'h15e7a75;
    stim[13] = 28'h676d029;
    stim[14] = 28'h6490f92;
    stim[15] = 28'h27d38bf;
    stim[16] = 28'h4ede426;
    stim[17] = 28'h7fec94a;
    stim[18] = 28'h684ebcc;
    stim[19] = 28'h4749b69;
    stim[20] = 28'h1bb03d0;
    stim[21] = 28'h365516a;
    stim[22] = 28'h3ae15ea;
    stim[23] = 28'h78f587e;
    stim[24] = 28'h3e23c0b;
    stim[25] = 28'h20a61bd;
    stim[26] = 28'h4f9ab60;
    stim[27] = 28'h0879582;
    stim[28] = 28'hb3fc420;
    stim[29] = 28'h1e5b9af;
    stim[30] = 28'h65f4574;
    stim[31] = 28'h3ba3c80;
    stim[32] = 28'h28588d5;
    stim[33] = 28'h33ed31c;
    stim[34] = 28'h1038c97;
    stim[35] = 28'h295d344;
    stim[36] = 28'h5d150b5;
    stim[37] = 28'h1f4d77d;
    stim[38] = 28'h7db1e5d;
    stim[39] = 28'h0d26c83;
    stim[40] = 28'h21ba937;
    stim[41] = 28'h2d4fd22;
    stim[42] = 28'h1474bb9;
    stim[43] = 28'h5a3307d;
    stim[44] = 28'h66e967f;
    stim[45] = 28'h1e259f2;
    stim[46] = 28'h79a4770;
    stim[47] = 28'h68fd952;
    stim[48] = 28'h69521e7;
    stim[49] = 28'h7d0b1de;
    stim[50] = 28'h53883f8;
    stim[51] = 28'h4053135;
    stim[52] = 28'h1757d0a;
    stim[53] = 28'h33ec20f;
    stim[54] = 28'h475c01f;
    stim[55] = 28'h4d45af7;
    stim[56] = 28'h1b4d882;
    stim[57] = 28'h6cec384;
    stim[58] = 28'h10e71ba;
    stim[59] = 28'h4cf5555;
    stim[60] = 28'h78c55d5;
    stim[61] = 28'h184c32c;
    stim[62] = 28'h5b51238;
    stim[63] = 28'h36f5461;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'hx00x;
      expv[2] = 13'hx00x;
      expv[3] = 13'h1002;
      expv[4] = 13'h1006;
      expv[5] = 13'h1006;
      expv[6] = 13'h1006;
      expv[7] = 13'h1006;
      expv[8] = 13'h1006;
      expv[9] = 13'h1006;
      expv[10] = 13'h1006;
      expv[11] = 13'h1002;
      expv[12] = 13'h1006;
      expv[13] = 13'h1006;
      expv[14] = 13'h1006;
      expv[15] = 13'h1006;
      expv[16] = 13'h1006;
      expv[17] = 13'h1006;
      expv[18] = 13'h1006;
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
      expv[30] = 13'h1002;
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
