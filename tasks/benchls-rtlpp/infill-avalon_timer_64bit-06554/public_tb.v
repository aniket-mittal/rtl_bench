// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06554 dut (
    .clk(clk),
    .address(in_vec[22:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h2522a7;
    stim[1] = 23'h59b454;
    stim[2] = 23'h462948;
    stim[3] = 23'h6ad5d8;
    stim[4] = 23'h2a7871;
    stim[5] = 23'h2fe78c;
    stim[6] = 23'h3b399b;
    stim[7] = 23'h038135;
    stim[8] = 23'h0f67ff;
    stim[9] = 23'h2bff34;
    stim[10] = 23'h3a31fa;
    stim[11] = 23'h5f79b6;
    stim[12] = 23'h5f5a70;
    stim[13] = 23'h1342b1;
    stim[14] = 23'h3b9ac3;
    stim[15] = 23'h6300e3;
    stim[16] = 23'h4a5023;
    stim[17] = 23'h1642be;
    stim[18] = 23'h0a85bd;
    stim[19] = 23'h5b6816;
    stim[20] = 23'h22782a;
    stim[21] = 23'h1a5ee8;
    stim[22] = 23'h067ae3;
    stim[23] = 23'h6e9cce;
    stim[24] = 23'h324053;
    stim[25] = 23'h13c6d2;
    stim[26] = 23'h46a201;
    stim[27] = 23'h4228d1;
    stim[28] = 23'h4aa97e;
    stim[29] = 23'h523294;
    stim[30] = 23'h3f1096;
    stim[31] = 23'h2bb48d;
    stim[32] = 23'h3e5274;
    stim[33] = 23'h076a93;
    stim[34] = 23'h5734a9;
    stim[35] = 23'h562d55;
    stim[36] = 23'h4bd739;
    stim[37] = 23'h2b3fc3;
    stim[38] = 23'h5e902f;
    stim[39] = 23'h2a0472;
    stim[40] = 23'h1adb69;
    stim[41] = 23'h3243cb;
    stim[42] = 23'h17a05e;
    stim[43] = 23'h3f67bb;
    stim[44] = 23'h2e1244;
    stim[45] = 23'h6e0656;
    stim[46] = 23'h3fcb67;
    stim[47] = 23'h0f4443;
    stim[48] = 23'h328df0;
    stim[49] = 23'h5a99e0;
    stim[50] = 23'h0781f3;
    stim[51] = 23'h326130;
    stim[52] = 23'h7af840;
    stim[53] = 23'h0b8b1a;
    stim[54] = 23'h6f74e4;
    stim[55] = 23'h4694c4;
    stim[56] = 23'h36abbd;
    stim[57] = 23'h4744cd;
    stim[58] = 23'h1b1292;
    stim[59] = 23'h7aa184;
    stim[60] = 23'h2a698e;
    stim[61] = 23'h4bc2f8;
    stim[62] = 23'h4bc5fd;
    stim[63] = 23'h1ae467;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h0c34f;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h042be;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h042be;
      expv[43] = 17'h042be;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h042be;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h042be;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h042be;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h01244;
      expv[62] = 17'h01244;
      expv[63] = 17'h01244;
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
