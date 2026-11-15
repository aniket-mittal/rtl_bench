// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09141 dut (
    .clock(clk),
    .Dn(in_vec[30:23]),
    .Xn(in_vec[22:15]),
    .Wn(in_vec[14:7]),
    .memory_Dn_active(in_vec[6:6]),
    .memory_Xn_active(in_vec[5:5]),
    .memory_bobot_active(in_vec[4:4]),
    .y_active(in_vec[3:3]),
    .e_active(in_vec[2:2]),
    .w_active(in_vec[1:1]),
    .sys_reset_active(in_vec[0:0]),
    .z(out_vec[13:6]),
    .done_read_Dn(out_vec[5:5]),
    .done_read_Xn(out_vec[4:4]),
    .done_yn(out_vec[3:3]),
    .done_en(out_vec[2:2]),
    .done_write_wn(out_vec[1:1]),
    .done_wn1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h0ebe13d1;
    stim[1] = 31'h5d4ea61b;
    stim[2] = 31'h26c37f52;
    stim[3] = 31'h05ba4a6c;
    stim[4] = 31'h61adaf8a;
    stim[5] = 31'h13b77186;
    stim[6] = 31'h6488a0d8;
    stim[7] = 31'h1116f2b0;
    stim[8] = 31'h631249aa;
    stim[9] = 31'h6cbb517a;
    stim[10] = 31'h760af350;
    stim[11] = 31'h18cefb8e;
    stim[12] = 31'h28ad06e6;
    stim[13] = 31'h360854ec;
    stim[14] = 31'h6d8285a6;
    stim[15] = 31'h45bfc8fe;
    stim[16] = 31'h7a1925b6;
    stim[17] = 31'h1ca822fc;
    stim[18] = 31'h409dc536;
    stim[19] = 31'h29631c6a;
    stim[20] = 31'h0dbebffc;
    stim[21] = 31'h286bc99e;
    stim[22] = 31'h2e9709f4;
    stim[23] = 31'h3fe0d8ca;
    stim[24] = 31'h68ebafe6;
    stim[25] = 31'h3fd6d76c;
    stim[26] = 31'h00d1ab7c;
    stim[27] = 31'h1e0d8464;
    stim[28] = 31'h07c7305a;
    stim[29] = 31'h50c7bd54;
    stim[30] = 31'h5906a91a;
    stim[31] = 31'h797b730c;
    stim[32] = 31'h7016fcf4;
    stim[33] = 31'h4ea9d588;
    stim[34] = 31'h60955e50;
    stim[35] = 31'h49f0e5d8;
    stim[36] = 31'h3b372ac6;
    stim[37] = 31'h6af472ac;
    stim[38] = 31'h029a82a4;
    stim[39] = 31'h4a8dfb1c;
    stim[40] = 31'h0bc9888e;
    stim[41] = 31'h2061e6c4;
    stim[42] = 31'h4e324a18;
    stim[43] = 31'h50cd2ee0;
    stim[44] = 31'h646892f2;
    stim[45] = 31'h76883838;
    stim[46] = 31'h4fc302a2;
    stim[47] = 31'h2af6aa1c;
    stim[48] = 31'h38f680c2;
    stim[49] = 31'h6571f6a7;
    stim[50] = 31'h31b65760;
    stim[51] = 31'h5c922db6;
    stim[52] = 31'h0e82d378;
    stim[53] = 31'h215cb87a;
    stim[54] = 31'h1e501574;
    stim[55] = 31'h1a7f36f4;
    stim[56] = 31'h5e8f9f62;
    stim[57] = 31'h0ea2e866;
    stim[58] = 31'h6ab00c76;
    stim[59] = 31'h5c658e2c;
    stim[60] = 31'h684a0cd0;
    stim[61] = 31'h1bfe58ae;
    stim[62] = 31'h6c325112;
    stim[63] = 31'h6d6fcfd4;
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
      expv[0] = 14'h0022;
      expv[1] = 14'h000b;
      expv[2] = 14'h0023;
      expv[3] = 14'h003c;
      expv[4] = 14'hxxx9;
      expv[5] = 14'hxxx5;
      expv[6] = 14'hxxxa;
      expv[7] = 14'hxxx2;
      expv[8] = 14'hxxx9;
      expv[9] = 14'hxxxb;
      expv[10] = 14'hxxx2;
      expv[11] = 14'hxxxd;
      expv[12] = 14'hxxx5;
      expv[13] = 14'hxxxc;
      expv[14] = 14'hxxx5;
      expv[15] = 14'hxxxf;
      expv[16] = 14'hxxx7;
      expv[17] = 14'hxxxe;
      expv[18] = 14'hxxx7;
      expv[19] = 14'hxxx9;
      expv[20] = 14'hxxxe;
      expv[21] = 14'hxxxf;
      expv[22] = 14'hxxx6;
      expv[23] = 14'hxxx9;
      expv[24] = 14'hxxx5;
      expv[25] = 14'hxxxc;
      expv[26] = 14'hxxxe;
      expv[27] = 14'hxxx4;
      expv[28] = 14'hxxxb;
      expv[29] = 14'hxxx6;
      expv[30] = 14'hxxxb;
      expv[31] = 14'hxxxc;
      expv[32] = 14'hxxx6;
      expv[33] = 14'hxxx8;
      expv[34] = 14'hxxx2;
      expv[35] = 14'hxxxa;
      expv[36] = 14'hxxx5;
      expv[37] = 14'hxxxc;
      expv[38] = 14'hxxx4;
      expv[39] = 14'hxxxe;
      expv[40] = 14'hxxxd;
      expv[41] = 14'hxxx4;
      expv[42] = 14'hxxxa;
      expv[43] = 14'hxxx0;
      expv[44] = 14'hxxx3;
      expv[45] = 14'hxxxa;
      expv[46] = 14'hxxx1;
      expv[47] = 14'hxxxe;
      expv[48] = 14'hxxx1;
      expv[49] = 14'h0015;
      expv[50] = 14'h0030;
      expv[51] = 14'h0017;
      expv[52] = 14'hxxxa;
      expv[53] = 14'hxxxb;
      expv[54] = 14'hxxx6;
      expv[55] = 14'hxxx6;
      expv[56] = 14'hxxx1;
      expv[57] = 14'hxxx5;
      expv[58] = 14'hxxx7;
      expv[59] = 14'hxxxc;
      expv[60] = 14'hxxx2;
      expv[61] = 14'hxxxd;
      expv[62] = 14'hxxx3;
      expv[63] = 14'hxxx6;
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
