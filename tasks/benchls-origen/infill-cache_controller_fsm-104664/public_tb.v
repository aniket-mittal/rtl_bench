// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104664 dut (
    .clk(clk),
    .hit0(in_vec[7:7]),
    .hit1(in_vec[6:6]),
    .lru_out(in_vec[5:5]),
    .dirty0_out(in_vec[4:4]),
    .dirty1_out(in_vec[3:3]),
    .pmem_resp(in_vec[2:2]),
    .mem_read(in_vec[1:1]),
    .mem_write(in_vec[0:0]),
    .load_data0(out_vec[13:13]),
    .load_data1(out_vec[12:12]),
    .load_valid0(out_vec[11:11]),
    .load_valid1(out_vec[10:10]),
    .load_tag0(out_vec[9:9]),
    .load_tag1(out_vec[8:8]),
    .load_lru(out_vec[7:7]),
    .load_dirty0(out_vec[6:6]),
    .load_dirty1(out_vec[5:5]),
    .datainmux_sel(out_vec[4:4]),
    .addressmux_sel(out_vec[3:3]),
    .pmem_write(out_vec[2:2]),
    .pmem_read(out_vec[1:1]),
    .mem_resp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h46;
    stim[1] = 8'h61;
    stim[2] = 8'h5d;
    stim[3] = 8'h93;
    stim[4] = 8'h8e;
    stim[5] = 8'hbc;
    stim[6] = 8'h69;
    stim[7] = 8'h44;
    stim[8] = 8'h73;
    stim[9] = 8'ha9;
    stim[10] = 8'ha1;
    stim[11] = 8'hb9;
    stim[12] = 8'h9e;
    stim[13] = 8'hb5;
    stim[14] = 8'hac;
    stim[15] = 8'h62;
    stim[16] = 8'h8d;
    stim[17] = 8'hc5;
    stim[18] = 8'h3b;
    stim[19] = 8'h96;
    stim[20] = 8'h82;
    stim[21] = 8'h48;
    stim[22] = 8'h75;
    stim[23] = 8'h38;
    stim[24] = 8'hf2;
    stim[25] = 8'h17;
    stim[26] = 8'h2b;
    stim[27] = 8'h5e;
    stim[28] = 8'hd0;
    stim[29] = 8'h6d;
    stim[30] = 8'h7e;
    stim[31] = 8'hde;
    stim[32] = 8'h73;
    stim[33] = 8'h85;
    stim[34] = 8'hf0;
    stim[35] = 8'hd8;
    stim[36] = 8'h51;
    stim[37] = 8'h06;
    stim[38] = 8'hce;
    stim[39] = 8'hf6;
    stim[40] = 8'h06;
    stim[41] = 8'hdc;
    stim[42] = 8'h32;
    stim[43] = 8'h86;
    stim[44] = 8'h1c;
    stim[45] = 8'h89;
    stim[46] = 8'h6a;
    stim[47] = 8'ha2;
    stim[48] = 8'h4a;
    stim[49] = 8'ha8;
    stim[50] = 8'hb2;
    stim[51] = 8'he3;
    stim[52] = 8'hdf;
    stim[53] = 8'h52;
    stim[54] = 8'he0;
    stim[55] = 8'he2;
    stim[56] = 8'h35;
    stim[57] = 8'h45;
    stim[58] = 8'hf0;
    stim[59] = 8'h78;
    stim[60] = 8'h2f;
    stim[61] = 8'h2f;
    stim[62] = 8'h45;
    stim[63] = 8'hb7;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h10b1;
      expv[2] = 14'h10b1;
      expv[3] = 14'h20d1;
      expv[4] = 14'h0081;
      expv[5] = 14'h0081;
      expv[6] = 14'h10b1;
      expv[7] = 14'h0081;
      expv[8] = 14'h10b1;
      expv[9] = 14'h20d1;
      expv[10] = 14'h20d1;
      expv[11] = 14'h20d1;
      expv[12] = 14'h0081;
      expv[13] = 14'h20d1;
      expv[14] = 14'h0081;
      expv[15] = 14'h0081;
      expv[16] = 14'h20d1;
      expv[17] = 14'h20d1;
      expv[18] = 14'h0000;
      expv[19] = 14'h000c;
      expv[20] = 14'h000a;
      expv[21] = 14'h000a;
      expv[22] = 14'h15ba;
      expv[23] = 14'h0000;
      expv[24] = 14'h0081;
      expv[25] = 14'h0000;
      expv[26] = 14'h000c;
      expv[27] = 14'h000c;
      expv[28] = 14'h000a;
      expv[29] = 14'h15ba;
      expv[30] = 14'h0081;
      expv[31] = 14'h0081;
      expv[32] = 14'h10b1;
      expv[33] = 14'h20d1;
      expv[34] = 14'h0081;
      expv[35] = 14'h0081;
      expv[36] = 14'h10b1;
      expv[37] = 14'h0000;
      expv[38] = 14'h2a8a;
      expv[39] = 14'h0081;
      expv[40] = 14'h0000;
      expv[41] = 14'h2a8a;
      expv[42] = 14'h0000;
      expv[43] = 14'h2a8a;
      expv[44] = 14'h0000;
      expv[45] = 14'h20d1;
      expv[46] = 14'h0081;
      expv[47] = 14'h0081;
      expv[48] = 14'h0081;
      expv[49] = 14'h0081;
      expv[50] = 14'h0081;
      expv[51] = 14'h20d1;
      expv[52] = 14'h20d1;
      expv[53] = 14'h0081;
      expv[54] = 14'h0081;
      expv[55] = 14'h0081;
      expv[56] = 14'h0000;
      expv[57] = 14'h2ada;
      expv[58] = 14'h0081;
      expv[59] = 14'h0081;
      expv[60] = 14'h0000;
      expv[61] = 14'h000c;
      expv[62] = 14'h2ada;
      expv[63] = 14'h20d1;
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
