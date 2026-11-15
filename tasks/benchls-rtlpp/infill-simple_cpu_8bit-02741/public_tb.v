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

  rtlpp_02741 dut (
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
    stim[0] = 17'h1d06b;
    stim[1] = 17'h15137;
    stim[2] = 17'h19d66;
    stim[3] = 17'h00e0c;
    stim[4] = 17'h1fa7c;
    stim[5] = 17'h139c0;
    stim[6] = 17'h0ffc2;
    stim[7] = 17'h137e8;
    stim[8] = 17'h1d2e8;
    stim[9] = 17'h1a4fa;
    stim[10] = 17'h16a66;
    stim[11] = 17'h180cc;
    stim[12] = 17'h0023e;
    stim[13] = 17'h09604;
    stim[14] = 17'h01670;
    stim[15] = 17'h07cfe;
    stim[16] = 17'h1604e;
    stim[17] = 17'h1d9d8;
    stim[18] = 17'h0822a;
    stim[19] = 17'h0875c;
    stim[20] = 17'h1024a;
    stim[21] = 17'h18292;
    stim[22] = 17'h11496;
    stim[23] = 17'h18200;
    stim[24] = 17'h1d0f6;
    stim[25] = 17'h1518a;
    stim[26] = 17'h1feea;
    stim[27] = 17'h19d1a;
    stim[28] = 17'h1d0a2;
    stim[29] = 17'h09cc6;
    stim[30] = 17'h075ac;
    stim[31] = 17'h1a1a8;
    stim[32] = 17'h18eda;
    stim[33] = 17'h08680;
    stim[34] = 17'h13a2a;
    stim[35] = 17'h01bbc;
    stim[36] = 17'h0b340;
    stim[37] = 17'h08ee6;
    stim[38] = 17'h05e9e;
    stim[39] = 17'h1a7ee;
    stim[40] = 17'h170f0;
    stim[41] = 17'h1b914;
    stim[42] = 17'h03e36;
    stim[43] = 17'h0a548;
    stim[44] = 17'h1d252;
    stim[45] = 17'h15002;
    stim[46] = 17'h0d064;
    stim[47] = 17'h07bc8;
    stim[48] = 17'h033c0;
    stim[49] = 17'h0919a;
    stim[50] = 17'h06ab2;
    stim[51] = 17'h1f422;
    stim[52] = 17'h15de2;
    stim[53] = 17'h0259c;
    stim[54] = 17'h023de;
    stim[55] = 17'h06753;
    stim[56] = 17'h1922e;
    stim[57] = 17'h1f820;
    stim[58] = 17'h09cf8;
    stim[59] = 17'h0f6b4;
    stim[60] = 17'h120ff;
    stim[61] = 17'h1cccc;
    stim[62] = 17'h09910;
    stim[63] = 17'h18714;
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
      expv[5] = 33'hxxxxx02xx;
      expv[6] = 33'hxxxxx02xx;
      expv[7] = 33'hxxxxx02xx;
      expv[8] = 33'hxxxxx03xx;
      expv[9] = 33'hxxxxx03xx;
      expv[10] = 33'hxxxxx03xx;
      expv[11] = 33'hxxxxx03xx;
      expv[12] = 33'hxxxxx03xx;
      expv[13] = 33'hxxxxx04xx;
      expv[14] = 33'hxxxxx04xx;
      expv[15] = 33'hxxxxx04xx;
      expv[16] = 33'hxxxxx04xx;
      expv[17] = 33'hxxxxx04xx;
      expv[18] = 33'hxxxxx05xx;
      expv[19] = 33'hxxxxx05xx;
      expv[20] = 33'hxxxxx06xx;
      expv[21] = 33'hxxxxx06xx;
      expv[22] = 33'hxxxxx06xx;
      expv[23] = 33'hxxxxx07xx;
      expv[24] = 33'hxxxxx07xx;
      expv[25] = 33'hxxxxx07xx;
      expv[26] = 33'hxxxxx07xx;
      expv[27] = 33'hxxxxx07xx;
      expv[28] = 33'hxxxxx08xx;
      expv[29] = 33'hxxxxx08xx;
      expv[30] = 33'hxxxxx09xx;
      expv[31] = 33'hxxxxx09xx;
      expv[32] = 33'hxxxxx09xx;
      expv[33] = 33'hxxxxx0axx;
      expv[34] = 33'hxxxxx0axx;
      expv[35] = 33'hxxxxx0bxx;
      expv[36] = 33'hxxxxx0bxx;
      expv[37] = 33'hxxxxx0bxx;
      expv[38] = 33'hxxxxx0cxx;
      expv[39] = 33'hxxxxx0cxx;
      expv[40] = 33'hxxxxx0cxx;
      expv[41] = 33'hxxxxx0cxx;
      expv[42] = 33'hxxxxx0cxx;
      expv[43] = 33'hxxxxx0dxx;
      expv[44] = 33'hxxxxx0dxx;
      expv[45] = 33'hxxxxx0dxx;
      expv[46] = 33'hxxxxx0dxx;
      expv[47] = 33'hxxxxx0dxx;
      expv[48] = 33'hxxxxx0exx;
      expv[49] = 33'hxxxxx0exx;
      expv[50] = 33'hxxxxx0fxx;
      expv[51] = 33'hxxxxx0fxx;
      expv[52] = 33'hxxxxx0fxx;
      expv[53] = 33'hxxxxx10xx;
      expv[54] = 33'hxxxxx10xx;
      expv[55] = 33'hxxxxx00xx;
      expv[56] = 33'hxxxxx00xx;
      expv[57] = 33'hxxxxx01xx;
      expv[58] = 33'hxxxxx01xx;
      expv[59] = 33'hxxxxx02xx;
      expv[60] = 33'hxxxxx00xx;
      expv[61] = 33'hxxxxx00xx;
      expv[62] = 33'hxxxxx01xx;
      expv[63] = 33'hxxxxx01xx;
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
