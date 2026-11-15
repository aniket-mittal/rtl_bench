// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  async_cdc_fifo dut (
    .wr_clk(clk),
    .rd_clk(in_vec[35:35]),
    .rstn(in_vec[34:34]),
    .wr_data(in_vec[33:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .rd_data(out_vec[34:3]),
    .fifo_full(out_vec[2:2]),
    .fifo_empty(out_vec[1:1]),
    .rd_data_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h294cc1543;
    stim[1] = 36'ha08b08de3;
    stim[2] = 36'h42438df22;
    stim[3] = 36'hd481bded7;
    stim[4] = 36'h41bf0fe13;
    stim[5] = 36'h5351fd7db;
    stim[6] = 36'hf0f631661;
    stim[7] = 36'h68bca0fd6;
    stim[8] = 36'h6b6df5f2d;
    stim[9] = 36'h550931569;
    stim[10] = 36'he3b041108;
    stim[11] = 36'h49bfd86d9;
    stim[12] = 36'h758ff2379;
    stim[13] = 36'h486d3232d;
    stim[14] = 36'h9ee265950;
    stim[15] = 36'h7e7afcf19;
    stim[16] = 36'h548f358f6;
    stim[17] = 36'hed2179188;
    stim[18] = 36'h4304dfeb2;
    stim[19] = 36'h7ef797fd8;
    stim[20] = 36'hf74a2b027;
    stim[21] = 36'hec74e2e2d;
    stim[22] = 36'h5f929357e;
    stim[23] = 36'h583e8385f;
    stim[24] = 36'h699082669;
    stim[25] = 36'he0601d3a0;
    stim[26] = 36'h40cd9d59a;
    stim[27] = 36'h71263ee4d;
    stim[28] = 36'hd90472ac0;
    stim[29] = 36'hf697947ba;
    stim[30] = 36'h474d0479f;
    stim[31] = 36'hdd7e9b819;
    stim[32] = 36'h77c86ae95;
    stim[33] = 36'h5e9e1ddfc;
    stim[34] = 36'hc9d425cea;
    stim[35] = 36'hf5e3b8958;
    stim[36] = 36'hedaf3378c;
    stim[37] = 36'hdbef1d1ea;
    stim[38] = 36'h7474749b2;
    stim[39] = 36'h5535b483b;
    stim[40] = 36'hc30d1dcbf;
    stim[41] = 36'hf0993def1;
    stim[42] = 36'h08e3b9c1a;
    stim[43] = 36'h636ab15c2;
    stim[44] = 36'hd4a49cb84;
    stim[45] = 36'h4f8022f87;
    stim[46] = 36'hea7456f62;
    stim[47] = 36'h52ecbd1e2;
    stim[48] = 36'hef0538d0b;
    stim[49] = 36'h4da5ca659;
    stim[50] = 36'hee751b6a0;
    stim[51] = 36'h7ff8dd398;
    stim[52] = 36'h4b7799bd5;
    stim[53] = 36'hfcf6b8c2e;
    stim[54] = 36'h185b27e80;
    stim[55] = 36'hfa3cbe080;
    stim[56] = 36'h5a79545dd;
    stim[57] = 36'hc46cafacf;
    stim[58] = 36'he590e46f0;
    stim[59] = 36'h510649030;
    stim[60] = 36'hfd4e0c824;
    stim[61] = 36'hd8d246965;
    stim[62] = 36'hf8ee82f2b;
    stim[63] = 36'h6d4cebbf8;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'hxxxxxxxxx;
      expv[3] = 35'h04871be43;
      expv[4] = 35'h04871be41;
      expv[5] = 35'h04871be41;
      expv[6] = 35'h29037bda9;
      expv[7] = 35'h29037bda9;
      expv[8] = 35'h29037bda9;
      expv[9] = 35'h29037bda9;
      expv[10] = 35'h29037bda8;
      expv[11] = 35'h29037bda8;
      expv[12] = 35'h29037bda8;
      expv[13] = 35'h29037bda8;
      expv[14] = 35'h29037bda8;
      expv[15] = 35'h29037bdaa;
      expv[16] = 35'h29037bdaa;
      expv[17] = 35'h29037bda8;
      expv[18] = 35'h29037bda8;
      expv[19] = 35'h29037bda8;
      expv[20] = 35'h291e6b1e9;
      expv[21] = 35'h291e6b1e9;
      expv[22] = 35'h291e6b1e9;
      expv[23] = 35'h291e6b1e9;
      expv[24] = 35'h291e6b1e9;
      expv[25] = 35'h291e6b1e8;
      expv[26] = 35'h291e6b1e8;
      expv[27] = 35'h291e6b1e8;
      expv[28] = 35'h291e6b1e8;
      expv[29] = 35'h291e6b1e8;
      expv[30] = 35'h291e6b1e8;
      expv[31] = 35'h0609bfd61;
      expv[32] = 35'h0609bfd61;
      expv[33] = 35'h0609bfd61;
      expv[34] = 35'h0609bfd60;
      expv[35] = 35'h0609bfd60;
      expv[36] = 35'h0609bfd60;
      expv[37] = 35'h0609bfd60;
      expv[38] = 35'h0609bfd60;
      expv[39] = 35'h0609bfd60;
      expv[40] = 35'h6e9456049;
      expv[41] = 35'h6e9456049;
      expv[42] = 35'h6e9456049;
      expv[43] = 35'h6e9456049;
      expv[44] = 35'h6e9456048;
      expv[45] = 35'h6e9456048;
      expv[46] = 35'h6e9456048;
      expv[47] = 35'h6e945604a;
      expv[48] = 35'h25d97a3c3;
      expv[49] = 35'h25d97a3c1;
      expv[50] = 35'h25d97a3c0;
      expv[51] = 35'h25d97a3c0;
      expv[52] = 35'h25d97a3c0;
      expv[53] = 35'h25d97a3c0;
      expv[54] = 35'h25d97a3c0;
      expv[55] = 35'h25d97a3c0;
      expv[56] = 35'h25d97a3c0;
      expv[57] = 35'h5e0a71a11;
      expv[58] = 35'h5e0a71a11;
      expv[59] = 35'h5e0a71a11;
      expv[60] = 35'h5e0a71a10;
      expv[61] = 35'h5e0a71a10;
      expv[62] = 35'h5e0a71a10;
      expv[63] = 35'h5e0a71a10;
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
