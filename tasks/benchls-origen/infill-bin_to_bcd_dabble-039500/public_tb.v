// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039500 dut (
    .binary(in_vec[15:0]),
    .bcd(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'he375;
    stim[1] = 16'h2c4f;
    stim[2] = 16'h8c76;
    stim[3] = 16'h7b89;
    stim[4] = 16'hffde;
    stim[5] = 16'h2588;
    stim[6] = 16'h1e5b;
    stim[7] = 16'h20bd;
    stim[8] = 16'h4c07;
    stim[9] = 16'h19c3;
    stim[10] = 16'h69cc;
    stim[11] = 16'hc020;
    stim[12] = 16'h6402;
    stim[13] = 16'h1128;
    stim[14] = 16'h7c22;
    stim[15] = 16'h06bf;
    stim[16] = 16'h3b53;
    stim[17] = 16'h838f;
    stim[18] = 16'h26b0;
    stim[19] = 16'h7540;
    stim[20] = 16'h7397;
    stim[21] = 16'h5fe8;
    stim[22] = 16'h5e8d;
    stim[23] = 16'h60c3;
    stim[24] = 16'had4c;
    stim[25] = 16'hff2b;
    stim[26] = 16'h1583;
    stim[27] = 16'he4c4;
    stim[28] = 16'hb383;
    stim[29] = 16'h7e83;
    stim[30] = 16'h5ba0;
    stim[31] = 16'h1d7a;
    stim[32] = 16'h69fc;
    stim[33] = 16'h4385;
    stim[34] = 16'h689c;
    stim[35] = 16'h2342;
    stim[36] = 16'hc0b2;
    stim[37] = 16'h8ed4;
    stim[38] = 16'h1b9a;
    stim[39] = 16'hcd5e;
    stim[40] = 16'h6a46;
    stim[41] = 16'h20aa;
    stim[42] = 16'h5266;
    stim[43] = 16'h2fad;
    stim[44] = 16'hc782;
    stim[45] = 16'hac4b;
    stim[46] = 16'h884e;
    stim[47] = 16'haf5d;
    stim[48] = 16'hd605;
    stim[49] = 16'heac8;
    stim[50] = 16'haefc;
    stim[51] = 16'h3749;
    stim[52] = 16'h358d;
    stim[53] = 16'h6e44;
    stim[54] = 16'h5cc2;
    stim[55] = 16'h92d2;
    stim[56] = 16'h7e46;
    stim[57] = 16'h2348;
    stim[58] = 16'h05f9;
    stim[59] = 16'h42c6;
    stim[60] = 16'h8e15;
    stim[61] = 16'h9a7f;
    stim[62] = 16'ha3e4;
    stim[63] = 16'h43aa;
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
      expv[0] = 16'h1001;
      expv[1] = 16'h0442;
      expv[2] = 16'h0011;
      expv[3] = 16'h1042;
      expv[4] = 16'h0004;
      expv[5] = 16'h2011;
      expv[6] = 16'h0011;
      expv[7] = 16'h0402;
      expv[8] = 16'h4040;
      expv[9] = 16'h0023;
      expv[10] = 16'h0004;
      expv[11] = 16'h2020;
      expv[12] = 16'h0002;
      expv[13] = 16'h1100;
      expv[14] = 16'h0022;
      expv[15] = 16'h0001;
      expv[16] = 16'h0003;
      expv[17] = 16'h1002;
      expv[18] = 16'h0401;
      expv[19] = 16'h0040;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0040;
      expv[23] = 16'h0223;
      expv[24] = 16'h0042;
      expv[25] = 16'h0001;
      expv[26] = 16'h0043;
      expv[27] = 16'h0024;
      expv[28] = 16'h1043;
      expv[29] = 16'h0003;
      expv[30] = 16'h0000;
      expv[31] = 16'h0002;
      expv[32] = 16'h0002;
      expv[33] = 16'h4041;
      expv[34] = 16'h0012;
      expv[35] = 16'h0402;
      expv[36] = 16'h0400;
      expv[37] = 16'h0040;
      expv[38] = 16'h0000;
      expv[39] = 16'h0001;
      expv[40] = 16'h0012;
      expv[41] = 16'h0402;
      expv[42] = 16'h0202;
      expv[43] = 16'h0101;
      expv[44] = 16'h2022;
      expv[45] = 16'h0011;
      expv[46] = 16'h1102;
      expv[47] = 16'h0201;
      expv[48] = 16'h0101;
      expv[49] = 16'h0000;
      expv[50] = 16'h0002;
      expv[51] = 16'h0002;
      expv[52] = 16'h0040;
      expv[53] = 16'h0004;
      expv[54] = 16'h0042;
      expv[55] = 16'h0012;
      expv[56] = 16'h0012;
      expv[57] = 16'h0401;
      expv[58] = 16'h0001;
      expv[59] = 16'h4042;
      expv[60] = 16'h0221;
      expv[61] = 16'h1003;
      expv[62] = 16'h0004;
      expv[63] = 16'h0102;
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
