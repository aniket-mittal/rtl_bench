// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  hpdmc_busif dut (
    .sys_clk(clk),
    .sdram_rst(in_vec[27:27]),
    .fml_adr(in_vec[26:4]),
    .fml_stb(in_vec[3:3]),
    .fml_we(in_vec[2:2]),
    .mgmt_ack(in_vec[1:1]),
    .data_ack(in_vec[0:0]),
    .fml_ack(out_vec[24:24]),
    .mgmt_stb(out_vec[23:23]),
    .mgmt_we(out_vec[22:22]),
    .mgmt_address(out_vec[21:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'hb25038d;
    stim[1] = 28'hf1a34db;
    stim[2] = 28'h5321aef;
    stim[3] = 28'h630a23e;
    stim[4] = 28'h2905c4a;
    stim[5] = 28'h3c0584f;
    stim[6] = 28'h79fc5af;
    stim[7] = 28'h1ea7450;
    stim[8] = 28'h3bcf5aa;
    stim[9] = 28'h1845128;
    stim[10] = 28'h5677fb9;
    stim[11] = 28'h55e4b35;
    stim[12] = 28'h38453ea;
    stim[13] = 28'h143a625;
    stim[14] = 28'h612d724;
    stim[15] = 28'h6038e81;
    stim[16] = 28'h34c9e70;
    stim[17] = 28'h5444ce6;
    stim[18] = 28'h72ba5d8;
    stim[19] = 28'h6af360c;
    stim[20] = 28'h1c4d2b6;
    stim[21] = 28'h02ee3b4;
    stim[22] = 28'h7f07d8e;
    stim[23] = 28'h77e077b;
    stim[24] = 28'h6087977;
    stim[25] = 28'h45272ca;
    stim[26] = 28'h5510d9e;
    stim[27] = 28'h54d5777;
    stim[28] = 28'h2ca1411;
    stim[29] = 28'h2bfc7b7;
    stim[30] = 28'h6ac44ad;
    stim[31] = 28'h6ea37b2;
    stim[32] = 28'h2bdb7f2;
    stim[33] = 28'h14b7b02;
    stim[34] = 28'h0b6f4fb;
    stim[35] = 28'h2fceb64;
    stim[36] = 28'h147416c;
    stim[37] = 28'h4092908;
    stim[38] = 28'h2bc79a4;
    stim[39] = 28'h6200c45;
    stim[40] = 28'h2639a21;
    stim[41] = 28'h318eb10;
    stim[42] = 28'h450f552;
    stim[43] = 28'h0579074;
    stim[44] = 28'h1fdc28f;
    stim[45] = 28'h1b7cd85;
    stim[46] = 28'h2da289a;
    stim[47] = 28'h78465a6;
    stim[48] = 28'h4fd6704;
    stim[49] = 28'h706b55c;
    stim[50] = 28'h26b1d91;
    stim[51] = 28'h2e26a5f;
    stim[52] = 28'h6a9172d;
    stim[53] = 28'h34fa6bc;
    stim[54] = 28'h4a5622a;
    stim[55] = 28'h1d48f85;
    stim[56] = 28'h07ed3a1;
    stim[57] = 28'h3b1e8a9;
    stim[58] = 28'h6b30bc0;
    stim[59] = 28'h4245aa5;
    stim[60] = 28'h0fc0efa;
    stim[61] = 28'h37999c2;
    stim[62] = 28'h62eb45b;
    stim[63] = 28'h26198cb;
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
      expv[0] = 25'h1x9281c;
      expv[1] = 25'h1b8d1a6;
      expv[2] = 25'h1e990d7;
      expv[3] = 25'h0f18511;
      expv[4] = 25'h01482e2;
      expv[5] = 25'h15e02c2;
      expv[6] = 25'h1fcfe2d;
      expv[7] = 25'h00f53a2;
      expv[8] = 25'h09de7ad;
      expv[9] = 25'h00c2289;
      expv[10] = 25'h12b3bfd;
      expv[11] = 25'h16af259;
      expv[12] = 25'h09c229f;
      expv[13] = 25'h14a1d31;
      expv[14] = 25'h07096b9;
      expv[15] = 25'h1301c74;
      expv[16] = 25'h01a64f3;
      expv[17] = 25'h06a2267;
      expv[18] = 25'h0395d2e;
      expv[19] = 25'h07579b0;
      expv[20] = 25'h04e2695;
      expv[21] = 25'h041771d;
      expv[22] = 25'h07f83ec;
      expv[23] = 25'h13bf03b;
      expv[24] = 25'h17043cb;
      expv[25] = 25'h0a29396;
      expv[26] = 25'h06a886c;
      expv[27] = 25'h16a6abb;
      expv[28] = 25'h11650a0;
      expv[29] = 25'h155fe3d;
      expv[30] = 25'h1f56225;
      expv[31] = 25'h03751bd;
      expv[32] = 25'h015edbf;
      expv[33] = 25'h00a5bd8;
      expv[34] = 25'h105b7a7;
      expv[35] = 25'h057e75b;
      expv[36] = 25'h0ca3a0b;
      expv[37] = 25'h0a04948;
      expv[38] = 25'h055e3cd;
      expv[39] = 25'h1710062;
      expv[40] = 25'h1131cd1;
      expv[41] = 25'h018c758;
      expv[42] = 25'h02287aa;
      expv[43] = 25'h042bc83;
      expv[44] = 25'h14fee14;
      expv[45] = 25'h14dbe6c;
      expv[46] = 25'h096d144;
      expv[47] = 25'h07c232d;
      expv[48] = 25'h067eb38;
      expv[49] = 25'h07835aa;
      expv[50] = 25'h11358ec;
      expv[51] = 25'h1d71352;
      expv[52] = 25'h1f548b9;
      expv[53] = 25'h0da7d35;
      expv[54] = 25'h0a52b11;
      expv[55] = 25'h14ea47c;
      expv[56] = 25'h103f69d;
      expv[57] = 25'h19d8f45;
      expv[58] = 25'h035985e;
      expv[59] = 25'h16122d5;
      expv[60] = 25'h087e077;
      expv[61] = 25'h01bccce;
      expv[62] = 25'h13175a2;
      expv[63] = 25'h1930cc6;
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
