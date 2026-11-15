// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017019 dut (
    .pclk(clk),
    .reset(in_vec[33:33]),
    .go(in_vec[32:32]),
    .stax(in_vec[31:24]),
    .stay(in_vec[23:16]),
    .endx(in_vec[15:8]),
    .endy(in_vec[7:0]),
    .busy(out_vec[17:17]),
    .wr(out_vec[16:16]),
    .addr(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h308b1e425;
    stim[1] = 34'h3d2adc175;
    stim[2] = 34'h0f28e82f7;
    stim[3] = 34'h024dfc0c0;
    stim[4] = 34'h0c500b773;
    stim[5] = 34'h1e2ce2ade;
    stim[6] = 34'h1fbf479b1;
    stim[7] = 34'h084b706da;
    stim[8] = 34'h04c605e1e;
    stim[9] = 34'h145d077c2;
    stim[10] = 34'h0faa9430b;
    stim[11] = 34'h1d2cfe5be;
    stim[12] = 34'h129d82a1c;
    stim[13] = 34'h17c384746;
    stim[14] = 34'h27eabe3c4;
    stim[15] = 34'h149df75ba;
    stim[16] = 34'h15fd8593f;
    stim[17] = 34'h0bfd83cac;
    stim[18] = 34'h219eabd1d;
    stim[19] = 34'h0275ffb2e;
    stim[20] = 34'h175e07b6a;
    stim[21] = 34'h0876d6114;
    stim[22] = 34'h19fa7bbb5;
    stim[23] = 34'h0e04d334a;
    stim[24] = 34'h05f7516da;
    stim[25] = 34'h0ffda5249;
    stim[26] = 34'h099910f90;
    stim[27] = 34'h05fe4c35c;
    stim[28] = 34'h079984ba8;
    stim[29] = 34'h1d8e37f89;
    stim[30] = 34'h0def4d101;
    stim[31] = 34'h136d51fe9;
    stim[32] = 34'h12d396be3;
    stim[33] = 34'h1614fca61;
    stim[34] = 34'h0aacd7a19;
    stim[35] = 34'h0c7f80823;
    stim[36] = 34'h1f4416e66;
    stim[37] = 34'h054c276fb;
    stim[38] = 34'h02282a7d3;
    stim[39] = 34'h1de263a79;
    stim[40] = 34'h09eb57481;
    stim[41] = 34'h06c006fc7;
    stim[42] = 34'h1698c1432;
    stim[43] = 34'h10d12ac36;
    stim[44] = 34'h1a7b6a5db;
    stim[45] = 34'h137370167;
    stim[46] = 34'h0a12d97ba;
    stim[47] = 34'h049df2c5f;
    stim[48] = 34'h19877dcd8;
    stim[49] = 34'h007aacf0c;
    stim[50] = 34'h1d36a3be9;
    stim[51] = 34'h03497ccf9;
    stim[52] = 34'h1321b4698;
    stim[53] = 34'h1c27fbfa4;
    stim[54] = 34'h1a6e7b3ff;
    stim[55] = 34'h154aee296;
    stim[56] = 34'h0f970bea5;
    stim[57] = 34'h01fb8104f;
    stim[58] = 34'h17a79d948;
    stim[59] = 34'h0bfff5d79;
    stim[60] = 34'h0f828180f;
    stim[61] = 34'h083bfb0fe;
    stim[62] = 34'h1826d85a1;
    stim[63] = 34'h090baf45c;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h3cee2;
      expv[7] = 18'h3cde2;
      expv[8] = 18'h3cce1;
      expv[9] = 18'h3cce0;
      expv[10] = 18'h3ccdf;
      expv[11] = 18'h3ccde;
      expv[12] = 18'h3ccdd;
      expv[13] = 18'h3ccdc;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h3df49;
      expv[17] = 18'h3de49;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h3e075;
      expv[22] = 18'h3df75;
      expv[23] = 18'h3df74;
      expv[24] = 18'h3de73;
      expv[25] = 18'h3dd72;
      expv[26] = 18'h3dc71;
      expv[27] = 18'h3db70;
      expv[28] = 18'h3da6f;
      expv[29] = 18'h3d96e;
      expv[30] = 18'h3d86d;
      expv[31] = 18'h3d76c;
      expv[32] = 18'h3d66b;
      expv[33] = 18'h3d56a;
      expv[34] = 18'h3d469;
      expv[35] = 18'h3d368;
      expv[36] = 18'h3d267;
      expv[37] = 18'h3d166;
      expv[38] = 18'h3d065;
      expv[39] = 18'h3cf64;
      expv[40] = 18'h3ce63;
      expv[41] = 18'h3cd62;
      expv[42] = 18'h3cc61;
      expv[43] = 18'h3cb61;
      expv[44] = 18'h3ca61;
      expv[45] = 18'h3c961;
      expv[46] = 18'h3c861;
      expv[47] = 18'h3c761;
      expv[48] = 18'h3c661;
      expv[49] = 18'h3c561;
      expv[50] = 18'h3c461;
      expv[51] = 18'h3c361;
      expv[52] = 18'h3c261;
      expv[53] = 18'h3c161;
      expv[54] = 18'h3c061;
      expv[55] = 18'h3bf61;
      expv[56] = 18'h3be61;
      expv[57] = 18'h3bd61;
      expv[58] = 18'h3bc61;
      expv[59] = 18'h3bb61;
      expv[60] = 18'h3ba61;
      expv[61] = 18'h3b961;
      expv[62] = 18'h3b861;
      expv[63] = 18'h3b761;
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
