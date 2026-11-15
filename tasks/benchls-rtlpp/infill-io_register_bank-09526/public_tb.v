// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09526 dut (
    .clk(clk),
    .iocs(in_vec[22:22]),
    .ioaddr(in_vec[21:19]),
    .din(in_vec[18:3]),
    .iord(in_vec[2:2]),
    .iowr(in_vec[1:1]),
    .rst(in_vec[0:0]),
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
    stim[0] = 23'h6ae58d;
    stim[1] = 23'h62944d;
    stim[2] = 23'h487a00;
    stim[3] = 23'h61439a;
    stim[4] = 23'h67c206;
    stim[5] = 23'h49e81a;
    stim[6] = 23'h351738;
    stim[7] = 23'h6369ea;
    stim[8] = 23'h4f5eec;
    stim[9] = 23'h4bebac;
    stim[10] = 23'h25e202;
    stim[11] = 23'h01544e;
    stim[12] = 23'h15bb7e;
    stim[13] = 23'h5ad222;
    stim[14] = 23'h408a7a;
    stim[15] = 23'h5516f6;
    stim[16] = 23'h580efe;
    stim[17] = 23'h15e60a;
    stim[18] = 23'h071b50;
    stim[19] = 23'h62b0f4;
    stim[20] = 23'h21b7c4;
    stim[21] = 23'h43b0a8;
    stim[22] = 23'h72f366;
    stim[23] = 23'h4e7f08;
    stim[24] = 23'h6468a2;
    stim[25] = 23'h42a952;
    stim[26] = 23'h405daa;
    stim[27] = 23'h1a2705;
    stim[28] = 23'h70a6a8;
    stim[29] = 23'h25b874;
    stim[30] = 23'h3c17b0;
    stim[31] = 23'h0413a4;
    stim[32] = 23'h26f356;
    stim[33] = 23'h5be396;
    stim[34] = 23'h30c490;
    stim[35] = 23'h75f988;
    stim[36] = 23'h64fc76;
    stim[37] = 23'h2dc84a;
    stim[38] = 23'h396398;
    stim[39] = 23'h276bd0;
    stim[40] = 23'h2a933e;
    stim[41] = 23'h16dcbe;
    stim[42] = 23'h5a6ba2;
    stim[43] = 23'h6ad9fe;
    stim[44] = 23'h6aac16;
    stim[45] = 23'h47e77e;
    stim[46] = 23'h5b4e26;
    stim[47] = 23'h1604be;
    stim[48] = 23'h675502;
    stim[49] = 23'h32d012;
    stim[50] = 23'h05897a;
    stim[51] = 23'h6afe7a;
    stim[52] = 23'h36bf84;
    stim[53] = 23'h757e5c;
    stim[54] = 23'h6ed19c;
    stim[55] = 23'h2c2a08;
    stim[56] = 23'h4ee960;
    stim[57] = 23'h55a550;
    stim[58] = 23'h248b1a;
    stim[59] = 23'h7a272a;
    stim[60] = 23'h63335a;
    stim[61] = 23'h718d72;
    stim[62] = 23'h592e6e;
    stim[63] = 23'h57cb34;
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
      expv[1] = 16'hxxxx;
      expv[2] = 16'hx0x0;
      expv[3] = 16'h00x0;
      expv[4] = 16'h00x0;
      expv[5] = 16'h00x0;
      expv[6] = 16'h00x0;
      expv[7] = 16'h00x0;
      expv[8] = 16'h00x0;
      expv[9] = 16'h00x0;
      expv[10] = 16'h00x0;
      expv[11] = 16'h00x0;
      expv[12] = 16'h00x0;
      expv[13] = 16'h00x0;
      expv[14] = 16'h00x0;
      expv[15] = 16'h00x0;
      expv[16] = 16'h00x0;
      expv[17] = 16'h00x0;
      expv[18] = 16'h00x0;
      expv[19] = 16'h00x0;
      expv[20] = 16'h00x0;
      expv[21] = 16'h00x0;
      expv[22] = 16'h00x0;
      expv[23] = 16'h00x0;
      expv[24] = 16'h00x0;
      expv[25] = 16'h00x0;
      expv[26] = 16'h00x0;
      expv[27] = 16'h00x0;
      expv[28] = 16'h00x0;
      expv[29] = 16'h00x0;
      expv[30] = 16'h00x0;
      expv[31] = 16'h00x0;
      expv[32] = 16'h00x0;
      expv[33] = 16'h00x0;
      expv[34] = 16'h00x0;
      expv[35] = 16'h00x0;
      expv[36] = 16'h00x0;
      expv[37] = 16'h00x0;
      expv[38] = 16'h00x0;
      expv[39] = 16'h00x0;
      expv[40] = 16'h00x0;
      expv[41] = 16'h00x0;
      expv[42] = 16'h00x0;
      expv[43] = 16'h00x0;
      expv[44] = 16'h00x0;
      expv[45] = 16'h00x0;
      expv[46] = 16'h00x0;
      expv[47] = 16'h00x0;
      expv[48] = 16'h00x0;
      expv[49] = 16'h0040;
      expv[50] = 16'h0040;
      expv[51] = 16'h0040;
      expv[52] = 16'h0040;
      expv[53] = 16'h0040;
      expv[54] = 16'h0040;
      expv[55] = 16'h0040;
      expv[56] = 16'h00x0;
      expv[57] = 16'h00x0;
      expv[58] = 16'h00x0;
      expv[59] = 16'h00x0;
      expv[60] = 16'h00x0;
      expv[61] = 16'h00x0;
      expv[62] = 16'h00x0;
      expv[63] = 16'h00x0;
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
