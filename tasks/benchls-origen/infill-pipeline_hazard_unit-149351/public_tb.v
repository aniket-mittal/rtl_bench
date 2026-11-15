// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149351 dut (
    .MemtoRegE(in_vec[27:26]),
    .IFID_rs(in_vec[25:21]),
    .IFID_rt(in_vec[20:16]),
    .IDEX_WA(in_vec[15:11]),
    .EXMEM_WA(in_vec[10:6]),
    .nPC_sel(in_vec[5:5]),
    .RegWriteE(in_vec[4:4]),
    .MemtoRegM(in_vec[3:2]),
    .jr(in_vec[1:1]),
    .MemWriteD(in_vec[0:0]),
    .IFID_en(out_vec[2:2]),
    .pc_en(out_vec[1:1]),
    .IDEX_reset(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hc649653;
    stim[1] = 28'h68430bd;
    stim[2] = 28'h5613804;
    stim[3] = 28'h80f9eb7;
    stim[4] = 28'hbbbcb00;
    stim[5] = 28'ha5c52fd;
    stim[6] = 28'h1b29f76;
    stim[7] = 28'hcdec382;
    stim[8] = 28'h2072644;
    stim[9] = 28'h378cdf4;
    stim[10] = 28'hcadd95b;
    stim[11] = 28'hdc9c24e;
    stim[12] = 28'h42e9b63;
    stim[13] = 28'haad2580;
    stim[14] = 28'hcdd0f77;
    stim[15] = 28'he84b3be;
    stim[16] = 28'h909ffef;
    stim[17] = 28'hc5b238c;
    stim[18] = 28'h055f2e3;
    stim[19] = 28'ha3556f9;
    stim[20] = 28'h689a08d;
    stim[21] = 28'h485963b;
    stim[22] = 28'h84b5dae;
    stim[23] = 28'h00bccef;
    stim[24] = 28'ha52e594;
    stim[25] = 28'h232f8dd;
    stim[26] = 28'h7b5409c;
    stim[27] = 28'hc636d30;
    stim[28] = 28'h79e8403;
    stim[29] = 28'h916e388;
    stim[30] = 28'h1f30966;
    stim[31] = 28'hd803995;
    stim[32] = 28'hc492766;
    stim[33] = 28'h60c102a;
    stim[34] = 28'heba9c0d;
    stim[35] = 28'h479530d;
    stim[36] = 28'hd585b6f;
    stim[37] = 28'h1504eb1;
    stim[38] = 28'hc69d6f7;
    stim[39] = 28'heb55c0c;
    stim[40] = 28'hf8b3b6e;
    stim[41] = 28'h4fb7ce8;
    stim[42] = 28'hbe2293e;
    stim[43] = 28'h7bc3cbf;
    stim[44] = 28'h485bc1c;
    stim[45] = 28'h6c0a03e;
    stim[46] = 28'h1927d81;
    stim[47] = 28'he3d4d67;
    stim[48] = 28'hc81b2c2;
    stim[49] = 28'he09074e;
    stim[50] = 28'he678308;
    stim[51] = 28'h4549787;
    stim[52] = 28'h2f10057;
    stim[53] = 28'he6a58b8;
    stim[54] = 28'h4ea4206;
    stim[55] = 28'hcd41e62;
    stim[56] = 28'ha3d230b;
    stim[57] = 28'hf4280c7;
    stim[58] = 28'hbe45175;
    stim[59] = 28'he386020;
    stim[60] = 28'he435bb2;
    stim[61] = 28'h0fc925a;
    stim[62] = 28'h9392a92;
    stim[63] = 28'hf92384f;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 3'h6;
      expv[1] = 3'h1;
      expv[2] = 3'h6;
      expv[3] = 3'h1;
      expv[4] = 3'h6;
      expv[5] = 3'h1;
      expv[6] = 3'h6;
      expv[7] = 3'h6;
      expv[8] = 3'h6;
      expv[9] = 3'h6;
      expv[10] = 3'h1;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h6;
      expv[14] = 3'h1;
      expv[15] = 3'h6;
      expv[16] = 3'h1;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h1;
      expv[24] = 3'h6;
      expv[25] = 3'h1;
      expv[26] = 3'h6;
      expv[27] = 3'h6;
      expv[28] = 3'h6;
      expv[29] = 3'h6;
      expv[30] = 3'h6;
      expv[31] = 3'h1;
      expv[32] = 3'h6;
      expv[33] = 3'h6;
      expv[34] = 3'h1;
      expv[35] = 3'h1;
      expv[36] = 3'h1;
      expv[37] = 3'h6;
      expv[38] = 3'h1;
      expv[39] = 3'h6;
      expv[40] = 3'h6;
      expv[41] = 3'h6;
      expv[42] = 3'h6;
      expv[43] = 3'h1;
      expv[44] = 3'h6;
      expv[45] = 3'h1;
      expv[46] = 3'h6;
      expv[47] = 3'h1;
      expv[48] = 3'h6;
      expv[49] = 3'h6;
      expv[50] = 3'h6;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h6;
      expv[54] = 3'h6;
      expv[55] = 3'h6;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h6;
      expv[60] = 3'h6;
      expv[61] = 3'h6;
      expv[62] = 3'h6;
      expv[63] = 3'h1;
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
