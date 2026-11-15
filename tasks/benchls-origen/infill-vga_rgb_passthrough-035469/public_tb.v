// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035469 dut (
    .clk(clk),
    .rst(in_vec[20:20]),
    .pclk(in_vec[19:19]),
    .vga_clk(in_vec[18:18]),
    .HREF(in_vec[17:17]),
    .VS(in_vec[16:16]),
    .rx(in_vec[15:0]),
    .VSYNC(out_vec[13:13]),
    .HSYNC(out_vec[12:12]),
    .R(out_vec[11:8]),
    .G(out_vec[7:4]),
    .B(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1c0fd6;
    stim[1] = 21'h125c0e;
    stim[2] = 21'h0a708f;
    stim[3] = 21'h0937bd;
    stim[4] = 21'h05f0d6;
    stim[5] = 21'h0d66fd;
    stim[6] = 21'h0cb435;
    stim[7] = 21'h0b4321;
    stim[8] = 21'h09e935;
    stim[9] = 21'h0932bc;
    stim[10] = 21'h074504;
    stim[11] = 21'h083714;
    stim[12] = 21'h0b929c;
    stim[13] = 21'h02bacf;
    stim[14] = 21'h00266e;
    stim[15] = 21'h0d8070;
    stim[16] = 21'h0e0704;
    stim[17] = 21'h0ca743;
    stim[18] = 21'h06b70b;
    stim[19] = 21'h084f5d;
    stim[20] = 21'h0d4ab1;
    stim[21] = 21'h0641f8;
    stim[22] = 21'h076188;
    stim[23] = 21'h124147;
    stim[24] = 21'h0d7c94;
    stim[25] = 21'h0fe128;
    stim[26] = 21'h0dd00e;
    stim[27] = 21'h07995a;
    stim[28] = 21'h082391;
    stim[29] = 21'h092c78;
    stim[30] = 21'h0e5dd1;
    stim[31] = 21'h02c384;
    stim[32] = 21'h0ab6e2;
    stim[33] = 21'h069459;
    stim[34] = 21'h0e6116;
    stim[35] = 21'h0922c8;
    stim[36] = 21'h0b2b38;
    stim[37] = 21'h05c0a1;
    stim[38] = 21'h08fe0a;
    stim[39] = 21'h07fde5;
    stim[40] = 21'h0e9076;
    stim[41] = 21'h08f61c;
    stim[42] = 21'h09732b;
    stim[43] = 21'h025c6f;
    stim[44] = 21'h0d8a9e;
    stim[45] = 21'h008839;
    stim[46] = 21'h093dad;
    stim[47] = 21'h054849;
    stim[48] = 21'h0c78a2;
    stim[49] = 21'h0a9820;
    stim[50] = 21'h007503;
    stim[51] = 21'h062092;
    stim[52] = 21'h011d41;
    stim[53] = 21'h001f1c;
    stim[54] = 21'h0c4b43;
    stim[55] = 21'h0022a3;
    stim[56] = 21'h0ecd6e;
    stim[57] = 21'h0f5613;
    stim[58] = 21'h0559aa;
    stim[59] = 21'h08caea;
    stim[60] = 21'h0911ac;
    stim[61] = 21'h095929;
    stim[62] = 21'h01cb45;
    stim[63] = 21'h0f506b;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h2000;
      expv[5] = 14'h2000;
      expv[6] = 14'h2000;
      expv[7] = 14'h2000;
      expv[8] = 14'h2000;
      expv[9] = 14'h2000;
      expv[10] = 14'h0xxx;
      expv[11] = 14'h0xxx;
      expv[12] = 14'h0xxx;
      expv[13] = 14'h0xxx;
      expv[14] = 14'h0xxx;
      expv[15] = 14'h2000;
      expv[16] = 14'h2000;
      expv[17] = 14'h2000;
      expv[18] = 14'h2000;
      expv[19] = 14'h2000;
      expv[20] = 14'h2000;
      expv[21] = 14'h2000;
      expv[22] = 14'h2000;
      expv[23] = 14'h0000;
      expv[24] = 14'h2000;
      expv[25] = 14'h2000;
      expv[26] = 14'h2000;
      expv[27] = 14'h2000;
      expv[28] = 14'h2000;
      expv[29] = 14'h2000;
      expv[30] = 14'h15b8;
      expv[31] = 14'h15b8;
      expv[32] = 14'h15b8;
      expv[33] = 14'h198c;
      expv[34] = 14'h198c;
      expv[35] = 14'h198c;
      expv[36] = 14'h198c;
      expv[37] = 14'h2000;
      expv[38] = 14'h2000;
      expv[39] = 14'h0xxx;
      expv[40] = 14'h0xxx;
      expv[41] = 14'h0xxx;
      expv[42] = 14'h0xxx;
      expv[43] = 14'h0xxx;
      expv[44] = 14'h2000;
      expv[45] = 14'h2000;
      expv[46] = 14'h2000;
      expv[47] = 14'h2000;
      expv[48] = 14'h2000;
      expv[49] = 14'h2000;
      expv[50] = 14'h2000;
      expv[51] = 14'h1219;
      expv[52] = 14'h1219;
      expv[53] = 14'h1219;
      expv[54] = 14'h0xxx;
      expv[55] = 14'h0xxx;
      expv[56] = 14'h1ca7;
      expv[57] = 14'h1ca7;
      expv[58] = 14'h1ca7;
      expv[59] = 14'h1ca7;
      expv[60] = 14'h1ca7;
      expv[61] = 14'h1ca7;
      expv[62] = 14'h1ca7;
      expv[63] = 14'h0xxx;
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
