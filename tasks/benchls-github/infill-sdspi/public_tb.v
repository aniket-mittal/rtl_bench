// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sdspi dut (
    .wb_clk_i(clk),
    .miso(in_vec[15:15]),
    .wb_rst_i(in_vec[14:14]),
    .wb_dat_i(in_vec[13:5]),
    .wb_we_i(in_vec[4:4]),
    .wb_sel_i(in_vec[3:2]),
    .wb_stb_i(in_vec[1:1]),
    .wb_cyc_i(in_vec[0:0]),
    .sclk(out_vec[11:11]),
    .mosi(out_vec[10:10]),
    .ss(out_vec[9:9]),
    .wb_dat_o(out_vec[8:1]),
    .wb_ack_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h6e2c;
    stim[1] = 16'hc086;
    stim[2] = 16'h9f05;
    stim[3] = 16'h3ca1;
    stim[4] = 16'h23df;
    stim[5] = 16'h1324;
    stim[6] = 16'h3ab0;
    stim[7] = 16'h1fc2;
    stim[8] = 16'h5f9e;
    stim[9] = 16'h88ff;
    stim[10] = 16'ha361;
    stim[11] = 16'hb908;
    stim[12] = 16'hbd4d;
    stim[13] = 16'h1ba4;
    stim[14] = 16'hb50b;
    stim[15] = 16'h11f3;
    stim[16] = 16'h3b0c;
    stim[17] = 16'h2afd;
    stim[18] = 16'h05ab;
    stim[19] = 16'ha07f;
    stim[20] = 16'hb786;
    stim[21] = 16'h31b1;
    stim[22] = 16'h2ced;
    stim[23] = 16'h0242;
    stim[24] = 16'hb51c;
    stim[25] = 16'h0a72;
    stim[26] = 16'hb1b9;
    stim[27] = 16'ha630;
    stim[28] = 16'h29ac;
    stim[29] = 16'h39a2;
    stim[30] = 16'ha02f;
    stim[31] = 16'h86e6;
    stim[32] = 16'h9a81;
    stim[33] = 16'h3c49;
    stim[34] = 16'h2a88;
    stim[35] = 16'h8e0a;
    stim[36] = 16'hbbf9;
    stim[37] = 16'h0725;
    stim[38] = 16'hab38;
    stim[39] = 16'h907c;
    stim[40] = 16'h2c49;
    stim[41] = 16'h25d1;
    stim[42] = 16'h25a0;
    stim[43] = 16'h90d6;
    stim[44] = 16'ha060;
    stim[45] = 16'h8622;
    stim[46] = 16'h2163;
    stim[47] = 16'h0926;
    stim[48] = 16'hb0f2;
    stim[49] = 16'h2a55;
    stim[50] = 16'h93e4;
    stim[51] = 16'h3149;
    stim[52] = 16'h896a;
    stim[53] = 16'h80c1;
    stim[54] = 16'h9776;
    stim[55] = 16'h124a;
    stim[56] = 16'h2eb0;
    stim[57] = 16'h88bb;
    stim[58] = 16'h07ba;
    stim[59] = 16'h3062;
    stim[60] = 16'h14cf;
    stim[61] = 16'h9431;
    stim[62] = 16'h9589;
    stim[63] = 16'hb583;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'he00;
      expv[2] = 12'he00;
      expv[3] = 12'he00;
      expv[4] = 12'he00;
      expv[5] = 12'hx00;
      expv[6] = 12'hx00;
      expv[7] = 12'hx00;
      expv[8] = 12'hx00;
      expv[9] = 12'he00;
      expv[10] = 12'hx0x;
      expv[11] = 12'hx0x;
      expv[12] = 12'hx0x;
      expv[13] = 12'hx0x;
      expv[14] = 12'hx0x;
      expv[15] = 12'hx0x;
      expv[16] = 12'hx0x;
      expv[17] = 12'hx0x;
      expv[18] = 12'hx0x;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'hxxx;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hxxx;
      expv[25] = 12'hxxx;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'hxxx;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'hxxx;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'hxxx;
      expv[48] = 12'hxxx;
      expv[49] = 12'hxxx;
      expv[50] = 12'hxxx;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'hxxx;
      expv[54] = 12'hxxx;
      expv[55] = 12'hxxx;
      expv[56] = 12'hxxx;
      expv[57] = 12'hxxx;
      expv[58] = 12'hxxx;
      expv[59] = 12'hxxx;
      expv[60] = 12'hxxx;
      expv[61] = 12'hxxx;
      expv[62] = 12'hxxx;
      expv[63] = 12'hxxx;
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
