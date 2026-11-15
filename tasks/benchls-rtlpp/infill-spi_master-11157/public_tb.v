// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11157 dut (
    .clk(clk),
    .rst(in_vec[7:7]),
    .en(in_vec[6:6]),
    .cpol(in_vec[5:5]),
    .cpha(in_vec[4:4]),
    .xfer_len(in_vec[3:0]),
    .ss(out_vec[6:6]),
    .sck(out_vec[5:5]),
    .busy(out_vec[4:4]),
    .done(out_vec[3:3]),
    .i_load(out_vec[2:2]),
    .i_en(out_vec[1:1]),
    .tbuf_mosi_oe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc5;
    stim[1] = 8'he7;
    stim[2] = 8'h02;
    stim[3] = 8'h25;
    stim[4] = 8'h2a;
    stim[5] = 8'h23;
    stim[6] = 8'h46;
    stim[7] = 8'h6f;
    stim[8] = 8'h76;
    stim[9] = 8'h79;
    stim[10] = 8'h79;
    stim[11] = 8'h75;
    stim[12] = 8'h54;
    stim[13] = 8'h02;
    stim[14] = 8'h55;
    stim[15] = 8'h57;
    stim[16] = 8'h1c;
    stim[17] = 8'h2c;
    stim[18] = 8'h35;
    stim[19] = 8'h6d;
    stim[20] = 8'h56;
    stim[21] = 8'h1c;
    stim[22] = 8'h35;
    stim[23] = 8'h5e;
    stim[24] = 8'h0e;
    stim[25] = 8'h2d;
    stim[26] = 8'h2a;
    stim[27] = 8'h0d;
    stim[28] = 8'h5c;
    stim[29] = 8'h5b;
    stim[30] = 8'h42;
    stim[31] = 8'h70;
    stim[32] = 8'h6c;
    stim[33] = 8'h74;
    stim[34] = 8'h4b;
    stim[35] = 8'h41;
    stim[36] = 8'h30;
    stim[37] = 8'h53;
    stim[38] = 8'hca;
    stim[39] = 8'h7d;
    stim[40] = 8'h17;
    stim[41] = 8'h4e;
    stim[42] = 8'h71;
    stim[43] = 8'h60;
    stim[44] = 8'h52;
    stim[45] = 8'h5b;
    stim[46] = 8'h76;
    stim[47] = 8'h3e;
    stim[48] = 8'h96;
    stim[49] = 8'h21;
    stim[50] = 8'h0a;
    stim[51] = 8'h35;
    stim[52] = 8'h66;
    stim[53] = 8'h18;
    stim[54] = 8'h30;
    stim[55] = 8'h4c;
    stim[56] = 8'h6c;
    stim[57] = 8'h03;
    stim[58] = 8'h63;
    stim[59] = 8'h6f;
    stim[60] = 8'h32;
    stim[61] = 8'h13;
    stim[62] = 8'h09;
    stim[63] = 8'h0b;
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
      expv[0] = 7'h44;
      expv[1] = 7'h64;
      expv[2] = 7'h44;
      expv[3] = 7'h64;
      expv[4] = 7'h64;
      expv[5] = 7'h64;
      expv[6] = 7'h44;
      expv[7] = 7'h50;
      expv[8] = 7'h13;
      expv[9] = 7'h31;
      expv[10] = 7'h13;
      expv[11] = 7'h31;
      expv[12] = 7'h33;
      expv[13] = 7'h11;
      expv[14] = 7'h31;
      expv[15] = 7'h33;
      expv[16] = 7'h11;
      expv[17] = 7'h31;
      expv[18] = 7'h11;
      expv[19] = 7'h31;
      expv[20] = 7'h33;
      expv[21] = 7'h11;
      expv[22] = 7'h31;
      expv[23] = 7'h11;
      expv[24] = 7'h33;
      expv[25] = 7'h13;
      expv[26] = 7'h33;
      expv[27] = 7'h13;
      expv[28] = 7'h33;
      expv[29] = 7'h11;
      expv[30] = 7'h13;
      expv[31] = 7'h19;
      expv[32] = 7'h64;
      expv[33] = 7'h70;
      expv[34] = 7'h30;
      expv[35] = 7'h33;
      expv[36] = 7'h11;
      expv[37] = 7'h31;
      expv[38] = 7'h44;
      expv[39] = 7'h64;
      expv[40] = 7'h70;
      expv[41] = 7'h70;
      expv[42] = 7'h33;
      expv[43] = 7'h11;
      expv[44] = 7'h13;
      expv[45] = 7'h31;
      expv[46] = 7'h33;
      expv[47] = 7'h11;
      expv[48] = 7'h44;
      expv[49] = 7'h64;
      expv[50] = 7'h44;
      expv[51] = 7'h64;
      expv[52] = 7'h64;
      expv[53] = 7'h70;
      expv[54] = 7'h70;
      expv[55] = 7'h70;
      expv[56] = 7'h33;
      expv[57] = 7'h11;
      expv[58] = 7'h31;
      expv[59] = 7'h33;
      expv[60] = 7'h11;
      expv[61] = 7'h31;
      expv[62] = 7'h11;
      expv[63] = 7'h31;
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
