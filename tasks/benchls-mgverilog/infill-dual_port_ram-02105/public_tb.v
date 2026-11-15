// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02105 dut (
    .CLKA(clk),
    .RSTA(in_vec[54:54]),
    .ADDRA(in_vec[53:46]),
    .DIA(in_vec[45:30]),
    .ENA(in_vec[29:29]),
    .WEA(in_vec[28:28]),
    .CLKB(in_vec[27:27]),
    .RSTB(in_vec[26:26]),
    .ADDRB(in_vec[25:18]),
    .DIB(in_vec[17:2]),
    .ENB(in_vec[1:1]),
    .WEB(in_vec[0:0]),
    .DOA(out_vec[31:16]),
    .DOB(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h67f69eb662746c;
    stim[1] = 55'h72a43360b0154d;
    stim[2] = 55'h214663353a5a3b;
    stim[3] = 55'h0a5c8aa788b4fb;
    stim[4] = 55'h1177e1d5a8453f;
    stim[5] = 55'h02e57c8b6c6726;
    stim[6] = 55'h30a1d91700e644;
    stim[7] = 55'h39f2526c803ef1;
    stim[8] = 55'h38c9b51739a5f4;
    stim[9] = 55'h142aa3c4c0eed4;
    stim[10] = 55'h32cb54054e5ea1;
    stim[11] = 55'h065c82e7b0f1d7;
    stim[12] = 55'h3f7a4a7afc1941;
    stim[13] = 55'h11135feb023ede;
    stim[14] = 55'h16680c6be71e56;
    stim[15] = 55'h25bc28416f4c52;
    stim[16] = 55'h10815121a75f44;
    stim[17] = 55'h01dfca7f17bbf8;
    stim[18] = 55'h13b3ce352d325a;
    stim[19] = 55'h240647591a53df;
    stim[20] = 55'h03b6418c3df88e;
    stim[21] = 55'h1008435ca3405a;
    stim[22] = 55'h0053681de6a8df;
    stim[23] = 55'h0e1e55f3cff58a;
    stim[24] = 55'h2c6ca7403c49fb;
    stim[25] = 55'h1f7c215a2461bb;
    stim[26] = 55'h04075ab362c0d1;
    stim[27] = 55'h12c4d9a08f57be;
    stim[28] = 55'h14a5ea3a2d3b6f;
    stim[29] = 55'h0b1a1d867afb4e;
    stim[30] = 55'h12654b55952243;
    stim[31] = 55'h2dd53e3265256e;
    stim[32] = 55'h181e287f577648;
    stim[33] = 55'h093d7c28f5e369;
    stim[34] = 55'h78772aa9e694b4;
    stim[35] = 55'h3eb2ba0667a145;
    stim[36] = 55'h2e2df065e52267;
    stim[37] = 55'h0bd3a0020178f1;
    stim[38] = 55'h0521116a018e5e;
    stim[39] = 55'h30cadd3e8d5a7c;
    stim[40] = 55'h1dce8ab91a838b;
    stim[41] = 55'h0f68a235245b27;
    stim[42] = 55'h2bfb3e2aa1063d;
    stim[43] = 55'h111bb72e1d7686;
    stim[44] = 55'h3cad0c79c7d08b;
    stim[45] = 55'h1ac095137d5179;
    stim[46] = 55'h13d6edbfcd7643;
    stim[47] = 55'h0487b22bf29ef6;
    stim[48] = 55'h39466abd81849a;
    stim[49] = 55'h26230be68ebb62;
    stim[50] = 55'h047b058752a6d4;
    stim[51] = 55'h345da5e3f9f806;
    stim[52] = 55'h2d26b8a57d2b85;
    stim[53] = 55'h04af73634f046b;
    stim[54] = 55'h0a746c11b61db1;
    stim[55] = 55'h1f15f420f39d07;
    stim[56] = 55'h2f7c4c70765170;
    stim[57] = 55'h2a86f7b4aae4e8;
    stim[58] = 55'h3e70b1c0913e68;
    stim[59] = 55'h2998684dcd8638;
    stim[60] = 55'h2320be9e152e44;
    stim[61] = 55'h15851217ab8b6c;
    stim[62] = 55'h3ca2a25dedc1c9;
    stim[63] = 55'h0a88e3aa6b636a;
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
      expv[3] = 32'h198cxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'he929xxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'h7f29xxxx;
      expv[19] = 32'hcf3894f7;
      expv[20] = 32'hcf38xxxx;
      expv[21] = 32'hcf38xxxx;
      expv[22] = 32'hcf38xxxx;
      expv[23] = 32'hcf38xxxx;
      expv[24] = 32'h7957xxxx;
      expv[25] = 32'h7957186e;
      expv[26] = 32'h7957186e;
      expv[27] = 32'h1d6a186e;
      expv[28] = 32'hxxxx4edb;
      expv[29] = 32'h97a8xxxx;
      expv[30] = 32'h97a8xxxx;
      expv[31] = 32'h97a8xxxx;
      expv[32] = 32'h54f8xxxx;
      expv[33] = 32'h78a1xxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'h2b74xxxx;
      expv[41] = 32'h3a2axxxx;
      expv[42] = 32'ha288xxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hb431xxxx;
      expv[46] = 32'hb431xxxx;
      expv[47] = 32'h5bb6xxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'h19aaxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hf131xxxx;
      expv[58] = 32'h1bdexxxx;
      expv[59] = 32'h1bdexxxx;
      expv[60] = 32'h1bdexxxx;
      expv[61] = 32'h1bdexxxx;
      expv[62] = 32'h1bdexxxx;
      expv[63] = 32'h1bdexxxx;
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
