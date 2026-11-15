// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07478 dut (
    .a(in_vec[32:1]),
    .lsb(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0280cdd2c;
    stim[1] = 33'h14a5270ca;
    stim[2] = 33'h185cb2bd3;
    stim[3] = 33'h1f237397e;
    stim[4] = 33'h1904a3488;
    stim[5] = 33'h1835a687a;
    stim[6] = 33'h08b2db9fc;
    stim[7] = 33'h0f16b35fd;
    stim[8] = 33'h01081ec6c;
    stim[9] = 33'h173e0f96a;
    stim[10] = 33'h01a1887f8;
    stim[11] = 33'h1e68d37de;
    stim[12] = 33'h127997a33;
    stim[13] = 33'h182d42f16;
    stim[14] = 33'h0e6535fff;
    stim[15] = 33'h19968caba;
    stim[16] = 33'h0e919dfe3;
    stim[17] = 33'h1abb74672;
    stim[18] = 33'h0a3f2b87a;
    stim[19] = 33'h17381022d;
    stim[20] = 33'h17560d3da;
    stim[21] = 33'h05b693f2e;
    stim[22] = 33'h0fd66dd15;
    stim[23] = 33'h0576f8f58;
    stim[24] = 33'h0a6151cad;
    stim[25] = 33'h15600f77a;
    stim[26] = 33'h163bdec38;
    stim[27] = 33'h19cf98318;
    stim[28] = 33'h1b65cba8c;
    stim[29] = 33'h0b0c3019f;
    stim[30] = 33'h1ea6cc18f;
    stim[31] = 33'h03f34726c;
    stim[32] = 33'h03f2f756b;
    stim[33] = 33'h0374ad7e2;
    stim[34] = 33'h0d6b4b3c0;
    stim[35] = 33'h1bd7d6962;
    stim[36] = 33'h1e94e8ffe;
    stim[37] = 33'h1ec6461dc;
    stim[38] = 33'h170c9a6a9;
    stim[39] = 33'h1b8780050;
    stim[40] = 33'h1e7a7c000;
    stim[41] = 33'h14d2d39eb;
    stim[42] = 33'h1f1756c2d;
    stim[43] = 33'h11e258784;
    stim[44] = 33'h1df2c9b08;
    stim[45] = 33'h1b8b5667b;
    stim[46] = 33'h144047059;
    stim[47] = 33'h14c8c4ec6;
    stim[48] = 33'h16a5359ac;
    stim[49] = 33'h02757c104;
    stim[50] = 33'h0203a93a4;
    stim[51] = 33'h17d12f1f9;
    stim[52] = 33'h02e38b972;
    stim[53] = 33'h04cb001d6;
    stim[54] = 33'h0fd7a2757;
    stim[55] = 33'h04737c5af;
    stim[56] = 33'h1390e581f;
    stim[57] = 33'h1813660ab;
    stim[58] = 33'h1709a8727;
    stim[59] = 33'h0a62d886d;
    stim[60] = 33'h14a5269e3;
    stim[61] = 33'h1451e24a0;
    stim[62] = 33'h10f96ad4b;
    stim[63] = 33'h17a88a2a8;
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
      expv[0] = 32'h280cdd2c;
      expv[1] = 32'h4a5270ca;
      expv[2] = 32'h85cb2bd3;
      expv[3] = 32'hf237397e;
      expv[4] = 32'h904a3488;
      expv[5] = 32'h835a687a;
      expv[6] = 32'h8b2db9fc;
      expv[7] = 32'hf16b35fd;
      expv[8] = 32'h1081ec6c;
      expv[9] = 32'h73e0f96a;
      expv[10] = 32'h1a1887f8;
      expv[11] = 32'he68d37de;
      expv[12] = 32'h27997a33;
      expv[13] = 32'h82d42f16;
      expv[14] = 32'he6535fff;
      expv[15] = 32'h9968caba;
      expv[16] = 32'he919dfe3;
      expv[17] = 32'habb74672;
      expv[18] = 32'ha3f2b87a;
      expv[19] = 32'h7381022d;
      expv[20] = 32'h7560d3da;
      expv[21] = 32'h5b693f2e;
      expv[22] = 32'hfd66dd15;
      expv[23] = 32'h576f8f58;
      expv[24] = 32'ha6151cad;
      expv[25] = 32'h5600f77a;
      expv[26] = 32'h63bdec38;
      expv[27] = 32'h9cf98318;
      expv[28] = 32'hb65cba8c;
      expv[29] = 32'hb0c3019f;
      expv[30] = 32'hea6cc18f;
      expv[31] = 32'h3f34726c;
      expv[32] = 32'h3f2f756b;
      expv[33] = 32'h374ad7e2;
      expv[34] = 32'hd6b4b3c0;
      expv[35] = 32'hbd7d6962;
      expv[36] = 32'he94e8ffe;
      expv[37] = 32'hec6461dc;
      expv[38] = 32'h70c9a6a9;
      expv[39] = 32'hb8780050;
      expv[40] = 32'he7a7c000;
      expv[41] = 32'h4d2d39eb;
      expv[42] = 32'hf1756c2d;
      expv[43] = 32'h1e258784;
      expv[44] = 32'hdf2c9b08;
      expv[45] = 32'hb8b5667b;
      expv[46] = 32'h44047059;
      expv[47] = 32'h4c8c4ec6;
      expv[48] = 32'h6a5359ac;
      expv[49] = 32'h2757c104;
      expv[50] = 32'h203a93a4;
      expv[51] = 32'h7d12f1f9;
      expv[52] = 32'h2e38b972;
      expv[53] = 32'h4cb001d6;
      expv[54] = 32'hfd7a2757;
      expv[55] = 32'h4737c5af;
      expv[56] = 32'h390e581f;
      expv[57] = 32'h813660ab;
      expv[58] = 32'h709a8727;
      expv[59] = 32'ha62d886d;
      expv[60] = 32'h4a5269e3;
      expv[61] = 32'h451e24a0;
      expv[62] = 32'h0f96ad4b;
      expv[63] = 32'h7a88a2a8;
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
