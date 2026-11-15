// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125629 dut (
    .clk(clk),
    .rst(in_vec[23:23]),
    .input_tdata(in_vec[22:7]),
    .input_tvalid(in_vec[6:6]),
    .output_tready(in_vec[5:5]),
    .rate(in_vec[4:0]),
    .input_tready(out_vec[17:17]),
    .output_tdata(out_vec[16:1]),
    .output_tvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hdc94ea;
    stim[1] = 24'hff1c22;
    stim[2] = 24'h48680a;
    stim[3] = 24'h1d9924;
    stim[4] = 24'h739e6c;
    stim[5] = 24'h04c332;
    stim[6] = 24'h77a06a;
    stim[7] = 24'h179847;
    stim[8] = 24'h45d0f4;
    stim[9] = 24'h010e3d;
    stim[10] = 24'h29520b;
    stim[11] = 24'h70e13e;
    stim[12] = 24'h33c809;
    stim[13] = 24'h4d77b2;
    stim[14] = 24'h7336d0;
    stim[15] = 24'h564af8;
    stim[16] = 24'h2312f6;
    stim[17] = 24'h07714e;
    stim[18] = 24'h135958;
    stim[19] = 24'h190191;
    stim[20] = 24'h766b80;
    stim[21] = 24'h300b11;
    stim[22] = 24'h7c3c69;
    stim[23] = 24'h1b3a1f;
    stim[24] = 24'h1b7791;
    stim[25] = 24'h6cbb29;
    stim[26] = 24'h2acb88;
    stim[27] = 24'h59d560;
    stim[28] = 24'h2fcb8e;
    stim[29] = 24'h51c1e8;
    stim[30] = 24'h281942;
    stim[31] = 24'h5bfd9c;
    stim[32] = 24'h1e0d2e;
    stim[33] = 24'h61ac1f;
    stim[34] = 24'h63fab0;
    stim[35] = 24'h35b88b;
    stim[36] = 24'h45ff8e;
    stim[37] = 24'h564340;
    stim[38] = 24'h149944;
    stim[39] = 24'h2fe8b9;
    stim[40] = 24'h17154a;
    stim[41] = 24'h0ad76a;
    stim[42] = 24'h2bbab3;
    stim[43] = 24'h5078a9;
    stim[44] = 24'h3ac70b;
    stim[45] = 24'h0c6e4a;
    stim[46] = 24'h4dbec7;
    stim[47] = 24'h716291;
    stim[48] = 24'h257d3f;
    stim[49] = 24'h262d8d;
    stim[50] = 24'h2c3cad;
    stim[51] = 24'h273801;
    stim[52] = 24'h4338b2;
    stim[53] = 24'h095c1f;
    stim[54] = 24'h72d4bd;
    stim[55] = 24'h3cf9d2;
    stim[56] = 24'h6f3a82;
    stim[57] = 24'h7565ed;
    stim[58] = 24'h0c8a81;
    stim[59] = 24'h073a08;
    stim[60] = 24'h5e44a6;
    stim[61] = 24'h31af7d;
    stim[62] = 24'h353ce7;
    stim[63] = 24'h55296f;
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
      expv[0] = 18'h20000;
      expv[1] = 18'h20000;
      expv[2] = 18'h20000;
      expv[3] = 18'h20000;
      expv[4] = 18'h20000;
      expv[5] = 18'h20000;
      expv[6] = 18'h20000;
      expv[7] = 18'h20000;
      expv[8] = 18'h20000;
      expv[9] = 18'h20000;
      expv[10] = 18'h20000;
      expv[11] = 18'h20000;
      expv[12] = 18'h20000;
      expv[13] = 18'h20000;
      expv[14] = 18'h20000;
      expv[15] = 18'h20000;
      expv[16] = 18'h20000;
      expv[17] = 18'h20000;
      expv[18] = 18'h20000;
      expv[19] = 18'h20000;
      expv[20] = 18'h20000;
      expv[21] = 18'h20000;
      expv[22] = 18'h20000;
      expv[23] = 18'h20000;
      expv[24] = 18'h20000;
      expv[25] = 18'h20000;
      expv[26] = 18'h20000;
      expv[27] = 18'h20000;
      expv[28] = 18'h20000;
      expv[29] = 18'h20000;
      expv[30] = 18'h20000;
      expv[31] = 18'h20000;
      expv[32] = 18'h20000;
      expv[33] = 18'h20000;
      expv[34] = 18'h20000;
      expv[35] = 18'h20000;
      expv[36] = 18'h20000;
      expv[37] = 18'h20000;
      expv[38] = 18'h20000;
      expv[39] = 18'h20000;
      expv[40] = 18'h20000;
      expv[41] = 18'h20000;
      expv[42] = 18'h20000;
      expv[43] = 18'h20000;
      expv[44] = 18'h20000;
      expv[45] = 18'h20000;
      expv[46] = 18'h20000;
      expv[47] = 18'h20000;
      expv[48] = 18'h20000;
      expv[49] = 18'h20000;
      expv[50] = 18'h20000;
      expv[51] = 18'h20000;
      expv[52] = 18'h20000;
      expv[53] = 18'h20000;
      expv[54] = 18'h20000;
      expv[55] = 18'h20000;
      expv[56] = 18'h20000;
      expv[57] = 18'h20000;
      expv[58] = 18'h20000;
      expv[59] = 18'h20000;
      expv[60] = 18'h20000;
      expv[61] = 18'h20000;
      expv[62] = 18'h20000;
      expv[63] = 18'h20000;
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
