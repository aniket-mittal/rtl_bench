// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215830 dut (
    .clk(clk),
    .rst_n(in_vec[1:1]),
    .axis_tready(in_vec[0:0]),
    .axis_tdata(out_vec[37:6]),
    .axis_tvalid(out_vec[5:5]),
    .axis_tlast(out_vec[4:4]),
    .axis_tkeep(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h0;
    stim[1] = 2'h0;
    stim[2] = 2'h2;
    stim[3] = 2'h3;
    stim[4] = 2'h3;
    stim[5] = 2'h2;
    stim[6] = 2'h2;
    stim[7] = 2'h2;
    stim[8] = 2'h3;
    stim[9] = 2'h3;
    stim[10] = 2'h3;
    stim[11] = 2'h2;
    stim[12] = 2'h1;
    stim[13] = 2'h2;
    stim[14] = 2'h3;
    stim[15] = 2'h3;
    stim[16] = 2'h3;
    stim[17] = 2'h2;
    stim[18] = 2'h0;
    stim[19] = 2'h3;
    stim[20] = 2'h3;
    stim[21] = 2'h2;
    stim[22] = 2'h3;
    stim[23] = 2'h2;
    stim[24] = 2'h2;
    stim[25] = 2'h2;
    stim[26] = 2'h3;
    stim[27] = 2'h2;
    stim[28] = 2'h3;
    stim[29] = 2'h2;
    stim[30] = 2'h3;
    stim[31] = 2'h3;
    stim[32] = 2'h2;
    stim[33] = 2'h3;
    stim[34] = 2'h3;
    stim[35] = 2'h3;
    stim[36] = 2'h2;
    stim[37] = 2'h3;
    stim[38] = 2'h2;
    stim[39] = 2'h3;
    stim[40] = 2'h2;
    stim[41] = 2'h2;
    stim[42] = 2'h2;
    stim[43] = 2'h2;
    stim[44] = 2'h3;
    stim[45] = 2'h2;
    stim[46] = 2'h3;
    stim[47] = 2'h3;
    stim[48] = 2'h2;
    stim[49] = 2'h3;
    stim[50] = 2'h2;
    stim[51] = 2'h3;
    stim[52] = 2'h3;
    stim[53] = 2'h2;
    stim[54] = 2'h2;
    stim[55] = 2'h3;
    stim[56] = 2'h3;
    stim[57] = 2'h3;
    stim[58] = 2'h3;
    stim[59] = 2'h3;
    stim[60] = 2'h2;
    stim[61] = 2'h1;
    stim[62] = 2'h2;
    stim[63] = 2'h3;
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
      expv[0] = 38'h000000000f;
      expv[1] = 38'h000000000f;
      expv[2] = 38'h000000000f;
      expv[3] = 38'h000000000f;
      expv[4] = 38'h000000002f;
      expv[5] = 38'h000001556f;
      expv[6] = 38'h000001554f;
      expv[7] = 38'h000001554f;
      expv[8] = 38'h000001554f;
      expv[9] = 38'h000002aaaf;
      expv[10] = 38'h000003ffef;
      expv[11] = 38'h000005552f;
      expv[12] = 38'h000000000f;
      expv[13] = 38'h000000000f;
      expv[14] = 38'h000000000f;
      expv[15] = 38'h000000002f;
      expv[16] = 38'h000001556f;
      expv[17] = 38'h000002aaaf;
      expv[18] = 38'h000000000f;
      expv[19] = 38'h000000000f;
      expv[20] = 38'h000000002f;
      expv[21] = 38'h000001556f;
      expv[22] = 38'h000001554f;
      expv[23] = 38'h000002aaaf;
      expv[24] = 38'h000002aa8f;
      expv[25] = 38'h000002aa8f;
      expv[26] = 38'h000002aa8f;
      expv[27] = 38'h000003ffef;
      expv[28] = 38'h000003ffcf;
      expv[29] = 38'h000005552f;
      expv[30] = 38'h000005550f;
      expv[31] = 38'h000006aa6f;
      expv[32] = 38'h000007ffaf;
      expv[33] = 38'h000007ff8f;
      expv[34] = 38'h00000954ef;
      expv[35] = 38'h00000aaa2f;
      expv[36] = 38'h00000bff6f;
      expv[37] = 38'h00000bff4f;
      expv[38] = 38'h00000d54af;
      expv[39] = 38'h00000d548f;
      expv[40] = 38'h00000ea9ef;
      expv[41] = 38'h00000ea9cf;
      expv[42] = 38'h00000ea9cf;
      expv[43] = 38'h00000ea9cf;
      expv[44] = 38'h00000ea9cf;
      expv[45] = 38'h00000fff2f;
      expv[46] = 38'h00000fff0f;
      expv[47] = 38'h000011546f;
      expv[48] = 38'h000012a9af;
      expv[49] = 38'h000012a98f;
      expv[50] = 38'h000013feef;
      expv[51] = 38'h000013fecf;
      expv[52] = 38'h000015542f;
      expv[53] = 38'h000016a96f;
      expv[54] = 38'h000016a94f;
      expv[55] = 38'h000016a94f;
      expv[56] = 38'h000017feaf;
      expv[57] = 38'h00001953ef;
      expv[58] = 38'h00001aa92f;
      expv[59] = 38'h00001bfe6f;
      expv[60] = 38'h00001d53af;
      expv[61] = 38'h000000000f;
      expv[62] = 38'h000000000f;
      expv[63] = 38'h000000000f;
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
