// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_102718 dut (
    .sd_clk(clk),
    .rstn(in_vec[11:11]),
    .sd_rst(in_vec[10:10]),
    .buf_wr(in_vec[9:9]),
    .buf_wdata(in_vec[8:1]),
    .buf_free(in_vec[0:0]),
    .buf_wr_rdy(out_vec[18:18]),
    .buf0_rd_rdy(out_vec[17:17]),
    .buf1_rd_rdy(out_vec[16:16]),
    .buf0_rdata(out_vec[15:8]),
    .buf1_rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h643;
    stim[1] = 12'h0f4;
    stim[2] = 12'hbaa;
    stim[3] = 12'hde2;
    stim[4] = 12'hfed;
    stim[5] = 12'hc14;
    stim[6] = 12'h900;
    stim[7] = 12'h9cf;
    stim[8] = 12'h81e;
    stim[9] = 12'he5f;
    stim[10] = 12'hd27;
    stim[11] = 12'hdd0;
    stim[12] = 12'h9f2;
    stim[13] = 12'hc68;
    stim[14] = 12'h8f3;
    stim[15] = 12'hb31;
    stim[16] = 12'hd9c;
    stim[17] = 12'hcc0;
    stim[18] = 12'hc11;
    stim[19] = 12'haff;
    stim[20] = 12'hfd0;
    stim[21] = 12'h800;
    stim[22] = 12'ha1a;
    stim[23] = 12'hd29;
    stim[24] = 12'h3b6;
    stim[25] = 12'h990;
    stim[26] = 12'ha61;
    stim[27] = 12'hb52;
    stim[28] = 12'h886;
    stim[29] = 12'ha2e;
    stim[30] = 12'hd21;
    stim[31] = 12'h87c;
    stim[32] = 12'hde7;
    stim[33] = 12'ha1b;
    stim[34] = 12'hbb9;
    stim[35] = 12'hdcb;
    stim[36] = 12'he8e;
    stim[37] = 12'he6a;
    stim[38] = 12'hb43;
    stim[39] = 12'hc9d;
    stim[40] = 12'h88f;
    stim[41] = 12'hcd3;
    stim[42] = 12'hef9;
    stim[43] = 12'hd3a;
    stim[44] = 12'hf50;
    stim[45] = 12'hccf;
    stim[46] = 12'hbc9;
    stim[47] = 12'hdd6;
    stim[48] = 12'hf4a;
    stim[49] = 12'hb26;
    stim[50] = 12'hc7e;
    stim[51] = 12'hf07;
    stim[52] = 12'hcb9;
    stim[53] = 12'hc26;
    stim[54] = 12'h9a0;
    stim[55] = 12'hd7c;
    stim[56] = 12'hbff;
    stim[57] = 12'hf8c;
    stim[58] = 12'hd0e;
    stim[59] = 12'hada;
    stim[60] = 12'hc16;
    stim[61] = 12'h83f;
    stim[62] = 12'hbc7;
    stim[63] = 12'h840;
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
      expv[0] = 19'h4xxxx;
      expv[1] = 19'h421xx;
      expv[2] = 19'h421xx;
      expv[3] = 19'h6d5xx;
      expv[4] = 19'h4d5xx;
      expv[5] = 19'h4f6xx;
      expv[6] = 19'h4f6xx;
      expv[7] = 19'h4f6xx;
      expv[8] = 19'h4f6xx;
      expv[9] = 19'h4f6xx;
      expv[10] = 19'h42fxx;
      expv[11] = 19'h42fxx;
      expv[12] = 19'h42fxx;
      expv[13] = 19'h42fxx;
      expv[14] = 19'h42fxx;
      expv[15] = 19'h42fxx;
      expv[16] = 19'h698xx;
      expv[17] = 19'h498xx;
      expv[18] = 19'h498xx;
      expv[19] = 19'h498xx;
      expv[20] = 19'h67fxx;
      expv[21] = 19'h47fe8;
      expv[22] = 19'h47fe8;
      expv[23] = 19'h60de8;
      expv[24] = 19'h40de8;
      expv[25] = 19'h4dbe8;
      expv[26] = 19'h4dbe8;
      expv[27] = 19'h630e8;
      expv[28] = 19'h330a9;
      expv[29] = 19'h330a9;
      expv[30] = 19'h330a9;
      expv[31] = 19'h430a9;
      expv[32] = 19'h430a9;
      expv[33] = 19'h430a9;
      expv[34] = 19'h60da9;
      expv[35] = 19'h50ddc;
      expv[36] = 19'h40ddc;
      expv[37] = 19'h447dc;
      expv[38] = 19'h435dc;
      expv[39] = 19'h6a1dc;
      expv[40] = 19'h4a1dc;
      expv[41] = 19'h4a1dc;
      expv[42] = 19'h4a1dc;
      expv[43] = 19'h47cdc;
      expv[44] = 19'h47cdc;
      expv[45] = 19'h4a8dc;
      expv[46] = 19'h4a8dc;
      expv[47] = 19'h6e4dc;
      expv[48] = 19'h4e4dc;
      expv[49] = 19'h4a5dc;
      expv[50] = 19'h693dc;
      expv[51] = 19'h493dc;
      expv[52] = 19'h483dc;
      expv[53] = 19'h483dc;
      expv[54] = 19'h483dc;
      expv[55] = 19'h483dc;
      expv[56] = 19'h483dc;
      expv[57] = 19'h6ffdc;
      expv[58] = 19'h4ffc6;
      expv[59] = 19'h4ffc6;
      expv[60] = 19'h66dc6;
      expv[61] = 19'h46dc6;
      expv[62] = 19'h46dc6;
      expv[63] = 19'h6e3c6;
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
