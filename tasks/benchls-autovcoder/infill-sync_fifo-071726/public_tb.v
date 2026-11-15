// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071726 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hff3;
    stim[1] = 12'h97d;
    stim[2] = 12'h278;
    stim[3] = 12'h1c2;
    stim[4] = 12'h680;
    stim[5] = 12'h29d;
    stim[6] = 12'h497;
    stim[7] = 12'h666;
    stim[8] = 12'h3e6;
    stim[9] = 12'h18c;
    stim[10] = 12'h7ab;
    stim[11] = 12'h4d5;
    stim[12] = 12'h3c1;
    stim[13] = 12'h4e0;
    stim[14] = 12'h6d8;
    stim[15] = 12'h644;
    stim[16] = 12'h644;
    stim[17] = 12'h314;
    stim[18] = 12'h145;
    stim[19] = 12'h000;
    stim[20] = 12'h4c0;
    stim[21] = 12'h524;
    stim[22] = 12'h57b;
    stim[23] = 12'h2d4;
    stim[24] = 12'h3f8;
    stim[25] = 12'h4e2;
    stim[26] = 12'h0a9;
    stim[27] = 12'h6cd;
    stim[28] = 12'h2f8;
    stim[29] = 12'h4dd;
    stim[30] = 12'h7fa;
    stim[31] = 12'hcee;
    stim[32] = 12'h177;
    stim[33] = 12'h74a;
    stim[34] = 12'h2ab;
    stim[35] = 12'h0b1;
    stim[36] = 12'ha5e;
    stim[37] = 12'h009;
    stim[38] = 12'h211;
    stim[39] = 12'h20b;
    stim[40] = 12'h609;
    stim[41] = 12'h4a1;
    stim[42] = 12'h14d;
    stim[43] = 12'h576;
    stim[44] = 12'h4c8;
    stim[45] = 12'h4d1;
    stim[46] = 12'h50e;
    stim[47] = 12'h4cb;
    stim[48] = 12'h7d2;
    stim[49] = 12'h7e3;
    stim[50] = 12'h36d;
    stim[51] = 12'h7be;
    stim[52] = 12'h5f6;
    stim[53] = 12'h71a;
    stim[54] = 12'h032;
    stim[55] = 12'h0d5;
    stim[56] = 12'h1d0;
    stim[57] = 12'h00e;
    stim[58] = 12'h5e2;
    stim[59] = 12'h608;
    stim[60] = 12'h528;
    stim[61] = 12'h327;
    stim[62] = 12'h7cd;
    stim[63] = 12'h4c0;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h1xx;
      expv[10] = 10'h1xx;
      expv[11] = 10'h1xx;
      expv[12] = 10'h3ab;
      expv[13] = 10'h3ab;
      expv[14] = 10'h3ab;
      expv[15] = 10'h1ab;
      expv[16] = 10'h1ab;
      expv[17] = 10'h1ab;
      expv[18] = 10'h1ab;
      expv[19] = 10'h1ab;
      expv[20] = 10'h1ab;
      expv[21] = 10'h1ab;
      expv[22] = 10'h1ab;
      expv[23] = 10'h324;
      expv[24] = 10'h324;
      expv[25] = 10'h324;
      expv[26] = 10'h324;
      expv[27] = 10'h324;
      expv[28] = 10'h37b;
      expv[29] = 10'h37b;
      expv[30] = 10'h37b;
      expv[31] = 10'h17b;
      expv[32] = 10'h100;
      expv[33] = 10'h100;
      expv[34] = 10'h1fa;
      expv[35] = 10'h1fa;
      expv[36] = 10'h1fa;
      expv[37] = 10'h100;
      expv[38] = 10'h100;
      expv[39] = 10'h100;
      expv[40] = 10'h100;
      expv[41] = 10'h14a;
      expv[42] = 10'h14a;
      expv[43] = 10'h14a;
      expv[44] = 10'h14a;
      expv[45] = 10'h376;
      expv[46] = 10'h376;
      expv[47] = 10'h376;
      expv[48] = 10'h376;
      expv[49] = 10'h30e;
      expv[50] = 10'h3d2;
      expv[51] = 10'h3d2;
      expv[52] = 10'h3e3;
      expv[53] = 10'h3e3;
      expv[54] = 10'h3be;
      expv[55] = 10'h3be;
      expv[56] = 10'h3be;
      expv[57] = 10'h3be;
      expv[58] = 10'h3be;
      expv[59] = 10'h3be;
      expv[60] = 10'h3f6;
      expv[61] = 10'h3f6;
      expv[62] = 10'h3f6;
      expv[63] = 10'h31a;
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
