// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085821 dut (
    .CLK(clk),
    .DI(in_vec[7:1]),
    .nDSYNC(in_vec[0:0]),
    .R_o(out_vec[24:18]),
    .G_o(out_vec[17:11]),
    .B_o(out_vec[10:4]),
    .nCSYNC(out_vec[3:3]),
    .nHSYNC(out_vec[2:2]),
    .nVSYNC(out_vec[1:1]),
    .nCLAMP(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb8;
    stim[1] = 8'h39;
    stim[2] = 8'h14;
    stim[3] = 8'h36;
    stim[4] = 8'h45;
    stim[5] = 8'h6c;
    stim[6] = 8'h76;
    stim[7] = 8'h54;
    stim[8] = 8'h9e;
    stim[9] = 8'h0b;
    stim[10] = 8'ha4;
    stim[11] = 8'hac;
    stim[12] = 8'hc4;
    stim[13] = 8'h4d;
    stim[14] = 8'hc3;
    stim[15] = 8'hbb;
    stim[16] = 8'h52;
    stim[17] = 8'hb0;
    stim[18] = 8'h22;
    stim[19] = 8'h72;
    stim[20] = 8'h5c;
    stim[21] = 8'hdf;
    stim[22] = 8'h76;
    stim[23] = 8'h66;
    stim[24] = 8'h6c;
    stim[25] = 8'h86;
    stim[26] = 8'h7f;
    stim[27] = 8'h47;
    stim[28] = 8'hea;
    stim[29] = 8'hc4;
    stim[30] = 8'hb8;
    stim[31] = 8'h55;
    stim[32] = 8'h5e;
    stim[33] = 8'h85;
    stim[34] = 8'hb1;
    stim[35] = 8'hb7;
    stim[36] = 8'h4b;
    stim[37] = 8'ha3;
    stim[38] = 8'h2b;
    stim[39] = 8'h7b;
    stim[40] = 8'hf4;
    stim[41] = 8'ha2;
    stim[42] = 8'hae;
    stim[43] = 8'h18;
    stim[44] = 8'hdb;
    stim[45] = 8'h31;
    stim[46] = 8'h23;
    stim[47] = 8'ha7;
    stim[48] = 8'hb9;
    stim[49] = 8'hcf;
    stim[50] = 8'h74;
    stim[51] = 8'hef;
    stim[52] = 8'h85;
    stim[53] = 8'he8;
    stim[54] = 8'h32;
    stim[55] = 8'hb6;
    stim[56] = 8'h71;
    stim[57] = 8'h7d;
    stim[58] = 8'h65;
    stim[59] = 8'h57;
    stim[60] = 8'h18;
    stim[61] = 8'hb6;
    stim[62] = 8'hd1;
    stim[63] = 8'hef;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'hxxxxxx3;
      expv[2] = 25'hxxxxxx3;
      expv[3] = 25'hxxxxxx6;
      expv[4] = 25'hxxxxxxe;
      expv[5] = 25'hxxxxxxe;
      expv[6] = 25'hxxxxxx5;
      expv[7] = 25'hxxxxxxe;
      expv[8] = 25'hxxxxxx6;
      expv[9] = 25'hxxxxxxf;
      expv[10] = 25'hxxxxxxf;
      expv[11] = 25'hxxxxxx4;
      expv[12] = 25'hxxxxxx5;
      expv[13] = 25'hxxxxxx4;
      expv[14] = 25'hxxxxxx4;
      expv[15] = 25'hxxxxxx4;
      expv[16] = 25'hxxxxxx4;
      expv[17] = 25'hxxxxxxa;
      expv[18] = 25'hxxxxxx2;
      expv[19] = 25'hxxxxxx8;
      expv[20] = 25'hxxxxxxa;
      expv[21] = 25'hxxxxxx7;
      expv[22] = 25'hxxxxxx7;
      expv[23] = 25'h1bxxxxe;
      expv[24] = 25'h1bxxxxc;
      expv[25] = 25'h1bxxxx5;
      expv[26] = 25'h1bxxxxc;
      expv[27] = 25'h1bxxxxc;
      expv[28] = 25'h1bxxxxc;
      expv[29] = 25'h0fd1xx9;
      expv[30] = 25'h0fd1xx4;
      expv[31] = 25'h0fd1xx3;
      expv[32] = 25'h0fd1xx3;
      expv[33] = 25'h0a91xxf;
      expv[34] = 25'h0a91xxf;
      expv[35] = 25'h0a91xxf;
      expv[36] = 25'h0a91xxf;
      expv[37] = 25'h0a91xxf;
      expv[38] = 25'h0a91xxf;
      expv[39] = 25'h0a91xxf;
      expv[40] = 25'h0a91xxf;
      expv[41] = 25'h0a91xx6;
      expv[42] = 25'h0a91xx8;
      expv[43] = 25'h0a91xxd;
      expv[44] = 25'h0a91xx3;
      expv[45] = 25'h0a91xx3;
      expv[46] = 25'h0a91xx3;
      expv[47] = 25'h0a91xx3;
      expv[48] = 25'h0a91xx3;
      expv[49] = 25'h0a91xx3;
      expv[50] = 25'h0a91xx3;
      expv[51] = 25'h0a91xx6;
      expv[52] = 25'h0a91xx6;
      expv[53] = 25'h0a91xx6;
      expv[54] = 25'h1de1xx1;
      expv[55] = 25'h1de1xxa;
      expv[56] = 25'h1de1xxe;
      expv[57] = 25'h1de1xxe;
      expv[58] = 25'h1de1xxe;
      expv[59] = 25'h1de1xxe;
      expv[60] = 25'h1de1xxe;
      expv[61] = 25'h1de1xx3;
      expv[62] = 25'h1de1xxe;
      expv[63] = 25'h1de1xxe;
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
