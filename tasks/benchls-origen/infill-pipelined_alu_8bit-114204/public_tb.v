// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_114204 dut (
    .clk(clk),
    .A(in_vec[21:14]),
    .B(in_vec[13:6]),
    .CarryIn(in_vec[5:5]),
    .Sel(in_vec[4:0]),
    .Y(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h2ee679;
    stim[1] = 22'h202204;
    stim[2] = 22'h3af506;
    stim[3] = 22'h09ca15;
    stim[4] = 22'h192480;
    stim[5] = 22'h28ec14;
    stim[6] = 22'h1a9f7d;
    stim[7] = 22'h149b49;
    stim[8] = 22'h2f5a91;
    stim[9] = 22'h056f30;
    stim[10] = 22'h2fee55;
    stim[11] = 22'h07eb66;
    stim[12] = 22'h0e9500;
    stim[13] = 22'h29172f;
    stim[14] = 22'h344821;
    stim[15] = 22'h3232d9;
    stim[16] = 22'h38cfca;
    stim[17] = 22'h308ca9;
    stim[18] = 22'h3451ec;
    stim[19] = 22'h0d22b7;
    stim[20] = 22'h099732;
    stim[21] = 22'h0765bd;
    stim[22] = 22'h1959b8;
    stim[23] = 22'h3e47ff;
    stim[24] = 22'h38033b;
    stim[25] = 22'h028ea7;
    stim[26] = 22'h3b8645;
    stim[27] = 22'h0fe2ae;
    stim[28] = 22'h24c790;
    stim[29] = 22'h1c2675;
    stim[30] = 22'h38405c;
    stim[31] = 22'h0d2cc9;
    stim[32] = 22'h022d47;
    stim[33] = 22'h0fc7b5;
    stim[34] = 22'h17e7a2;
    stim[35] = 22'h29898a;
    stim[36] = 22'h1a6315;
    stim[37] = 22'h06409c;
    stim[38] = 22'h349e0e;
    stim[39] = 22'h05e115;
    stim[40] = 22'h068028;
    stim[41] = 22'h3c2ea9;
    stim[42] = 22'h08ff08;
    stim[43] = 22'h27ba1f;
    stim[44] = 22'h03dc81;
    stim[45] = 22'h1a9b9d;
    stim[46] = 22'h282565;
    stim[47] = 22'h2023fa;
    stim[48] = 22'h311d48;
    stim[49] = 22'h0ad2ee;
    stim[50] = 22'h3c2f2e;
    stim[51] = 22'h15ad5e;
    stim[52] = 22'h0354c0;
    stim[53] = 22'h3e6077;
    stim[54] = 22'h2d9211;
    stim[55] = 22'h3c5ce3;
    stim[56] = 22'h195449;
    stim[57] = 22'h01e4c2;
    stim[58] = 22'h3bc3df;
    stim[59] = 22'h2f3add;
    stim[60] = 22'h1f542f;
    stim[61] = 22'h161003;
    stim[62] = 22'h3e8905;
    stim[63] = 22'h1a8b41;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'h00;
      expv[5] = 8'h80;
      expv[6] = 8'h3f;
      expv[7] = 8'h17;
      expv[8] = 8'h64;
      expv[9] = 8'h50;
      expv[10] = 8'h00;
      expv[11] = 8'h7e;
      expv[12] = 8'h13;
      expv[13] = 8'h0a;
      expv[14] = 8'h5f;
      expv[15] = 8'hb2;
      expv[16] = 8'h3a;
      expv[17] = 8'hb6;
      expv[18] = 8'hf2;
      expv[19] = 8'h00;
      expv[20] = 8'h44;
      expv[21] = 8'hea;
      expv[22] = 8'h82;
      expv[23] = 8'h65;
      expv[24] = 8'h41;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'hf5;
      expv[30] = 8'hff;
      expv[31] = 8'h6a;
      expv[32] = 8'h49;
      expv[33] = 8'h7c;
      expv[34] = 8'h00;
      expv[35] = 8'hce;
      expv[36] = 8'hf7;
      expv[37] = 8'h1f;
      expv[38] = 8'hfd;
      expv[39] = 8'h98;
      expv[40] = 8'h76;
      expv[41] = 8'h00;
      expv[42] = 8'h54;
      expv[43] = 8'h4b;
      expv[44] = 8'h34;
      expv[45] = 8'h56;
      expv[46] = 8'h46;
      expv[47] = 8'h00;
      expv[48] = 8'h81;
      expv[49] = 8'h00;
      expv[50] = 8'hb5;
      expv[51] = 8'h00;
      expv[52] = 8'h88;
      expv[53] = 8'hc0;
      expv[54] = 8'h98;
      expv[55] = 8'h00;
      expv[56] = 8'h0d;
      expv[57] = 8'h03;
      expv[58] = 8'h7f;
      expv[59] = 8'h73;
      expv[60] = 8'h6c;
      expv[61] = 8'h9a;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
