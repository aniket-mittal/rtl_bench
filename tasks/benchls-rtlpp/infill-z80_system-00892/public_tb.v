// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00892 dut (
    .CLK(clk),
    .RESET(in_vec[23:23]),
    .CE_N(in_vec[22:22]),
    .CE_P(in_vec[21:21]),
    .A(in_vec[20:20]),
    .DI(in_vec[19:12]),
    .CS_n(in_vec[11:11]),
    .WR_n(in_vec[10:10]),
    .RD_n(in_vec[9:9]),
    .MEM_DO(in_vec[8:1]),
    .MEM_WAIT(in_vec[0:0]),
    .DO(out_vec[68:61]),
    .MEM_ADDR(out_vec[60:40]),
    .MEM_DI(out_vec[39:32]),
    .MEM_RD(out_vec[31:31]),
    .MEM_WR(out_vec[30:30]),
    .OUTL(out_vec[29:15]),
    .OUTR(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hec1ade;
    stim[1] = 24'hec132a;
    stim[2] = 24'h5124a9;
    stim[3] = 24'h14a30e;
    stim[4] = 24'h23875c;
    stim[5] = 24'h5872ff;
    stim[6] = 24'h4d8fec;
    stim[7] = 24'h3ea4fd;
    stim[8] = 24'h4ad7c8;
    stim[9] = 24'h2425bd;
    stim[10] = 24'h0d5e80;
    stim[11] = 24'h0924d1;
    stim[12] = 24'h721b97;
    stim[13] = 24'h615bcc;
    stim[14] = 24'h65d70e;
    stim[15] = 24'h306557;
    stim[16] = 24'h535ca5;
    stim[17] = 24'h107169;
    stim[18] = 24'h03ccd6;
    stim[19] = 24'h59cd37;
    stim[20] = 24'h0bc94a;
    stim[21] = 24'h546dfe;
    stim[22] = 24'h784854;
    stim[23] = 24'h62f46e;
    stim[24] = 24'h05baa8;
    stim[25] = 24'h7067e4;
    stim[26] = 24'h631a6d;
    stim[27] = 24'h031f28;
    stim[28] = 24'h4a4738;
    stim[29] = 24'h2eec7d;
    stim[30] = 24'h7516b2;
    stim[31] = 24'h72195b;
    stim[32] = 24'h51da76;
    stim[33] = 24'h4f5c01;
    stim[34] = 24'h60dc8e;
    stim[35] = 24'h5995cd;
    stim[36] = 24'h6623bf;
    stim[37] = 24'h187feb;
    stim[38] = 24'h7943f1;
    stim[39] = 24'h3306df;
    stim[40] = 24'h3f7e01;
    stim[41] = 24'hf0fe98;
    stim[42] = 24'h550375;
    stim[43] = 24'h7116b3;
    stim[44] = 24'h26b9ba;
    stim[45] = 24'h1e64f5;
    stim[46] = 24'h4d2f3d;
    stim[47] = 24'h488764;
    stim[48] = 24'h3765d3;
    stim[49] = 24'h6cfde1;
    stim[50] = 24'h32e206;
    stim[51] = 24'h0884d2;
    stim[52] = 24'h754b63;
    stim[53] = 24'h27491c;
    stim[54] = 24'h672551;
    stim[55] = 24'h35671f;
    stim[56] = 24'h4ebd5c;
    stim[57] = 24'h314ec7;
    stim[58] = 24'h5cdad1;
    stim[59] = 24'h54f551;
    stim[60] = 24'h625715;
    stim[61] = 24'h016929;
    stim[62] = 24'h243eb1;
    stim[63] = 24'h225d4e;
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
      expv[0] = 69'hxxx0000000xxxxxxxx;
      expv[1] = 69'h0000000000xxxxxxxx;
      expv[2] = 69'h1fx0000000xxxxxxxx;
      expv[3] = 69'h1fx0000000xxxxxxxx;
      expv[4] = 69'h0000000000xxxxxxxx;
      expv[5] = 69'h1fe0000000xxxxxxxx;
      expv[6] = 69'h0000000000xxxxxxxx;
      expv[7] = 69'h1fe0000000xxxxxxxx;
      expv[8] = 69'h0000000000xxxxxxxx;
      expv[9] = 69'h0000000000xxxxxxxx;
      expv[10] = 69'h0000000000xxxxxxxx;
      expv[11] = 69'h0000000000xxxxxxxx;
      expv[12] = 69'h0fe0000000xxxxxxxx;
      expv[13] = 69'h0000000000xxxxxxxx;
      expv[14] = 69'h0000000000xxxxxxxx;
      expv[15] = 69'h0fe0000000xxxxxxxx;
      expv[16] = 69'h0fe0000000xxxxxxxx;
      expv[17] = 69'h0fe0000000xxxxxxxx;
      expv[18] = 69'h0000000000xxxxxxxx;
      expv[19] = 69'h0fe0000000xxxxxxxx;
      expv[20] = 69'h0000000000xxxxxxxx;
      expv[21] = 69'h0fe0000000xxxxxxxx;
      expv[22] = 69'h0fe0000000xxxxxxxx;
      expv[23] = 69'h0000000000xxxxxxxx;
      expv[24] = 69'h0000000000xxxxxxxx;
      expv[25] = 69'h0fe0000000xxxxxxxx;
      expv[26] = 69'h0000000000xxxxxxxx;
      expv[27] = 69'h0000000000xxxxxxxx;
      expv[28] = 69'h0000000000xxxxxxxx;
      expv[29] = 69'h0000000000xxxxxxxx;
      expv[30] = 69'h0fe0000000xxxxxxxx;
      expv[31] = 69'h0fe0000000xxxxxxxx;
      expv[32] = 69'h0fe0000000xxxxxxxx;
      expv[33] = 69'h0000000000xxxxxxxx;
      expv[34] = 69'h0000000000xxxxxxxx;
      expv[35] = 69'h0fe0000000xxxxxxxx;
      expv[36] = 69'h0000000000xxxxxxxx;
      expv[37] = 69'h1fe0000000xxxxxxxx;
      expv[38] = 69'h1fe0000000xxxxxxxx;
      expv[39] = 69'h1fe0000000xxxxxxxx;
      expv[40] = 69'h1fe0000000xxxxxxxx;
      expv[41] = 69'h1fe0000000xxxxxxxx;
      expv[42] = 69'h1fe0000000xxxxxxxx;
      expv[43] = 69'h1fe0000000xxxxxxxx;
      expv[44] = 69'h0000000000xxxxxxxx;
      expv[45] = 69'h1fe0000000xxxxxxxx;
      expv[46] = 69'h0000000000xxxxxxxx;
      expv[47] = 69'h0000000000xxxxxxxx;
      expv[48] = 69'h1fe0000000xxxxxxxx;
      expv[49] = 69'h0000000000xxxxxxxx;
      expv[50] = 69'h1fe0000000xxxxxxxx;
      expv[51] = 69'h0000000000xxxxxxxx;
      expv[52] = 69'h0fe0000000xxxxxxxx;
      expv[53] = 69'h0000000000xxxxxxxx;
      expv[54] = 69'h0000000000xxxxxxxx;
      expv[55] = 69'h0fe0000000xxxxxxxx;
      expv[56] = 69'h0000000000xxxxxxxx;
      expv[57] = 69'h0fe0000000xxxxxxxx;
      expv[58] = 69'h0fe0000000xxxxxxxx;
      expv[59] = 69'h0fe0000000xxxxxxxx;
      expv[60] = 69'h0000000000xxxxxxxx;
      expv[61] = 69'h0000000000xxxxxxxx;
      expv[62] = 69'h0000000000xxxxxxxx;
      expv[63] = 69'h0000000000xxxxxxxx;
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
