// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103837 dut (
    .io_EX_MEM_REGRD(in_vec[28:24]),
    .io_MEM_WB_REGRD(in_vec[23:19]),
    .io_ID_EX_REGRS1(in_vec[18:14]),
    .io_ID_EX_REGRS2(in_vec[13:9]),
    .io_ID_EX_inst_op(in_vec[8:2]),
    .io_EX_MEM_REGWR(in_vec[1:1]),
    .io_MEM_WB_REGWR(in_vec[0:0]),
    .io_forward_a(out_vec[3:2]),
    .io_forward_b(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h13b973f4;
    stim[1] = 29'h085bb049;
    stim[2] = 29'h1c9e81b8;
    stim[3] = 29'h1e9089d4;
    stim[4] = 29'h1ae08fb6;
    stim[5] = 29'h0102c3f1;
    stim[6] = 29'h174bc494;
    stim[7] = 29'h07d6c8ee;
    stim[8] = 29'h0adabb98;
    stim[9] = 29'h190d9805;
    stim[10] = 29'h0f6427c1;
    stim[11] = 29'h10a4d406;
    stim[12] = 29'h10f675f1;
    stim[13] = 29'h1474aaa3;
    stim[14] = 29'h0e06845f;
    stim[15] = 29'h08a25ea0;
    stim[16] = 29'h14641998;
    stim[17] = 29'h0418b19d;
    stim[18] = 29'h11fe3c9c;
    stim[19] = 29'h1d5ee67d;
    stim[20] = 29'h0d47d02b;
    stim[21] = 29'h1fca15ae;
    stim[22] = 29'h07533013;
    stim[23] = 29'h0fda543f;
    stim[24] = 29'h1588b688;
    stim[25] = 29'h151e2b5d;
    stim[26] = 29'h19f55c89;
    stim[27] = 29'h00fda64c;
    stim[28] = 29'h1604747a;
    stim[29] = 29'h01e97222;
    stim[30] = 29'h1991ca12;
    stim[31] = 29'h1edd3512;
    stim[32] = 29'h0e2a5ec5;
    stim[33] = 29'h0c9305c6;
    stim[34] = 29'h0b8b38c9;
    stim[35] = 29'h099b4c29;
    stim[36] = 29'h14640a45;
    stim[37] = 29'h13eadc6a;
    stim[38] = 29'h10a4d5af;
    stim[39] = 29'h129adc73;
    stim[40] = 29'h034c86c0;
    stim[41] = 29'h0088cdd9;
    stim[42] = 29'h03673a56;
    stim[43] = 29'h055ab866;
    stim[44] = 29'h0d8cb200;
    stim[45] = 29'h0ba44040;
    stim[46] = 29'h01f1137e;
    stim[47] = 29'h0d58c9d6;
    stim[48] = 29'h0c3bc339;
    stim[49] = 29'h0a528e62;
    stim[50] = 29'h1e2af800;
    stim[51] = 29'h0da3ed38;
    stim[52] = 29'h0de65d8d;
    stim[53] = 29'h0de301de;
    stim[54] = 29'h1ec565b4;
    stim[55] = 29'h018bddb7;
    stim[56] = 29'h0af00e3e;
    stim[57] = 29'h0971e658;
    stim[58] = 29'h0ace6eaf;
    stim[59] = 29'h037c600e;
    stim[60] = 29'h03632590;
    stim[61] = 29'h1e3d0980;
    stim[62] = 29'h1e1cd909;
    stim[63] = 29'h161b004b;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h2;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h4;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h4;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h8;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
