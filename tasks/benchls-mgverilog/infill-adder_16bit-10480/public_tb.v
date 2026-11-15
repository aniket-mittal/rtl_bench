// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10480 dut (
    .in1(in_vec[31:16]),
    .in2(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7b252788;
    stim[1] = 32'h0549a513;
    stim[2] = 32'h0198222b;
    stim[3] = 32'h9460970c;
    stim[4] = 32'h46e72d5d;
    stim[5] = 32'hf3a39de3;
    stim[6] = 32'h08d88719;
    stim[7] = 32'hd4782dcc;
    stim[8] = 32'hea0b122b;
    stim[9] = 32'h68c4bde1;
    stim[10] = 32'h5e2ebbf5;
    stim[11] = 32'h668aa815;
    stim[12] = 32'he2d63511;
    stim[13] = 32'hce4336d4;
    stim[14] = 32'h5ad4e39a;
    stim[15] = 32'he2bcc189;
    stim[16] = 32'h3583cf85;
    stim[17] = 32'h2360fef0;
    stim[18] = 32'h38c06bcb;
    stim[19] = 32'he16731e6;
    stim[20] = 32'hb8fafbae;
    stim[21] = 32'h7cee3f53;
    stim[22] = 32'ha8164df1;
    stim[23] = 32'h36a83852;
    stim[24] = 32'h5cf2fac6;
    stim[25] = 32'hd8b9c09a;
    stim[26] = 32'hd8201018;
    stim[27] = 32'hd3bf63d5;
    stim[28] = 32'ha644a33b;
    stim[29] = 32'h61aea604;
    stim[30] = 32'h11938780;
    stim[31] = 32'h3fd5112f;
    stim[32] = 32'h32914e2b;
    stim[33] = 32'h86a66700;
    stim[34] = 32'hb1f2d694;
    stim[35] = 32'he26c792c;
    stim[36] = 32'hfe2db9c3;
    stim[37] = 32'hbd28b5cd;
    stim[38] = 32'h4ab6be6a;
    stim[39] = 32'h2f21568d;
    stim[40] = 32'headc8bc3;
    stim[41] = 32'hf2e19aa2;
    stim[42] = 32'h6a8a5f34;
    stim[43] = 32'hfd7ed3c2;
    stim[44] = 32'hb690d0e0;
    stim[45] = 32'h610a77b9;
    stim[46] = 32'hadce4f5a;
    stim[47] = 32'had923a79;
    stim[48] = 32'h8b8bbad6;
    stim[49] = 32'h49234935;
    stim[50] = 32'hcfb2716c;
    stim[51] = 32'h27bfbbf0;
    stim[52] = 32'h4e3dd0e7;
    stim[53] = 32'h26c6c5fa;
    stim[54] = 32'hb011459c;
    stim[55] = 32'h680d2fb2;
    stim[56] = 32'hf2c62082;
    stim[57] = 32'hac8e8fa4;
    stim[58] = 32'hd5549e75;
    stim[59] = 32'h8b256832;
    stim[60] = 32'h7a316b72;
    stim[61] = 32'hb247bd05;
    stim[62] = 32'he4ef9280;
    stim[63] = 32'h0131cef1;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'ha2ad;
      expv[1] = 16'haa5c;
      expv[2] = 16'h23c3;
      expv[3] = 16'h2b6c;
      expv[4] = 16'h7444;
      expv[5] = 16'h9186;
      expv[6] = 16'h8ff1;
      expv[7] = 16'h0244;
      expv[8] = 16'hfc36;
      expv[9] = 16'h26a5;
      expv[10] = 16'h1a23;
      expv[11] = 16'h0e9f;
      expv[12] = 16'h17e7;
      expv[13] = 16'h0517;
      expv[14] = 16'h3e6e;
      expv[15] = 16'ha445;
      expv[16] = 16'h0508;
      expv[17] = 16'h2250;
      expv[18] = 16'ha48b;
      expv[19] = 16'h134d;
      expv[20] = 16'hb4a8;
      expv[21] = 16'hbc41;
      expv[22] = 16'hf607;
      expv[23] = 16'h6efa;
      expv[24] = 16'h57b8;
      expv[25] = 16'h9953;
      expv[26] = 16'he838;
      expv[27] = 16'h3794;
      expv[28] = 16'h497f;
      expv[29] = 16'h07b2;
      expv[30] = 16'h9913;
      expv[31] = 16'h5104;
      expv[32] = 16'h80bc;
      expv[33] = 16'heda6;
      expv[34] = 16'h8886;
      expv[35] = 16'h5b98;
      expv[36] = 16'hb7f0;
      expv[37] = 16'h72f5;
      expv[38] = 16'h0920;
      expv[39] = 16'h85ae;
      expv[40] = 16'h769f;
      expv[41] = 16'h8d83;
      expv[42] = 16'hc9be;
      expv[43] = 16'hd140;
      expv[44] = 16'h8770;
      expv[45] = 16'hd8c3;
      expv[46] = 16'hfd28;
      expv[47] = 16'he80b;
      expv[48] = 16'h4661;
      expv[49] = 16'h9258;
      expv[50] = 16'h411e;
      expv[51] = 16'he3af;
      expv[52] = 16'h1f24;
      expv[53] = 16'hecc0;
      expv[54] = 16'hf5ad;
      expv[55] = 16'h97bf;
      expv[56] = 16'h1348;
      expv[57] = 16'h3c32;
      expv[58] = 16'h73c9;
      expv[59] = 16'hf357;
      expv[60] = 16'he5a3;
      expv[61] = 16'h6f4c;
      expv[62] = 16'h776f;
      expv[63] = 16'hd022;
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
