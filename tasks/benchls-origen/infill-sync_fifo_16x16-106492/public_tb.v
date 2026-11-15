// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106492 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .we(in_vec[17:17]),
    .re(in_vec[16:16]),
    .din(in_vec[15:0]),
    .dout(out_vec[17:2]),
    .flagf(out_vec[1:1]),
    .flage(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7357f;
    stim[1] = 19'h61fb1;
    stim[2] = 19'h26989;
    stim[3] = 19'h14a08;
    stim[4] = 19'h27826;
    stim[5] = 19'h1534a;
    stim[6] = 19'h1732a;
    stim[7] = 19'h1596a;
    stim[8] = 19'h199d0;
    stim[9] = 19'h2d1f8;
    stim[10] = 19'h33dbe;
    stim[11] = 19'h04dee;
    stim[12] = 19'h01fc4;
    stim[13] = 19'h08755;
    stim[14] = 19'h27fcc;
    stim[15] = 19'h06577;
    stim[16] = 19'h16508;
    stim[17] = 19'h156e7;
    stim[18] = 19'h38cd1;
    stim[19] = 19'h2df29;
    stim[20] = 19'h03b70;
    stim[21] = 19'h1b7c6;
    stim[22] = 19'h39f68;
    stim[23] = 19'h3054f;
    stim[24] = 19'h0141c;
    stim[25] = 19'h26454;
    stim[26] = 19'h1a2f9;
    stim[27] = 19'h0464b;
    stim[28] = 19'h70aa4;
    stim[29] = 19'h018c2;
    stim[30] = 19'h22395;
    stim[31] = 19'h024c4;
    stim[32] = 19'h3d318;
    stim[33] = 19'h11f6e;
    stim[34] = 19'h0306f;
    stim[35] = 19'h2121f;
    stim[36] = 19'h3a90e;
    stim[37] = 19'h39800;
    stim[38] = 19'h3cca0;
    stim[39] = 19'h0650e;
    stim[40] = 19'h3b05e;
    stim[41] = 19'h26ebd;
    stim[42] = 19'h3d4ef;
    stim[43] = 19'h0b0f3;
    stim[44] = 19'h213ab;
    stim[45] = 19'h0ca42;
    stim[46] = 19'h37396;
    stim[47] = 19'h24e1d;
    stim[48] = 19'h22960;
    stim[49] = 19'h2f2eb;
    stim[50] = 19'h10269;
    stim[51] = 19'h3d92e;
    stim[52] = 19'h35a55;
    stim[53] = 19'h0932c;
    stim[54] = 19'h0ee51;
    stim[55] = 19'h3358d;
    stim[56] = 19'h13139;
    stim[57] = 19'h345c8;
    stim[58] = 19'h379d0;
    stim[59] = 19'h133cd;
    stim[60] = 19'h0b26a;
    stim[61] = 19'h1adf2;
    stim[62] = 19'h11ce7;
    stim[63] = 19'h03e89;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'h1a624;
      expv[7] = 18'h1e099;
      expv[8] = 18'h1e099;
      expv[9] = 18'h1e099;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'hxxxxx;
      expv[17] = 18'h347e0;
      expv[18] = 18'h0f6f8;
      expv[19] = 18'h1ff30;
      expv[20] = 18'hxxxxx;
      expv[21] = 18'hxxxxx;
      expv[22] = 18'h23345;
      expv[23] = 18'h23345;
      expv[24] = 18'h23345;
      expv[25] = 18'hxxxxx;
      expv[26] = 18'hxxxxx;
      expv[27] = 18'hxxxxx;
      expv[28] = 18'hxxxxx;
      expv[29] = 18'hxxxxx;
      expv[30] = 18'hxxxxx;
      expv[31] = 18'hxxxxx;
      expv[32] = 18'hxxxxx;
      expv[33] = 18'h08e54;
      expv[34] = 18'h34c61;
      expv[35] = 18'hxxxxx;
      expv[36] = 18'hxxxxx;
      expv[37] = 18'h0487d;
      expv[38] = 18'h0487c;
      expv[39] = 18'h2a439;
      expv[40] = 18'hxxxxx;
      expv[41] = 18'h26000;
      expv[42] = 18'hxxxxx;
      expv[43] = 18'h33280;
      expv[44] = 18'hxxxxx;
      expv[45] = 18'hxxxxx;
      expv[46] = 18'hxxxxx;
      expv[47] = 18'h2c178;
      expv[48] = 18'hxxxxx;
      expv[49] = 18'hxxxxx;
      expv[50] = 18'hxxxxx;
      expv[51] = 18'hxxxxx;
      expv[52] = 18'hxxxxx;
      expv[53] = 18'h1baf4;
      expv[54] = 18'hxxxxx;
      expv[55] = 18'hxxxxx;
      expv[56] = 18'h353bc;
      expv[57] = 18'h04ead;
      expv[58] = 18'h04eac;
      expv[59] = 18'h1ce59;
      expv[60] = 18'h1ce58;
      expv[61] = 18'hxxxxx;
      expv[62] = 18'h13874;
      expv[63] = 18'h0a580;
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
