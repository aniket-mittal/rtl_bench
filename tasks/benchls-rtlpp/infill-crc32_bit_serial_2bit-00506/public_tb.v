// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00506 dut (
    .clk(clk),
    .clk_ena(in_vec[5:5]),
    .init(in_vec[4:4]),
    .in_valid(in_vec[3:3]),
    .in_data(in_vec[2:1]),
    .shift(in_vec[0:0]),
    .crc(out_vec[33:2]),
    .out_data(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h13;
    stim[1] = 6'h18;
    stim[2] = 6'h33;
    stim[3] = 6'h0d;
    stim[4] = 6'h31;
    stim[5] = 6'h2e;
    stim[6] = 6'h2c;
    stim[7] = 6'h16;
    stim[8] = 6'h0b;
    stim[9] = 6'h10;
    stim[10] = 6'h0e;
    stim[11] = 6'h22;
    stim[12] = 6'h20;
    stim[13] = 6'h32;
    stim[14] = 6'h1d;
    stim[15] = 6'h23;
    stim[16] = 6'h34;
    stim[17] = 6'h20;
    stim[18] = 6'h1f;
    stim[19] = 6'h28;
    stim[20] = 6'h22;
    stim[21] = 6'h0e;
    stim[22] = 6'h27;
    stim[23] = 6'h27;
    stim[24] = 6'h11;
    stim[25] = 6'h06;
    stim[26] = 6'h2b;
    stim[27] = 6'h02;
    stim[28] = 6'h00;
    stim[29] = 6'h36;
    stim[30] = 6'h1f;
    stim[31] = 6'h35;
    stim[32] = 6'h10;
    stim[33] = 6'h12;
    stim[34] = 6'h2a;
    stim[35] = 6'h32;
    stim[36] = 6'h2e;
    stim[37] = 6'h28;
    stim[38] = 6'h29;
    stim[39] = 6'h2e;
    stim[40] = 6'h2d;
    stim[41] = 6'h09;
    stim[42] = 6'h17;
    stim[43] = 6'h34;
    stim[44] = 6'h37;
    stim[45] = 6'h23;
    stim[46] = 6'h09;
    stim[47] = 6'h18;
    stim[48] = 6'h3a;
    stim[49] = 6'h15;
    stim[50] = 6'h26;
    stim[51] = 6'h38;
    stim[52] = 6'h24;
    stim[53] = 6'h1d;
    stim[54] = 6'h01;
    stim[55] = 6'h22;
    stim[56] = 6'h36;
    stim[57] = 6'h26;
    stim[58] = 6'h17;
    stim[59] = 6'h27;
    stim[60] = 6'h31;
    stim[61] = 6'h37;
    stim[62] = 6'h1f;
    stim[63] = 6'h0c;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'h3fffffffc;
      expv[4] = 34'h3fffffffc;
      expv[5] = 34'h3fffffffc;
      expv[6] = 34'h0fffffffc;
      expv[7] = 34'h1e48ef9bc;
      expv[8] = 34'h1e48ef9bc;
      expv[9] = 34'h1e48ef9bc;
      expv[10] = 34'h1e48ef9bc;
      expv[11] = 34'h1e48ef9bc;
      expv[12] = 34'h1e48ef9bc;
      expv[13] = 34'h1e48ef9bc;
      expv[14] = 34'h3fffffffc;
      expv[15] = 34'h3fffffffc;
      expv[16] = 34'h0fffffffc;
      expv[17] = 34'h3fffffffc;
      expv[18] = 34'h3fffffffc;
      expv[19] = 34'h3fffffffc;
      expv[20] = 34'h2926cf53c;
      expv[21] = 34'h2926cf53c;
      expv[22] = 34'h2926cf53c;
      expv[23] = 34'h0a49b3d4c;
      expv[24] = 34'h02926cf53;
      expv[25] = 34'h02926cf53;
      expv[26] = 34'h02926cf53;
      expv[27] = 34'h1d138b596;
      expv[28] = 34'h1d138b596;
      expv[29] = 34'h1d138b596;
      expv[30] = 34'h3fffffffc;
      expv[31] = 34'h3fffffffc;
      expv[32] = 34'h3fffffffc;
      expv[33] = 34'h3fffffffc;
      expv[34] = 34'h3fffffffc;
      expv[35] = 34'h3491df37c;
      expv[36] = 34'h3fffffffc;
      expv[37] = 34'h0fffffffc;
      expv[38] = 34'h2526cf53c;
      expv[39] = 34'h2f908378c;
      expv[40] = 34'h0be420de3;
      expv[41] = 34'h399728ff9;
      expv[42] = 34'h399728ff9;
      expv[43] = 34'h399728ff9;
      expv[44] = 34'h3fffffffc;
      expv[45] = 34'h3fffffffc;
      expv[46] = 34'h0fffffffc;
      expv[47] = 34'h0fffffffc;
      expv[48] = 34'h0fffffffc;
      expv[49] = 34'h3fffffffc;
      expv[50] = 34'h3fffffffc;
      expv[51] = 34'h3fffffffc;
      expv[52] = 34'h3fffffffc;
      expv[53] = 34'h3fffffffc;
      expv[54] = 34'h3fffffffc;
      expv[55] = 34'h3fffffffc;
      expv[56] = 34'h3fffffffc;
      expv[57] = 34'h3fffffffc;
      expv[58] = 34'h3fffffffc;
      expv[59] = 34'h3fffffffc;
      expv[60] = 34'h0fffffffc;
      expv[61] = 34'h3fffffffc;
      expv[62] = 34'h3fffffffc;
      expv[63] = 34'h3fffffffc;
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
