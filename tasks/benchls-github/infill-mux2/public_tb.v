// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Mux2 dut (
    .sel(in_vec[16:16]),
    .i0(in_vec[15:8]),
    .i1(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1f46e;
    stim[1] = 17'h0e691;
    stim[2] = 17'h158a6;
    stim[3] = 17'h0eb64;
    stim[4] = 17'h1e0b3;
    stim[5] = 17'h0cf35;
    stim[6] = 17'h0022c;
    stim[7] = 17'h1a4b9;
    stim[8] = 17'h0c8b6;
    stim[9] = 17'h0a2e3;
    stim[10] = 17'h0cd49;
    stim[11] = 17'h051e3;
    stim[12] = 17'h195c0;
    stim[13] = 17'h11feb;
    stim[14] = 17'h1d3f4;
    stim[15] = 17'h16c36;
    stim[16] = 17'h0aafb;
    stim[17] = 17'h0be4f;
    stim[18] = 17'h1c2e1;
    stim[19] = 17'h008ae;
    stim[20] = 17'h1e90c;
    stim[21] = 17'h133eb;
    stim[22] = 17'h01d35;
    stim[23] = 17'h0ce0a;
    stim[24] = 17'h085d0;
    stim[25] = 17'h05d6e;
    stim[26] = 17'h10ca6;
    stim[27] = 17'h000c3;
    stim[28] = 17'h01d1b;
    stim[29] = 17'h1cace;
    stim[30] = 17'h1ada7;
    stim[31] = 17'h0bd6e;
    stim[32] = 17'h167b6;
    stim[33] = 17'h0f6fd;
    stim[34] = 17'h0a38c;
    stim[35] = 17'h1ca35;
    stim[36] = 17'h1bb84;
    stim[37] = 17'h0d6eb;
    stim[38] = 17'h1d314;
    stim[39] = 17'h08076;
    stim[40] = 17'h0ca54;
    stim[41] = 17'h165e5;
    stim[42] = 17'h01504;
    stim[43] = 17'h1da9e;
    stim[44] = 17'h1d03b;
    stim[45] = 17'h0e543;
    stim[46] = 17'h10505;
    stim[47] = 17'h16a25;
    stim[48] = 17'h0f473;
    stim[49] = 17'h0500b;
    stim[50] = 17'h0e8d7;
    stim[51] = 17'h0e5e1;
    stim[52] = 17'h0e123;
    stim[53] = 17'h1d2c6;
    stim[54] = 17'h0220a;
    stim[55] = 17'h0ef06;
    stim[56] = 17'h12340;
    stim[57] = 17'h0e534;
    stim[58] = 17'h1af73;
    stim[59] = 17'h0ccce;
    stim[60] = 17'h110b3;
    stim[61] = 17'h06db3;
    stim[62] = 17'h0bf55;
    stim[63] = 17'h14302;
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
      expv[0] = 8'h6e;
      expv[1] = 8'he6;
      expv[2] = 8'ha6;
      expv[3] = 8'heb;
      expv[4] = 8'hb3;
      expv[5] = 8'hcf;
      expv[6] = 8'h02;
      expv[7] = 8'hb9;
      expv[8] = 8'hc8;
      expv[9] = 8'ha2;
      expv[10] = 8'hcd;
      expv[11] = 8'h51;
      expv[12] = 8'hc0;
      expv[13] = 8'heb;
      expv[14] = 8'hf4;
      expv[15] = 8'h36;
      expv[16] = 8'haa;
      expv[17] = 8'hbe;
      expv[18] = 8'he1;
      expv[19] = 8'h08;
      expv[20] = 8'h0c;
      expv[21] = 8'heb;
      expv[22] = 8'h1d;
      expv[23] = 8'hce;
      expv[24] = 8'h85;
      expv[25] = 8'h5d;
      expv[26] = 8'ha6;
      expv[27] = 8'h00;
      expv[28] = 8'h1d;
      expv[29] = 8'hce;
      expv[30] = 8'ha7;
      expv[31] = 8'hbd;
      expv[32] = 8'hb6;
      expv[33] = 8'hf6;
      expv[34] = 8'ha3;
      expv[35] = 8'h35;
      expv[36] = 8'h84;
      expv[37] = 8'hd6;
      expv[38] = 8'h14;
      expv[39] = 8'h80;
      expv[40] = 8'hca;
      expv[41] = 8'he5;
      expv[42] = 8'h15;
      expv[43] = 8'h9e;
      expv[44] = 8'h3b;
      expv[45] = 8'he5;
      expv[46] = 8'h05;
      expv[47] = 8'h25;
      expv[48] = 8'hf4;
      expv[49] = 8'h50;
      expv[50] = 8'he8;
      expv[51] = 8'he5;
      expv[52] = 8'he1;
      expv[53] = 8'hc6;
      expv[54] = 8'h22;
      expv[55] = 8'hef;
      expv[56] = 8'h40;
      expv[57] = 8'he5;
      expv[58] = 8'h73;
      expv[59] = 8'hcc;
      expv[60] = 8'hb3;
      expv[61] = 8'h6d;
      expv[62] = 8'hbf;
      expv[63] = 8'h02;
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
