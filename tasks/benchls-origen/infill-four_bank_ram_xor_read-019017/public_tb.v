// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019017 dut (
    .CLK(clk),
    .din(in_vec[76:45]),
    .wr_en(in_vec[44:44]),
    .addr_wr(in_vec[43:34]),
    .rd_en(in_vec[33:33]),
    .rst_rd(in_vec[32:32]),
    .addr_rd(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h12309229cfeba53d7e10;
    stim[1] = 77'h0eb0ee9722d3d8ea095f;
    stim[2] = 77'h089394cbdd62a43a7d82;
    stim[3] = 77'h113d0d3a695e260b59f2;
    stim[4] = 77'h1436cf8a497283c956a4;
    stim[5] = 77'h0cbc15abc6b68dd00d44;
    stim[6] = 77'h16b6b6becbf00760ed57;
    stim[7] = 77'h04cbd9776e861e336cff;
    stim[8] = 77'h1d1543177742ebf3daa6;
    stim[9] = 77'h13529625a402f688d00c;
    stim[10] = 77'h189524fa5f1a53c8b6ab;
    stim[11] = 77'h1990dd248c1c56f3728d;
    stim[12] = 77'h01db22c9eba06c0a7cf3;
    stim[13] = 77'h15ccf1bac4a8019087a2;
    stim[14] = 77'h00c822c827a434a9bbb5;
    stim[15] = 77'h0b875e8bdd5a4f0808ca;
    stim[16] = 77'h1cd632cbcfaad92640cf;
    stim[17] = 77'h1cea1cff9df0e4c3586a;
    stim[18] = 77'h0754c73eea34e02ab036;
    stim[19] = 77'h13049890e8c227d2231e;
    stim[20] = 77'h1ca78e2829564acf5109;
    stim[21] = 77'h0a5a18e02a84b97797cf;
    stim[22] = 77'h08ce0709e4b66f6cae85;
    stim[23] = 77'h1b78173a4c004fad2687;
    stim[24] = 77'h09f40023f9803d868ac9;
    stim[25] = 77'h1618f4e45f4a15f05876;
    stim[26] = 77'h1c9fcbac1b02c87c627a;
    stim[27] = 77'h19fcf0fa66ca3a4cded8;
    stim[28] = 77'h05629bbf89fc43f639c0;
    stim[29] = 77'h1aa917f7bf88925499b8;
    stim[30] = 77'h16d732f0212209c3c3fb;
    stim[31] = 77'h13a2355ab55a3be6f82b;
    stim[32] = 77'h1b4fb53a3070ba8e9876;
    stim[33] = 77'h127faa83f42ae7535a35;
    stim[34] = 77'h0c1f0c127946d406fa5b;
    stim[35] = 77'h0228e9421afc94cb66b6;
    stim[36] = 77'h0fecef13f980cb414a82;
    stim[37] = 77'h1a8955ec981694d35d4b;
    stim[38] = 77'h0f5bb4d970da32ec3eff;
    stim[39] = 77'h1203e69db826cb19a12a;
    stim[40] = 77'h160d2f56ca508131c929;
    stim[41] = 77'h0db7d23da7fab5f0c465;
    stim[42] = 77'h004e2a406470c7e7af15;
    stim[43] = 77'h1d0acf7e7392b4486a6a;
    stim[44] = 77'h1297c41e8a305e90ab95;
    stim[45] = 77'h01727b5d1e7a186a23dc;
    stim[46] = 77'h199e6f6d66c610253c46;
    stim[47] = 77'h1ba37ca4168cea613a8c;
    stim[48] = 77'h1468c89d9acebd006a20;
    stim[49] = 77'h1a3ca21a57060498bc1c;
    stim[50] = 77'h0fc3678e70d276c72245;
    stim[51] = 77'h152c18fbfcceddfae3e8;
    stim[52] = 77'h039db2cd9d482b7168b1;
    stim[53] = 77'h1df6a2f8c02e52232edd;
    stim[54] = 77'h1fc187b913bccfa402f0;
    stim[55] = 77'h0edd8fb9884c984a7b17;
    stim[56] = 77'h01507483efdc2c7c479b;
    stim[57] = 77'h1a28816d952c6a0957ac;
    stim[58] = 77'h11c912172da0a505eb58;
    stim[59] = 77'h0ca6168de6361d46f352;
    stim[60] = 77'h18bcdec7345ae06b6656;
    stim[61] = 77'h07c6aa3669a8cbce3918;
    stim[62] = 77'h18371d0211a296cc04f7;
    stim[63] = 77'h1ea06688b42e78f3bcfd;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
