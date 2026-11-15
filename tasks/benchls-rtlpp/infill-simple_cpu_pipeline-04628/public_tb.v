// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04628 dut (
    .clk(clk),
    .mem_rd_data1(in_vec[16:9]),
    .mem_rd_data2(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .mem_wr_data(out_vec[32:25]),
    .mem_wr_addr(out_vec[24:17]),
    .mem_wr_en(out_vec[16:16]),
    .mem_rd_addr1(out_vec[15:8]),
    .mem_rd_addr2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h08f39;
    stim[1] = 17'h1ee3f;
    stim[2] = 17'h13158;
    stim[3] = 17'h1b580;
    stim[4] = 17'h1c494;
    stim[5] = 17'h171c0;
    stim[6] = 17'h125c4;
    stim[7] = 17'h182f4;
    stim[8] = 17'h1b402;
    stim[9] = 17'h05958;
    stim[10] = 17'h05f50;
    stim[11] = 17'h0c0fe;
    stim[12] = 17'h1d533;
    stim[13] = 17'h1110a;
    stim[14] = 17'h081a6;
    stim[15] = 17'h0556e;
    stim[16] = 17'h06276;
    stim[17] = 17'h12e36;
    stim[18] = 17'h055c0;
    stim[19] = 17'h1cd56;
    stim[20] = 17'h0e338;
    stim[21] = 17'h03d38;
    stim[22] = 17'h1e540;
    stim[23] = 17'h15af2;
    stim[24] = 17'h1b590;
    stim[25] = 17'h0fd40;
    stim[26] = 17'h04608;
    stim[27] = 17'h0cc48;
    stim[28] = 17'h03bb2;
    stim[29] = 17'h0607e;
    stim[30] = 17'h074a0;
    stim[31] = 17'h1d84e;
    stim[32] = 17'h0989c;
    stim[33] = 17'h16648;
    stim[34] = 17'h0ee40;
    stim[35] = 17'h151b6;
    stim[36] = 17'h09086;
    stim[37] = 17'h176da;
    stim[38] = 17'h071cc;
    stim[39] = 17'h0eacc;
    stim[40] = 17'h11204;
    stim[41] = 17'h09b10;
    stim[42] = 17'h00ae2;
    stim[43] = 17'h0fb96;
    stim[44] = 17'h04af4;
    stim[45] = 17'h080ea;
    stim[46] = 17'h0d810;
    stim[47] = 17'h197a4;
    stim[48] = 17'h0de10;
    stim[49] = 17'h1e00c;
    stim[50] = 17'h05cd8;
    stim[51] = 17'h0bf36;
    stim[52] = 17'h0024e;
    stim[53] = 17'h067e4;
    stim[54] = 17'h0f098;
    stim[55] = 17'h14392;
    stim[56] = 17'h10b60;
    stim[57] = 17'h02a68;
    stim[58] = 17'h0201a;
    stim[59] = 17'h0295c;
    stim[60] = 17'h16c04;
    stim[61] = 17'h0a4fc;
    stim[62] = 17'h01bae;
    stim[63] = 17'h12b0e;
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
      expv[0] = 33'hxxxxx00xx;
      expv[1] = 33'hxxxxx00xx;
      expv[2] = 33'hxxxxx00xx;
      expv[3] = 33'hxxxxx01xx;
      expv[4] = 33'hxxxxx01xx;
      expv[5] = 33'hxxxxx01xx;
      expv[6] = 33'hxxxxx01xx;
      expv[7] = 33'hxxxxx01xx;
      expv[8] = 33'hxxxxx02xx;
      expv[9] = 33'hxxxxx02xx;
      expv[10] = 33'hxxxxx03xx;
      expv[11] = 33'hxxxxx03xx;
      expv[12] = 33'hxxxxx00xx;
      expv[13] = 33'hxxxxx00xx;
      expv[14] = 33'hxxxxx01xx;
      expv[15] = 33'hxxxxx01xx;
      expv[16] = 33'hxxxxx01xx;
      expv[17] = 33'hxxxxx01xx;
      expv[18] = 33'hxxxxx01xx;
      expv[19] = 33'hxxxxx02xx;
      expv[20] = 33'hxxxxx02xx;
      expv[21] = 33'hxxxxx03xx;
      expv[22] = 33'hxxxxx03xx;
      expv[23] = 33'hxxxxx03xx;
      expv[24] = 33'hxxxxx04xx;
      expv[25] = 33'hxxxxx04xx;
      expv[26] = 33'hxxxxx05xx;
      expv[27] = 33'hxxxxx05xx;
      expv[28] = 33'hxxxxx05xx;
      expv[29] = 33'hxxxxx06xx;
      expv[30] = 33'hxxxxx06xx;
      expv[31] = 33'hxxxxx06xx;
      expv[32] = 33'hxxxxx06xx;
      expv[33] = 33'hxxxxx06xx;
      expv[34] = 33'hxxxxx077e;
      expv[35] = 33'hxxxxx077e;
      expv[36] = 33'hxxxxx087e;
      expv[37] = 33'hxxxxx087e;
      expv[38] = 33'hxxxxx087e;
      expv[39] = 33'hxxxxx09xx;
      expv[40] = 33'hxxxxx09xx;
      expv[41] = 33'hxxxxx0axx;
      expv[42] = 33'hxxxxx0axx;
      expv[43] = 33'hxxxxx0axx;
      expv[44] = 33'hxxxxx0ba8;
      expv[45] = 33'hxxxxx0ba8;
      expv[46] = 33'hxxxxx0ca8;
      expv[47] = 33'hxxxxx0ca8;
      expv[48] = 33'hxxxxx0ca8;
      expv[49] = 33'hxxxxx0dxx;
      expv[50] = 33'hxxxxx0dxx;
      expv[51] = 33'hxxxxx0exx;
      expv[52] = 33'hxxxxx0exx;
      expv[53] = 33'hxxxxx0exx;
      expv[54] = 33'hxxxxx0f7e;
      expv[55] = 33'hxxxxx0f7e;
      expv[56] = 33'hxxxxx107e;
      expv[57] = 33'hxxxxx107e;
      expv[58] = 33'hxxxxx107e;
      expv[59] = 33'hxxxxx11xx;
      expv[60] = 33'hxxxxx11xx;
      expv[61] = 33'hxxxxx11xx;
      expv[62] = 33'h1exxx11xx;
      expv[63] = 33'h1exxx11xx;
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
