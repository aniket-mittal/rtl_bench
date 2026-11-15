// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007315 dut (
    .clk(clk),
    .A(in_vec[34:19]),
    .B(in_vec[18:3]),
    .select(in_vec[2:0]),
    .z_flag(out_vec[17:17]),
    .out(out_vec[16:1]),
    .finish(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h792d5c843;
    stim[1] = 35'h0b2d1972f;
    stim[2] = 35'h511d2847e;
    stim[3] = 35'h6c26f0d5c;
    stim[4] = 35'h6c3bb2cb2;
    stim[5] = 35'h5e744d641;
    stim[6] = 35'h648f602fa;
    stim[7] = 35'h0a42bedc4;
    stim[8] = 35'h2c93f68ed;
    stim[9] = 35'h3d96ced8a;
    stim[10] = 35'h1757eb119;
    stim[11] = 35'h6af160dd9;
    stim[12] = 35'h20fcfed4c;
    stim[13] = 35'h2654af0a0;
    stim[14] = 35'h5749bdd02;
    stim[15] = 35'h44caa6ecb;
    stim[16] = 35'h1f5641f93;
    stim[17] = 35'h3ebb99a52;
    stim[18] = 35'h5d99540fc;
    stim[19] = 35'h53272e562;
    stim[20] = 35'h265ae8720;
    stim[21] = 35'h703a95fce;
    stim[22] = 35'h2e1cbb8eb;
    stim[23] = 35'h648f135b3;
    stim[24] = 35'h208321c4a;
    stim[25] = 35'h41acd04ba;
    stim[26] = 35'h08c35910a;
    stim[27] = 35'h2e9e54bd7;
    stim[28] = 35'h22dc83361;
    stim[29] = 35'h1e0f33a90;
    stim[30] = 35'h153ff3ff3;
    stim[31] = 35'h35340fb0b;
    stim[32] = 35'h0f009670b;
    stim[33] = 35'h4ba8de4e1;
    stim[34] = 35'h5f3dabb71;
    stim[35] = 35'h7046db394;
    stim[36] = 35'h0e51ffaca;
    stim[37] = 35'h3f086c2bf;
    stim[38] = 35'h18f03d869;
    stim[39] = 35'h53770a702;
    stim[40] = 35'h3a2ec746c;
    stim[41] = 35'h66dd03669;
    stim[42] = 35'h252a61d5b;
    stim[43] = 35'h787d0d1e7;
    stim[44] = 35'h397f3774a;
    stim[45] = 35'h540c8ed48;
    stim[46] = 35'h4e2411e93;
    stim[47] = 35'h1e5182b44;
    stim[48] = 35'h6d9356501;
    stim[49] = 35'h3c9c4b884;
    stim[50] = 35'h3257078d5;
    stim[51] = 35'h0f88b3ac4;
    stim[52] = 35'h4b4e85609;
    stim[53] = 35'h76ee49bd4;
    stim[54] = 35'h3778f088a;
    stim[55] = 35'h7e5bada8e;
    stim[56] = 35'h0f1c48594;
    stim[57] = 35'h326dd6bed;
    stim[58] = 35'h72d4e692d;
    stim[59] = 35'h2501c2a13;
    stim[60] = 35'h6a70f59e9;
    stim[61] = 35'h286054190;
    stim[62] = 35'h716389058;
    stim[63] = 35'h1b1885978;
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
      expv[0] = 18'h3e4b4;
      expv[1] = 18'h20000;
      expv[2] = 18'h20001;
      expv[3] = 18'h3c356;
      expv[4] = 18'h39174;
      expv[5] = 18'h04440;
      expv[6] = 18'h04444;
      expv[7] = 18'h0fb70;
      expv[8] = 18'h00000;
      expv[9] = 18'h1863a;
      expv[10] = 18'h0b118;
      expv[11] = 18'h0284e;
      expv[12] = 18'h1fb52;
      expv[13] = 18'h1557a;
      expv[14] = 18'h179c0;
      expv[15] = 18'h1132a;
      expv[16] = 18'h07d58;
      expv[17] = 18'h1f2cc;
      expv[18] = 18'h1503e;
      expv[19] = 18'h188d0;
      expv[20] = 18'h03b32;
      expv[21] = 18'h00001;
      expv[22] = 18'h0b872;
      expv[23] = 18'h1923c;
      expv[24] = 18'h0bc6c;
      expv[25] = 18'h032fe;
      expv[26] = 18'h0dc8c;
      expv[27] = 18'h00000;
      expv[28] = 18'h07e9a;
      expv[29] = 18'h146e0;
      expv[30] = 18'h054fe;
      expv[31] = 18'h0d4d0;
      expv[32] = 18'h03c02;
      expv[33] = 18'h1b56a;
      expv[34] = 18'h0ce1a;
      expv[35] = 18'h16ce4;
      expv[36] = 18'h0a356;
      expv[37] = 18'h00000;
      expv[38] = 18'h16da6;
      expv[39] = 18'h15080;
      expv[40] = 18'h11d1a;
      expv[41] = 18'h18dda;
      expv[42] = 18'h094a8;
      expv[43] = 18'h00000;
      expv[44] = 18'h19a5c;
      expv[45] = 18'h18b84;
      expv[46] = 18'h13890;
      expv[47] = 18'h00ad0;
      expv[48] = 18'h05d0c;
      expv[49] = 18'h12e20;
      expv[50] = 18'h00000;
      expv[51] = 18'h0ceb0;
      expv[52] = 18'h117b8;
      expv[53] = 18'h126f4;
      expv[54] = 18'h05e02;
      expv[55] = 18'h00001;
      expv[56] = 18'h12164;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h09406;
      expv[60] = 18'h1d348;
      expv[61] = 18'h1f1e4;
      expv[62] = 18'h1e9a4;
      expv[63] = 18'h082c0;
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
