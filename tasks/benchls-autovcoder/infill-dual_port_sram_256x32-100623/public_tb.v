// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_100623 dut (
    .clk0(clk),
    .csb0(in_vec[55:55]),
    .web0(in_vec[54:54]),
    .wmask0(in_vec[53:50]),
    .addr0(in_vec[49:42]),
    .din0(in_vec[41:10]),
    .clk1(in_vec[9:9]),
    .csb1(in_vec[8:8]),
    .addr1(in_vec[7:0]),
    .dout0(out_vec[63:32]),
    .dout1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'he95c2f3d12aff6;
    stim[1] = 56'h0a39c9f5c8b3bf;
    stim[2] = 56'h0279b6528cbeaf;
    stim[3] = 56'h3668cd11f0b7fd;
    stim[4] = 56'h80e6da545496cf;
    stim[5] = 56'hfba39a1670bf62;
    stim[6] = 56'h489b5b99de7dff;
    stim[7] = 56'h2bb8b22657a3f7;
    stim[8] = 56'h9c48f86b3616c0;
    stim[9] = 56'hb4d47d9b542600;
    stim[10] = 56'h79678cac99360e;
    stim[11] = 56'hec8ed4b9e4db97;
    stim[12] = 56'he2bc00402458b3;
    stim[13] = 56'h816c656a765e70;
    stim[14] = 56'h91ace302095172;
    stim[15] = 56'h5b410154f207e9;
    stim[16] = 56'h6347c2bcdff444;
    stim[17] = 56'h95c34add059a4f;
    stim[18] = 56'h9cdf7ee07e9e9f;
    stim[19] = 56'h252dac16a36fce;
    stim[20] = 56'hd52986c1108394;
    stim[21] = 56'h6527fb520e6c87;
    stim[22] = 56'hd15f75f887ab56;
    stim[23] = 56'h8cff492a4f2f48;
    stim[24] = 56'hde205a831e488d;
    stim[25] = 56'hcdbd5a0ba2dcb9;
    stim[26] = 56'h3757b9432b9d0e;
    stim[27] = 56'h7eef0bac9d98a6;
    stim[28] = 56'hb68c66ecbd64b1;
    stim[29] = 56'h17b2c4576583d9;
    stim[30] = 56'hcf63a8d9239ced;
    stim[31] = 56'h8864acc571fbbd;
    stim[32] = 56'h906000b7ac5249;
    stim[33] = 56'h58923c9bf364c4;
    stim[34] = 56'h04055457a6c5ad;
    stim[35] = 56'h9abe4104e96f25;
    stim[36] = 56'h25b5badd11c022;
    stim[37] = 56'h123cae76997193;
    stim[38] = 56'h9c0dfadbe69511;
    stim[39] = 56'h8896af78da2c11;
    stim[40] = 56'hfc8d3edcd85f2a;
    stim[41] = 56'hb91c095081d821;
    stim[42] = 56'hda6ff28b20fb53;
    stim[43] = 56'h2a8c6b32e6d6d7;
    stim[44] = 56'h85e0ec514e34d9;
    stim[45] = 56'h93f5af533b5090;
    stim[46] = 56'h429b20487b9fec;
    stim[47] = 56'hface734addd63a;
    stim[48] = 56'hc2c836b9960b64;
    stim[49] = 56'ha39cff54e45b4f;
    stim[50] = 56'h4d9e22d3fe18f7;
    stim[51] = 56'h4d692ca2bf9a35;
    stim[52] = 56'h8629523d66bbee;
    stim[53] = 56'h0a116f8bb06195;
    stim[54] = 56'h26ed896d11de71;
    stim[55] = 56'hfe458ed620521d;
    stim[56] = 56'hccb4399069831e;
    stim[57] = 56'hff213284504ab0;
    stim[58] = 56'hb07dd97c567821;
    stim[59] = 56'he9f21ac085fd30;
    stim[60] = 56'h6c4533ab63ace2;
    stim[61] = 56'h523cd6ba8a0be1;
    stim[62] = 56'h52f417d2221a1b;
    stim[63] = 56'h61a0b1adf7d716;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxx9dxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
