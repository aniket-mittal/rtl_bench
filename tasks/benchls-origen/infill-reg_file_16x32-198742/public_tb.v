// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198742 dut (
    .clk(clk),
    .write(in_vec[40:40]),
    .wrAddr(in_vec[39:36]),
    .wrData(in_vec[35:4]),
    .rdAddrA(in_vec[3:0]),
    .rdDataA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h001933f4aad;
    stim[1] = 41'h1ed4bdc70b6;
    stim[2] = 41'h045c7d44dea;
    stim[3] = 41'h07135084021;
    stim[4] = 41'h133b5173b01;
    stim[5] = 41'h14532cb448b;
    stim[6] = 41'h179088bb166;
    stim[7] = 41'h1ea55ac65c3;
    stim[8] = 41'h10bc3e02eb4;
    stim[9] = 41'h11429db21d6;
    stim[10] = 41'h097a2313da4;
    stim[11] = 41'h1e77806a476;
    stim[12] = 41'h0f1793e3e26;
    stim[13] = 41'h067579356dd;
    stim[14] = 41'h17796925779;
    stim[15] = 41'h0eedf48ec83;
    stim[16] = 41'h03c38567900;
    stim[17] = 41'h1e916222d35;
    stim[18] = 41'h015d2da4305;
    stim[19] = 41'h1145fa9c27f;
    stim[20] = 41'h1eaa4f4d78c;
    stim[21] = 41'h0910fc0fd8f;
    stim[22] = 41'h1ff64fec1d7;
    stim[23] = 41'h19bf5cab53f;
    stim[24] = 41'h0eab18ea90d;
    stim[25] = 41'h192bf6b8f6a;
    stim[26] = 41'h0b88cb1f258;
    stim[27] = 41'h017fb7103bb;
    stim[28] = 41'h197aaaad64c;
    stim[29] = 41'h1d1a9016ded;
    stim[30] = 41'h14a7a762bd4;
    stim[31] = 41'h1f42fa44b92;
    stim[32] = 41'h0a74a746b27;
    stim[33] = 41'h1c455724007;
    stim[34] = 41'h1997e0bdfcd;
    stim[35] = 41'h1d339958ccd;
    stim[36] = 41'h0c72f7c18b5;
    stim[37] = 41'h0ad4883857f;
    stim[38] = 41'h001e4376493;
    stim[39] = 41'h1016deab421;
    stim[40] = 41'h018f353abf2;
    stim[41] = 41'h0f61e50f4ac;
    stim[42] = 41'h1732db279d5;
    stim[43] = 41'h084fd03c7b4;
    stim[44] = 41'h01eae79f956;
    stim[45] = 41'h11557682529;
    stim[46] = 41'h1b9b6b1f771;
    stim[47] = 41'h1b51cb1a337;
    stim[48] = 41'h1e54dca09af;
    stim[49] = 41'h0e51c7a148c;
    stim[50] = 41'h07f65a9168f;
    stim[51] = 41'h09e64dcc421;
    stim[52] = 41'h1d628226aa8;
    stim[53] = 41'h01e812ed51c;
    stim[54] = 41'h0c0b087c687;
    stim[55] = 41'h1ed6ea625ba;
    stim[56] = 41'h0959c50d7f1;
    stim[57] = 41'h1eaa90fae0e;
    stim[58] = 41'h09f630ad5d3;
    stim[59] = 41'h0b992c5bffc;
    stim[60] = 41'h01e8a93a26f;
    stim[61] = 41'h12d2c3e89f6;
    stim[62] = 41'h1338b45fb0c;
    stim[63] = 41'h05a3d210639;
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
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'h3b5173b0;
      expv[8] = 32'h532cb448;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'h532cb448;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'h3b5173b0;
      expv[16] = 32'hbc3e02eb;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'h79692577;
      expv[23] = 32'hf64fec1d;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'h532cb448;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'h79692577;
      expv[33] = 32'h79692577;
      expv[34] = 32'h1a9016de;
      expv[35] = 32'h1a9016de;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'h42fa44b9;
      expv[38] = 32'h3b5173b0;
      expv[39] = 32'h45fa9c27;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'h45572400;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'ha7a762bd;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'h97e0bdfc;
      expv[46] = 32'h55768252;
      expv[47] = 32'h32db279d;
      expv[48] = 32'h42fa44b9;
      expv[49] = 32'h45572400;
      expv[50] = 32'h42fa44b9;
      expv[51] = 32'h55768252;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'h45572400;
      expv[54] = 32'h32db279d;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'h55768252;
      expv[57] = 32'hd6ea625b;
      expv[58] = 32'h3b5173b0;
      expv[59] = 32'h45572400;
      expv[60] = 32'h42fa44b9;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'h45572400;
      expv[63] = 32'h97e0bdfc;
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
