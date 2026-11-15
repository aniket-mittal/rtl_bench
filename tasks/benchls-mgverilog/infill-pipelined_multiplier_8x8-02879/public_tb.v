// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02879 dut (
    .clk(clk),
    .ce(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .p(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1ec8a;
    stim[1] = 17'h17aed;
    stim[2] = 17'h0011a;
    stim[3] = 17'h04469;
    stim[4] = 17'h0ab27;
    stim[5] = 17'h16ef7;
    stim[6] = 17'h130aa;
    stim[7] = 17'h055b0;
    stim[8] = 17'h130bd;
    stim[9] = 17'h0f484;
    stim[10] = 17'h0fd76;
    stim[11] = 17'h16e66;
    stim[12] = 17'h0215f;
    stim[13] = 17'h11cf0;
    stim[14] = 17'h10ccc;
    stim[15] = 17'h07e7f;
    stim[16] = 17'h13398;
    stim[17] = 17'h11f66;
    stim[18] = 17'h1122e;
    stim[19] = 17'h12c56;
    stim[20] = 17'h036be;
    stim[21] = 17'h066e6;
    stim[22] = 17'h00274;
    stim[23] = 17'h1b07b;
    stim[24] = 17'h08469;
    stim[25] = 17'h08fd1;
    stim[26] = 17'h13f85;
    stim[27] = 17'h18ac2;
    stim[28] = 17'h0dabc;
    stim[29] = 17'h139b5;
    stim[30] = 17'h1099c;
    stim[31] = 17'h07457;
    stim[32] = 17'h01fff;
    stim[33] = 17'h13f2b;
    stim[34] = 17'h18bd8;
    stim[35] = 17'h0db5c;
    stim[36] = 17'h007ac;
    stim[37] = 17'h1e16a;
    stim[38] = 17'h1859b;
    stim[39] = 17'h0967a;
    stim[40] = 17'h0d40c;
    stim[41] = 17'h0556e;
    stim[42] = 17'h1efc7;
    stim[43] = 17'h1d852;
    stim[44] = 17'h0ac84;
    stim[45] = 17'h179d5;
    stim[46] = 17'h13a2b;
    stim[47] = 17'h196ac;
    stim[48] = 17'h1064f;
    stim[49] = 17'h02418;
    stim[50] = 17'h066d3;
    stim[51] = 17'h1d3e8;
    stim[52] = 17'h06e38;
    stim[53] = 17'h00f10;
    stim[54] = 17'h14969;
    stim[55] = 17'h1294d;
    stim[56] = 17'h13b79;
    stim[57] = 17'h150b9;
    stim[58] = 17'h1bf61;
    stim[59] = 17'h0b706;
    stim[60] = 17'h0ca2f;
    stim[61] = 17'h0efbf;
    stim[62] = 17'h03747;
    stim[63] = 17'h04790;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'h0938;
      expv[8] = 16'h0938;
      expv[9] = 16'hf6f2;
      expv[10] = 16'hf6f2;
      expv[11] = 16'hf6f2;
      expv[12] = 16'hfc22;
      expv[13] = 16'hfc22;
      expv[14] = 16'hefe0;
      expv[15] = 16'hf370;
      expv[16] = 16'hf370;
      expv[17] = 16'h2bd4;
      expv[18] = 16'hfe40;
      expv[19] = 16'hfd90;
      expv[20] = 16'heb48;
      expv[21] = 16'heb48;
      expv[22] = 16'heb48;
      expv[23] = 16'heb48;
      expv[24] = 16'h0c5a;
      expv[25] = 16'h0c5a;
      expv[26] = 16'h0c5a;
      expv[27] = 16'h033c;
      expv[28] = 16'h0ec8;
      expv[29] = 16'h0ec8;
      expv[30] = 16'hd990;
      expv[31] = 16'he1bb;
      expv[32] = 16'he1bb;
      expv[33] = 16'he1bb;
      expv[34] = 16'h1c94;
      expv[35] = 16'hef4d;
      expv[36] = 16'hef4d;
      expv[37] = 16'hef4d;
      expv[38] = 16'hfc7c;
      expv[39] = 16'h0a95;
      expv[40] = 16'h0a95;
      expv[41] = 16'h0a95;
      expv[42] = 16'h0a95;
      expv[43] = 16'h1248;
      expv[44] = 16'hf32a;
      expv[45] = 16'hf32a;
      expv[46] = 16'h3087;
      expv[47] = 16'h03c9;
      expv[48] = 16'hf330;
      expv[49] = 16'hebad;
      expv[50] = 16'hebad;
      expv[51] = 16'hebad;
      expv[52] = 16'h09be;
      expv[53] = 16'h09be;
      expv[54] = 16'h09be;
      expv[55] = 16'h22c8;
      expv[56] = 16'h01da;
      expv[57] = 16'h0438;
      expv[58] = 16'h1df1;
      expv[59] = 16'h0c55;
      expv[60] = 16'h0c55;
      expv[61] = 16'h0c55;
      expv[62] = 16'h0c55;
      expv[63] = 16'h0c55;
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
