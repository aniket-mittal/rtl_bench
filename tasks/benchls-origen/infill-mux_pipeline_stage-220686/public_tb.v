// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220686 dut (
    .clk(clk),
    .reset(in_vec[51:51]),
    .ce(in_vec[50:50]),
    .din0(in_vec[49:34]),
    .din1(in_vec[33:18]),
    .din2(in_vec[17:2]),
    .din3(in_vec[1:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h955c44ed321a9;
    stim[1] = 52'hdfb308e092d55;
    stim[2] = 52'h7e6a58c6ce721;
    stim[3] = 52'h760e7f32708bd;
    stim[4] = 52'h460c72caef9cd;
    stim[5] = 52'h5cda79dbd6e72;
    stim[6] = 52'h4c72104853f65;
    stim[7] = 52'h6d9ccec816b02;
    stim[8] = 52'h0ae02cb866675;
    stim[9] = 52'h17db5688c1a4f;
    stim[10] = 52'h63f6daa8914a0;
    stim[11] = 52'h5ae9363046372;
    stim[12] = 52'h3e25e5a8eed3c;
    stim[13] = 52'h5e978cc5fd5de;
    stim[14] = 52'h1f2063f7e57a7;
    stim[15] = 52'h3910395ae0771;
    stim[16] = 52'h5f7efbf8a34a7;
    stim[17] = 52'h2bd02297ff711;
    stim[18] = 52'h4e20a10d1cdd0;
    stim[19] = 52'h71439d8b37375;
    stim[20] = 52'h216408f1d46fb;
    stim[21] = 52'h6cfe89a766c9d;
    stim[22] = 52'h700e7612333ed;
    stim[23] = 52'h215f6d47d2319;
    stim[24] = 52'h2973912ec1975;
    stim[25] = 52'h6e2d3b2b9affb;
    stim[26] = 52'h3add5f8a28d61;
    stim[27] = 52'h1bd64d5a7017e;
    stim[28] = 52'h2c87868e0827f;
    stim[29] = 52'h0975a0885bc1e;
    stim[30] = 52'h78e137f20ce13;
    stim[31] = 52'h3a35d2080d6c7;
    stim[32] = 52'h4a4a7e21a8320;
    stim[33] = 52'h04a23caab572a;
    stim[34] = 52'h2442ff84cd401;
    stim[35] = 52'h66174b50c0a1e;
    stim[36] = 52'hd6dedd25f15ec;
    stim[37] = 52'h25673e4721132;
    stim[38] = 52'h72e28308fa9d3;
    stim[39] = 52'h367d5bdfadb74;
    stim[40] = 52'h7c6960b7eff53;
    stim[41] = 52'h6185bfc9016b4;
    stim[42] = 52'h627106399ffd3;
    stim[43] = 52'h1b1505ebfc810;
    stim[44] = 52'h144fd84f3de1b;
    stim[45] = 52'h70ade14c35b34;
    stim[46] = 52'h389db28674e40;
    stim[47] = 52'h305d99f0f5df7;
    stim[48] = 52'h2d3e9426cca9b;
    stim[49] = 52'h78aede99a5a52;
    stim[50] = 52'h72dbb3024ad17;
    stim[51] = 52'h3a6788995abf4;
    stim[52] = 52'h269c6d3d239df;
    stim[53] = 52'h2304d280a77bc;
    stim[54] = 52'h21144f5182fcb;
    stim[55] = 52'h5498dc0260df9;
    stim[56] = 52'h4905f846261ca;
    stim[57] = 52'h2f6d451790ffb;
    stim[58] = 52'h704eef85daa5b;
    stim[59] = 52'h694e8e5c1e16f;
    stim[60] = 52'h08b51386b6ee0;
    stim[61] = 52'h0b14d0dce0f57;
    stim[62] = 52'h18c9bfe63d316;
    stim[63] = 52'h3e6b1572fbcbc;
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
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h631b;
      expv[4] = 16'hfcc9;
      expv[5] = 16'hcb2b;
      expv[6] = 16'h5b9c;
      expv[7] = 16'h4121;
      expv[8] = 16'h5ac0;
      expv[9] = 16'h5ac0;
      expv[10] = 16'h5ac0;
      expv[11] = 16'h8fdb;
      expv[12] = 16'h18dc;
      expv[13] = 16'h18dc;
      expv[14] = 16'hf577;
      expv[15] = 16'hf577;
      expv[16] = 16'hf577;
      expv[17] = 16'h8d29;
      expv[18] = 16'h8d29;
      expv[19] = 16'h3882;
      expv[20] = 16'h762c;
      expv[21] = 16'h762c;
      expv[22] = 16'h269d;
      expv[23] = 16'hd848;
      expv[24] = 16'hd848;
      expv[25] = 16'hd848;
      expv[26] = 16'h6bfe;
      expv[27] = 16'h6bfe;
      expv[28] = 16'h6bfe;
      expv[29] = 16'h6bfe;
      expv[30] = 16'h6bfe;
      expv[31] = 16'h3384;
      expv[32] = 16'h3384;
      expv[33] = 16'h2929;
      expv[34] = 16'h2929;
      expv[35] = 16'h2929;
      expv[36] = 16'h0287;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'hea74;
      expv[40] = 16'hea74;
      expv[41] = 16'hbfd4;
      expv[42] = 16'h8616;
      expv[43] = 16'h7ff4;
      expv[44] = 16'h7ff4;
      expv[45] = 16'h7ff4;
      expv[46] = 16'hc2b7;
      expv[47] = 16'hc2b7;
      expv[48] = 16'hc2b7;
      expv[49] = 16'hc2b7;
      expv[50] = 16'h9694;
      expv[51] = 16'h2b45;
      expv[52] = 16'h2b45;
      expv[53] = 16'h2b45;
      expv[54] = 16'h2b45;
      expv[55] = 16'h2b45;
      expv[56] = 16'h7009;
      expv[57] = 16'h9872;
      expv[58] = 16'h9872;
      expv[59] = 16'h6a96;
      expv[60] = 16'h785b;
      expv[61] = 16'h785b;
      expv[62] = 16'h785b;
      expv[63] = 16'h785b;
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
